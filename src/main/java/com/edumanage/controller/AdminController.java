package com.edumanage.controller;

import org.springframework.security.core.Authentication;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.edumanage.model.Batch;
import com.edumanage.model.User;
import com.edumanage.model.Inquiry;
import com.edumanage.repository.UserRepository;
import com.edumanage.service.AdminService;
import com.edumanage.service.InquiryService;
import com.edumanage.service.RegistrationService;

// iText / OpenPDF Imports
import com.lowagie.text.*;
import com.lowagie.text.pdf.*;
import com.lowagie.text.pdf.draw.LineSeparator;
import javax.servlet.http.HttpServletResponse;
import java.awt.Color;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

@Controller
@RequestMapping("/admin")
public class AdminController {

    private final AdminService adminService;
    private final RegistrationService registrationService;
    private final InquiryService inquiryService;
    private final UserRepository userRepository;
    private final PasswordEncoder passwordEncoder;

    // ✅ Constructor injection
    public AdminController(AdminService adminService,
                           RegistrationService registrationService,
                           InquiryService inquiryService,
                           UserRepository userRepository,
                           PasswordEncoder passwordEncoder) {
        this.adminService = adminService;
        this.registrationService = registrationService;
        this.inquiryService = inquiryService;
        this.userRepository = userRepository;
        this.passwordEncoder = passwordEncoder;
    }
    // ADMIN ACCOUNT / PROFILE MANAGEMENT
    @GetMapping("/profile")
    public String showAdminProfile(Authentication authentication, Model model) {
        if (authentication == null) {
            return "redirect:/login";
        }
        String username = authentication.getName();
        User admin = userRepository.findByUsername(username)
                .orElseThrow(() -> new RuntimeException("Admin account not found: " + username));
        
        model.addAttribute("admin", admin);
        return "admin/profile"; // loads WEB-INF/views/admin/profile.jsp
    }

    @PostMapping("/profile/update")
    public String updateAdminProfile(@RequestParam("fullName") String fullName,
                                     @RequestParam("email") String email,
                                     @RequestParam("phone") String phone,
                                     @RequestParam(value = "password", required = false) String password,
                                     Authentication authentication,
                                     RedirectAttributes redirectAttributes) {
        if (authentication == null) {
            return "redirect:/login";
        }
        String username = authentication.getName();
        User admin = userRepository.findByUsername(username)
                .orElseThrow(() -> new RuntimeException("Admin account not found: " + username));

        admin.setFullName(fullName);
        admin.setEmail(email);
        admin.setPhone(phone);

        if (password != null && !password.trim().isEmpty()) {
            admin.setPassword(passwordEncoder.encode(password.trim()));
        }

        userRepository.save(admin);
        redirectAttributes.addFlashAttribute("successMsg", "Account information updated successfully!");
        return "redirect:/admin/profile";
    }
    // DASHBOARD
    @GetMapping("/dashboard")
    public String dashboard(Model model) {
        model.addAttribute("batches", adminService.listBatches());
        model.addAttribute("students", adminService.listStudents());
        model.addAttribute("trainers", adminService.listTrainers());
        return "admin/dashboard";
    }
    // INQUIRIES
    @GetMapping("/inquiries")
    public String listInquiries(Model model) {
        model.addAttribute("inquiries", inquiryService.findAll());
        return "admin/inquiries";
    }

    @PostMapping("/inquiries/{id}/status")
    public String updateInquiryStatus(@PathVariable Long id,
                                      @RequestParam("status") Inquiry.Status status,
                                      RedirectAttributes redirectAttributes) {
        inquiryService.updateStatus(id, status);
        redirectAttributes.addFlashAttribute("message", "Inquiry status updated to " + status);
        return "redirect:/admin/inquiries";
    }
    // REGISTRATIONS
    @GetMapping("/registrations")
    public String listRegistrations(Model model) {
        model.addAttribute("registrations", registrationService.findAll());
        return "admin/registrations";
    }

    @PostMapping("/registrations/{id}/approve")
    public String approveRegistration(@PathVariable Long id, RedirectAttributes redirectAttributes) {
        String credentials = registrationService.approveAndCreateLogin(id);
        redirectAttributes.addFlashAttribute("approvedMessage", "Approved! Credentials: " + credentials);
        return "redirect:/admin/registrations";
    }

