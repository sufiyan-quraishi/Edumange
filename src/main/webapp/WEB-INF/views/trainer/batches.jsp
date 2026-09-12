<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>My Assigned Batches - EduManage</title>
    <!-- FontAwesome Vector Icons -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css">
    <!-- Project Stylesheet -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
    
    <style>
        .batches-grid {
            display: grid;
            grid-template-columns: repeat(auto-fill, minmax(380px, 1fr));
            gap: 24px;
            margin-top: 15px;
        }

        @media (max-width: 768px) {
            .batches-grid {
                grid-template-columns: 1fr;
            }
        }

        .batch-card {
            background: var(--surface);
            border: 1px solid var(--border);
            border-radius: 20px;
            padding: 24px;
            box-shadow: var(--shadow);
            transition: all 0.3s ease;
            display: flex;
            flex-direction: column;
            justify-content: space-between;
        }

        .batch-card:hover {
            transform: translateY(-4px);
            box-shadow: var(--shadow-xl);
            border-color: rgba(79, 110, 247, 0.4);
        }

        .batch-card-header {
            display: flex;
            justify-content: space-between;
            align-items: flex-start;
            margin-bottom: 20px;
        }

        .batch-card-title-group {
            display: flex;
            align-items: center;
            gap: 14px;
        }

        .batch-icon-box {
            width: 52px;
            height: 52px;
            border-radius: 14px;
            background: linear-gradient(135deg, #3b82f6, #4f6ef7);
            color: #ffffff;
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 22px;
            box-shadow: 0 8px 18px rgba(79, 110, 247, 0.25);
            flex-shrink: 0;
        }

        .batch-name {
            font-size: 16.5px;
            font-weight: 800;
            color: var(--text);
            margin: 0 0 4px 0;
        }

        .batch-course {
            font-size: 13px;
            color: var(--text-muted);
            display: flex;
            align-items: center;
            gap: 6px;
        }

        .badge-live {
            background: rgba(16, 185, 129, 0.12);
            color: #10b981;
            font-size: 11.5px;
            font-weight: 700;
            padding: 4px 12px;
            border-radius: 20px;
            border: 1px solid rgba(16, 185, 129, 0.2);
        }

        .enrolled-bar {
            background: var(--surface-alt);
            border: 1px solid var(--border);
            border-radius: 14px;
            padding: 12px 16px;
            display: flex;
            align-items: center;
            justify-content: space-between;
            margin-bottom: 20px;
        }

        .enrolled-label {
            font-size: 13px;
            color: var(--text-muted);
            display: flex;
            align-items: center;
            gap: 8px;
            font-weight: 600;
        }

        .enrolled-badge {
            background: rgba(79, 110, 247, 0.12);
            color: var(--primary);
            font-size: 12.5px;
            font-weight: 800;
            padding: 5px 14px;
            border-radius: 20px;
        }

        .batch-actions {
            display: flex;
            align-items: center;
            justify-content: flex-end;
            gap: 10px;
            flex-wrap: wrap;
        }

        .btn-action-students {
            background: rgba(79, 110, 247, 0.1);
            color: var(--primary);
            border: 1px solid rgba(79, 110, 247, 0.2);
            padding: 8px 16px;
            border-radius: 10px;
            font-size: 12.5px;
            font-weight: 700;
            text-decoration: none;
            display: inline-flex;
            align-items: center;
            gap: 6px;
            transition: all 0.2s ease;
        }

        .btn-action-students:hover {
            background: var(--primary);
            color: #ffffff;
        }

        .btn-action-attendance {
            background: rgba(16, 185, 129, 0.1);
            color: #10b981;
            border: 1px solid rgba(16, 185, 129, 0.2);
            padding: 8px 16px;
            border-radius: 10px;
            font-size: 12.5px;
            font-weight: 700;
            text-decoration: none;
            display: inline-flex;
            align-items: center;
            gap: 6px;
            transition: all 0.2s ease;
        }

        .btn-action-attendance:hover {
            background: #10b981;
            color: #ffffff;
        }

        .btn-action-task {
            background: rgba(59, 130, 246, 0.1);
            color: #2563eb;
            border: 1px solid rgba(59, 130, 246, 0.2);
            padding: 8px 16px;
            border-radius: 10px;
            font-size: 12.5px;
            font-weight: 700;
            text-decoration: none;
            display: inline-flex;
            align-items: center;
            gap: 6px;
            transition: all 0.2s ease;
        }

        .btn-action-task:hover {
            background: #2563eb;
            color: #ffffff;
        }
    </style>
</head>
<body style="min-height: 100vh; display: flex; flex-direction: column; margin: 0;">

<div class="dashboard-layout" style="flex: 1; display: flex; min-height: 100vh;">
    
    <!-- 1. TRAINER SIDEBAR -->
    <jsp:include page="/WEB-INF/views/common/trainer-sidebar.jsp" />

    <!-- 2. MAIN CONTENT AREA -->
    <main class="main-content" style="flex: 1; display: flex; flex-direction: column; justify-content: space-between; padding: 30px; box-sizing: border-box;">
        
        <div>
            <!-- Header Section -->
            <div style="display: flex; justify-content: space-between; align-items: center; margin-bottom: 24px; flex-wrap: wrap; gap: 12px;">
                <div style="display: flex; align-items: center; gap: 10px;">
                    <i class="fas fa-users-rectangle" style="font-size: 22px; color: var(--primary);"></i>
                    <h2 style="margin: 0; font-size: 20px; font-weight: 800; color: var(--text);">My Assigned Batches</h2>
                </div>

                <span class="badge-live" style="font-size: 12px; font-weight: 800; padding: 6px 14px;">
                    ${fn:length(batches)} Active Batches
                </span>
            </div>

            <!-- Batches Cards Grid -->
            <div class="batches-grid">
                <c:choose>
                    <c:when test="${not empty batches}">
                        <c:forEach var="b" items="${batches}">
                            <div class="batch-card">
                                <div>
                                    <!-- Card Header Top -->
                                    <div class="batch-card-header">
                                        <div class="batch-card-title-group">
                                            <div class="batch-icon-box">
                                                <i class="fas fa-laptop-code"></i>
                                            </div>
                                            <div>
                                                <h3 class="batch-name">${b.batchName}</h3>
                                                <div class="batch-course">
                                                    <i class="fas fa-book-open" style="font-size: 11px;"></i>
                                                    <span>${b.courseName}</span>
                                                </div>
                                            </div>
                                        </div>
                                        <span class="badge-live">Live</span>
                                    </div>

                                    <!-- Enrolled Strength Row -->
                                    <div class="enrolled-bar">
                                        <div class="enrolled-label">
                                            <i class="fas fa-users" style="color: var(--primary);"></i>
                                            <span>Enrolled Strength:</span>
                                        </div>
                                        <span class="enrolled-badge">
                                            ${fn:length(b.students)} Students
                                        </span>
                                    </div>
                                </div>

                                <!-- Action Buttons Bottom -->
                                <div class="batch-actions">
                                    <a href="${pageContext.request.contextPath}/trainer/batch/${b.id}/students" class="btn-action-students">
                                        <i class="fas fa-graduation-cap"></i> Students
                                    </a>
                                    <a href="${pageContext.request.contextPath}/trainer/batch/${b.id}/attendance" class="btn-action-attendance">
                                        <i class="fas fa-calendar-check"></i> Attendance
                                    </a>
                                    <a href="${pageContext.request.contextPath}/trainer/batch/${b.id}/tasks/new" class="btn-action-task">
                                        <i class="fas fa-plus-circle"></i> Task
                                    </a>
                                </div>
                            </div>
                        </c:forEach>
                    </c:when>
                    <c:otherwise>
                        <div class="dashboard-card" style="grid-column: 1 / -1; text-align: center; padding: 40px; color: var(--text-muted); border-radius: 18px;">
                            <i class="fas fa-chalkboard" style="font-size: 32px; color: var(--primary); margin-bottom: 10px; display: block;"></i>
                            <h4 style="margin: 0; font-size: 16px; color: var(--text);">No Batches Assigned</h4>
                            <p style="margin: 4px 0 0; font-size: 13px;">You do not have any active teaching batches assigned yet.</p>
                        </div>
                    </c:otherwise>
                </c:choose>
            </div>
        </div>

    </main>
</div>

</body>
</html>