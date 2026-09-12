package com.edumanage.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.core.io.ClassPathResource;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Service;

import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;

@Service
public class EmailService {

    @Autowired
    private JavaMailSender mailSender;

    @Value("${spring.mail.username}")
    private String fromAddress;

    public void sendApprovalEmail(String toEmail, String fullName, String username, String rawPassword) {
        try {
            MimeMessage message = mailSender.createMimeMessage();
            
            // true = multipart message (HTML body + Inline Images / Attachments)
            MimeMessageHelper helper = new MimeMessageHelper(message, true, "UTF-8");

            helper.setFrom(fromAddress, "EduManage Portal");
            helper.setTo(toEmail);
            helper.setSubject("🎉 Welcome to EduManage - Your Account is Approved!");

            // Modern Responsive HTML Email Template
            String htmlContent = "<!DOCTYPE html>"
                + "<html>"
                + "<head>"
                + "<meta charset='UTF-8'>"
                + "<meta name='viewport' content='width=device-width, initial-scale=1.0'>"
                + "<style>"
                + "  body { font-family: 'Segoe UI', Arial, sans-serif; background-color: #f4f7f6; margin: 0; padding: 0; }"
                + "  .container { max-width: 600px; margin: 30px auto; background-color: #ffffff; border-radius: 8px; overflow: hidden; box-shadow: 0 4px 10px rgba(0,0,0,0.05); }"
                + "  .header { background: linear-gradient(135deg, #1e3c72 0%, #2a5298 100%); padding: 30px 20px; text-align: center; color: #ffffff; }"
                + "  .logo { max-width: 140px; margin-bottom: 10px; }"
                + "  .header h1 { margin: 0; font-size: 22px; font-weight: 600; letter-spacing: 0.5px; }"
                + "  .content { padding: 30px; color: #333333; line-height: 1.6; font-size: 15px; }"
                + "  .cred-box { background-color: #f8fafc; border-left: 4px solid #2a5298; border-radius: 4px; padding: 18px; margin: 20px 0; }"
                + "  .cred-item { margin: 8px 0; font-size: 14px; }"
                + "  .cred-item span { font-weight: 600; color: #1e293b; display: inline-block; width: 100px; }"
                + "  .code-text { background: #e2e8f0; padding: 3px 8px; border-radius: 4px; font-family: monospace; font-size: 14px; color: #0f172a; font-weight: bold; }"
                + "  .btn-wrapper { text-align: center; margin: 30px 0 20px 0; }"
                + "  .btn { background-color: #2563eb; color: #ffffff !important; padding: 12px 30px; text-decoration: none; border-radius: 6px; font-weight: 600; display: inline-block; }"
                + "  .footer { background-color: #f1f5f9; padding: 20px; text-align: center; font-size: 12px; color: #64748b; border-top: 1px solid #e2e8f0; }"
                + "</style>"
                + "</head>"
                + "<body>"
                + "  <div class='container'>"
                + "    <div class='header'>"
                + "      <img src='cid:eduManageLogo' alt='EduManage Logo' class='logo'/>"
                + "      <h1>Welcome to EduManage</h1>"
                + "    </div>"
                + "    <div class='content'>"
                + "      <p>Dear <strong>" + fullName + "</strong>,</p>"
                + "      <p>Congratulations! Your registration request has been reviewed and successfully <strong>approved</strong> by the administrator.</p>"
                + "      <div class='cred-box'>"
                + "        <div class='cred-item'><span>Username:</span> <span class='code-text'>" + username + "</span></div>"
                + "        <div class='cred-item'><span>Password:</span> <span class='code-text'>" + rawPassword + "</span></div>"
                + "      </div>"
                + "      <p>You can now access your dashboard to view courses, batches, and tasks.</p>"
                + "      <div class='btn-wrapper'>"
                + "        <a href='http://localhost:8080/login' class='btn' target='_blank'>Login to Your Portal</a>"
                + "      </div>"
                + "      <p style='font-size: 13px; color: #dc2626;'><em>* Note: For security purposes, please update your temporary password immediately after logging in.</em></p>"
                + "    </div>"
                + "    <div class='footer'>"
                + "      <p>&copy; 2026 EduManage Training Management System. All rights reserved.</p>"
                + "      <p>Need assistance? Contact support at admin@edumanage.com</p>"
                + "    </div>"
                + "  </div>"
                + "</body>"
                + "</html>";

            helper.setText(htmlContent, true);

            // Inline Image Embed (cid:eduManageLogo)
            // Make sure you place your logo at: src/main/resources/static/images/logo.png
            ClassPathResource logoResource = new ClassPathResource("static/images/logo.jpeg");
            if (logoResource.exists()) {
                helper.addInline("eduManageLogo", logoResource);
            }

            mailSender.send(message);

        } catch (MessagingException | java.io.UnsupportedEncodingException e) {
            e.printStackTrace();
        }
    }
}