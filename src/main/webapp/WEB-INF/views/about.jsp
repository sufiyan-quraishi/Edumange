<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>About Us | EduManage</title>
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

        /* Hero Banner */
        .about-hero {
            padding: 80px 20px 50px;
            text-align: center;
            position: relative;
            background: radial-gradient(circle at 50% 10%, rgba(79, 110, 247, 0.12) 0%, transparent 60%);
        }

        .badge-pill {
            display: inline-flex;
            align-items: center;
            gap: 8px;
            padding: 8px 20px;
            border-radius: 9999px;
            background: var(--primary-light);
            color: var(--primary);
            font-size: 13px;
            font-weight: 700;
            border: 1px solid rgba(79, 110, 247, 0.2);
            margin-bottom: 24px;
            letter-spacing: 0.5px;
        }

        .about-title {
            font-size: clamp(34px, 5vw, 52px);
            font-weight: 800;
            line-height: 1.15;
            letter-spacing: -0.03em;
            max-width: 850px;
            margin: 0 auto 20px;
        }

        .gradient-text {
            background: linear-gradient(135deg, #4f6ef7 0%, #06b6d4 100%);
            -webkit-background-clip: text;
            -webkit-text-fill-color: transparent;
        }

        .about-subtitle {
            font-size: 17px;
            line-height: 1.7;
            color: var(--text-muted);
            max-width: 680px;
            margin: 0 auto;
        }

        /* Cards */
        .about-card {
            background: var(--surface);
            border: 1px solid var(--border);
            border-radius: 24px;
            padding: 32px;
            box-shadow: var(--shadow);
            transition: all 0.35s cubic-bezier(0.2, 0.65, 0.3, 1);
            display: flex;
            flex-direction: column;
        }

        .about-card:hover {
            transform: translateY(-6px);
            box-shadow: var(--shadow-lg);
            border-color: rgba(79, 110, 247, 0.3);
        }

        .icon-box {
            width: 54px;
            height: 54px;
            border-radius: 16px;
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 22px;
            margin-bottom: 22px;
            flex-shrink: 0;
        }

        .icon-blue { background: rgba(79, 110, 247, 0.12); color: #4f6ef7; }
        .icon-green { background: rgba(16, 185, 129, 0.12); color: #10b981; }
        .icon-purple { background: rgba(139, 92, 246, 0.12); color: #8b5cf6; }
        .icon-amber { background: rgba(245, 158, 11, 0.12); color: #f59e0b; }
        .icon-rose { background: rgba(244, 63, 94, 0.12); color: #f43f5e; }
        .icon-cyan { background: rgba(6, 182, 212, 0.12); color: #06b6d4; }

        .about-card h3 {
            font-size: 19px;
            font-weight: 700;
            margin: 0 0 10px;
            color: var(--text);
        }

        .about-card p {
            font-size: 14.5px;
            line-height: 1.65;
            color: var(--text-muted);
            margin: 0;
        }

        /* Stats */
        .stats-strip {
            max-width: 1140px;
            margin: 40px auto 70px;
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(200px, 1fr));
            gap: 20px;
            padding: 0 20px;
        }

        .stat-item {
            background: var(--surface);
            border: 1px solid var(--border);
            border-radius: 20px;
            padding: 24px;
            text-align: center;
            box-shadow: var(--shadow);
        }

        .stat-number {
            font-size: 32px;
            font-weight: 800;
            color: var(--primary);
            margin-bottom: 4px;
        }

        .stat-label {
            font-size: 13px;
            font-weight: 600;
            color: var(--text-muted);
            text-transform: uppercase;
            letter-spacing: 0.5px;
        }

        /* CTA */
        .cta-banner {
            background: linear-gradient(135deg, #1e293b 0%, #0f172a 100%);
            border-radius: 28px;
            padding: 60px 40px;
            text-align: center;
            color: #ffffff;
            position: relative;
            overflow: hidden;
            border: 1px solid rgba(255, 255, 255, 0.08);
            box-shadow: var(--shadow-lg);
        }

        .btn-modern-primary {
            background: linear-gradient(135deg, #4f6ef7, #3b82f6);
            color: #ffffff !important;
            padding: 14px 34px;
            border-radius: 14px;
            font-size: 15px;
            font-weight: 700;
            display: inline-flex;
            align-items: center;
            gap: 10px;
            text-decoration: none;
            box-shadow: 0 10px 25px rgba(79, 110, 247, 0.4);
            transition: all 0.3s ease;
        }

        .btn-modern-primary:hover {
            transform: translateY(-3px) scale(1.02);
            background: linear-gradient(135deg, #3b5be0, #2563eb);
        }

        /* Fixed Non-Overlapping Footer with Chatbot Clearance */
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

        /* Padded Right Container to avoid Chatbot overlap */
        .footer-social-wrap {
            display: flex;
            align-items: center;
            gap: 10px;
            padding-right: 75px; /* Chatbot bubble gap */
        }

        @media (max-width: 768px) {
            .footer-social-wrap {
                padding-right: 0;
                margin-bottom: 60px; /* Space on mobile */
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
            padding-right: 75px; /* Chatbot clearance */
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

<!-- 2. MAIN CONTENT -->
<main style="flex: 1;">

    <!-- HERO INTRO -->
    <section class="about-hero">
        <div class="badge-pill">
            <i class="fas fa-sparkles"></i> NEXT-GEN INSTITUTE PORTAL
        </div>
        <h1 class="about-title">
            Empowering Institutes with <span class="gradient-text">Smarter Education</span> Management
        </h1>
        <p class="about-subtitle">
            EduManage unites students, expert trainers, and administrators into an integrated digital environment — turning everyday institute workflows into frictionless learning outcomes.
        </p>
    </section>

    <!-- METRICS STRIP -->
    <div class="stats-strip">
        <div class="stat-item">
            <div class="stat-number">100%</div>
            <div class="stat-label">Paperless Records</div>
        </div>
        <div class="stat-item">
            <div class="stat-number">3x</div>
            <div class="stat-label">Faster Evaluations</div>
        </div>
        <div class="stat-item">
            <div class="stat-number">Real-Time</div>
            <div class="stat-label">Attendance Sync</div>
        </div>
        <div class="stat-item">
            <div class="stat-number">Unified</div>
            <div class="stat-label">Multi-Batch Control</div>
        </div>
    </div>

    <!-- MISSION & VISION SECTION -->
    <section style="max-width: 1140px; margin: 0 auto 60px; padding: 0 20px;">
        <div style="display: grid; grid-template-columns: repeat(auto-fit, minmax(320px, 1fr)); gap: 24px;">
            
            <div class="about-card">
                <div class="icon-box icon-blue">
                    <i class="fas fa-book-open-reader"></i>
                </div>
                <h3>Our Vision</h3>
                <p>
                    Managing an academy involves far more than student spreadsheets. Registrations, cohorts, daily presence, coding tasks, and mentor feedback require interconnected harmony. We envision an institute where administrative friction is zero and teaching takes center stage.
                </p>
            </div>

            <div class="about-card">
                <div class="icon-box icon-green">
                    <i class="fas fa-bullseye"></i>
                </div>
                <h3>Our Core Purpose</h3>
                <p>
                    Our mission is clear — help training institutes eliminate manual operational burdens, minimize administrative overhead, and provide learners with structured coursework that accelerates technical careers.
                </p>
            </div>

        </div>
    </section>

    <!-- WHAT EDUMANAGE SOLVES -->
    <section style="background: var(--surface-alt); border-top: 1px solid var(--border); border-bottom: 1px solid var(--border); padding: 70px 20px;">
        <div style="max-width: 1140px; margin: 0 auto;">
            
            <div style="text-align: center; margin-bottom: 45px;">
                <span class="badge-pill"><i class="fas fa-wand-magic-sparkles"></i> KEY ADVANTAGES</span>
                <h2 style="font-size: 32px; font-weight: 800; margin: 8px 0 0; color: var(--text);">What EduManage Solves</h2>
                <p style="color: var(--text-muted); font-size: 15px; margin-top: 8px;">A single robust platform built to replace fragmented tools and legacy systems.</p>
            </div>

            <div style="display: grid; grid-template-columns: repeat(auto-fit, minmax(280px, 1fr)); gap: 24px;">
                
                <div class="about-card">
                    <div class="icon-box icon-rose">
                        <i class="fas fa-file-excel"></i>
                    </div>
                    <h3>Scattered Data Sheets</h3>
                    <p>Replaces disjointed local Excel files and physical registers with a centralized, secure database accessible from anywhere.</p>
                </div>

                <div class="about-card">
                    <div class="icon-box icon-purple">
                        <i class="fas fa-network-wired"></i>
                    </div>
                    <h3>Communication Gaps</h3>
                    <p>Instantly synchronizes assignments, review feedbacks, and announcements directly between students and trainers.</p>
                </div>

                <div class="about-card">
                    <div class="icon-box icon-amber">
                        <i class="fas fa-clock-rotate-left"></i>
                    </div>
                    <h3>Manual Task Tracking</h3>
                    <p>Automates daily attendance ratios, task submission pipelines, and individual evaluation grading without paperwork.</p>
                </div>

            </div>

        </div>
    </section>

    <!-- ECOSYSTEM ROLES SECTION -->
    <section style="max-width: 1140px; margin: 70px auto; padding: 0 20px;">
        <div style="text-align: center; margin-bottom: 45px;">
            <span class="badge-pill"><i class="fas fa-users-gear"></i> ROLES & ACCESS</span>
            <h2 style="font-size: 32px; font-weight: 800; margin: 8px 0 0; color: var(--text);">Connecting Every Stakeholder</h2>
            <p style="color: var(--text-muted); font-size: 15px; margin-top: 8px;">Tailored operational dashboards designed for each user persona.</p>
        </div>

        <div style="display: grid; grid-template-columns: repeat(auto-fit, minmax(300px, 1fr)); gap: 24px;">
            
            <div class="about-card">
                <div class="icon-box icon-blue">
                    <i class="fas fa-shield-halved"></i>
                </div>
                <h3>Super Administrator</h3>
                <p>Maintains institute integrity, manages training batches, assigns trainers, enrolls students, and oversees overarching analytics.</p>
            </div>

            <div class="about-card">
                <div class="icon-box icon-cyan">
                    <i class="fas fa-chalkboard-user"></i>
                </div>
                <h3>Faculty Trainer</h3>
                <p>Manages live batches, logs daily student attendance, assigns code tasks, and delivers constructive grading and review feedback.</p>
            </div>

            <div class="about-card">
                <div class="icon-box icon-green">
                    <i class="fas fa-user-graduate"></i>
                </div>
                <h3>Active Student</h3>
                <p>Tracks coursework progress, submits assignments with attachments, monitors attendance percentages, and views scores.</p>
            </div>

        </div>
    </section>

    <!-- CALL TO ACTION BANNER -->
    <section style="max-width: 1140px; margin: 0 auto 80px; padding: 0 20px;">
        <div class="cta-banner">
            <div style="position: relative; z-index: 2;">
                <div style="width: 58px; height: 58px; border-radius: 18px; background: rgba(79, 110, 247, 0.25); color: #818cf8; display: flex; align-items: center; justify-content: center; font-size: 26px; margin: 0 auto 20px;">
                    <i class="fas fa-rocket"></i>
                </div>
                <h2 style="font-size: clamp(26px, 4vw, 36px); font-weight: 800; margin: 0 0 12px;">Ready to Elevate Your Institute?</h2>
                <p style="color: #94a3b8; font-size: 16px; max-width: 620px; margin: 0 auto 30px; line-height: 1.6;">
                    Experience the modern management standard built for progressive training institutes and academies.
                </p>
                <a href="${pageContext.request.contextPath}/registration" class="btn-modern-primary">
                    <span>Create Free Account</span>
                    <i class="fas fa-arrow-right"></i>
                </a>
            </div>
        </div>
    </section>

</main>

<!-- 3. FOOTER (With right-side padding to prevent chatbot overlap) -->
<footer class="site-footer">
    <div class="footer-wrapper">
        
        <!-- Brand & Info -->
        <div class="footer-brand">
            <div class="footer-logo-icon">
                <i class="fas fa-graduation-cap"></i>
            </div>
            <div class="footer-brand-text">
                <h3>EduManage</h3>
                <p>Training Institute Management System</p>
            </div>
        </div>

        <!-- Contact Links -->
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

        <!-- Social Media Buttons -->
        <div class="footer-social-wrap">
            <a href="#" class="social-pill-btn" title="Facebook"><i class="fab fa-facebook-f"></i></a>
            <a href="#" class="social-pill-btn" title="X (Twitter)"><i class="fab fa-x-twitter"></i></a>
            <a href="#" class="social-pill-btn" title="LinkedIn"><i class="fab fa-linkedin-in"></i></a>
            <a href="#" class="social-pill-btn" title="Instagram"><i class="fab fa-instagram"></i></a>
        </div>

    </div>

    <!-- Copyright Sub-strip -->
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