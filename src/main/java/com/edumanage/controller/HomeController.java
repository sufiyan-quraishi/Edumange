package com.edumanage.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpServletRequest;

@Controller
public class HomeController {

    // 1. Home / Index Page
    @GetMapping({"/", "/home", "/index"})
    public String home() {
        return "index";
    }

    // 2. About Us Page
    @GetMapping("/about")
    public String about() {
        return "about";
    }

    // 3. Courses Directory Page
    @GetMapping("/courses")
    public String courses() {
        return "courses";
    }

    // 4. Contact Us Page (View)
    @GetMapping("/contact")
    public String contact() {
        return "contact";
    }

    // 5. Contact Form Submission
    @PostMapping("/contact")
    public String handleContactForm(@RequestParam String name,
                                    @RequestParam String email,
                                    @RequestParam(required = false) String phone,
                                    @RequestParam String subject,
                                    @RequestParam String message,
                                    Model model) {
        model.addAttribute("successMsg", "Thank you! Your message has been successfully sent.");
        return "contact";
    }

    // 6. Login Page
    @GetMapping("/login")
    public String login(@RequestParam(value = "error", required = false) String error,
                        @RequestParam(value = "logout", required = false) String logout,
                        HttpServletRequest request,
                        Model model) {
        if (error != null) {
            model.addAttribute("errorMsg", "Invalid username or password.");
        }
        if (logout != null) {
            model.addAttribute("logoutMsg", "You have been successfully logged out.");
        }
        return "login";
    }

    // 7. Access Denied Page
    @GetMapping("/access-denied")
    public String accessDenied() {
        return "access-denied";
    }
}