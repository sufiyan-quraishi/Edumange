package com.edumanage.controller;

import com.edumanage.model.Registration;
import com.edumanage.service.RegistrationService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

@Controller
public class RegistrationController {

    @Autowired
    private RegistrationService registrationService;

    // GET mapping: /register aur /registration dono se form open hoga
    @GetMapping({"/register", "/registration"})
    public String showForm(Model model) {
        model.addAttribute("registration", new Registration());
        return "registration"; // registration.jsp
    }

    // POST mapping: form submit handle karega
    @PostMapping({"/register", "/registration"})
    public String submit(@ModelAttribute("registration") Registration registration, Model model) {
        registrationService.save(registration);
        model.addAttribute("registration", registration);
        return "registration-success"; // registration-success.jsp
    }
}