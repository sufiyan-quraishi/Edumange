package com.edumanage.controller;

import com.edumanage.model.*;
import com.edumanage.repository.UserRepository;
import com.edumanage.service.StudentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import java.io.IOException;
import java.util.List;

@Controller
@RequestMapping("/student")
public class StudentController {

    @Autowired
    private StudentService studentService;

    @Autowired
    private UserRepository userRepository;

    private User currentStudent(Authentication auth) {
        return userRepository.findByUsername(auth.getName())
                .orElseThrow(() -> new RuntimeException("Student not found"));
    }

    @GetMapping("/dashboard")
    public String dashboard(Authentication auth, Model model) {
        User student = currentStudent(auth);
        List<Batch> batches = studentService.findBatchesForStudent(student);
        List<Task> tasks = studentService.findTasksForStudent(student);
        int[] attendance = studentService.attendanceSummary(student);

        long pendingTasks = tasks.stream().filter(t -> !studentService.hasSubmitted(t, student)).count();

        model.addAttribute("student", student);
        model.addAttribute("batches", batches);
        model.addAttribute("batchCount", batches.size());
        model.addAttribute("taskCount", tasks.size());
        model.addAttribute("pendingTaskCount", pendingTasks);
        model.addAttribute("attendancePresent", attendance[0]);
        model.addAttribute("attendanceTotal", attendance[1]);
        model.addAttribute("recentSubmissions", studentService.findSubmissionsForStudent(student));
        return "student/dashboard";
    }

    @GetMapping("/profile")
    public String profile(Authentication auth, Model model) {
        model.addAttribute("student", currentStudent(auth));
        return "student/profile";
    }

    @PostMapping("/profile/update")
    public String updateProfile(@ModelAttribute User formStudent,
                                Authentication auth,
                                RedirectAttributes redirectAttributes) {
        User student = currentStudent(auth);
        student.setFullName(formStudent.getFullName());
        student.setEmail(formStudent.getEmail());
        student.setPhone(formStudent.getPhone());
        userRepository.save(student);

        redirectAttributes.addFlashAttribute("message", "Profile updated successfully!");
        return "redirect:/student/profile";
    }

    @GetMapping("/attendance")
    public String attendance(Authentication auth, Model model) {
        User student = currentStudent(auth);
        model.addAttribute("attendanceList", studentService.findAttendanceForStudent(student));
        return "student/attendance";
    }

    @GetMapping("/tasks")
    public String allTasks(Authentication auth, Model model) {
        User student = currentStudent(auth);
        List<Task> tasks = studentService.findTasksForStudent(student);
        model.addAttribute("tasks", tasks);
        model.addAttribute("student", student);
        return "student/tasks";
    }

    @GetMapping("/batch/{id}/tasks")
    public String tasks(@PathVariable Long id, Authentication auth, Model model) {
        User student = currentStudent(auth);
        Batch batch = studentService.findBatchesForStudent(student).stream()
                .filter(b -> b.getId().equals(id))
                .findFirst()
                .orElseThrow(() -> new RuntimeException("Not your batch"));
        model.addAttribute("batch", batch);
        model.addAttribute("tasks", studentService.findTasksForBatch(batch));
        model.addAttribute("student", student);
        return "student/batch-tasks";
    }

    @GetMapping("/tasks/{taskId}/submit")
    public String submitForm(@PathVariable Long taskId, Model model) {
        model.addAttribute("task", studentService.findTaskById(taskId));
        return "student/submit-task";
    }

    @PostMapping("/tasks/{taskId}/submit")
    public String submit(@PathVariable Long taskId,
                          @RequestParam("file") MultipartFile file,
                          @RequestParam(required = false) String note,
                          Authentication auth) throws IOException {
        Task task = studentService.findTaskById(taskId);
        studentService.submitAssignment(task, currentStudent(auth), file, note);
        return "redirect:/student/dashboard";
    }

    @GetMapping("/feedback")
    public String feedback(Authentication auth, Model model) {
        User student = currentStudent(auth);
        model.addAttribute("submissions", studentService.findSubmissionsForStudent(student));
        return "student/feedback";
    }
}