    @PostMapping("/registrations/{id}/reject")
    public String rejectRegistration(@PathVariable Long id, RedirectAttributes redirectAttributes) {
        registrationService.reject(id);
        redirectAttributes.addFlashAttribute("approvedMessage", "Registration rejected.");
        return "redirect:/admin/registrations";
    }
    // TRAINER CRUD
    @GetMapping("/trainers")
    public String listTrainers(Model model) {
        model.addAttribute("trainers", adminService.listTrainers());
        model.addAttribute("newTrainer", new TrainerForm());
        return "admin/trainers";
    }

    @GetMapping("/trainers/add")
    public String showAddTrainerForm(Model model) {
        model.addAttribute("newTrainer", new TrainerForm());
        return "admin/addTrainer";
    }

    @PostMapping("/trainers/add")
    public String saveTrainer(@ModelAttribute("newTrainer") TrainerForm form) {
        adminService.createTrainer(
                form.getFullName(),
                form.getEmail(),
                form.getPhone(),
                form.getUsername(),
                form.getPassword()
        );
        return "redirect:/admin/trainers";
    }

    @GetMapping("/trainers/edit/{id}")
    public String editTrainer(@PathVariable Long id, Model model) {
        model.addAttribute("trainer", adminService.findTrainerById(id));
        return "admin/editTrainer";
    }

    @PostMapping("/trainers/{id}/update")
    public String updateTrainer(@PathVariable Long id, @ModelAttribute User trainer) {
        trainer.setId(id);
        adminService.updateTrainer(trainer);
        return "redirect:/admin/trainers";
    }

    @PostMapping("/trainers/delete/{id}")
    public String deleteTrainer(@PathVariable Long id) {
        adminService.deleteTrainer(id);
        return "redirect:/admin/trainers";
    }
    // STUDENT CRUD
    @GetMapping("/students")
    public String listStudents(Model model) {
        model.addAttribute("students", adminService.listStudents());
        return "admin/students";
    }

    @GetMapping("/students/edit/{id}")
    public String editStudent(@PathVariable Long id, Model model) {
        model.addAttribute("student", adminService.findStudentById(id));
        return "admin/editStudent";
    }

    @PostMapping("/students/{id}/update")
    public String updateStudent(@PathVariable Long id, @ModelAttribute User student) {
        student.setId(id);
        adminService.updateStudent(student);
        return "redirect:/admin/students";
    }

    @PostMapping("/students/delete/{id}")
    public String deleteStudent(@PathVariable Long id) {
        adminService.deleteStudent(id);
        return "redirect:/admin/students";
    }
    // BATCH CRUD
    @GetMapping("/batches")
    public String listBatches(Model model) {
        model.addAttribute("batches", adminService.listBatches());
        model.addAttribute("trainers", adminService.listTrainers());
        model.addAttribute("newBatch", new Batch());
        return "admin/batches";
    }

    @PostMapping("/batches")
    public String createBatch(@ModelAttribute("newBatch") Batch batch,
                              @RequestParam(required = false) Long trainerId) {
        if (trainerId != null) {
            batch.setTrainer(adminService.findTrainerById(trainerId));
        }
        adminService.createBatch(batch);
        return "redirect:/admin/batches";
    }

    @GetMapping("/batches/{id}/assign")
    public String assignBatch(@PathVariable Long id, Model model) {
        model.addAttribute("batch", adminService.findBatchById(id));
        model.addAttribute("trainers", adminService.listTrainers());
        model.addAttribute("students", adminService.listStudents());
        return "admin/assign";
    }

    @PostMapping("/batches/{id}/assign-trainer")
    public String assignTrainer(@PathVariable Long id, @RequestParam Long trainerId) {
        adminService.assignTrainer(id, trainerId);
        return "redirect:/admin/batches/" + id + "/assign";
    }

    @PostMapping("/batches/{id}/assign-students")
    public String assignStudents(@PathVariable Long id, @RequestParam List<Long> studentIds) {
        adminService.assignStudents(id, studentIds);
        return "redirect:/admin/batches/" + id + "/assign";
    }
    // ATTENDANCE & TASKS & REPORTS
    @GetMapping("/attendance")
    public String attendance(Model model) {
        model.addAttribute("batches", adminService.listBatches());
        return "admin/attendance";
    }

    @GetMapping("/tasks")
    public String tasks(Model model) {
        model.addAttribute("batches", adminService.listBatches());
        return "admin/tasks";
    }

