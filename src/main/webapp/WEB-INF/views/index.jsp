<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>EduManage | Smart Institute & Learning Platform</title>
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
            --primary-light: rgba(79, 110, 247, 0.09);
            --bg: #f8fafc;
            --surface: #ffffff;
            --surface-alt: #f1f5f9;
            --text: #0f172a;
            --text-muted: #64748b;
            --border: #e2e8f0;
            --shadow-sm: 0 2px 8px rgba(15, 23, 42, 0.04);
            --shadow: 0 6px 24px -2px rgba(15, 23, 42, 0.06);
            --shadow-xl: 0 24px 48px -12px rgba(15, 23, 42, 0.12);
        }

        [data-theme="dark"] {
            --bg: #090d16;
            --surface: #111827;
            --surface-alt: #1a2234;
            --text: #f8fafc;
            --text-muted: #94a3b8;
            --border: #1f293d;
            --shadow-sm: 0 2px 8px rgba(0, 0, 0, 0.3);
            --shadow: 0 6px 24px -2px rgba(0, 0, 0, 0.45);
            --shadow-xl: 0 24px 48px -12px rgba(0, 0, 0, 0.7);
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

        /* ---------------- HERO WITH VIDEO OVERLAY ---------------- */
        .hero-banner-wrapper {
            position: relative;
            min-height: 88vh;
            display: flex;
            align-items: center;
            justify-content: center;
            overflow: hidden;
            background: #000000;
        }

        .hero-video-bg {
            position: absolute;
            top: 50%;
            left: 50%;
            min-width: 100%;
            min-height: 100%;
            width: auto;
            height: auto;
            transform: translate(-50%, -50%);
            object-fit: cover;
            z-index: 1;
            opacity: 0.95;
            filter: brightness(0.9) contrast(1.05);
        }

        .hero-glass-overlay {
            position: absolute;
            inset: 0;
            background: radial-gradient(circle at center, rgba(0, 0, 0, 0.25) 0%, rgba(0, 0, 0, 0.6) 100%);
            z-index: 2;
        }

        .hero-content-box {
            position: relative;
            z-index: 3;
            max-width: 960px;
            margin: 0 auto;
            padding: 80px 20px 60px;
            text-align: center;
            color: #ffffff;
            text-shadow: 0 2px 10px rgba(0, 0, 0, 0.85);
        }

        .hero-tag-pill {
            display: inline-flex;
            align-items: center;
            gap: 8px;
            padding: 7px 20px;
            border-radius: 9999px;
            background: rgba(79, 110, 247, 0.2);
            color: #93c5fd;
            border: 1px solid rgba(147, 197, 253, 0.3);
            font-size: 13px;
            font-weight: 700;
            letter-spacing: 0.8px;
            margin-bottom: 24px;
            backdrop-filter: blur(8px);
            animation: fadeInDown 0.8s ease;
        }

        .hero-main-title {
            font-size: clamp(36px, 5.8vw, 62px);
            font-weight: 800;
            line-height: 1.15;
            letter-spacing: -0.03em;
            margin: 0 auto 20px;
            text-shadow: 0 4px 20px rgba(0, 0, 0, 0.6);
        }

        .gradient-title-span {
            background: linear-gradient(135deg, #60a5fa 0%, #a78bfa 50%, #38bdf8 100%);
            -webkit-background-clip: text;
            -webkit-text-fill-color: transparent;
        }

        .hero-sub-p {
            font-size: clamp(15.5px, 2vw, 18.5px);
            line-height: 1.7;
            color: #cbd5e1;
            max-width: 740px;
            margin: 0 auto 34px;
        }

        .hero-action-row {
            display: flex;
            align-items: center;
            justify-content: center;
            gap: 16px;
            flex-wrap: wrap;
            margin-bottom: 50px;
        }

        .btn-glow-primary {
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
            box-shadow: 0 10px 30px rgba(79, 110, 247, 0.5);
            transition: all 0.3s cubic-bezier(0.2, 0.65, 0.3, 1);
            border: none;
        }

        .btn-glow-primary:hover {
            transform: translateY(-3px) scale(1.02);
            box-shadow: 0 16px 40px rgba(79, 110, 247, 0.65);
            background: linear-gradient(135deg, #3b5be0, #2563eb);
        }

        .btn-glass-secondary {
            background: rgba(255, 255, 255, 0.08);
            color: #ffffff !important;
            border: 1px solid rgba(255, 255, 255, 0.2);
            padding: 14px 30px;
            border-radius: 14px;
            font-size: 15px;
            font-weight: 700;
            display: inline-flex;
            align-items: center;
            gap: 8px;
            text-decoration: none;
            backdrop-filter: blur(10px);
            transition: all 0.25s ease;
        }

        .btn-glass-secondary:hover {
            background: rgba(255, 255, 255, 0.16);
            border-color: #ffffff;
            transform: translateY(-2px);
        }

        /* Hero Floating Metrics */
        .hero-stats-strip {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(180px, 1fr));
            gap: 18px;
            max-width: 860px;
            margin: 0 auto;
        }

        .hero-stat-card {
            background: rgba(255, 255, 255, 0.06);
            border: 1px solid rgba(255, 255, 255, 0.12);
            border-radius: 18px;
            padding: 18px 16px;
            backdrop-filter: blur(12px);
            transition: all 0.3s ease;
        }

        .hero-stat-card:hover {
            background: rgba(255, 255, 255, 0.1);
            border-color: rgba(79, 110, 247, 0.4);
            transform: translateY(-3px);
        }

        .hero-stat-num {
            font-size: 28px;
            font-weight: 800;
            color: #60a5fa;
            margin-bottom: 2px;
        }

        .hero-stat-label {
            font-size: 12.5px;
            font-weight: 600;
            color: #94a3b8;
            letter-spacing: 0.4px;
        }

        /* ---------------- SECTION CARDS & DESIGN ---------------- */
        .section-container {
            max-width: 1160px;
            margin: 0 auto;
            padding: 70px 20px;
        }

        .section-head-center {
            text-align: center;
            max-width: 700px;
            margin: 0 auto 45px;
        }

        .section-pill-tag {
            display: inline-flex;
            align-items: center;
            gap: 6px;
            padding: 6px 16px;
            border-radius: 9999px;
            background: var(--primary-light);
            color: var(--primary);
            font-size: 12.5px;
            font-weight: 700;
            border: 1px solid rgba(79, 110, 247, 0.2);
            margin-bottom: 12px;
        }

        .section-main-heading {
            font-size: clamp(28px, 4vw, 36px);
            font-weight: 800;
            color: var(--text);
            margin: 0 0 10px;
            letter-spacing: -0.02em;
        }

        .section-sub-heading {
            font-size: 15.5px;
            color: var(--text-muted);
            margin: 0;
            line-height: 1.65;
        }

        .features-grid {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(320px, 1fr));
            gap: 24px;
        }

        .feature-box {
            background: var(--surface);
            border: 1px solid var(--border);
            border-radius: 22px;
            padding: 32px 28px;
            box-shadow: var(--shadow);
            transition: all 0.35s cubic-bezier(0.2, 0.65, 0.3, 1);
            position: relative;
            overflow: hidden;
            display: flex;
            flex-direction: column;
        }

        .feature-box::before {
            content: "";
            position: absolute;
            top: 0;
            left: 0;
            right: 0;
            height: 4px;
            background: var(--accent-bar, linear-gradient(90deg, #4f6ef7, #06b6d4));
            opacity: 0;
            transition: opacity 0.3s ease;
        }

        .feature-box:hover {
            transform: translateY(-6px);
            box-shadow: var(--shadow-xl);
            border-color: rgba(79, 110, 247, 0.35);
        }

        .feature-box:hover::before {
            opacity: 1;
        }

        .feature-icon-wrap {
            width: 52px;
            height: 52px;
            border-radius: 16px;
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 22px;
            margin-bottom: 22px;
            flex-shrink: 0;
        }

        .icon-blue-gradient   { background: rgba(79, 110, 247, 0.12); color: #4f6ef7; }
        .icon-green-gradient  { background: rgba(16, 185, 129, 0.12); color: #10b981; }
        .icon-purple-gradient { background: rgba(139, 92, 246, 0.12); color: #8b5cf6; }

        .feature-box h3 {
            font-size: 19px;
            font-weight: 800;
            margin: 0 0 10px;
            color: var(--text);
        }

        .feature-box p {
            font-size: 14.5px;
            color: var(--text-muted);
            line-height: 1.65;
            margin: 0;
        }

        /* ---------------- STEP JOURNEY ---------------- */
        .steps-grid {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(250px, 1fr));
            gap: 22px;
        }

        .step-card {
            background: var(--surface);
            border: 1px solid var(--border);
            border-radius: 20px;
            padding: 30px 24px;
            box-shadow: var(--shadow);
            position: relative;
            transition: all 0.3s ease;
        }

        .step-card:hover {
            transform: translateY(-4px);
            border-color: var(--primary);
            box-shadow: var(--shadow-xl);
        }

        .step-num-badge {
            width: 44px;
            height: 44px;
            border-radius: 12px;
            background: linear-gradient(135deg, var(--primary), #8b5cf6);
            color: #ffffff;
            font-size: 17px;
            font-weight: 800;
            display: flex;
            align-items: center;
            justify-content: center;
            margin-bottom: 20px;
            box-shadow: 0 6px 18px rgba(79, 110, 247, 0.3);
        }

        .step-card h4 {
            font-size: 17.5px;
            font-weight: 800;
            margin: 0 0 8px;
            color: var(--text);
        }

        .step-card p {
            font-size: 13.5px;
            color: var(--text-muted);
            line-height: 1.6;
            margin: 0;
        }

        /* ---------------- INTERACTIVE INQUIRY MODAL ---------------- */
        .modal-popup-backdrop {
            position: fixed;
            inset: 0;
            background: rgba(9, 13, 22, 0.75);
            backdrop-filter: blur(8px);
            z-index: 9999;
            display: none;
            align-items: center;
            justify-content: center;
            padding: 20px;
            animation: fadeInModal 0.3s ease;
        }

        .modal-popup-card {
            background: var(--surface);
            border: 1px solid var(--border);
            border-radius: 24px;
            padding: 36px 32px;
            max-width: 480px;
            width: 100%;
            position: relative;
            box-shadow: 0 25px 60px -15px rgba(0, 0, 0, 0.5);
        }

        .modal-popup-close-btn {
            position: absolute;
            top: 18px;
            right: 20px;
            background: var(--surface-alt);
            border: 1px solid var(--border);
            width: 32px;
            height: 32px;
            border-radius: 50%;
            font-size: 18px;
            color: var(--text-muted);
            cursor: pointer;
            display: flex;
            align-items: center;
            justify-content: center;
            transition: all 0.2s ease;
        }

        .modal-popup-close-btn:hover {
            background: rgba(239, 68, 68, 0.12);
            color: #ef4444;
            border-color: #ef4444;
        }

        .form-input-box {
            width: 100%;
            box-sizing: border-box;
            padding: 12px 14px;
            border-radius: 10px;
            border: 1px solid var(--border);
            background: var(--surface-alt);
            color: var(--text);
            font-size: 14px;
            outline: none;
            transition: border-color 0.2s ease;
            margin-top: 5px;
        }

        .form-input-box:focus {
            border-color: var(--primary);
            box-shadow: 0 0 0 3px rgba(79, 110, 247, 0.15);
        }

        /* ---------------- PERFECT FOOTER ---------------- */
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

        @keyframes fadeInDown {
            from { opacity: 0; transform: translateY(-15px); }
            to { opacity: 1; transform: translateY(0); }
        }

        @keyframes fadeInModal {
            from { opacity: 0; transform: scale(0.95); }
            to { opacity: 1; transform: scale(1); }
        }
    </style>
</head>
<body>

<!-- 1. NAVIGATION BAR -->
<jsp:include page="common/navbar.jsp" />

<!-- 2. HIGH-IMPACT HERO SECTION WITH VIDEO -->
<div class="hero-banner-wrapper">
    
    <!-- Background Video Asset -->
    <video autoplay muted loop playsinline class="hero-video-bg">
        <source src="${pageContext.request.contextPath}/videos/hero-bg.mp4" type="video/mp4">
        Your browser does not support the video tag.
    </video>

    <!-- Glass Vignette Overlay -->
    <div class="hero-glass-overlay"></div>

    <!-- Main Content Container -->
    <div class="hero-content-box">
        
        <div class="hero-tag-pill">
            <i class="fas fa-sparkles"></i> NEXT-GEN INSTITUTE ECOSYSTEM
        </div>

        <h1 class="hero-main-title">
            Learn Skills That <span class="gradient-title-span">Accelerate Careers</span>
        </h1>

        <p class="hero-sub-p">
            EduManage unites course registrations, trainer-led cohorts, real-time attendance logs, and code deliverable reviews in one frictionless platform.
        </p>

        <div class="hero-action-row">
            <a href="${pageContext.request.contextPath}/registration" class="btn-glow-primary">
                <span>Start Learning Free</span>
                <i class="fas fa-arrow-right"></i>
            </a>

            <a href="${pageContext.request.contextPath}/courses" class="btn-glass-secondary">
                <i class="fas fa-layer-group"></i>
                <span>Explore 15+ Tracks</span>
            </a>
        </div>

        <!-- Live Floating Metric Badges -->
        <div class="hero-stats-strip">
            <div class="hero-stat-card">
                <div class="hero-stat-num">15+</div>
                <div class="hero-stat-label">Specialized Tracks</div>
            </div>
            <div class="hero-stat-card">
                <div class="hero-stat-num">100%</div>
                <div class="hero-stat-label">Trainer-Led Cohorts</div>
            </div>
            <div class="hero-stat-card">
                <div class="hero-stat-num">24/7</div>
                <div class="hero-stat-label">Progress Analytics</div>
            </div>
        </div>

    </div>
</div>

<!-- 3. WHY EDUMANAGE SECTION -->
<main style="flex: 1;">
    <section class="section-container">
        
        <div class="section-head-center">
            <span class="section-pill-tag"><i class="fas fa-wand-magic-sparkles"></i> CORE ADVANTAGES</span>
            <h2 class="section-main-heading">Why Choose EduManage?</h2>
            <p class="section-sub-heading">Everything needed to learn, collaborate, and manage institute operations efficiently.</p>
        </div>

        <div class="features-grid">
            
            <div class="feature-box" style="--accent-bar: linear-gradient(90deg, #3b82f6, #60a5fa);">
                <div class="feature-icon-wrap icon-blue-gradient">
                    <i class="fas fa-layer-group"></i>
                </div>
                <h3>Structured Batch Cohorts</h3>
                <p>Learn alongside dedicated peers in curated, mentor-led batches with strict timetables and structured course roadmaps.</p>
            </div>

            <div class="feature-box" style="--accent-bar: linear-gradient(90deg, #10b981, #34d399);">
                <div class="feature-icon-wrap icon-green-gradient">
                    <i class="fas fa-clipboard-check"></i>
                </div>
                <h3>Constructive Code Reviews</h3>
                <p>Receive individual marks, actionable feedback, and line-by-line solution evaluation on every task submitted.</p>
            </div>

            <div class="feature-box" style="--accent-bar: linear-gradient(90deg, #8b5cf6, #c084fc);">
                <div class="feature-icon-wrap icon-purple-gradient">
                    <i class="fas fa-chart-line"></i>
                </div>
                <h3>Real-Time Tracking</h3>
                <p>Monitor your attendance percentages, assignment status, and skill progression in an intuitive analytics dashboard.</p>
            </div>

        </div>

    </section>

    <!-- 4. STEP-BY-STEP ADMISSIONS WORKFLOW -->
    <section style="background: var(--surface-alt); border-top: 1px solid var(--border); border-bottom: 1px solid var(--border);">
        <div class="section-container">
            
            <div class="section-head-center">
                <span class="section-pill-tag"><i class="fas fa-route"></i> STEP-BY-STEP</span>
                <h2 class="section-main-heading">How It Works</h2>
                <p class="section-sub-heading">From initial inquiry to final certification, your career milestone is mapped.</p>
            </div>

            <div class="steps-grid">
                
                <div class="step-card">
                    <div class="step-num-badge">01</div>
                    <h4>Register Profile</h4>
                    <p>Submit your student details and select your technical specialization track online.</p>
                </div>

                <div class="step-card">
                    <div class="step-num-badge">02</div>
                    <h4>Admin Approval</h4>
                    <p>Admissions review your enrollment profile and allocate secure platform credentials.</p>
                </div>

                <div class="step-card">
                    <div class="step-num-badge">03</div>
                    <h4>Join Batch Cohort</h4>
                    <p>Get assigned to an active trainer cohort with scheduled sessions and peers.</p>
                </div>

                <div class="step-card">
                    <div class="step-num-badge">04</div>
                    <h4>Learn & Excel</h4>
                    <p>Attend sessions, solve assignments, build real-world portfolios, and prepare for interviews.</p>
                </div>

            </div>

        </div>
    </section>
</main>

<!-- 5. UNIVERSAL MODERN FOOTER -->
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

<!-- 6. INQUIRY POPUP MODAL -->
<div class="modal-popup-backdrop" id="inquiryOverlay">
    <div class="modal-popup-card">
        <button type="button" class="modal-popup-close-btn" onclick="closePopup()">&times;</button>
        
        <div style="display: flex; align-items: center; gap: 10px; margin-bottom: 14px;">
            <div style="width: 38px; height: 38px; border-radius: 10px; background: rgba(79, 110, 247, 0.12); color: var(--primary); display: flex; align-items: center; justify-content: center; font-size: 17px;">
                <i class="fas fa-comments"></i>
            </div>
            <div>
                <h3 style="margin: 0; font-size: 18px; font-weight: 800; color: var(--text);">Quick Academic Inquiry</h3>
                <small style="color: var(--text-muted);">Get course details & counseling within 24 hours</small>
            </div>
        </div>

        <div id="popupMessage" style="margin-bottom: 12px;"></div>

        <form id="inquiryForm">
            <div style="margin-bottom: 12px;">
                <label style="font-size: 12.5px; font-weight: 700; color: var(--text); display: block;">Full Name <span style="color: var(--danger);">*</span></label>
                <input type="text" name="name" required placeholder=" Your Name" class="form-input-box">
            </div>

            <div style="margin-bottom: 12px;">
                <label style="font-size: 12.5px; font-weight: 700; color: var(--text); display: block;">Phone Number <span style="color: var(--danger);">*</span></label>
                <input type="tel" name="phone" required placeholder="+91 XXXXX XXXXX" class="form-input-box">
            </div>

            <div style="margin-bottom: 12px;">
                <label style="font-size: 12.5px; font-weight: 700; color: var(--text); display: block;">Email Address</label>
                <input type="email" name="email" placeholder="name@example.com" class="form-input-box">
            </div>

            <div style="margin-bottom: 18px;">
                <label style="font-size: 12.5px; font-weight: 700; color: var(--text); display: block;">Course Interested</label>
                <input type="text" name="courseInterested" placeholder="e.g. Java Full Stack / Python Data Science" class="form-input-box">
            </div>

            <button type="submit" class="btn-glow-primary" style="width: 100%; justify-content: center; padding: 12px; font-size: 14px; border-radius: 10px;">
                <span>Submit Inquiry</span>
                <i class="fas fa-paper-plane"></i>
            </button>
        </form>
    </div>
</div>

<!-- 7. GLOBAL CONTEXT PATH & COMMON CHATBOT COMPONENT -->

<!-- 8. PAGE SCRIPTS -->
<script>
    // Show inquiry popup 5 seconds after landing on the page
    setTimeout(function () {
        const popup = document.getElementById('inquiryOverlay');
        if(popup) popup.style.display = 'flex';
    }, 5000);

    function closePopup() {
        const popup = document.getElementById('inquiryOverlay');
        if(popup) popup.style.display = 'none';
    }

    document.getElementById('inquiryForm').addEventListener('submit', function (e) {
        e.preventDefault();
        const formData = new FormData(this);
        const params = new URLSearchParams();
        formData.forEach((value, key) => { params.append(key, value); });

        fetch('${pageContext.request.contextPath}/inquiry/submit', {
            method: 'POST',
            headers: { 'Content-Type': 'application/x-www-form-urlencoded' },
            body: params.toString()
        }).then(res => res.text())
          .then(() => {
              document.getElementById('popupMessage').innerHTML =
                  '<div style="background: rgba(16, 185, 129, 0.12); color: #10b981; border: 1px solid rgba(16, 185, 129, 0.25); border-radius: 8px; padding: 10px; font-size: 13px; font-weight: 700; text-align: center;"><i class="fas fa-check-circle"></i> Thank you! Our academic team will contact you soon.</div>';
              setTimeout(closePopup, 1800);
          }).catch(() => {
              document.getElementById('popupMessage').innerHTML =
                  '<div style="background: rgba(16, 185, 129, 0.12); color: #10b981; border: 1px solid rgba(16, 185, 129, 0.25); border-radius: 8px; padding: 10px; font-size: 13px; font-weight: 700; text-align: center;"><i class="fas fa-check-circle"></i> Inquiry received! We will reach out shortly.</div>';
              setTimeout(closePopup, 1800);
          });
    });
</script>

</body>
</html>