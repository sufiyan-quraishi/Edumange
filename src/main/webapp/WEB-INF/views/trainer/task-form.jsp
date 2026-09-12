<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Assign Task - EduManage</title>
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
                    <h2><i class="fas fa-plus-circle" style="color: var(--primary);"></i> Assign New Task</h2>
                    <span style="color: var(--text-muted); font-size: 13.5px;">Create a coursework deliverable, lab project, or assignment for <strong>${batch.batchName}</strong> (${batch.courseName}).</span>
                </div>
                
                <a href="${pageContext.request.contextPath}/trainer/batches" style="text-decoration: none;">
                    <button type="button" class="mini-btn" style="padding: 10px 18px; font-size: 13px;">
                        <i class="fas fa-arrow-left"></i> Back to Batches
                    </button>
                </a>
            </div>

            <!-- Main Layout Grid -->
            <div style="display: grid; grid-template-columns: minmax(280px, 340px) 1fr; gap: 24px; align-items: start;">
                
                <!-- Left Batch Details Info Card -->
                <div class="dashboard-card" style="padding: 24px; border-radius: 18px;">
                    <div class="card-header-custom" style="margin-bottom: 16px; border-bottom: 1px solid var(--border); padding-bottom: 12px;">
                        <span class="badge badge-approved" style="font-size: 11.5px;">Target Batch Info</span>
                    </div>

                    <div style="display: flex; align-items: center; gap: 12px; margin-bottom: 16px;">
                        <div style="width: 44px; height: 44px; border-radius: 12px; background: rgba(79, 110, 247, 0.12); color: var(--primary); display: flex; align-items: center; justify-content: center; font-size: 20px;">
                            <i class="fas fa-layer-group"></i>
                        </div>
                        <div>
                            <h4 style="margin: 0; font-size: 16px; font-weight: 800; color: var(--text);">${batch.batchName}</h4>
                            <span style="font-size: 12.5px; color: var(--text-muted);">${batch.courseName}</span>
                        </div>
                    </div>

                    <div style="padding-top: 14px; border-top: 1px solid var(--border); display: flex; flex-direction: column; gap: 10px; font-size: 13px; color: var(--text-muted);">
                        <div>
                            <i class="fas fa-calendar-day" style="color: var(--primary); width: 18px;"></i>
                            <span>Assigned On: <strong>Today</strong></span>
                        </div>
                        <div>
                            <i class="fas fa-user-check" style="color: var(--primary); width: 18px;"></i>
                            <span>Visibility: <strong>All Enrolled Students</strong></span>
                        </div>
                    </div>
                </div>

                <!-- Right Form Card -->
                <div class="dashboard-card" style="padding: 28px; border-radius: 18px;">
                    <div class="card-header-custom" style="margin-bottom: 20px; border-bottom: 1px solid var(--border); padding-bottom: 14px;">
                        <div>
                            <h6 style="margin: 0; font-size: 16px; font-weight: 700; color: var(--text);">
                                <i class="fas fa-file-signature" style="color: var(--primary); margin-right: 6px;"></i> Task Specifications
                            </h6>
                            <small style="color: var(--text-muted); font-size: 12.5px;">Provide assignment instructions and a submission deadline</small>
                        </div>
                    </div>

                    <form action="${pageContext.request.contextPath}/trainer/batch/${batch.id}/tasks" method="post">
                        
                        <!-- Task Title Input -->
                        <div class="form-group" style="margin-bottom: 20px;">
                            <label style="font-size: 13.5px; font-weight: 700; margin-bottom: 8px; display: flex; align-items: center; gap: 6px; color: var(--text);">
                                <i class="fas fa-heading" style="color: var(--primary);"></i> Assignment Title <span style="color: var(--danger); font-size: 12px;">*</span>
                            </label>
                            <input type="text" name="title" placeholder="e.g. Build Spring Boot REST API for Authentication" required style="width: 100%; padding: 12px 14px; border: 1px solid var(--border); border-radius: 10px; background: var(--surface-alt); color: var(--text); font-size: 13.5px; box-sizing: border-box; outline: none;">
                        </div>

                        <!-- Due Date Input -->
                        <div class="form-group" style="margin-bottom: 20px;">
                            <label style="font-size: 13.5px; font-weight: 700; margin-bottom: 8px; display: flex; align-items: center; gap: 6px; color: var(--text);">
                                <i class="far fa-calendar-alt" style="color: var(--primary);"></i> Submission Deadline
                            </label>
                            <input type="date" name="dueDate" style="width: 100%; max-width: 240px; padding: 11px 14px; border: 1px solid var(--border); border-radius: 10px; background: var(--surface-alt); color: var(--text); font-size: 13.5px; box-sizing: border-box; outline: none;">
                        </div>

                        <!-- Description / Instructions Input -->
                        <div class="form-group" style="margin-bottom: 24px;">
                            <label style="font-size: 13.5px; font-weight: 700; margin-bottom: 8px; display: flex; align-items: center; gap: 6px; color: var(--text);">
                                <i class="fas fa-align-left" style="color: var(--primary);"></i> Task Requirements & Guidelines
                            </label>
                            <textarea name="description" rows="5" placeholder="Detail the expected milestones, project constraints, database requirements, and submission format..." style="width: 100%; padding: 12px 14px; border: 1px solid var(--border); border-radius: 10px; background: var(--surface-alt); color: var(--text); font-size: 13.5px; box-sizing: border-box; outline: none; resize: vertical;"></textarea>
                        </div>

                        <!-- Form Actions -->
                        <div style="display: flex; justify-content: flex-end; gap: 12px;">
                            <a href="${pageContext.request.contextPath}/trainer/batches" class="mini-btn" style="padding: 11px 22px; font-size: 13.5px; text-decoration: none; border-radius: 10px;">
                                Cancel
                            </a>
                            <button type="submit" class="btn-primary" style="width: auto; padding: 11px 28px; font-size: 14px; border-radius: 10px; display: inline-flex; align-items: center; gap: 8px;">
                                <i class="fas fa-paper-plane"></i> Publish Task
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