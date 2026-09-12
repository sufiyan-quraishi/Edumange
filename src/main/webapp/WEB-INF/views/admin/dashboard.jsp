<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin Dashboard - EduManage</title>
    <!-- FontAwesome Vector Icons -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <!-- Project Stylesheet -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
    
    <style>
        /* Enhanced Download PDF Button */
        .btn-download-pdf {
            background: linear-gradient(135deg, #ef4444, #dc2626) !important;
            color: #ffffff !important;
            border: none;
            padding: 13px 26px !important;
            border-radius: 12px;
            font-size: 14.5px;
            font-weight: 700;
            cursor: pointer;
            display: inline-flex;
            align-items: center;
            gap: 10px;
            box-shadow: 0 8px 24px rgba(239, 68, 68, 0.35);
            transition: all 0.3s cubic-bezier(0.2, 0.65, 0.3, 1);
            letter-spacing: 0.3px;
        }

        .btn-download-pdf i {
            font-size: 17px;
            transition: transform 0.25s ease;
        }

        .btn-download-pdf:hover {
            transform: translateY(-3px) scale(1.03);
            box-shadow: 0 12px 30px rgba(239, 68, 68, 0.5);
            background: linear-gradient(135deg, #dc2626, #b91c1c) !important;
        }

        .btn-download-pdf:hover i {
            transform: translateY(2px) scale(1.15);
        }

        /* Enhanced High-End Management Module Cards */
        .module-grid {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(260px, 1fr));
            gap: 24px;
            margin-top: 15px;
        }

        .module-card {
            background: var(--surface);
            border: 1px solid var(--border);
            border-radius: 18px;
            padding: 26px 22px;
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

        .module-card::after {
            content: "";
            position: absolute;
            width: 130px;
            height: 130px;
            right: -40px;
            bottom: -40px;
            border-radius: 50%;
            background: var(--card-glow, rgba(79, 110, 247, 0.06));
            transition: transform 0.5s ease;
        }

        .module-card:hover {
            transform: translateY(-8px);
            box-shadow: var(--shadow-xl);
            border-color: rgba(79, 110, 247, 0.3);
        }

        .module-card:hover::before {
            opacity: 1;
        }

        .module-card:hover::after {
            transform: scale(2.2);
        }

        .module-icon-wrap {
            width: 58px;
            height: 58px;
            border-radius: 16px;
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 24px;
            color: #ffffff;
            margin-bottom: 18px;
            box-shadow: 0 8px 20px rgba(0, 0, 0, 0.12);
            transition: transform 0.35s ease, box-shadow 0.35s ease;
            position: relative;
            z-index: 2;
        }

        .module-card:hover .module-icon-wrap {
            transform: scale(1.1) rotate(-6deg);
            box-shadow: 0 12px 28px rgba(0, 0, 0, 0.2);
        }

        .module-title {
            font-size: 17px;
            font-weight: 800;
            color: var(--text);
            margin-bottom: 6px;
            letter-spacing: -0.2px;
            position: relative;
            z-index: 2;
        }

        .module-desc {
            font-size: 13px;
            color: var(--text-muted);
            line-height: 1.45;
            position: relative;
            z-index: 2;
            margin-bottom: 16px;
        }

        .module-link-action {
            font-size: 12.5px;
            font-weight: 700;
            color: var(--primary);
            display: inline-flex;
            align-items: center;
            gap: 6px;
            margin-top: auto;
            position: relative;
            z-index: 2;
            transition: gap 0.2s ease;
        }

        .module-card:hover .module-link-action {
            gap: 10px;
        }

        /* Module Theme Palettes */
        .mod-blue   { --card-accent: linear-gradient(90deg, #3b82f6, #60a5fa); --card-glow: rgba(59, 130, 246, 0.1); }
        .mod-orange { --card-accent: linear-gradient(90deg, #f97316, #fb923c); --card-glow: rgba(249, 115, 22, 0.1); }
        .mod-purple { --card-accent: linear-gradient(90deg, #8b5cf6, #a78bfa); --card-glow: rgba(139, 92, 246, 0.1); }
        .mod-green  { --card-accent: linear-gradient(90deg, #10b981, #34d399); --card-glow: rgba(16, 185, 129, 0.1); }
        .mod-cyan   { --card-accent: linear-gradient(90deg, #06b6d4, #22d3ee); --card-glow: rgba(6, 182, 212, 0.1); }
        .mod-pink   { --card-accent: linear-gradient(90deg, #ec4899, #f472b6); --card-glow: rgba(236, 72, 153, 0.1); }
        .mod-indigo { --card-accent: linear-gradient(90deg, #6366f1, #818cf8); --card-glow: rgba(99, 102, 241, 0.1); }
        .mod-red    { --card-accent: linear-gradient(90deg, #ef4444, #f87171); --card-glow: rgba(239, 68, 68, 0.1); }
    </style>
</head>
<body>

<div class="dashboard-layout">
    
    <!-- ================= 1. SIDEBAR NAVIGATION ================= -->
    <jsp:include page="/WEB-INF/views/common/admin-sidebar.jsp" />

    <!-- ================= 2. MAIN CONTENT AREA ================= -->
    <main class="main-content">
        
        <!-- Header Bar with Stylized Live PDF Download -->
        <div class="header-bar" style="margin-bottom: 28px;">
            <div>
                <h2><i class="fas fa-layer-group" style="color: var(--primary);"></i> Admin Control Center</h2>
                <span style="color: var(--text-muted); font-size: 14px;">Select any management module below to manage institute operations.</span>
            </div>
            
            <!-- CHANGED: Enhanced PDF Download Button -->
            <a href="${pageContext.request.contextPath}/admin/reports/download" style="text-decoration: none;">
                <button type="button" class="btn-download-pdf">
                    <i class="fas fa-file-pdf"></i>
                    <span>Download Live Report (PDF)</span>
                </button>
            </a>
        </div>

        <!-- ================= 3. ATTRACTIVE MANAGEMENT MODULES ================= -->
        <div class="section-title" style="margin-top: 0; margin-bottom: 18px;">
            <h5><i class="fas fa-th-large" style="color: var(--primary);"></i> Operational Modules</h5>
            <span>Institute Management System</span>
        </div>

        <div class="module-grid">
            
            <!-- 1. Inquiries -->
            <a href="${pageContext.request.contextPath}/admin/inquiries" class="module-card mod-blue">
                <div class="module-icon-wrap" style="background: linear-gradient(135deg, #2563eb, #3b82f6);">
                    <i class="fas fa-envelope-open-text"></i>
                </div>
                <div class="module-title">Inquiry Center</div>
                <div class="module-desc">Track and review prospective student inquiries and incoming leads.</div>
                <div class="module-link-action">Open Inquiries <i class="fas fa-arrow-right"></i></div>
            </a>

            <!-- 2. Registrations -->
            <a href="${pageContext.request.contextPath}/admin/registrations" class="module-card mod-orange">
                <div class="module-icon-wrap" style="background: linear-gradient(135deg, #ea580c, #f97316);">
                    <i class="fas fa-user-check"></i>
                </div>
                <div class="module-title">Student Approvals</div>
                <div class="module-desc">Verify new applicants and approve admission requests into batches.</div>
                <div class="module-link-action">Review Registrations <i class="fas fa-arrow-right"></i></div>
            </a>

            <!-- 3. Trainers -->
            <a href="${pageContext.request.contextPath}/admin/trainers" class="module-card mod-purple">
                <div class="module-icon-wrap" style="background: linear-gradient(135deg, #7c3aed, #8b5cf6);">
                    <i class="fas fa-chalkboard-teacher"></i>
                </div>
                <div class="module-title">Trainer Management</div>
                <div class="module-desc">Manage mentor profiles, assign course specialties, and track staff.</div>
                <div class="module-link-action">Manage Faculty <i class="fas fa-arrow-right"></i></div>
            </a>

            <!-- 4. Students -->
            <a href="${pageContext.request.contextPath}/admin/students" class="module-card mod-green">
                <div class="module-icon-wrap" style="background: linear-gradient(135deg, #059669, #10b981);">
                    <i class="fas fa-user-graduate"></i>
                </div>
                <div class="module-title">Student Directory</div>
                <div class="module-desc">Access enrolled student roster, course status, and profile details.</div>
                <div class="module-link-action">View Students <i class="fas fa-arrow-right"></i></div>
            </a>

            <!-- 5. Batches -->
            <a href="${pageContext.request.contextPath}/admin/batches" class="module-card mod-cyan">
                <div class="module-icon-wrap" style="background: linear-gradient(135deg, #0891b2, #06b6d4);">
                    <i class="fas fa-cubes"></i>
                </div>
                <div class="module-title">Batch Scheduling</div>
                <div class="module-desc">Create course batches, set timings, and link active trainers.</div>
                <div class="module-link-action">Manage Batches <i class="fas fa-arrow-right"></i></div>
            </a>

            <!-- 6. Attendance -->
            <a href="${pageContext.request.contextPath}/admin/attendance" class="module-card mod-pink">
                <div class="module-icon-wrap" style="background: linear-gradient(135deg, #db2777, #ec4899);">
                    <i class="fas fa-fingerprint"></i>
                </div>
                <div class="module-title">Attendance Logs</div>
                <div class="module-desc">Monitor daily check-ins, batch attendance records, and trends.</div>
                <div class="module-link-action">Track Attendance <i class="fas fa-arrow-right"></i></div>
            </a>

            <!-- 7. Tasks & Assignments -->
            <a href="${pageContext.request.contextPath}/admin/tasks" class="module-card mod-indigo">
                <div class="module-icon-wrap" style="background: linear-gradient(135deg, #4f46e5, #6366f1);">
                    <i class="fas fa-tasks"></i>
                </div>
                <div class="module-title">Tasks & Assignments</div>
                <div class="module-desc">Review student project submissions and trainer task assignments.</div>
                <div class="module-link-action">Check Tasks <i class="fas fa-arrow-right"></i></div>
            </a>

            <!-- 8. Reports & Analytics (Direct PDF Trigger) -->
            <a href="${pageContext.request.contextPath}/admin/reports/download" class="module-card mod-red">
                <div class="module-icon-wrap" style="background: linear-gradient(135deg, #dc2626, #ef4444);">
                    <i class="fas fa-file-pdf"></i>
                </div>
                <div class="module-title">Instant PDF Report</div>
                <div class="module-desc">Generate real-time live database report in one click.</div>
                <div class="module-link-action" style="color: #ef4444;">Download Now <i class="fas fa-download"></i></div>
            </a>

        </div>

    </main>
</div>

<!-- ================= 4. CHATBOT WIDGET ================= -->
<button class="chatbot-bubble" id="adminChatbotBubble" title="EduManage Assistant">
    <i class="fas fa-comment-dots"></i>
</button>

<div class="chatbot-panel" id="adminChatbotPanel">
    <div class="chatbot-header">
        <div class="chatbot-header-info">
            <div class="bot-avatar"><i class="fas fa-robot"></i></div>
            <div class="bot-title-area">
                <h4>EduManage Bot</h4>
                <div class="sub"><span class="online-dot"></span> Online</div>
            </div>
        </div>
        <button class="chatbot-close" id="adminChatbotClose">&times;</button>
    </div>
    
    <div class="chatbot-messages" id="adminChatMessages">
        <div class="chat-msg bot">Hello Admin! Click any module above or ask me for help.</div>
    </div>

    <div class="chatbot-quick">
        <button class="quick-btn" onclick="sendQuickAction('Pending Registrations')">Approvals</button>
        <button class="quick-btn" onclick="sendQuickAction('Batches')">Batches</button>
        <button class="quick-btn" onclick="sendQuickAction('Attendance')">Attendance</button>
    </div>

    <div class="chatbot-input">
        <input type="text" id="adminChatInput" placeholder="Type module name...">
        <button type="button" id="adminSendBtn" onclick="submitAdminChat()"><i class="fas fa-paper-plane"></i></button>
    </div>
</div>
<!-- Include Common Footer -->
    <jsp:include page="/WEB-INF/views/common/admin-footer.jsp" />

<!-- ================= 5. SCRIPTS ================= -->
<script>
    const botBubble = document.getElementById('adminChatbotBubble');
    const botPanel = document.getElementById('adminChatbotPanel');
    const botClose = document.getElementById('adminChatbotClose');
    const chatInput = document.getElementById('adminChatInput');

    botBubble.addEventListener('click', () => {
        botPanel.style.display = (botPanel.style.display === 'flex') ? 'none' : 'flex';
    });

    botClose.addEventListener('click', () => {
        botPanel.style.display = 'none';
    });

    function submitAdminChat() {
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
        const box = document.getElementById('adminChatMessages');
        const msgDiv = document.createElement('div');
        msgDiv.className = 'chat-msg ' + sender;
        msgDiv.innerText = text;
        box.appendChild(msgDiv);
        box.scrollTop = box.scrollHeight;
    }

    chatInput.addEventListener('keypress', (e) => {
        if(e.key === 'Enter') submitAdminChat();
    });
</script>

</body>
</html>