<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Contact Us | EduManage</title>
    <!-- FontAwesome Vector Icons -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css">
    <!-- Google Fonts -->
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Plus+Jakarta+Sans:wght@400;500;600;700;800&display=swap" rel="stylesheet">
    <!-- Project Stylesheet -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">

    <style>
        :root {
            --primary: #4f6ef7;
            --primary-hover: #3b5be0;
            --primary-light: rgba(79, 110, 247, 0.08);
            --bg: #f8fafc;
            --surface: #ffffff;
            --surface-alt: #f1f5f9;
            --text: #0f172a;
            --text-muted: #64748b;
            --border: #e2e8f0;
            --shadow: 0 4px 20px -2px rgba(15, 23, 42, 0.05);
            --shadow-lg: 0 20px 30px -10px rgba(15, 23, 42, 0.08);
        }

        [data-theme="dark"] {
            --bg: #090d16;
            --surface: #111827;
            --surface-alt: #1a2234;
            --text: #f8fafc;
            --text-muted: #94a3b8;
            --border: #1f293d;
            --shadow: 0 4px 20px -2px rgba(0, 0, 0, 0.4);
            --shadow-lg: 0 20px 30px -10px rgba(0, 0, 0, 0.6);
        }

        body {
            font-family: 'Plus Jakarta Sans', sans-serif;
            background: var(--bg);
            color: var(--text);
            margin: 0;
            min-height: 100vh;
            display: flex;
            flex-direction: column;
            overflow-x: hidden;
        }

        .contact-hero {
            padding: 70px 20px 40px;
            text-align: center;
            background: radial-gradient(circle at 50% 10%, rgba(79, 110, 247, 0.12) 0%, transparent 60%);
        }

        .badge-pill {
            display: inline-flex;
            align-items: center;
            gap: 8px;
            padding: 7px 18px;
            border-radius: 9999px;
            background: var(--primary-light);
            color: var(--primary);
            font-size: 13px;
            font-weight: 700;
            border: 1px solid rgba(79, 110, 247, 0.2);
            margin-bottom: 20px;
        }

        .contact-title {
            font-size: clamp(32px, 4.5vw, 46px);
            font-weight: 800;
            letter-spacing: -0.02em;
            margin: 0 0 14px;
            color: var(--text);
        }

        .gradient-text {
            background: linear-gradient(135deg, #4f6ef7 0%, #06b6d4 100%);
            -webkit-background-clip: text;
            -webkit-text-fill-color: transparent;
        }

        .contact-subtitle {
            font-size: 16px;
            color: var(--text-muted);
            max-width: 650px;
            margin: 0 auto;
            line-height: 1.7;
        }

        .contact-grid {
            display: grid;
            grid-template-columns: 0.85fr 1.15fr;
            gap: 30px;
            align-items: start;
        }

        @media (max-width: 900px) {
            .contact-grid {
                grid-template-columns: 1fr;
            }
        }

        .contact-card {
            background: var(--surface);
            border: 1px solid var(--border);
            border-radius: 24px;
            padding: 32px;
            box-shadow: var(--shadow);
        }

        .icon-box {
            width: 48px;
            height: 48px;
            border-radius: 14px;
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 20px;
            flex-shrink: 0;
        }

        .icon-blue { background: rgba(79, 110, 247, 0.12); color: #4f6ef7; }
        .icon-green { background: rgba(16, 185, 129, 0.12); color: #10b981; }
        .icon-purple { background: rgba(139, 92, 246, 0.12); color: #8b5cf6; }
        .icon-amber { background: rgba(245, 158, 11, 0.12); color: #f59e0b; }

        .info-strip {
            display: flex;
            gap: 15px;
            align-items: center;
            padding: 16px;
            border-radius: 16px;
            background: var(--surface-alt);
            border: 1px solid var(--border);
            margin-bottom: 14px;
            transition: all 0.25s ease;
        }

        .info-strip:hover {
            transform: translateY(-2px);
            border-color: rgba(79, 110, 247, 0.3);
        }

        .form-control-custom {
            width: 100%;
            box-sizing: border-box;
            padding: 12px 16px;
            border-radius: 12px;
            border: 1px solid var(--border);
            background: var(--surface-alt);
            color: var(--text);
            font-size: 14px;
            outline: none;
            transition: border-color 0.2s ease, box-shadow 0.2s ease;
        }

        .form-control-custom:focus {
            border-color: var(--primary);
            box-shadow: 0 0 0 3px rgba(79, 110, 247, 0.15);
        }

        .btn-modern-primary {
            background: linear-gradient(135deg, #4f6ef7, #3b82f6);
            color: #ffffff !important;
            padding: 13px 28px;
            border-radius: 12px;
            font-size: 14.5px;
            font-weight: 700;
            display: inline-flex;
            align-items: center;
            justify-content: center;
            gap: 8px;
            text-decoration: none;
            border: none;
            cursor: pointer;
            box-shadow: 0 8px 22px rgba(79, 110, 247, 0.35);
            transition: all 0.3s ease;
            width: 100%;
        }

        .btn-modern-primary:hover {
            transform: translateY(-2px);
            box-shadow: 0 12px 28px rgba(79, 110, 247, 0.45);
        }

        /* Footer */
        .site-footer {
            background: var(--surface);
            border-top: 1px solid var(--border);
            padding: 35px 20px 25px;
            margin-top: auto;
            position: relative;
            z-index: 10;
        }

        .footer-wrapper {
            max-width: 1140px;
            margin: 0 auto;
            display: flex;
            align-items: center;
            justify-content: space-between;
            flex-wrap: wrap;
            gap: 25px;
            padding-bottom: 22px;
            border-bottom: 1px solid var(--border);
        }

        .footer-brand {
            display: flex;
            align-items: center;
            gap: 12px;
        }

        .footer-logo-icon {
            width: 42px;
            height: 42px;
            border-radius: 12px;
            background: linear-gradient(135deg, #4f6ef7, #3b82f6);
            color: #ffffff;
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 19px;
            box-shadow: 0 6px 16px rgba(79, 110, 247, 0.25);
        }

        .footer-brand-text h3 {
            margin: 0;
            font-size: 18px;
            font-weight: 800;
            color: var(--text);
        }

        .footer-brand-text p {
            margin: 2px 0 0;
            font-size: 12.5px;
            color: var(--text-muted);
        }

        .footer-links-group {
            display: flex;
            align-items: center;
            gap: 24px;
            flex-wrap: wrap;
        }

        .footer-contact-link {
            font-size: 13.5px;
            color: var(--text-muted);
            text-decoration: none;
            display: inline-flex;
            align-items: center;
            gap: 8px;
            transition: color 0.2s ease;
        }

        .footer-contact-link:hover {
            color: var(--primary);
        }

        .footer-social-wrap {
            display: flex;
            align-items: center;
            gap: 10px;
            padding-right: 75px;
        }

        @media (max-width: 768px) {
            .footer-social-wrap {
                padding-right: 0;
                margin-bottom: 60px;
            }
        }

        .social-pill-btn {
            width: 38px;
            height: 38px;
            border-radius: 50%;
            background: var(--surface-alt);
            color: var(--text-muted);
            border: 1px solid var(--border);
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 14px;
            text-decoration: none;
            transition: all 0.25s ease;
        }

        .social-pill-btn:hover {
            background: var(--primary);
            color: #ffffff;
            border-color: var(--primary);
            transform: translateY(-2px);
        }

        .footer-bottom {
            max-width: 1140px;
            margin: 18px auto 0;
            display: flex;
            align-items: center;
            justify-content: space-between;
            font-size: 12.5px;
            color: var(--text-muted);
            flex-wrap: wrap;
            gap: 10px;
            padding-right: 75px;
        }

        @media (max-width: 768px) {
            .footer-bottom {
                padding-right: 0;
            }
        }
    </style>
</head>
<body>

<!-- 1. NAVBAR -->
<jsp:include page="common/navbar.jsp" />

<!-- 2. HERO INTRO -->
<section class="contact-hero">
    <div class="badge-pill">
        <i class="fas fa-headset"></i> WE'RE HERE TO HELP
    </div>
    <h1 class="contact-title">
        Let's Start a <span class="gradient-text">Conversation</span>
    </h1>
    <p class="contact-subtitle">
        Have questions about courses, cohort schedules, or technical assistance? Our advisory team is available to assist your learning journey.
    </p>
</section>

<!-- 3. MAIN CONTACT SECTION -->
<section style="background: var(--surface-alt); border-top: 1px solid var(--border); border-bottom: 1px solid var(--border); padding: 60px 20px;">
    <div style="max-width: 1140px; margin: 0 auto;">
        
        <div class="contact-grid">

            <!-- LEFT: CONTACT INFO -->
            <div>
                <div class="contact-card">
                    <div class="icon-box icon-blue" style="margin-bottom: 16px;">
                        <i class="fas fa-address-book"></i>
                    </div>

                    <h2 style="font-size: 22px; font-weight: 800; margin: 0 0 8px; color: var(--text);">
                        Contact Information
                    </h2>
                    <p style="color: var(--text-muted); font-size: 14px; margin: 0 0 24px; line-height: 1.6;">
                        Connect directly via phone, email, or schedule an in-person academic counseling session.
                    </p>

                    <!-- Email -->
                    <div class="info-strip">
                        <div class="icon-box icon-blue" style="width: 40px; height: 40px; font-size: 16px; margin: 0;">
                            <i class="far fa-envelope"></i>
                        </div>
                        <div>
                            <h4 style="margin: 0 0 2px; font-size: 14px; font-weight: 700; color: var(--text);">Email Support</h4>
                            <p style="margin: 0; font-size: 13.5px; color: var(--text-muted);">edumanagesupport@gmail.com</p>
                        </div>
                    </div>

                    <!-- Phone -->
                    <div class="info-strip">
                        <div class="icon-box icon-green" style="width: 40px; height: 40px; font-size: 16px; margin: 0;">
                            <i class="fas fa-phone-alt"></i>
                        </div>
                        <div>
                            <h4 style="margin: 0 0 2px; font-size: 14px; font-weight: 700; color: var(--text);">Direct Phone</h4>
                            <p style="margin: 0; font-size: 13.5px; color: var(--text-muted);">+91 88558 15751</p>
                        </div>
                    </div>

                    <!-- Location -->
                    <div class="info-strip">
                        <div class="icon-box icon-purple" style="width: 40px; height: 40px; font-size: 16px; margin: 0;">
                            <i class="fas fa-location-dot"></i>
                        </div>
                        <div>
                            <h4 style="margin: 0 0 2px; font-size: 14px; font-weight: 700; color: var(--text);">Campus Location</h4>
                            <p style="margin: 0; font-size: 13.5px; color: var(--text-muted);">Pune, Maharashtra, India</p>
                        </div>
                    </div>

                    <!-- Working Hours -->
                    <div class="info-strip" style="margin-bottom: 0;">
                        <div class="icon-box icon-amber" style="width: 40px; height: 40px; font-size: 16px; margin: 0;">
                            <i class="far fa-clock"></i>
                        </div>
                        <div>
                            <h4 style="margin: 0 0 2px; font-size: 14px; font-weight: 700; color: var(--text);">Counseling Hours</h4>
                            <p style="margin: 0; font-size: 13.5px; color: var(--text-muted);">Mon – Sat | 9:00 AM – 7:00 PM</p>
                        </div>
                    </div>
                </div>

                <!-- Quick Call Support Card -->
                <div class="contact-card" style="margin-top: 24px; text-align: center; padding: 26px;">
                    <div class="icon-box icon-blue" style="margin: 0 auto 14px;">
                        <i class="fas fa-bolt"></i>
                    </div>
                    <h3 style="font-size: 17px; font-weight: 800; margin: 0 0 6px; color: var(--text);">Need Immediate Assistance?</h3>
                    <p style="font-size: 13.5px; color: var(--text-muted); margin: 0 0 16px;">Speak directly with our technical counseling team.</p>
                    <a href="tel:+918855815751" class="btn-secondary" style="display: inline-flex; align-items: center; gap: 8px; text-decoration: none; padding: 9px 20px; font-size: 13px; font-weight: 700; border-radius: 10px;">
                        <i class="fas fa-phone-volume"></i> Call Academic Counselor
                    </a>
                </div>
            </div>

            <!-- RIGHT: CONTACT FORM -->
            <div class="contact-card" style="padding: 38px 34px;">
                <div class="icon-box icon-purple" style="margin-bottom: 16px;">
                    <i class="fas fa-paper-plane"></i>
                </div>

                <h2 style="font-size: 22px; font-weight: 800; margin: 0 0 8px; color: var(--text);">
                    Send Us a Message
                </h2>
                <p style="color: var(--text-muted); font-size: 14px; margin: 0 0 26px;">
                    Fill out the form below and our coordinators will reach out within 24 business hours.
                </p>

                <form action="${pageContext.request.contextPath}/contact" method="post">
                    
                    <!-- Row: Name + Email -->
                    <div style="display: grid; grid-template-columns: repeat(auto-fit, minmax(220px, 1fr)); gap: 16px; margin-bottom: 18px;">
                        <div>
                            <label for="name" style="font-size: 13px; font-weight: 700; color: var(--text); display: block; margin-bottom: 6px;">
                                Full Name <span style="color: var(--danger); font-size: 11px;">*</span>
                            </label>
                            <input type="text" id="name" name="name" placeholder="your name" required class="form-control-custom">
                        </div>

                        <div>
                            <label for="email" style="font-size: 13px; font-weight: 700; color: var(--text); display: block; margin-bottom: 6px;">
                                Email Address <span style="color: var(--danger); font-size: 11px;">*</span>
                            </label>
                            <input type="email" id="email" name="email" placeholder="name@example.com" required class="form-control-custom">
                        </div>
                    </div>

                    <!-- Row: Phone -->
                    <div style="margin-bottom: 18px;">
                        <label for="phone" style="font-size: 13px; font-weight: 700; color: var(--text); display: block; margin-bottom: 6px;">
                            Phone Number
                        </label>
                        <input type="tel" id="phone" name="phone" placeholder="+91 XXXXX XXXXX" class="form-control-custom">
                    </div>

                    <!-- Row: Subject -->
                    <div style="margin-bottom: 18px;">
                        <label for="subject" style="font-size: 13px; font-weight: 700; color: var(--text); display: block; margin-bottom: 6px;">
                            Subject Category <span style="color: var(--danger); font-size: 11px;">*</span>
                        </label>
                        <select id="subject" name="subject" required class="form-control-custom" style="cursor: pointer;">
                            <option value="">Select an inquiry subject</option>
                            <option value="course">Course Curriculum & Syllabus</option>
                            <option value="registration">Admission & Registration</option>
                            <option value="technical">Technical Support</option>
                            <option value="career">Placement & Career Counseling</option>
                            <option value="other">General Query</option>
                        </select>
                    </div>

                    <!-- Row: Message -->
                    <div style="margin-bottom: 22px;">
                        <label for="message" style="font-size: 13px; font-weight: 700; color: var(--text); display: block; margin-bottom: 6px;">
                            Your Message <span style="color: var(--danger); font-size: 11px;">*</span>
                        </label>
                        <textarea id="message" name="message" rows="5" placeholder="Please describe how we can assist you..." required class="form-control-custom" style="resize: vertical;"></textarea>
                    </div>

                    <!-- Submit Button -->
                    <button type="submit" class="btn-modern-primary">
                        <span>Send Message</span>
                        <i class="fas fa-arrow-right"></i>
                    </button>

                    <!-- Alert message -->
                    <c:if test="${not empty successMsg}">
                        <div style="background: rgba(16, 185, 129, 0.12); color: #10b981; border: 1px solid rgba(16, 185, 129, 0.25); border-radius: 10px; padding: 12px; margin-top: 14px; text-align: center; font-size: 13.5px; font-weight: 700;">
                            <i class="fas fa-check-circle" style="margin-right: 5px;"></i> ${successMsg}
                        </div>
                    </c:if>

                    <p style="text-align: center; margin: 14px 0 0; font-size: 12.5px; color: var(--text-muted); display: flex; align-items: center; justify-content: center; gap: 6px;">
                        <i class="fas fa-lock" style="color: #10b981; font-size: 11px;"></i> Your contact information remains strictly confidential.
                    </p>
                </form>
            </div>

        </div>

    </div>
</section>

<!-- 4. WHY CONTACT EDUMANAGE -->
<section style="max-width: 1140px; margin: 70px auto; padding: 0 20px;">
    <div style="text-align: center; margin-bottom: 40px;">
        <span class="badge-pill"><i class="fas fa-award"></i> WHY REACH OUT</span>
        <h2 style="font-size: 30px; font-weight: 800; margin: 8px 0 0; color: var(--text);">Why Contact EduManage?</h2>
        <p style="color: var(--text-muted); font-size: 15px; margin-top: 8px;">Guaranteed prompt responses and personalized learning guidance.</p>
    </div>

    <div style="display: grid; grid-template-columns: repeat(auto-fit, minmax(240px, 1fr)); gap: 20px;">
        <div class="contact-card" style="padding: 26px;">
            <div class="icon-box icon-amber" style="margin-bottom: 16px;">
                <i class="fas fa-bolt"></i>
            </div>
            <h3 style="font-size: 17px; font-weight: 800; margin: 0 0 8px; color: var(--text);">Rapid Response</h3>
            <p style="font-size: 13.5px; color: var(--text-muted); line-height: 1.6; margin: 0;">Our academic desk answers inquiries within one business day.</p>
        </div>

        <div class="contact-card" style="padding: 26px;">
            <div class="icon-box icon-blue" style="margin-bottom: 16px;">
                <i class="fas fa-chalkboard-user"></i>
            </div>
            <h3 style="font-size: 17px; font-weight: 800; margin: 0 0 8px; color: var(--text);">Faculty Advice</h3>
            <p style="font-size: 13.5px; color: var(--text-muted); line-height: 1.6; margin: 0;">Connect with mentors to pick the right specialization track.</p>
        </div>

        <div class="contact-card" style="padding: 26px;">
            <div class="icon-box icon-green" style="margin-bottom: 16px;">
                <i class="fas fa-user-graduate"></i>
            </div>
            <h3 style="font-size: 17px; font-weight: 800; margin: 0 0 8px; color: var(--text);">Student Support</h3>
            <p style="font-size: 13.5px; color: var(--text-muted); line-height: 1.6; margin: 0;">End-to-end guidance from orientation to graduation portfolio.</p>
        </div>

        <div class="contact-card" style="padding: 26px;">
            <div class="icon-box icon-purple" style="margin-bottom: 16px;">
                <i class="fas fa-shield-halved"></i>
            </div>
            <h3 style="font-size: 17px; font-weight: 800; margin: 0 0 8px; color: var(--text);">Privacy First</h3>
            <p style="font-size: 13.5px; color: var(--text-muted); line-height: 1.6; margin: 0;">Your inquiries and details are encrypted and secure.</p>
        </div>
    </div>
</section>

<!-- 5. FOOTER -->
<footer class="site-footer">
    <div class="footer-wrapper">
        <div class="footer-brand">
            <div class="footer-logo-icon">
                <i class="fas fa-graduation-cap"></i>
            </div>
            <div class="footer-brand-text">
                <h3>EduManage</h3>
                <p>Training Institute Management System</p>
            </div>
        </div>

        <div class="footer-links-group">
            <a href="mailto:edumanagesupport@gmail.com" class="footer-contact-link">
                <i class="far fa-envelope" style="color: var(--primary);"></i>
                <span>edumanagesupport@gmail.com</span>
            </a>
            <a href="https://www.edumanage.com" target="_blank" class="footer-contact-link">
                <i class="fas fa-globe" style="color: var(--primary);"></i>
                <span>www.edumanage.com</span>
            </a>
        </div>

        <div class="footer-social-wrap">
            <a href="#" class="social-pill-btn" title="Facebook"><i class="fab fa-facebook-f"></i></a>
            <a href="#" class="social-pill-btn" title="X (Twitter)"><i class="fab fa-x-twitter"></i></a>
            <a href="#" class="social-pill-btn" title="LinkedIn"><i class="fab fa-linkedin-in"></i></a>
            <a href="#" class="social-pill-btn" title="Instagram"><i class="fab fa-instagram"></i></a>
        </div>
    </div>

    <div class="footer-bottom">
        <span>&copy; 2026 EduManage Technologies. All rights reserved.</span>
        <div style="display: flex; gap: 18px;">
            <a href="${pageContext.request.contextPath}/about" style="color: var(--text-muted); text-decoration: none;">About</a>
            <a href="${pageContext.request.contextPath}/contact" style="color: var(--text-muted); text-decoration: none;">Contact</a>
            <a href="${pageContext.request.contextPath}/login" style="color: var(--text-muted); text-decoration: none;">Portal Login</a>
        </div>
    </div>
</footer>



</body>
</html>