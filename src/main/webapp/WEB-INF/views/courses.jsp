<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Courses | EduManage</title>
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

        .courses-hero {
            padding: 80px 20px 45px;
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

        .courses-title {
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

        .courses-subtitle {
            font-size: 16px;
            color: var(--text-muted);
            max-width: 680px;
            margin: 0 auto;
            line-height: 1.7;
        }

        .course-grid {
            display: grid;
            grid-template-columns: repeat(auto-fill, minmax(290px, 1fr));
            gap: 24px;
        }

        .course-card {
            background: var(--surface);
            border: 1px solid var(--border);
            border-radius: 20px;
            padding: 26px;
            box-shadow: var(--shadow);
            transition: all 0.3s cubic-bezier(0.2, 0.65, 0.3, 1);
            display: flex;
            flex-direction: column;
            justify-content: space-between;
        }

        .course-card:hover {
            transform: translateY(-5px);
            box-shadow: var(--shadow-lg);
            border-color: rgba(79, 110, 247, 0.4);
        }

        .icon-box {
            width: 50px;
            height: 50px;
            border-radius: 14px;
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 22px;
            margin-bottom: 18px;
            flex-shrink: 0;
        }

        .icon-orange  { background: rgba(249, 115, 22, 0.12); color: #f97316; }
        .icon-blue    { background: rgba(59, 130, 246, 0.12); color: #3b82f6; }
        .icon-red     { background: rgba(239, 68, 68, 0.12); color: #ef4444; }
        .icon-cyan    { background: rgba(6, 182, 212, 0.12); color: #06b6d4; }
        .icon-green   { background: rgba(16, 185, 129, 0.12); color: #10b981; }
        .icon-emerald { background: rgba(5, 150, 105, 0.12); color: #059669; }
        .icon-indigo  { background: rgba(99, 102, 241, 0.12); color: #6366f1; }
        .icon-purple  { background: rgba(139, 92, 246, 0.12); color: #8b5cf6; }
        .icon-pink    { background: rgba(236, 72, 153, 0.12); color: #ec4899; }
        .icon-violet  { background: rgba(124, 58, 237, 0.12); color: #7c3aed; }
        .icon-sky     { background: rgba(14, 165, 233, 0.12); color: #0ea5e9; }
        .icon-slate   { background: rgba(100, 116, 139, 0.12); color: #64748b; }
        .icon-rose    { background: rgba(244, 63, 94, 0.12); color: #f43f5e; }
        .icon-amber   { background: rgba(245, 158, 11, 0.12); color: #f59e0b; }

        .course-title {
            font-size: 17.5px;
            font-weight: 800;
            color: var(--text);
            margin: 0 0 10px 0;
            line-height: 1.35;
        }

        .course-desc {
            font-size: 13.5px;
            color: var(--text-muted);
            line-height: 1.6;
            margin: 0 0 16px 0;
        }

        .meta-strip {
            background: var(--surface-alt);
            border: 1px solid var(--border);
            border-radius: 12px;
            padding: 10px 14px;
            display: flex;
            flex-direction: column;
            gap: 6px;
            margin-bottom: 18px;
            font-size: 12.5px;
        }

        .meta-item {
            display: flex;
            align-items: center;
            justify-content: space-between;
        }

        .meta-label {
            color: var(--text-muted);
            display: flex;
            align-items: center;
            gap: 6px;
        }

        .meta-value {
            font-weight: 700;
            color: var(--text);
        }

        .btn-modern-primary {
            background: linear-gradient(135deg, #4f6ef7, #3b82f6);
            color: #ffffff !important;
            padding: 13px 32px;
            border-radius: 12px;
            font-size: 14.5px;
            font-weight: 700;
            display: inline-flex;
            align-items: center;
            gap: 8px;
            text-decoration: none;
            box-shadow: 0 8px 22px rgba(79, 110, 247, 0.35);
            transition: all 0.3s ease;
        }

        .btn-modern-primary:hover {
            transform: translateY(-2px);
            box-shadow: 0 12px 28px rgba(79, 110, 247, 0.45);
        }

        .step-number {
            width: 44px;
            height: 44px;
            border-radius: 12px;
            background: linear-gradient(135deg, var(--primary), #8b5cf6);
            color: #ffffff;
            font-weight: 800;
            font-size: 17px;
            display: flex;
            align-items: center;
            justify-content: center;
            margin-bottom: 18px;
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

<!-- 1. NAVIGATION -->
<jsp:include page="common/navbar.jsp" />

<!-- 2. HERO HEADER -->
<main style="flex: 1;">

    <section class="courses-hero">
        <div class="badge-pill">
            <i class="fas fa-graduation-cap"></i> INDUSTRY RECOGNIZED CURRICULUM
        </div>
        <h1 class="courses-title">
            Explore Career-Ready <span class="gradient-text">Specializations</span>
        </h1>
        <p class="courses-subtitle">
            Hands-on programs led by industry professionals with real-time projects, code reviews, and structured placement milestones.
        </p>
    </section>

    <!-- 3. COURSES DIRECTORY GRID -->
    <section style="max-width: 1180px; margin: 0 auto 70px; padding: 0 20px;">
        <div class="course-grid">

            <!-- Java Full Stack -->
            <div class="course-card">
                <div>
                    <div class="icon-box icon-orange"><i class="fab fa-java"></i></div>
                    <h3 class="course-title">Java Full Stack Development</h3>
                    <p class="course-desc">Architect scalable enterprise web applications with Core Java, Spring Boot, RESTful APIs, and relational databases.</p>
                    <div class="meta-strip">
                        <div class="meta-item">
                            <span class="meta-label"><i class="far fa-clock"></i> Duration:</span>
                            <span class="meta-value">3 Months</span>
                        </div>
                        <div class="meta-item">
                            <span class="meta-label"><i class="fas fa-code"></i> Tech:</span>
                            <span class="meta-value">Java, Spring, JSP, MySQL</span>
                        </div>
                    </div>
                </div>
                <a href="${pageContext.request.contextPath}/registration" class="mini-btn" style="width: 100%; text-align: center; text-decoration: none; padding: 10px; font-weight: 700; box-sizing: border-box;">
                    Enroll Now <i class="fas fa-arrow-right" style="margin-left: 4px;"></i>
                </a>
            </div>

            <!-- Python & Data Science -->
            <div class="course-card">
                <div>
                    <div class="icon-box icon-blue"><i class="fab fa-python"></i></div>
                    <h3 class="course-title">Python & Data Science</h3>
                    <p class="course-desc">Master Python scripting, statistical analysis, data visualization pipelines, and core machine learning fundamentals.</p>
                    <div class="meta-strip">
                        <div class="meta-item">
                            <span class="meta-label"><i class="far fa-clock"></i> Duration:</span>
                            <span class="meta-value">2.5 Months</span>
                        </div>
                        <div class="meta-item">
                            <span class="meta-label"><i class="fas fa-code"></i> Tech:</span>
                            <span class="meta-value">Pandas, NumPy, Scikit-Learn</span>
                        </div>
                    </div>
                </div>
                <a href="${pageContext.request.contextPath}/registration" class="mini-btn" style="width: 100%; text-align: center; text-decoration: none; padding: 10px; font-weight: 700; box-sizing: border-box;">
                    Enroll Now <i class="fas fa-arrow-right" style="margin-left: 4px;"></i>
                </a>
            </div>

            <!-- Frontend Development -->
            <div class="course-card">
                <div>
                    <div class="icon-box icon-red"><i class="fab fa-html5"></i></div>
                    <h3 class="course-title">Modern Frontend Web</h3>
                    <p class="course-desc">Build responsive, interactive web experiences with modern CSS architecture, modern JavaScript ES6+, and responsive frameworks.</p>
                    <div class="meta-strip">
                        <div class="meta-item">
                            <span class="meta-label"><i class="far fa-clock"></i> Duration:</span>
                            <span class="meta-value">2 Months</span>
                        </div>
                        <div class="meta-item">
                            <span class="meta-label"><i class="fas fa-code"></i> Tech:</span>
                            <span class="meta-value">HTML5, CSS3, JS, Bootstrap</span>
                        </div>
                    </div>
                </div>
                <a href="${pageContext.request.contextPath}/registration" class="mini-btn" style="width: 100%; text-align: center; text-decoration: none; padding: 10px; font-weight: 700; box-sizing: border-box;">
                    Enroll Now <i class="fas fa-arrow-right" style="margin-left: 4px;"></i>
                </a>
            </div>

            <!-- React JS -->
            <div class="course-card">
                <div>
                    <div class="icon-box icon-cyan"><i class="fab fa-react"></i></div>
                    <h3 class="course-title">React.js Single Page Apps</h3>
                    <p class="course-desc">Develop reactive SPAs using functional components, modern Hooks, Context API state management, and external API consumption.</p>
                    <div class="meta-strip">
                        <div class="meta-item">
                            <span class="meta-label"><i class="far fa-clock"></i> Duration:</span>
                            <span class="meta-value">2 Months</span>
                        </div>
                        <div class="meta-item">
                            <span class="meta-label"><i class="fas fa-code"></i> Tech:</span>
                            <span class="meta-value">React, Redux, Tailwind, REST</span>
                        </div>
                    </div>
                </div>
                <a href="${pageContext.request.contextPath}/registration" class="mini-btn" style="width: 100%; text-align: center; text-decoration: none; padding: 10px; font-weight: 700; box-sizing: border-box;">
                    Enroll Now <i class="fas fa-arrow-right" style="margin-left: 4px;"></i>
                </a>
            </div>

            <!-- Spring Boot & Microservices -->
            <div class="course-card">
                <div>
                    <div class="icon-box icon-green"><i class="fas fa-leaf"></i></div>
                    <h3 class="course-title">Spring Boot & Microservices</h3>
                    <p class="course-desc">Master backend microservices architecture, JWT authentication, Spring Data JPA, and decoupled message brokers.</p>
                    <div class="meta-strip">
                        <div class="meta-item">
                            <span class="meta-label"><i class="far fa-clock"></i> Duration:</span>
                            <span class="meta-value">2.5 Months</span>
                        </div>
                        <div class="meta-item">
                            <span class="meta-label"><i class="fas fa-code"></i> Tech:</span>
                            <span class="meta-value">Spring Cloud, JWT, REST, Docker</span>
                        </div>
                    </div>
                </div>
                <a href="${pageContext.request.contextPath}/registration" class="mini-btn" style="width: 100%; text-align: center; text-decoration: none; padding: 10px; font-weight: 700; box-sizing: border-box;">
                    Enroll Now <i class="fas fa-arrow-right" style="margin-left: 4px;"></i>
                </a>
            </div>

            <!-- Python Web (Django/Flask) -->
            <div class="course-card">
                <div>
                    <div class="icon-box icon-emerald"><i class="fas fa-laptop-code"></i></div>
                    <h3 class="course-title">Python Full Stack (Django)</h3>
                    <p class="course-desc">Create secure and dynamic web backends using Django ORM, template engines, Flask microservices, and REST APIs.</p>
                    <div class="meta-strip">
                        <div class="meta-item">
                            <span class="meta-label"><i class="far fa-clock"></i> Duration:</span>
                            <span class="meta-value">2 Months</span>
                        </div>
                        <div class="meta-item">
                            <span class="meta-label"><i class="fas fa-code"></i> Tech:</span>
                            <span class="meta-value">Django, Flask, SQLite, DRF</span>
                        </div>
                    </div>
                </div>
                <a href="${pageContext.request.contextPath}/registration" class="mini-btn" style="width: 100%; text-align: center; text-decoration: none; padding: 10px; font-weight: 700; box-sizing: border-box;">
                    Enroll Now <i class="fas fa-arrow-right" style="margin-left: 4px;"></i>
                </a>
            </div>

            <!-- SQL & Database Design -->
            <div class="course-card">
                <div>
                    <div class="icon-box icon-indigo"><i class="fas fa-database"></i></div>
                    <h3 class="course-title">SQL & Database Architecture</h3>
                    <p class="course-desc">Master complex queries, indexing structures, schema design, transactions, and performance tuning across RDBMS.</p>
                    <div class="meta-strip">
                        <div class="meta-item">
                            <span class="meta-label"><i class="far fa-clock"></i> Duration:</span>
                            <span class="meta-value">6 Weeks</span>
                        </div>
                        <div class="meta-item">
                            <span class="meta-label"><i class="fas fa-code"></i> Tech:</span>
                            <span class="meta-value">MySQL, PostgreSQL, Query Plan</span>
                        </div>
                    </div>
                </div>
                <a href="${pageContext.request.contextPath}/registration" class="mini-btn" style="width: 100%; text-align: center; text-decoration: none; padding: 10px; font-weight: 700; box-sizing: border-box;">
                    Enroll Now <i class="fas fa-arrow-right" style="margin-left: 4px;"></i>
                </a>
            </div>

            <!-- Data Analytics -->
            <div class="course-card">
                <div>
                    <div class="icon-box icon-purple"><i class="fas fa-chart-pie"></i></div>
                    <h3 class="course-title">Business Data Analytics</h3>
                    <p class="course-desc">Transform raw dataset streams into actionable dashboards using Advanced Excel, SQL analysis, and PowerBI visualization.</p>
                    <div class="meta-strip">
                        <div class="meta-item">
                            <span class="meta-label"><i class="far fa-clock"></i> Duration:</span>
                            <span class="meta-value">2 Months</span>
                        </div>
                        <div class="meta-item">
                            <span class="meta-label"><i class="fas fa-code"></i> Tech:</span>
                            <span class="meta-value">Excel, SQL, PowerBI, Python</span>
                        </div>
                    </div>
                </div>
                <a href="${pageContext.request.contextPath}/registration" class="mini-btn" style="width: 100%; text-align: center; text-decoration: none; padding: 10px; font-weight: 700; box-sizing: border-box;">
                    Enroll Now <i class="fas fa-arrow-right" style="margin-left: 4px;"></i>
                </a>
            </div>

            <!-- Digital Marketing -->
            <div class="course-card">
                <div>
                    <div class="icon-box icon-pink"><i class="fas fa-bullhorn"></i></div>
                    <h3 class="course-title">Performance Marketing</h3>
                    <p class="course-desc">Execute data-driven digital campaigns across search engines, social paid ads, conversion funnels, and analytics.</p>
                    <div class="meta-strip">
                        <div class="meta-item">
                            <span class="meta-label"><i class="far fa-clock"></i> Duration:</span>
                            <span class="meta-value">6 Weeks</span>
                        </div>
                        <div class="meta-item">
                            <span class="meta-label"><i class="fas fa-code"></i> Tech:</span>
                            <span class="meta-value">SEO, Google Ads, Meta Ads</span>
                        </div>
                    </div>
                </div>
                <a href="${pageContext.request.contextPath}/registration" class="mini-btn" style="width: 100%; text-align: center; text-decoration: none; padding: 10px; font-weight: 700; box-sizing: border-box;">
                    Enroll Now <i class="fas fa-arrow-right" style="margin-left: 4px;"></i>
                </a>
            </div>

            <!-- UI/UX Product Design -->
            <div class="course-card">
                <div>
                    <div class="icon-box icon-violet"><i class="fas fa-pen-nib"></i></div>
                    <h3 class="course-title">UI/UX Product Design</h3>
                    <p class="course-desc">Craft user-centric software interfaces with wireframing, high-fidelity prototypes, user research, and Figma design systems.</p>
                    <div class="meta-strip">
                        <div class="meta-item">
                            <span class="meta-label"><i class="far fa-clock"></i> Duration:</span>
                            <span class="meta-value">6 Weeks</span>
                        </div>
                        <div class="meta-item">
                            <span class="meta-label"><i class="fas fa-code"></i> Tech:</span>
                            <span class="meta-value">Figma, Design Systems, UX</span>
                        </div>
                    </div>
                </div>
                <a href="${pageContext.request.contextPath}/registration" class="mini-btn" style="width: 100%; text-align: center; text-decoration: none; padding: 10px; font-weight: 700; box-sizing: border-box;">
                    Enroll Now <i class="fas fa-arrow-right" style="margin-left: 4px;"></i>
                </a>
            </div>

            <!-- Cloud Computing -->
            <div class="course-card">
                <div>
                    <div class="icon-box icon-sky"><i class="fas fa-cloud"></i></div>
                    <h3 class="course-title">Cloud Infrastructure & AWS</h3>
                    <p class="course-desc">Deploy and manage cloud architectures with AWS compute instances, VPC networking, S3 buckets, and serverless computing.</p>
                    <div class="meta-strip">
                        <div class="meta-item">
                            <span class="meta-label"><i class="far fa-clock"></i> Duration:</span>
                            <span class="meta-value">2 Months</span>
                        </div>
                        <div class="meta-item">
                            <span class="meta-label"><i class="fas fa-code"></i> Tech:</span>
                            <span class="meta-value">AWS, EC2, S3, CloudFront</span>
                        </div>
                    </div>
                </div>
                <a href="${pageContext.request.contextPath}/registration" class="mini-btn" style="width: 100%; text-align: center; text-decoration: none; padding: 10px; font-weight: 700; box-sizing: border-box;">
                    Enroll Now <i class="fas fa-arrow-right" style="margin-left: 4px;"></i>
                </a>
            </div>

            <!-- DevOps & CI/CD -->
            <div class="course-card">
                <div>
                    <div class="icon-box icon-slate"><i class="fas fa-gears"></i></div>
                    <h3 class="course-title">DevOps & Cloud Automation</h3>
                    <p class="course-desc">Automate production software delivery pipelines with Git workflows, Docker containerization, Kubernetes, and CI/CD.</p>
                    <div class="meta-strip">
                        <div class="meta-item">
                            <span class="meta-label"><i class="far fa-clock"></i> Duration:</span>
                            <span class="meta-value">2 Months</span>
                        </div>
                        <div class="meta-item">
                            <span class="meta-label"><i class="fas fa-code"></i> Tech:</span>
                            <span class="meta-value">Docker, K8s, Jenkins, GitHub</span>
                        </div>
                    </div>
                </div>
                <a href="${pageContext.request.contextPath}/registration" class="mini-btn" style="width: 100%; text-align: center; text-decoration: none; padding: 10px; font-weight: 700; box-sizing: border-box;">
                    Enroll Now <i class="fas fa-arrow-right" style="margin-left: 4px;"></i>
                </a>
            </div>

            <!-- Artificial Intelligence -->
            <div class="course-card">
                <div>
                    <div class="icon-box icon-rose"><i class="fas fa-brain"></i></div>
                    <h3 class="course-title">Artificial Intelligence & LLMs</h3>
                    <p class="course-desc">Explore generative AI foundations, retrieval-augmented generation (RAG), prompt engineering, and neural network modeling.</p>
                    <div class="meta-strip">
                        <div class="meta-item">
                            <span class="meta-label"><i class="far fa-clock"></i> Duration:</span>
                            <span class="meta-value">3 Months</span>
                        </div>
                        <div class="meta-item">
                            <span class="meta-label"><i class="fas fa-code"></i> Tech:</span>
                            <span class="meta-value">PyTorch, LLMs, LangChain, RAG</span>
                        </div>
                    </div>
                </div>
                <a href="${pageContext.request.contextPath}/registration" class="mini-btn" style="width: 100%; text-align: center; text-decoration: none; padding: 10px; font-weight: 700; box-sizing: border-box;">
                    Enroll Now <i class="fas fa-arrow-right" style="margin-left: 4px;"></i>
                </a>
            </div>

            <!-- Cyber Security -->
            <div class="course-card">
                <div>
                    <div class="icon-box icon-amber"><i class="fas fa-shield-virus"></i></div>
                    <h3 class="course-title">Cyber Security Essentials</h3>
                    <p class="course-desc">Understand network defense protocols, vulnerability assessment, ethical penetration testing, and security auditing.</p>
                    <div class="meta-strip">
                        <div class="meta-item">
                            <span class="meta-label"><i class="far fa-clock"></i> Duration:</span>
                            <span class="meta-value">2 Months</span>
                        </div>
                        <div class="meta-item">
                            <span class="meta-label"><i class="fas fa-code"></i> Tech:</span>
                            <span class="meta-value">Wireshark, Kali, OWASP, Crypt</span>
                        </div>
                    </div>
                </div>
                <a href="${pageContext.request.contextPath}/registration" class="mini-btn" style="width: 100%; text-align: center; text-decoration: none; padding: 10px; font-weight: 700; box-sizing: border-box;">
                    Enroll Now <i class="fas fa-arrow-right" style="margin-left: 4px;"></i>
                </a>
            </div>

            <!-- C & C++ Programming -->
            <div class="course-card">
                <div>
                    <div class="icon-box icon-blue"><i class="fas fa-file-code"></i></div>
                    <h3 class="course-title">C & C++ Programming / DSA</h3>
                    <p class="course-desc">Master fundamental memory management, pointers, object-oriented concepts, and core data structures & algorithms.</p>
                    <div class="meta-strip">
                        <div class="meta-item">
                            <span class="meta-label"><i class="far fa-clock"></i> Duration:</span>
                            <span class="meta-value">2 Months</span>
                        </div>
                        <div class="meta-item">
                            <span class="meta-label"><i class="fas fa-code"></i> Tech:</span>
                            <span class="meta-value">C, C++, OOP, Pointers, DSA</span>
                        </div>
                    </div>
                </div>
                <a href="${pageContext.request.contextPath}/registration" class="mini-btn" style="width: 100%; text-align: center; text-decoration: none; padding: 10px; font-weight: 700; box-sizing: border-box;">
                    Enroll Now <i class="fas fa-arrow-right" style="margin-left: 4px;"></i>
                </a>
            </div>

            <!-- Aptitude & Placement Prep -->
            <div class="course-card">
                <div>
                    <div class="icon-box icon-green"><i class="fas fa-user-check"></i></div>
                    <h3 class="course-title">Aptitude & Interview Prep</h3>
                    <p class="course-desc">Accelerate quantitative aptitude, logical reasoning patterns, technical live coding, and mock interview communication.</p>
                    <div class="meta-strip">
                        <div class="meta-item">
                            <span class="meta-label"><i class="far fa-clock"></i> Duration:</span>
                            <span class="meta-value">6 Weeks</span>
                        </div>
                        <div class="meta-item">
                            <span class="meta-label"><i class="fas fa-code"></i> Tech:</span>
                            <span class="meta-value">Quant, Reasoning, HR Mocks</span>
                        </div>
                    </div>
                </div>
                <a href="${pageContext.request.contextPath}/registration" class="mini-btn" style="width: 100%; text-align: center; text-decoration: none; padding: 10px; font-weight: 700; box-sizing: border-box;">
                    Enroll Now <i class="fas fa-arrow-right" style="margin-left: 4px;"></i>
                </a>
            </div>

        </div>
    </section>

    <!-- 4. LEARNING METHODOLOGY SECTION -->
    <section style="background: var(--surface-alt); border-top: 1px solid var(--border); border-bottom: 1px solid var(--border); padding: 70px 20px;">
        <div style="max-width: 1140px; margin: 0 auto;">
            
            <div style="text-align: center; margin-bottom: 40px;">
                <span class="badge-pill"><i class="fas fa-sparkles"></i> METHODOLOGY</span>
                <h2 style="font-size: 30px; font-weight: 800; margin: 8px 0 0; color: var(--text);">Our Learning Approach</h2>
                <p style="color: var(--text-muted); font-size: 15px; margin-top: 8px;">Practical application and hands-on deliverables over rote theory.</p>
            </div>

            <div style="display: grid; grid-template-columns: repeat(auto-fit, minmax(240px, 1fr)); gap: 20px;">
                <div class="course-card" style="padding: 26px;">
                    <div class="icon-box icon-blue"><i class="fas fa-laptop-code"></i></div>
                    <h3 style="font-size: 17px; font-weight: 800; margin: 0 0 8px; color: var(--text);">Live Code Labs</h3>
                    <p style="font-size: 13.5px; color: var(--text-muted); line-height: 1.6; margin: 0;">Interactive sessions with instant mentor feedback on daily assignments.</p>
                </div>

                <div class="course-card" style="padding: 26px;">
                    <div class="icon-box icon-green"><i class="fas fa-cubes"></i></div>
                    <h3 style="font-size: 17px; font-weight: 800; margin: 0 0 8px; color: var(--text);">Project Portfolios</h3>
                    <p style="font-size: 13.5px; color: var(--text-muted); line-height: 1.6; margin: 0;">Build production-grade applications to showcase on GitHub and resumes.</p>
                </div>

                <div class="course-card" style="padding: 26px;">
                    <div class="icon-box icon-purple"><i class="fas fa-chalkboard-user"></i></div>
                    <h3 style="font-size: 17px; font-weight: 800; margin: 0 0 8px; color: var(--text);">1-on-1 Mentorship</h3>
                    <p style="font-size: 13.5px; color: var(--text-muted); line-height: 1.6; margin: 0;">Regular evaluation rounds, doubt resolution, and career advisory sessions.</p>
                </div>

                <div class="course-card" style="padding: 26px;">
                    <div class="icon-box icon-amber"><i class="fas fa-briefcase"></i></div>
                    <h3 style="font-size: 17px; font-weight: 800; margin: 0 0 8px; color: var(--text);">Placement Readiness</h3>
                    <p style="font-size: 13.5px; color: var(--text-muted); line-height: 1.6; margin: 0;">Systematic mock interviews, aptitude drills, and technical screenings.</p>
                </div>
            </div>

        </div>
    </section>

    <!-- 5. 4-STEP JOURNEY SECTION -->
    <section style="max-width: 1140px; margin: 70px auto; padding: 0 20px;">
        <div style="text-align: center; margin-bottom: 45px;">
            <span class="badge-pill"><i class="fas fa-route"></i> ROADMAP</span>
            <h2 style="font-size: 30px; font-weight: 800; margin: 8px 0 0; color: var(--text);">Your Learning Journey</h2>
            <p style="color: var(--text-muted); font-size: 15px; margin-top: 8px;">A structured roadmap guiding you from enrollment to technical career launch.</p>
        </div>

        <div style="display: grid; grid-template-columns: repeat(auto-fit, minmax(240px, 1fr)); gap: 20px;">
            <div class="course-card" style="padding: 26px;">
                <div class="step-number">01</div>
                <h3 style="font-size: 17px; font-weight: 800; margin: 0 0 8px; color: var(--text);">Select Track</h3>
                <p style="font-size: 13.5px; color: var(--text-muted); line-height: 1.6; margin: 0;">Choose the specialization that matches your technical aspirations.</p>
            </div>

            <div class="course-card" style="padding: 26px;">
                <div class="step-number">02</div>
                <h3 style="font-size: 17px; font-weight: 800; margin: 0 0 8px; color: var(--text);">Attend & Build</h3>
                <p style="font-size: 13.5px; color: var(--text-muted); line-height: 1.6; margin: 0;">Participate in live cohorts and complete hands-on weekly deliverables.</p>
            </div>

            <div class="course-card" style="padding: 26px;">
                <div class="step-number">03</div>
                <h3 style="font-size: 17px; font-weight: 800; margin: 0 0 8px; color: var(--text);">Capstone Project</h3>
                <p style="font-size: 13.5px; color: var(--text-muted); line-height: 1.6; margin: 0;">Deploy a comprehensive full-stack solution evaluated by trainers.</p>
            </div>

            <div class="course-card" style="padding: 26px;">
                <div class="step-number">04</div>
                <h3 style="font-size: 17px; font-weight: 800; margin: 0 0 8px; color: var(--text);">Graduate & Hire</h3>
                <p style="font-size: 13.5px; color: var(--text-muted); line-height: 1.6; margin: 0;">Earn certification and step directly into placement interview drives.</p>
            </div>
        </div>
    </section>

    <!-- 6. FINAL CTA BANNER -->
    <section style="max-width: 1140px; margin: 0 auto 80px; padding: 0 20px;">
        <div class="course-card" style="text-align: center; padding: 50px 30px; border-radius: 28px; background: linear-gradient(135deg, #1e293b 0%, #0f172a 100%); color: #ffffff; border: 1px solid rgba(255, 255, 255, 0.08); box-shadow: var(--shadow-lg);">
            <div style="width: 58px; height: 58px; border-radius: 18px; background: rgba(79, 110, 247, 0.25); color: #818cf8; display: flex; align-items: center; justify-content: center; font-size: 26px; margin: 0 auto 20px;">
                <i class="fas fa-graduation-cap"></i>
            </div>
            <h2 style="font-size: clamp(26px, 4vw, 34px); font-weight: 800; margin: 0 0 12px; color: #ffffff;">Find Your Ideal Course Today</h2>
            <p style="color: #94a3b8; font-size: 15.5px; max-width: 620px; margin: 0 auto 28px; line-height: 1.6;">
                Begin learning industry-standard technologies with structured curricula, faculty guidance, and dedicated career support.
            </p>
            <a href="${pageContext.request.contextPath}/registration" class="btn-modern-primary" style="margin: 0 auto;">
                <span>Start Learning Now</span>
                <i class="fas fa-arrow-right"></i>
            </a>
        </div>
    </section>

</main>

<!-- 7. SITE FOOTER -->
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