    @GetMapping("/reports")
    public String reports(Model model) {
        model.addAttribute("batches", adminService.listBatches());
        model.addAttribute("students", adminService.listStudents());
        model.addAttribute("trainers", adminService.listTrainers());
        return "admin/reports";
    }
    // DOWNLOAD COMPREHENSIVE LIVE PDF REPORT
    @GetMapping("/reports/download")
    public void downloadPdfReport(HttpServletResponse response) throws IOException {
        response.setContentType("application/pdf");
        String filename = "EduManage_Institute_Audit_Report_" + new SimpleDateFormat("yyyyMMdd_HHmm").format(new Date()) + ".pdf";
        response.setHeader("Content-Disposition", "attachment; filename=" + filename);

        Document document = new Document(PageSize.A4, 30, 30, 30, 30);
        PdfWriter writer = PdfWriter.getInstance(document, response.getOutputStream());
        document.open();

        Color primaryBlue = Color.decode("#1e3a8a");
        Color secondaryBlue = Color.decode("#3b82f6");
        Color darkNavy = Color.decode("#0f172a");
        Color lightGray = Color.decode("#f8fafc");
        Color altRowColor = Color.decode("#f1f5f9");
        Color borderLine = Color.decode("#cbd5e1");

        Font titleFont = FontFactory.getFont(FontFactory.HELVETICA_BOLD, 20, Color.WHITE);
        Font subTitleFont = FontFactory.getFont(FontFactory.HELVETICA, 9.5f, Color.decode("#e0e7ff"));
        Font sectionHeadingFont = FontFactory.getFont(FontFactory.HELVETICA_BOLD, 12.5f, primaryBlue);
        Font tableHeaderFont = FontFactory.getFont(FontFactory.HELVETICA_BOLD, 9.5f, Color.WHITE);
        Font tableBodyFont = FontFactory.getFont(FontFactory.HELVETICA, 9.0f, Color.decode("#334155"));
        Font tableBodyBold = FontFactory.getFont(FontFactory.HELVETICA_BOLD, 9.0f, Color.decode("#0f172a"));
        Font footerFont = FontFactory.getFont(FontFactory.HELVETICA_OBLIQUE, 8.5f, Color.GRAY);

        PdfPTable headerBanner = new PdfPTable(1);
        headerBanner.setWidthPercentage(100);
        
        PdfPCell bannerCell = new PdfPCell();
        bannerCell.setBackgroundColor(primaryBlue);
        bannerCell.setPadding(14);
        bannerCell.setBorder(Rectangle.NO_BORDER);

        Paragraph brand = new Paragraph("EduManage Institute of Technology", titleFont);
        brand.setAlignment(Element.ALIGN_CENTER);
        bannerCell.addElement(brand);

        Paragraph tagline = new Paragraph("Comprehensive Institutional Operations & Performance Report", subTitleFont);
        tagline.setAlignment(Element.ALIGN_CENTER);
        bannerCell.addElement(tagline);

        Paragraph meta = new Paragraph("Generated on: " + new SimpleDateFormat("dd MMM yyyy, hh:mm a").format(new Date()) + " | Admin Console", subTitleFont);
        meta.setAlignment(Element.ALIGN_CENTER);
        bannerCell.addElement(meta);

        headerBanner.addCell(bannerCell);
        document.add(headerBanner);
        document.add(new Paragraph("\n"));

        document.add(new Paragraph("1. Institute Metrics Overview", sectionHeadingFont));
        document.add(new Paragraph(" "));

        List<Batch> allBatches = adminService.listBatches();
        List<User> allStudents = adminService.listStudents();
        List<User> allTrainers = adminService.listTrainers();
        int totalInquiries = inquiryService.findAll().size();

        PdfPTable summaryTable = new PdfPTable(4);
        summaryTable.setWidthPercentage(100);
        summaryTable.setWidths(new float[]{25f, 25f, 25f, 25f});

        addSummaryCard(summaryTable, "Total Batches", String.valueOf(allBatches.size()), secondaryBlue, tableHeaderFont, tableBodyBold);
        addSummaryCard(summaryTable, "Active Students", String.valueOf(allStudents.size()), Color.decode("#10b981"), tableHeaderFont, tableBodyBold);
        addSummaryCard(summaryTable, "Faculty Members", String.valueOf(allTrainers.size()), Color.decode("#8b5cf6"), tableHeaderFont, tableBodyBold);
        addSummaryCard(summaryTable, "New Inquiries", String.valueOf(totalInquiries), Color.decode("#f97316"), tableHeaderFont, tableBodyBold);

        document.add(summaryTable);
        document.add(new Paragraph("\n"));

        document.add(new Paragraph("2. Batches & Faculty Allocation", sectionHeadingFont));
        document.add(new Paragraph(" "));

        PdfPTable batchTable = new PdfPTable(4);
        batchTable.setWidthPercentage(100);
        batchTable.setWidths(new float[]{10f, 35f, 30f, 25f});

        addHeaderCell(batchTable, "ID", darkNavy, tableHeaderFont);
        addHeaderCell(batchTable, "Batch Name", darkNavy, tableHeaderFont);
        addHeaderCell(batchTable, "Course Curriculum", darkNavy, tableHeaderFont);
        addHeaderCell(batchTable, "Assigned Mentor", darkNavy, tableHeaderFont);

        int bIndex = 1;
        if (allBatches.isEmpty()) {
            PdfPCell empty = new PdfPCell(new Phrase("No active batches recorded in system.", tableBodyFont));
            empty.setColspan(4);
            empty.setPadding(8);
            batchTable.addCell(empty);
        } else {
            for (Batch b : allBatches) {
                Color rowBg = (bIndex % 2 == 0) ? altRowColor : Color.WHITE;
                addBodyCell(batchTable, String.valueOf(bIndex++), rowBg, tableBodyFont, Element.ALIGN_CENTER);
                addBodyCell(batchTable, b.getBatchName() != null ? b.getBatchName() : "N/A", rowBg, tableBodyBold, Element.ALIGN_LEFT);
                addBodyCell(batchTable, b.getCourseName() != null ? b.getCourseName() : "General Track", rowBg, tableBodyFont, Element.ALIGN_LEFT);
                addBodyCell(batchTable, b.getTrainer() != null ? b.getTrainer().getFullName() : "Pending Assignment", rowBg, tableBodyFont, Element.ALIGN_LEFT);
            }
        }
        document.add(batchTable);
        document.add(new Paragraph("\n"));

        document.add(new Paragraph("3. Enrolled Students Directory", sectionHeadingFont));
        document.add(new Paragraph(" "));

        PdfPTable studentTable = new PdfPTable(4);
        studentTable.setWidthPercentage(100);
        studentTable.setWidths(new float[]{8f, 32f, 38f, 22f});

        addHeaderCell(studentTable, "#", darkNavy, tableHeaderFont);
        addHeaderCell(studentTable, "Student Full Name", darkNavy, tableHeaderFont);
        addHeaderCell(studentTable, "Email Address", darkNavy, tableHeaderFont);
        addHeaderCell(studentTable, "Contact Number", darkNavy, tableHeaderFont);

        int sIndex = 1;
        if (allStudents.isEmpty()) {
            PdfPCell empty = new PdfPCell(new Phrase("No students enrolled currently.", tableBodyFont));
            empty.setColspan(4);
            empty.setPadding(8);
            studentTable.addCell(empty);
        } else {
            for (User s : allStudents) {
                Color rowBg = (sIndex % 2 == 0) ? altRowColor : Color.WHITE;
                addBodyCell(studentTable, String.valueOf(sIndex++), rowBg, tableBodyFont, Element.ALIGN_CENTER);
                addBodyCell(studentTable, s.getFullName() != null ? s.getFullName() : "N/A", rowBg, tableBodyBold, Element.ALIGN_LEFT);
                addBodyCell(studentTable, s.getEmail() != null ? s.getEmail() : "N/A", rowBg, tableBodyFont, Element.ALIGN_LEFT);
                addBodyCell(studentTable, s.getPhone() != null ? s.getPhone() : "N/A", rowBg, tableBodyFont, Element.ALIGN_CENTER);
            }
        }
        document.add(studentTable);
        document.add(new Paragraph("\n"));

        document.add(new Paragraph("4. Faculty & Instructors Roster", sectionHeadingFont));
        document.add(new Paragraph(" "));

        PdfPTable trainerTable = new PdfPTable(4);
        trainerTable.setWidthPercentage(100);
        trainerTable.setWidths(new float[]{8f, 32f, 38f, 22f});

        addHeaderCell(trainerTable, "#", darkNavy, tableHeaderFont);
        addHeaderCell(trainerTable, "Instructor Name", darkNavy, tableHeaderFont);
        addHeaderCell(trainerTable, "Faculty Email", darkNavy, tableHeaderFont);
        addHeaderCell(trainerTable, "Phone Contact", darkNavy, tableHeaderFont);

        int tIndex = 1;
        if (allTrainers.isEmpty()) {
            PdfPCell empty = new PdfPCell(new Phrase("No instructors configured.", tableBodyFont));
            empty.setColspan(4);
            empty.setPadding(8);
            trainerTable.addCell(empty);
        } else {
            for (User t : allTrainers) {
                Color rowBg = (tIndex % 2 == 0) ? altRowColor : Color.WHITE;
                addBodyCell(trainerTable, String.valueOf(tIndex++), rowBg, tableBodyFont, Element.ALIGN_CENTER);
                addBodyCell(trainerTable, t.getFullName() != null ? t.getFullName() : "N/A", rowBg, tableBodyBold, Element.ALIGN_LEFT);
                addBodyCell(trainerTable, t.getEmail() != null ? t.getEmail() : "N/A", rowBg, tableBodyFont, Element.ALIGN_LEFT);
                addBodyCell(trainerTable, t.getPhone() != null ? t.getPhone() : "N/A", rowBg, tableBodyFont, Element.ALIGN_CENTER);
            }
        }
        document.add(trainerTable);
        document.add(new Paragraph("\n"));

        LineSeparator sep = new LineSeparator();
        sep.setLineColor(borderLine);
        document.add(sep);

        PdfPTable footerTable = new PdfPTable(2);
        footerTable.setWidthPercentage(100);
        footerTable.setSpacingBefore(12f);

        PdfPCell leftFooter = new PdfPCell();
        leftFooter.setBorder(Rectangle.NO_BORDER);
        leftFooter.addElement(new Paragraph("EduManage Administration System", tableBodyBold));
        leftFooter.addElement(new Paragraph("Confidential & Internal Institutional Document", footerFont));
        footerTable.addCell(leftFooter);

        PdfPCell rightFooter = new PdfPCell();
        rightFooter.setBorder(Rectangle.NO_BORDER);
        rightFooter.setHorizontalAlignment(Element.ALIGN_RIGHT);
        Paragraph signTitle = new Paragraph("Authorized Signature & Seal", tableBodyBold);
        signTitle.setAlignment(Element.ALIGN_RIGHT);
        rightFooter.addElement(signTitle);
        Paragraph signLine = new Paragraph("___________________________", footerFont);
        signLine.setAlignment(Element.ALIGN_RIGHT);
        rightFooter.addElement(signLine);
        footerTable.addCell(rightFooter);

        document.add(footerTable);

        document.close();
    }

