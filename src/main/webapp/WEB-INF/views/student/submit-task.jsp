<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Submit Assignment - EduManage</title>
    <!-- FontAwesome Vector Icons -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css">
    <!-- Project Stylesheet -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
</head>
<body style="min-height: 100vh; display: flex; flex-direction: column; margin: 0;">

<div class="dashboard-layout" style="flex: 1; display: flex; min-height: 100vh;">
    
    <!-- 1. SIDEBAR NAVIGATION -->
    <jsp:include page="/WEB-INF/views/common/student-sidebar.jsp" />

    <!-- 2. MAIN CONTENT AREA -->
    <main class="main-content" style="flex: 1; display: flex; flex-direction: column; justify-content: space-between; padding: 30px; box-sizing: border-box;">
        
        <div>
            <!-- Header Bar -->
            <div class="header-bar" style="margin-bottom: 24px; display: flex; justify-content: space-between; align-items: center; flex-wrap: wrap; gap: 12px;">
                <div>
                    <h2><i class="fas fa-file-arrow-up" style="color: var(--primary);"></i> Submit Task Deliverable</h2>
                    <span style="color: var(--text-muted); font-size: 13.5px;">Upload your completed work, code archives, or report files for mentor evaluation.</span>
                </div>
                
                <a href="${pageContext.request.contextPath}/student/tasks" style="text-decoration: none;">
                    <button type="button" class="mini-btn" style="padding: 10px 18px; font-size: 13px;">
                        <i class="fas fa-arrow-left"></i> Back to Tasks
                    </button>
                </a>
            </div>

            <div style="display: grid; grid-template-columns: minmax(280px, 360px) 1fr; gap: 24px; align-items: start;">
                
                <!-- Left Task Details Card -->
                <div class="dashboard-card" style="padding: 24px; border-radius: 18px;">
                    <div class="card-header-custom" style="margin-bottom: 16px; border-bottom: 1px solid var(--border); padding-bottom: 12px;">
                        <span class="badge badge-pending" style="font-size: 11.5px;">Assignment Details</span>
                    </div>

                    <h3 style="margin: 0 0 10px 0; font-size: 18px; font-weight: 800; color: var(--text); line-height: 1.3;">
                        ${task.title}
                    </h3>
                    
                    <p style="color: var(--text-muted); font-size: 13.5px; line-height: 1.5; margin: 0 0 20px 0;">
                        ${task.description != null ? task.description : 'No detailed description provided for this assignment.'}
                    </p>

                    <div style="padding-top: 16px; border-top: 1px solid var(--border); display: flex; flex-direction: column; gap: 12px;">
                        <div style="font-size: 13px; color: var(--text-muted); display: flex; align-items: center; gap: 10px;">
                            <i class="far fa-calendar-alt" style="color: var(--primary); font-size: 15px; width: 16px;"></i>
                            <span>Due Date: <strong style="color: #ea580c;">${task.dueDate != null ? task.dueDate : 'Not specified'}</strong></span>
                        </div>
                        <c:if test="${task.batch != null}">
                            <div style="font-size: 13px; color: var(--text-muted); display: flex; align-items: center; gap: 10px;">
                                <i class="fas fa-layer-group" style="color: var(--primary); font-size: 15px; width: 16px;"></i>
                                <span>Batch: <strong style="color: var(--text);">${task.batch.batchName}</strong></span>
                            </div>
                        </c:if>
                    </div>
                </div>

                <!-- Right Submission Form Card -->
                <div class="dashboard-card" style="padding: 28px; border-radius: 18px;">
                    <div class="card-header-custom" style="margin-bottom: 20px; border-bottom: 1px solid var(--border); padding-bottom: 14px;">
                        <div>
                            <h6 style="margin: 0; font-size: 16px; font-weight: 700; color: var(--text);">
                                <i class="fas fa-cloud-upload-alt" style="color: var(--primary); margin-right: 6px;"></i> Upload Submission
                            </h6>
                            <small style="color: var(--text-muted); font-size: 12.5px;">Select your submission document (ZIP, PDF, DOCX, etc.)</small>
                        </div>
                    </div>

                    <form action="${pageContext.request.contextPath}/student/tasks/${task.id}/submit" method="post" enctype="multipart/form-data">
                        
                        <div class="form-group" style="margin-bottom: 20px;">
                            <label style="font-size: 13.5px; font-weight: 700; margin-bottom: 8px; display: flex; align-items: center; gap: 6px; color: var(--text);">
                                <i class="fas fa-paperclip" style="color: var(--primary);"></i> Project / Solution File <span style="color: var(--danger); font-size: 12px;">*</span>
                            </label>
                            <input type="file" name="file" required style="width: 100%; padding: 12px 14px; border: 1px solid var(--border); border-radius: 10px; background: var(--surface-alt); color: var(--text); font-size: 13.5px; box-sizing: border-box;">
                        </div>

                        <div class="form-group" style="margin-bottom: 24px;">
                            <label style="font-size: 13.5px; font-weight: 700; margin-bottom: 8px; display: flex; align-items: center; gap: 6px; color: var(--text);">
                                <i class="fas fa-sticky-note" style="color: var(--primary);"></i> Submission Notes <span style="color: var(--text-muted); font-weight: normal; font-size: 12px;">(Optional)</span>
                            </label>
                            <textarea name="note" rows="4" placeholder="Mention repository links, brief notes, or implementation details for your instructor..." style="width: 100%; padding: 12px 14px; border: 1px solid var(--border); border-radius: 10px; background: var(--surface-alt); color: var(--text); font-size: 13.5px; box-sizing: border-box; resize: vertical;"></textarea>
                        </div>

                        <div style="display: flex; justify-content: flex-end; gap: 12px;">
                            <button type="submit" class="btn-primary" style="width: auto; padding: 11px 28px; font-size: 14px; border-radius: 10px; display: inline-flex; align-items: center; gap: 8px;">
                                <i class="fas fa-paper-plane"></i> Submit Assignment
                            </button>
                        </div>
                    </form>
                </div>

            </div>
        </div>

        </div>

    </main>
</div>

</body>
</html>