<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Trainer Dashboard - EduManage</title>
    <!-- FontAwesome Vector Icons -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css">
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
        .mod-blue   { --card-accent: linear-gradient(90deg, #3b82f6, #60a5fa); }
        .mod-indigo { --card-accent: linear-gradient(90deg, #6366f1, #818cf8); }
        .mod-green  { --card-accent: linear-gradient(90deg, #10b981, #34d399); }
        .mod-purple { --card-accent: linear-gradient(90deg, #7c3aed, #8b5cf6); }
    </style>
</head>
<body style="min-height: 100vh; display: flex; flex-direction: column; margin: 0;">

<div class="dashboard-layout" style="flex: 1; display: flex; min-height: 100vh;">
    
    <!-- 1. TRAINER SIDEBAR NAVIGATION -->
    <jsp:include page="/WEB-INF/views/common/trainer-sidebar.jsp" />

    <!-- 2. MAIN CONTENT AREA -->
    <main class="main-content" style="flex: 1; display: flex; flex-direction: column; justify-content: space-between; padding: 30px; box-sizing: border-box;">
        
        <div>
            <!-- Header Bar -->
            <div class="header-bar" style="margin-bottom: 24px;">
                <div>
                    <h2><i class="fas fa-chalkboard-user" style="color: var(--primary);"></i> Trainer Control Center</h2>
                    <span style="color: var(--text-muted); font-size: 14px;">Welcome back, <strong>${trainer.fullName}</strong>! Manage your batches, student attendance, and task evaluations.</span>
                </div>
            </div>

            <!-- Operational Modules -->
            <div class="section-title" style="margin-top: 0; margin-bottom: 14px;">
                <h5><i class="fas fa-th-large" style="color: var(--primary);"></i> Faculty Modules</h5>
                <span>Trainer Operations Portal</span>
            </div>

            <div class="module-grid">
                
                <!-- 1. Assigned Batches -->
                <a href="${pageContext.request.contextPath}/trainer/batches" class="module-card mod-blue">
                    <div class="module-icon-wrap" style="background: linear-gradient(135deg, #2563eb, #3b82f6);">
                        <i class="fas fa-layer-group"></i>
                    </div>
                    <div class="module-title">Assigned Batches</div>
                    <div class="module-desc">Manage your course cohorts, lecture schedules, and active student rosters.</div>
                    <div class="module-link-action">View Batches <i class="fas fa-arrow-right"></i></div>
                </a>

                <!-- 2. Attendance Tracker -->
                <a href="${pageContext.request.contextPath}/trainer/attendance" class="module-card mod-green">
                    <div class="module-icon-wrap" style="background: linear-gradient(135deg, #059669, #10b981);">
                        <i class="fas fa-calendar-check"></i>
                    </div>
                    <div class="module-title">Mark Attendance</div>
                    <div class="module-desc">Record daily classroom attendance, check-ins, and student presence logs.</div>
                    <div class="module-link-action">Manage Attendance <i class="fas fa-arrow-right"></i></div>
                </a>

                <!-- 3. Assign Tasks -->
                <a href="${pageContext.request.contextPath}/trainer/tasks" class="module-card mod-indigo">
                    <div class="module-icon-wrap" style="background: linear-gradient(135deg, #4f46e5, #6366f1);">
                        <i class="fas fa-tasks"></i>
                    </div>
                    <div class="module-title">Assignments & Tasks</div>
                    <div class="module-desc">Create assignments, share lab exercises, and set deadline submission dates.</div>
                    <div class="module-link-action">Assign Tasks <i class="fas fa-arrow-right"></i></div>
                </a>

                <!-- 4. Review Submissions -->
                <a href="${pageContext.request.contextPath}/trainer/tasks" class="module-card mod-purple">
                    <div class="module-icon-wrap" style="background: linear-gradient(135deg, #7c3aed, #8b5cf6);">
                        <i class="fas fa-clipboard-check"></i>
                    </div>
                    <div class="module-title">Review Submissions</div>
                    <div class="module-desc">Evaluate submitted student code deliverables, assign scores, and give feedback.</div>
                    <div class="module-link-action">Grade Tasks <i class="fas fa-arrow-right"></i></div>
                </a>

            </div>
        </div>

      
        </div>

    </main>
</div>
  <!-- 3. COMMON FOOTER -->
        <div style="margin-top: 50px; width: 100%;">
            <jsp:include page="/WEB-INF/views/common/admin-footer.jsp" />
<!-- 4. CHATBOT WIDGET -->
<button class="chatbot-bubble" id="trainerChatbotBubble" title="EduManage Assistant">
    <i class="fas fa-comment-dots"></i>
</button>

<div class="chatbot-panel" id="trainerChatbotPanel">
    <div class="chatbot-header">
        <div class="chatbot-header-info">
            <div class="bot-avatar"><i class="fas fa-robot"></i></div>
            <div class="bot-title-area">
                <h4>EduManage Bot</h4>
                <div class="sub"><span class="online-dot"></span> Online</div>
            </div>
        </div>
        <button class="chatbot-close" id="trainerChatbotClose">&times;</button>
    </div>
    
    <div class="chatbot-messages" id="trainerChatMessages">
        <div class="chat-msg bot">Hello ${trainer.fullName}! Click any faculty module above or ask me for help.</div>
    </div>

    <div class="chatbot-quick">
        <button class="quick-btn" onclick="sendQuickAction('Mark Attendance')">Attendance</button>
        <button class="quick-btn" onclick="sendQuickAction('Assigned Batches')">Batches</button>
        <button class="quick-btn" onclick="sendQuickAction('Assign Tasks')">Assign Task</button>
    </div>

    <div class="chatbot-input">
        <input type="text" id="trainerChatInput" placeholder="Type module name...">
        <button type="button" id="trainerSendBtn" onclick="submitTrainerChat()"><i class="fas fa-paper-plane"></i></button>
    </div>
</div>

<!-- 5. SCRIPTS -->
<script>
    const botBubble = document.getElementById('trainerChatbotBubble');
    const botPanel = document.getElementById('trainerChatbotPanel');
    const botClose = document.getElementById('trainerChatbotClose');
    const chatInput = document.getElementById('trainerChatInput');

    botBubble.addEventListener('click', () => {
        botPanel.style.display = (botPanel.style.display === 'flex') ? 'none' : 'flex';
    });

    botClose.addEventListener('click', () => {
        botPanel.style.display = 'none';
    });

    function submitTrainerChat() {
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
        const box = document.getElementById('trainerChatMessages');
        const msgDiv = document.createElement('div');
        msgDiv.className = 'chat-msg ' + sender;
        msgDiv.innerText = text;
        box.appendChild(msgDiv);
        box.scrollTop = box.scrollHeight;
    }

    chatInput.addEventListener('keypress', (e) => {
        if(e.key === 'Enter') submitTrainerChat();
    });
</script>

</body>
</html>