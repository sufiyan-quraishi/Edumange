<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Submissions Review - EduManage</title>
    <!-- FontAwesome Vector Icons -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css">
    <!-- Project Stylesheet -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
</head>
<body style="min-height: 100vh; display: flex; flex-direction: column; margin: 0;">

<div class="dashboard-layout" style="flex: 1; display: flex; min-height: 100vh;">
    
    <!-- 1. TRAINER SIDEBAR NAVIGATION -->
    <jsp:include page="/WEB-INF/views/common/trainer-sidebar.jsp" />

    <!-- 2. MAIN CONTENT AREA -->
    <main class="main-content" style="flex: 1; display: flex; flex-direction: column; justify-content: space-between; padding: 30px; box-sizing: border-box;">
        
        <div>
            <!-- Header Bar -->
            <div class="header-bar" style="margin-bottom: 24px; display: flex; justify-content: space-between; align-items: center; flex-wrap: wrap; gap: 12px;">
                <div>
                    <h2><i class="fas fa-clipboard-check" style="color: var(--primary);"></i> Submissions Review</h2>
                    <span style="color: var(--text-muted); font-size: 13.5px;">
                        Task: <strong>${task.title}</strong> | Batch: <strong>${task.batch.batchName}</strong>
                    </span>
                </div>
                
                <a href="${pageContext.request.contextPath}/trainer/tasks" style="text-decoration: none;">
                    <button type="button" class="mini-btn" style="padding: 10px 18px; font-size: 13px;">
                        <i class="fas fa-arrow-left"></i> Back to Tasks
                    </button>
                </a>
            </div>

            <!-- Task Summary Strip -->
            <div class="dashboard-card" style="padding: 18px 22px; border-radius: 14px; margin-bottom: 24px; display: flex; align-items: center; justify-content: space-between; flex-wrap: wrap; gap: 14px;">
                <div style="display: flex; align-items: center; gap: 14px;">
                    <div style="width: 42px; height: 42px; border-radius: 12px; background: rgba(79, 110, 247, 0.12); color: var(--primary); display: flex; align-items: center; justify-content: center; font-size: 18px;">
                        <i class="fas fa-file-code"></i>
                    </div>
                    <div>
                        <h4 style="margin: 0; font-size: 16px; font-weight: 800; color: var(--text);">${task.title}</h4>
                        <span style="font-size: 12.5px; color: var(--text-muted);">${task.description}</span>
                    </div>
                </div>

                <div style="display: flex; align-items: center; gap: 10px;">
                    <span class="badge" style="background: rgba(79, 110, 247, 0.1); color: var(--primary); font-size: 12px; font-weight: 700; padding: 5px 12px;">
                        <i class="fas fa-layer-group"></i> ${task.batch.batchName}
                    </span>
                    <span class="badge badge-approved" style="font-size: 12px; font-weight: 700; padding: 5px 12px;">
                        ${fn:length(submissions)} Total Submissions
                    </span>
                </div>
            </div>

            <!-- Submissions Grid -->
            <div style="display: grid; grid-template-columns: repeat(auto-fit, minmax(360px, 1fr)); gap: 20px;">
                <c:choose>
                    <c:when test="${not empty submissions}">
                        <c:forEach var="s" items="${submissions}">
                            <div class="dashboard-card" style="padding: 24px; border-radius: 18px; display: flex; flex-direction: column; justify-content: space-between;">
                                
                                <div>
                                    <!-- Student Profile & Status Strip -->
                                    <div style="display: flex; justify-content: space-between; align-items: flex-start; margin-bottom: 14px; padding-bottom: 12px; border-bottom: 1px solid var(--border);">
                                        <div style="display: flex; align-items: center; gap: 10px;">
                                            <div style="width: 38px; height: 38px; border-radius: 50%; background: linear-gradient(135deg, var(--primary), #8b5cf6); color: #fff; display: flex; align-items: center; justify-content: center; font-weight: 700; font-size: 14px;">
                                                ${s.student.fullName.substring(0, 1).toUpperCase()}
                                            </div>
                                            <div>
                                                <h4 style="margin: 0; font-size: 15px; font-weight: 800; color: var(--text);">${s.student.fullName}</h4>
                                                <span style="font-size: 11.5px; color: var(--text-muted); font-family: monospace;">@${s.student.username}</span>
                                            </div>
                                        </div>

                                        <span class="badge ${s.status == 'REVIEWED' ? 'badge-approved' : 'badge-pending'}" style="font-size: 11px;">
                                            <i class="${s.status == 'REVIEWED' ? 'fas fa-check-circle' : 'fas fa-hourglass-half'}" style="margin-right: 3px;"></i>
                                            ${s.status}
                                        </span>
                                    </div>

                                    <!-- Submission Details -->
                                    <div style="display: flex; flex-direction: column; gap: 10px; margin-bottom: 16px;">
                                        <div style="font-size: 12.5px; color: var(--text-muted); display: flex; align-items: center; gap: 8px;">
                                            <i class="far fa-clock" style="color: var(--primary);"></i>
                                            <span>Submitted: <strong style="color: var(--text);">${s.submittedAt}</strong></span>
                                        </div>

                                        <c:if test="${not empty s.fileName}">
                                            <div style="background: var(--surface-alt); border: 1px solid var(--border); border-radius: 10px; padding: 10px 12px; display: flex; align-items: center; justify-content: space-between;">
                                                <div style="display: flex; align-items: center; gap: 8px; overflow: hidden;">
                                                    <i class="fas fa-file-arrow-down" style="color: var(--primary); font-size: 15px;"></i>
                                                    <span style="font-size: 13px; font-weight: 600; color: var(--text); text-overflow: ellipsis; white-space: nowrap; overflow: hidden;">
                                                        ${s.fileName}
                                                    </span>
                                                </div>
                                                <a href="${pageContext.request.contextPath}/uploads/${s.fileName}" target="_blank" class="mini-btn" style="padding: 5px 10px; font-size: 11.5px; border-radius: 6px; text-decoration: none;">
                                                    <i class="fas fa-download"></i>
                                                </a>
                                            </div>
                                        </c:if>

                                        <c:if test="${not empty s.submissionNote}">
                                            <div style="font-size: 13px; color: var(--text); background: var(--surface-alt); border-left: 3px solid var(--primary); padding: 8px 12px; border-radius: 0 8px 8px 0; margin-top: 4px;">
                                                <strong style="font-size: 11.5px; color: var(--text-muted); display: block;">Student Note:</strong>
                                                ${s.submissionNote}
                                            </div>
                                        </c:if>
                                    </div>
                                </div>

                                <!-- Bottom Review Block -->
                                <div style="border-top: 1px solid var(--border); padding-top: 14px; margin-top: 6px;">
                                    <c:choose>
                                        <c:when test="${s.status == 'REVIEWED'}">
                                            <div style="background: rgba(16, 185, 129, 0.08); border: 1px solid rgba(16, 185, 129, 0.2); border-radius: 10px; padding: 12px;">
                                                <div style="display: flex; justify-content: space-between; align-items: center; margin-bottom: 6px;">
                                                    <span style="font-size: 12px; font-weight: 700; color: #10b981;">
                                                        <i class="fas fa-check-double"></i> Evaluation Completed
                                                    </span>
                                                    <span class="badge badge-approved" style="font-size: 12.5px; font-weight: 800;">
                                                        ${s.marks} / 100
                                                    </span>
                                                </div>
                                                <p style="margin: 0; font-size: 12.5px; color: var(--text); line-height: 1.4;">
                                                    <i class="fas fa-comment-dots" style="color: #10b981; margin-right: 4px;"></i>
                                                    ${s.feedback}
                                                </p>
                                            </div>
                                        </c:when>
                                        <c:otherwise>
                                            <!-- Trainer Grading Form -->
                                            <form action="${pageContext.request.contextPath}/trainer/submissions/${s.id}/feedback" method="post">
                                                <div style="display: grid; grid-template-columns: 110px 1fr; gap: 10px; margin-bottom: 10px;">
                                                    <div>
                                                        <label style="font-size: 12px; font-weight: 700; display: block; margin-bottom: 4px;">Marks (/100)</label>
                                                        <input type="number" name="marks" min="0" max="100" placeholder="e.g. 85" required style="width: 100%; padding: 8px 10px; border: 1px solid var(--border); border-radius: 8px; background: var(--surface-alt); color: var(--text); font-size: 13px; outline: none; box-sizing: border-box;">
                                                    </div>
                                                    <div>
                                                        <label style="font-size: 12px; font-weight: 700; display: block; margin-bottom: 4px;">Review Remarks</label>
                                                        <input type="text" name="feedback" placeholder="Add constructive feedback..." required style="width: 100%; padding: 8px 10px; border: 1px solid var(--border); border-radius: 8px; background: var(--surface-alt); color: var(--text); font-size: 13px; outline: none; box-sizing: border-box;">
                                                    </div>
                                                </div>
                                                <button type="submit" class="btn-primary" style="padding: 9px 16px; font-size: 13px; border-radius: 8px; display: inline-flex; align-items: center; justify-content: center; gap: 6px;">
                                                    <i class="fas fa-paper-plane"></i> Submit Feedback & Marks
                                                </button>
                                            </form>
                                        </c:otherwise>
                                    </c:choose>
                                </div>

                            </div>
                        </c:forEach>
                    </c:when>
                    <c:otherwise>
                        <div class="dashboard-card" style="grid-column: 1 / -1; text-align: center; padding: 40px; color: var(--text-muted); border-radius: 18px;">
                            <i class="fas fa-file-circle-exclamation" style="font-size: 32px; color: var(--primary); margin-bottom: 10px; display: block;"></i>
                            <h4 style="margin: 0; font-size: 16px; color: var(--text);">No Submissions Found</h4>
                            <p style="margin: 4px 0 0; font-size: 13px;">Students have not submitted their solution files for this assignment yet.</p>
                        </div>
                    </c:otherwise>
                </c:choose>
            </div>
        </div>

    </main>
</div>



</body>
</html>