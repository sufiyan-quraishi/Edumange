package com.edumanage.controller;

import com.edumanage.model.Inquiry;
import com.edumanage.service.InquiryService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@RequestMapping("/inquiry")
public class InquiryController {

    @Autowired
    private InquiryService inquiryService;

    /**
     * Called via AJAX/fetch from the popup's "Submit Inquiry" button.
     * Popup shows after 5 seconds on the landing page (see index.jsp).
     */
    @PostMapping("/submit")
    @ResponseBody
    public String submitInquiry(Inquiry inquiry) {
        inquiryService.save(inquiry);
        return "success"; // JS shows a thank-you message and closes the popup
    }
}
