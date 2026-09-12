<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Tasks Assigned - EduManage</title>
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
                    <h2><i class="fas fa-tasks" style="color: var(--primary);"></i> Tasks I've Assigned</h2>
                    <span style="color: var(--text-muted); font-size: 13.5px;">All coursework tasks, project assignments, and evaluations created across your cohorts.</span>
                </div>
                
                <a href="${pageContext.request.contextPath}/trainer/dashboard" style="text-decoration: none;">
                    <button type="button" class="mini-btn" style="padding: 10px 18px; font-size: 13px;">
                        <i class="fas fa-arrow-left"></i> Back to Dashboard
                    </button>
                </a>
            </div>

            <!-- Tasks Table Card -->
            <div class="dashboard-card" style="padding: 26px; border-radius: 18px; box-shadow: var(--shadow);">
                
                <div class="card-header-custom" style="margin-bottom: 18px; border-bottom: 1px solid var(--border); padding-bottom: 12px; display: flex; align-items: center; justify-content: space-between;">
                    <div>
                        <h6 style="margin: 0; font-size: 16px; color: var(--text); font-weight: 700;">
                            <i class="fas fa-list-check" style="color: var(--primary); margin-right: 6px;"></i> Assigned Tasks Directory
                        </h6>
                        <small style="color: var(--text-muted); font-size: 12.5px;">Monitor student deadlines and grade incoming solution deliverables</small>
                    </div>
                    <span class="badge badge-approved" style="font-size: 12px; font-weight: 600;">
                        ${fn:length(tasks)} Tasks Published
                    </span>
                </div>

                <div class="table-wrapper">
                    <table>
                        <thead>
                            <tr>
                                <th><i class="fas fa-heading" style="color: var(--primary); margin-right: 6px;"></i> Task Title</th>
                                <th><i class="fas fa-layer-group" style="color: var(--primary); margin-right: 6px;"></i> Target Batch</th>
                                <th style="width: 150px;"><i class="far fa-calendar-plus" style="color: var(--primary); margin-right: 6px;"></i> Assigned</th>
                                <th style="width: 150px;"><i class="far fa-calendar-xmark" style="color: var(--primary); margin-right: 6px;"></i> Due Date</th>
                                <th style="text-align: center; width: 170px;"><i class="fas fa-clipboard-check" style="color: var(--primary); margin-right: 6px;"></i> Action</th>
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
                                                    <span style="display: block; font-size: 12px; color: var(--text-muted); margin-top: 3px; max-width: 380px; white-space: nowrap; overflow: hidden; text-overflow: ellipsis;">
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
                                                <span style="font-size: 13px; color: var(--text-muted);">
                                                    ${t.assignedDate != null ? t.assignedDate : '-'}
                                                </span>
                                            </td>
                                            <td>
                                                <span style="font-size: 13px; font-weight: 600; color: #ea580c;">
                                                    <i class="far fa-clock" style="margin-right: 4px;"></i> ${t.dueDate != null ? t.dueDate : 'No Due Date'}
                                                </span>
                                            </td>
                                            <td style="text-align: center;">
                                                <a href="${pageContext.request.contextPath}/trainer/tasks/${t.id}/submissions" class="mini-btn" style="padding: 8px 16px; font-size: 12.5px; border-radius: 8px; text-decoration: none; display: inline-flex; align-items: center; gap: 6px;">
                                                    <i class="fas fa-eye"></i> View Submissions
                                                </a>
                                            </td>
                                        </tr>
                                    </c:forEach>
                                </c:when>
                                <c:otherwise>
                                    <tr>
                                        <td colspan="5" style="text-align: center; padding: 36px; color: var(--text-muted);">
                                            <i class="fas fa-tasks" style="font-size: 28px; color: var(--primary); margin-bottom: 10px; display: block;"></i>
                                            <strong>No Tasks Assigned Yet</strong>
                                            <p style="margin: 4px 0 0; font-size: 13px;">You haven't created any assignments yet. Navigate to your batches to create a new task.</p>
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