    private void addHeaderCell(PdfPTable table, String text, Color bgColor, Font font) {
        PdfPCell cell = new PdfPCell(new Phrase(text, font));
        cell.setBackgroundColor(bgColor);
        cell.setPadding(6.5f);
        cell.setHorizontalAlignment(Element.ALIGN_CENTER);
        cell.setBorderColor(Color.decode("#94a3b8"));
        table.addCell(cell);
    }

    private void addBodyCell(PdfPTable table, String text, Color bgColor, Font font, int align) {
        PdfPCell cell = new PdfPCell(new Phrase(text, font));
        cell.setBackgroundColor(bgColor);
        cell.setPadding(5.5f);
        cell.setHorizontalAlignment(align);
        cell.setBorderColor(Color.decode("#e2e8f0"));
        table.addCell(cell);
    }

    private void addSummaryCard(PdfPTable table, String title, String value, Color color, Font hFont, Font vFont) {
        PdfPCell cell = new PdfPCell();
        cell.setBackgroundColor(Color.decode("#f8fafc"));
        cell.setBorderColor(color);
        cell.setBorderWidth(1.5f);
        cell.setPadding(8f);

        Paragraph pTitle = new Paragraph(title, FontFactory.getFont(FontFactory.HELVETICA_BOLD, 8.5f, color));
        pTitle.setAlignment(Element.ALIGN_CENTER);
        cell.addElement(pTitle);

        Paragraph pVal = new Paragraph(value, FontFactory.getFont(FontFactory.HELVETICA_BOLD, 15f, Color.decode("#0f172a")));
        pVal.setAlignment(Element.ALIGN_CENTER);
        cell.addElement(pVal);

        table.addCell(cell);
    }
    // DATA TRANSFER OBJECTS (DTOs)
    public static class TrainerForm {
        private String fullName;
        private String email;
        private String phone;
        private String username;
        private String password;

        public TrainerForm() {}

        public String getFullName() { return fullName; }
        public void setFullName(String fullName) { this.fullName = fullName; }

        public String getEmail() { return email; }
        public void setEmail(String email) { this.email = email; }

        public String getPhone() { return phone; }
        public void setPhone(String phone) { this.phone = phone; }

        public String getUsername() { return username; }
        public void setUsername(String username) { this.username = username; }

        public String getPassword() { return password; }
        public void setPassword(String password) { this.password = password; }
    }
}