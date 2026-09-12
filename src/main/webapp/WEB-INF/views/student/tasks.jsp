<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>My Tasks - EduManage</title>
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
                    <h2><i class="fas fa-list-check" style="color: var(--primary);"></i> My Tasks & Assignments</h2>
                    <span style="color: var(--text-muted); font-size: 13.5px;">All practical assignments, lab deliverables, and course projects across your enrolled batches.</span>
                </div>
                
                <a href="${pageContext.request.contextPath}/student/dashboard" style="text-decoration: none;">
                    <button type="button" class="mini-btn" style="padding: 10px 18px; font-size: 13px;">
                        <i class="fas fa-arrow-left"></i> Back to Dashboard
                    </button>
                </a>
            </div>

            <!-- Tasks Table Card -->
            <div class="dashboard-card" style="padding: 24px; border-radius: 18px; box-shadow: var(--shadow);">
                
                <div class="card-header-custom" style="margin-bottom: 18px; border-bottom: 1px solid var(--border); padding-bottom: 12px; display: flex; align-items: center; justify-content: space-between;">
                    <div>
                        <h6 style="margin: 0; font-size: 16px; color: var(--text); font-weight: 700;">
                            <i class="fas fa-tasks" style="color: var(--primary); margin-right: 6px;"></i> Assigned Tasks Roster
                        </h6>
                        <small style="color: var(--text-muted); font-size: 12.5px;">Review details and submit deliverables before the deadline</small>
                    </div>
                    <span class="badge badge-approved" style="font-size: 12px; font-weight: 600;">
                        ${fn:length(tasks)} Total Tasks
                    </span>
                </div>

                <div class="table-wrapper">
                    <table>
                        <thead>
                            <tr>
                                <th><i class="fas fa-heading" style="color: var(--primary); margin-right: 6px;"></i> Task Title</th>
                                <th><i class="fas fa-layer-group" style="color: var(--primary); margin-right: 6px;"></i> Batch</th>
                                <th style="width: 170px;"><i class="far fa-calendar-alt" style="color: var(--primary); margin-right: 6px;"></i> Due Date</th>
                                <th style="text-align: center; width: 140px;"><i class="fas fa-paper-plane" style="color: var(--primary); margin-right: 6px;"></i> Action</th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:choose>
                                <c:when test="${not empty tasks}">
                                    <c:forEach var="t" items="${tasks}">
                                        <tr>
                                            <td>
                                                <strong style="color: var(--text); font-size: 14px;">${t.title}</strong>
                                                <c:if test="${not empty t.description}">
                                                    <span style="display: block; font-size: 12px; color: var(--text-muted); margin-top: 3px; max-width: 460px; white-space: nowrap; overflow: hidden; text-overflow: ellipsis;">
                                                        ${t.description}
                                                    </span>
                                                </c:if>
                                            </td>
                                            <td>
                                                <span class="badge" style="background: rgba(79, 110, 247, 0.1); color: var(--primary); font-size: 12px; font-weight: 700; padding: 4px 10px;">
                                                    <i class="fas fa-chalkboard-user" style="margin-right: 4px;"></i> ${t.batch != null ? t.batch.batchName : 'General'}
                                                </span>
                                            </td>
                                            <td>
                                                <span style="font-size: 13px; font-weight: 600; color: #ea580c;">
                                                    <i class="far fa-clock" style="margin-right: 4px;"></i> ${t.dueDate != null ? t.dueDate : 'No Deadline'}
                                                </span>
                                            </td>
                                            <td style="text-align: center;">
                                                <a href="${pageContext.request.contextPath}/student/tasks/${t.id}/submit" class="mini-btn" style="padding: 8px 16px; font-size: 12.5px; border-radius: 8px; text-decoration: none; display: inline-flex; align-items: center; gap: 6px;">
                                                    <i class="fas fa-cloud-arrow-up"></i> Submit
                                                </a>
                                            </td>
                                        </tr>
                                    </c:forEach>
                                </c:when>
                                <c:otherwise>
                                    <tr>
                                        <td colspan="4" style="text-align: center; padding: 36px; color: var(--text-muted);">
                                            <i class="fas fa-clipboard-check" style="font-size: 26px; color: var(--primary); margin-bottom: 8px; display: block;"></i>
                                            <strong>No Tasks Assigned</strong>
                                            <p style="margin: 4px 0 0; font-size: 13px;">You have no pending assignments or project tasks at the moment.</p>
                                        </td>
                                    </tr>
                                </c:otherwise>
                            </c:choose>
                        </tbody>
                    </table>
                </div>

            </div>
        </div>


        </div>

    </main>
</div>

</body>
</html>