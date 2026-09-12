<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Student Dashboard - EduManage</title>
    <!-- FontAwesome Vector Icons -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <!-- Project Stylesheet -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
    
    <style>
        /* Operational Module Cards */
        .module-grid {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(240px, 1fr));
            gap: 20px;
            margin-top: 15px;
        }

        .module-card {
            background: var(--surface);
            border: 1px solid var(--border);
            border-radius: 18px;
            padding: 24px 20px;
            display: flex;
            flex-direction: column;
            align-items: flex-start;
            position: relative;
            overflow: hidden;
            text-decoration: none;
            box-shadow: var(--shadow);
            transition: all 0.35s cubic-bezier(0.2, 0.65, 0.3, 1);
        }

        .module-card::before {
            content: "";
            position: absolute;
            top: 0;
            left: 0;
            right: 0;
            height: 4px;
            background: var(--card-accent, linear-gradient(90deg, #4f6ef7, #22c3a6));
            opacity: 0;
            transition: opacity 0.3s ease;
        }

        .module-card:hover {
            transform: translateY(-6px);
            box-shadow: var(--shadow-xl);
            border-color: rgba(79, 110, 247, 0.3);
        }

        .module-card:hover::before {
            opacity: 1;
        }

        .module-icon-wrap {
            width: 52px;
            height: 52px;
            border-radius: 15px;
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 22px;
            color: #ffffff;
            margin-bottom: 16px;
            box-shadow: 0 8px 20px rgba(0, 0, 0, 0.12);
        }

        .module-title {
            font-size: 16px;
            font-weight: 800;
            color: var(--text);
            margin-bottom: 6px;
        }

        .module-desc {
            font-size: 12.5px;
            color: var(--text-muted);
            line-height: 1.4;
            margin-bottom: 14px;
        }

        .module-link-action {
            font-size: 12px;
            font-weight: 700;
            color: var(--primary);
            display: inline-flex;
            align-items: center;
            gap: 6px;
            margin-top: auto;
        }

        /* Color Palettes */
        .mod-indigo { --card-accent: linear-gradient(90deg, #6366f1, #818cf8); }
        .mod-green  { --card-accent: linear-gradient(90deg, #10b981, #34d399); }
        .mod-purple { --card-accent: linear-gradient(90deg, #8b5cf6, #a78bfa); }
        .mod-cyan   { --card-accent: linear-gradient(90deg, #06b6d4, #22d3ee); }
        .mod-pink   { --card-accent: linear-gradient(90deg, #ec4899, #f472b6); }

        /* Enrolled Batches Card Grid */
        .batch-cards-container {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(320px, 1fr));
            gap: 22px;
            margin-top: 15px;
        }

        .enrolled-batch-box {
            background: var(--surface);
            border: 1px solid var(--border);
            border-radius: 20px;
            padding: 24px;
            position: relative;
            box-shadow: var(--shadow);
            transition: all 0.3s cubic-bezier(0.2, 0.65, 0.3, 1);
            display: flex;
            flex-direction: column;
            justify-content: space-between;
        }

        .enrolled-batch-box:hover {
            transform: translateY(-5px);
            border-color: var(--primary);
            box-shadow: var(--shadow-xl);
        }

        .batch-box-top {
            display: flex;
            justify-content: space-between;
            align-items: flex-start;
            margin-bottom: 14px;
        }

        .batch-icon-title {
            display: flex;
            align-items: center;
            gap: 12px;
        }

        .batch-avatar-icon {
            width: 46px;
            height: 46px;
            border-radius: 14px;
            background: linear-gradient(135deg, var(--primary), #8b5cf6);
            color: #ffffff;
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 20px;
            box-shadow: 0 6px 16px rgba(79, 110, 247, 0.3);
        }

        .batch-box-info h4 {
            margin: 0;
            font-size: 16px;
            font-weight: 800;
            color: var(--text);
        }

        .batch-box-info span {
            font-size: 12px;
            color: var(--text-muted);
        }

        .batch-trainer-bar {
            background: var(--surface-alt);
            border: 1px solid var(--border);
            border-radius: 12px;
            padding: 10px 14px;
            margin: 14px 0;
            display: flex;
            align-items: center;
            justify-content: space-between;
        }

        .trainer-meta {
            display: flex;
            align-items: center;
            gap: 8px;
        }

        .trainer-meta i {
            color: var(--primary);
            font-size: 14px;
        }

        .trainer-meta strong {
            font-size: 13px;
            color: var(--text);
        }

        .batch-box-footer {
            margin-top: 10px;
            display: flex;
            align-items: center;
            justify-content: space-between;
            border-top: 1px solid var(--border);
            padding-top: 14px;
        }
    </style>
</head>
<body style="min-height: 100vh; display: flex; flex-direction: column; margin: 0;">

<div class="dashboard-layout" style="flex: 1; display: flex; min-height: 100vh;">
    
    <!-- 1. SIDEBAR NAVIGATION -->
    <jsp:include page="/WEB-INF/views/common/student-sidebar.jsp" />

    <!-- 2. MAIN CONTENT AREA -->
    <main class="main-content" style="flex: 1; display: flex; flex-direction: column; justify-content: space-between; padding: 30px; box-sizing: border-box;">
        
        <div>
            <!-- Header Bar (Profile button removed) -->
            <div class="header-bar" style="margin-bottom: 24px;">
                <div>
                    <h2><i class="fas fa-graduation-cap" style="color: var(--primary);"></i> Student Control Center</h2>
                    <span style="color: var(--text-muted); font-size: 14px;">Welcome , <strong>${student.fullName}</strong>! </span>
                </div>
            </div>

            <!-- 3. ATTRACTIVE MANAGEMENT MODULES -->
            <div class="section-title" style="margin-top: 0; margin-bottom: 14px;">
                <h5><i class="fas fa-th-large" style="color: var(--primary);"></i> Academic Modules</h5>
                <span>Student Learning Portal</span>
            </div>

            <div class="module-grid">
                
                <!-- 1. Tasks & Assignments -->
                <a href="${pageContext.request.contextPath}/student/tasks" class="module-card mod-indigo">
                    <div class="module-icon-wrap" style="background: linear-gradient(135deg, #4f46e5, #6366f1);">
                        <i class="fas fa-tasks"></i>
                    </div>
                    <div class="module-title">Tasks & Assignments</div>
                    <div class="module-desc">Submit assignments, project source code, and track deadlines.</div>
                    <div class="module-link-action">Open Tasks <i class="fas fa-arrow-right"></i></div>
                </a>

                <!-- 2. Attendance Logs -->
                <a href="${pageContext.request.contextPath}/student/attendance" class="module-card mod-green">
                    <div class="module-icon-wrap" style="background: linear-gradient(135deg, #059669, #10b981);">
                        <i class="fas fa-calendar-check"></i>
                    </div>
                    <div class="module-title">My Attendance</div>
                    <div class="module-desc">Track daily lecture check-ins, presence percentage, and logs.</div>
                    <div class="module-link-action">Track Attendance <i class="fas fa-arrow-right"></i></div>
                </a>

                <!-- 3. Trainer Feedback -->
                <a href="${pageContext.request.contextPath}/student/feedback" class="module-card mod-purple">
                    <div class="module-icon-wrap" style="background: linear-gradient(135deg, #7c3aed, #8b5cf6);">
                        <i class="fas fa-comment-dots"></i>
                    </div>
                    <div class="module-title">Trainer Feedback</div>
                    <div class="module-desc">Read instructor reviews, grades, remarks, and mentor comments.</div>
                    <div class="module-link-action">Read Reviews <i class="fas fa-arrow-right"></i></div>
                </a>

                <!-- 4. Course Syllabus -->
                <a href="${pageContext.request.contextPath}/courses" class="module-card mod-cyan">
                    <div class="module-icon-wrap" style="background: linear-gradient(135deg, #0891b2, #06b6d4);">
                        <i class="fas fa-book-open"></i>
                    </div>
                    <div class="module-title">Course Syllabus</div>
                    <div class="module-desc">Browse course learning tracks, curriculum topics, and roadmap.</div>
                    <div class="module-link-action">Explore Course <i class="fas fa-arrow-right"></i></div>
                </a>

                <!-- 5. Student Profile -->
                <a href="${pageContext.request.contextPath}/student/profile" class="module-card mod-pink">
                    <div class="module-icon-wrap" style="background: linear-gradient(135deg, #db2777, #ec4899);">
                        <i class="fas fa-id-card"></i>
                    </div>
                    <div class="module-title">Student Profile</div>
                    <div class="module-desc">Manage your contact information, credentials, and settings.</div>
                    <div class="module-link-action">Manage Profile <i class="fas fa-arrow-right"></i></div>
                </a>

            </div>

            <!-- 4. ENROLLED BATCHES CARD SECTION -->
            <div class="section-title" style="margin-top: 34px; margin-bottom: 14px;">
                <h5><i class="fas fa-chalkboard-teacher" style="color: var(--primary);"></i> My Active Batches</h5>
                <span class="badge badge-approved" style="font-size: 11px;">${fn:length(batches)} Active Enrollments</span>
            </div>

            <div class="batch-cards-container">
                <c:choose>
                    <c:when test="${not empty batches}">
                        <c:forEach var="b" items="${batches}">
                            <div class="enrolled-batch-box">
                                <div>
                                    <div class="batch-box-top">
                                        <div class="batch-icon-title">
                                            <div class="batch-avatar-icon">
                                                <i class="fas fa-laptop-code"></i>
                                            </div>
                                            <div class="batch-box-info">
                                                <h4>${b.batchName}</h4>
                                                <span><i class="fas fa-book" style="margin-right: 4px;"></i> ${b.courseName}</span>
                                            </div>
                                        </div>
                                        <span class="badge badge-approved" style="font-size: 10.5px;">Live Batch</span>
                                    </div>

                                    <!-- Trainer Meta Card -->
                                    <div class="batch-trainer-bar">
                                        <div class="trainer-meta">
                                            <i class="fas fa-chalkboard-teacher"></i>
                                            <span>Instructor:</span>
                                        </div>
                                        <strong>
                                            <c:choose>
                                                <c:when test="${b.trainer != null}">
                                                    ${b.trainer.fullName}
                                                </c:when>
                                                <c:otherwise>
                                                    <span style="color: var(--text-muted); font-weight: normal; font-style: italic;">Not Assigned</span>
                                                </c:otherwise>
                                            </c:choose>
                                        </strong>
                                    </div>

                                    <!-- Progress Indicator -->
                                    <div class="progress" style="height: 6px; margin: 12px 0 6px 0;">
                                        <div class="progress-bar" style="width: 75%;"></div>
                                    </div>
                                    <div style="display: flex; justify-content: space-between; font-size: 11px; color: var(--text-muted); margin-bottom: 8px;">
                                        <span>Course Track Progress</span>
                                        <span style="font-weight: 700; color: var(--primary);">Active</span>
                                    </div>
                                </div>

                                <!-- Card Footer Action -->
                                <div class="batch-box-footer">
                                    <span style="font-size: 12px; color: var(--text-muted);">
                                        <i class="far fa-clock" style="color: var(--primary);"></i> Daily Sessions
                                    </span>
                                    <a href="${pageContext.request.contextPath}/student/batch/${b.id}/tasks" class="mini-btn" style="padding: 8px 18px; font-size: 12.5px; border-radius: 10px; text-decoration: none; display: inline-flex; align-items: center; gap: 6px;">
                                        <i class="fas fa-tasks"></i> View Tasks
                                    </a>
                                </div>
                            </div>
                        </c:forEach>
                    </c:when>
                    <c:otherwise>
                        <div class="dashboard-card" style="grid-column: 1 / -1; text-align: center; padding: 36px; color: var(--text-muted);">
                            <i class="fas fa-info-circle" style="font-size: 26px; color: var(--primary); margin-bottom: 8px; display: block;"></i>
                            <strong>No Batch Assigned Yet</strong>
                            <p style="margin: 4px 0 0; font-size: 13px;">You haven't been assigned to an active cohort yet. Please contact the administrator.</p>
                        </div>
                    </c:otherwise>
                </c:choose>
            </div>
        </div>

       

    </main>
</div>

        <!-- Universal Common Footer Include -->
        <jsp:include page="/WEB-INF/views/common/admin-footer.jsp" />

<!-- 6. CHATBOT WIDGET -->
<button class="chatbot-bubble" id="studentChatbotBubble" title="EduManage Assistant">
    <i class="fas fa-comment-dots"></i>
</button>

<div class="chatbot-panel" id="studentChatbotPanel">
    <div class="chatbot-header">
        <div class="chatbot-header-info">
            <div class="bot-avatar"><i class="fas fa-robot"></i></div>
            <div class="bot-title-area">
                <h4>EduManage Bot</h4>
                <div class="sub"><span class="online-dot"></span> Online</div>
            </div>
        </div>
        <button class="chatbot-close" id="studentChatbotClose">&times;</button>
    </div>
    
    <div class="chatbot-messages" id="studentChatMessages">
        <div class="chat-msg bot">Hello ${student.fullName}! Click any learning module above or ask me for help.</div>
    </div>

    <div class="chatbot-quick">
        <button class="quick-btn" onclick="sendQuickAction('My Tasks')">Tasks</button>
        <button class="quick-btn" onclick="sendQuickAction('Attendance')">Attendance</button>
        <button class="quick-btn" onclick="sendQuickAction('Feedback')">Feedback</button>
    </div>

    <div class="chatbot-input">
        <input type="text" id="studentChatInput" placeholder="Type module name...">
        <button type="button" id="studentSendBtn" onclick="submitStudentChat()"><i class="fas fa-paper-plane"></i></button>
    </div>
</div>

<!-- 7. SCRIPTS -->
<script>
    const botBubble = document.getElementById('studentChatbotBubble');
    const botPanel = document.getElementById('studentChatbotPanel');
    const botClose = document.getElementById('studentChatbotClose');
    const chatInput = document.getElementById('studentChatInput');

    botBubble.addEventListener('click', () => {
        botPanel.style.display = (botPanel.style.display === 'flex') ? 'none' : 'flex';
    });

    botClose.addEventListener('click', () => {
        botPanel.style.display = 'none';
    });

    function submitStudentChat() {
        const text = chatInput.value.trim();
        if(!text) return;
        appendChatMsg(text, 'user');
        chatInput.value = '';

        setTimeout(() => {
            appendChatMsg('You can access "' + text + '" directly from the operational module cards above.', 'bot');
        }, 350);
    }

    function sendQuickAction(query) {
        appendChatMsg(query, 'user');
        setTimeout(() => {
            appendChatMsg('Opening details for ' + query + '...', 'bot');
        }, 250);
    }

    function appendChatMsg(text, sender) {
        const box = document.getElementById('studentChatMessages');
        const msgDiv = document.createElement('div');
        msgDiv.className = 'chat-msg ' + sender;
        msgDiv.innerText = text;
        box.appendChild(msgDiv);
        box.scrollTop = box.scrollHeight;
    }

    chatInput.addEventListener('keypress', (e) => {
        if(e.key === 'Enter') submitStudentChat();
    });
</script>

</body>
</html>