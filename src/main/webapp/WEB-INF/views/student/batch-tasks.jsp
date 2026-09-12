<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Tasks - EduManage</title>
    <!-- FontAwesome Icons -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
</head>
<body>

<div class="dashboard-layout">
    <!-- Student Sidebar Navigation -->
    <jsp:include page="/WEB-INF/views/common/student-sidebar.jsp" />

    <!-- Main Content Area -->
    <main class="main-content">
        
        <!-- Header Bar -->
        <div class="header-bar" style="margin-bottom: 24px;">
            <div>
                <h2>
                    <i class="fas fa-tasks" style="color: var(--primary);"></i> 
                    Tasks & Assignments - ${batch.batchName}
                </h2>
                <span style="color: var(--text-muted); font-size: 13.5px;">
                    <i class="fas fa-book-open" style="margin-right: 4px;"></i> ${batch.courseName}
                </span>
            </div>
            <a href="${pageContext.request.contextPath}/student/dashboard" style="text-decoration: none;">
                <button type="button" class="mini-btn" style="padding: 10px 18px; font-size: 13.5px;">
                    <i class="fas fa-arrow-left"></i> Back to Dashboard
                </button>
            </a>
        </div>

        <!-- Tasks Directory Card -->
        <div class="dashboard-card" style="padding: 24px; border-radius: 18px; box-shadow: var(--shadow);">
            
            <div class="card-header-custom" style="margin-bottom: 18px; border-bottom: 1px solid var(--border); padding-bottom: 12px; display: flex; align-items: center; justify-content: space-between;">
                <div>
                    <h6 style="margin: 0; font-size: 16px; color: var(--text); font-weight: 700;">
                        <i class="fas fa-list-check" style="color: var(--primary); margin-right: 6px;"></i> Assigned Tasks
                    </h6>
                    <small style="color: var(--text-muted); font-size: 12.5px;">Pending and submitted course assignments</small>
                </div>
                <span class="badge" style="background: var(--bg); color: var(--text); border: 1px solid var(--border); font-size: 12px; font-weight: 600;">
                    ${fn:length(tasks)} Total Tasks
                </span>
            </div>

            <div class="table-wrapper">
                <table>
                    <thead>
                        <tr>
                            <th><i class="fas fa-file-alt" style="color: var(--primary); margin-right: 6px;"></i> Task Title</th>
                            <th style="width: 200px;"><i class="fas fa-calendar-alt" style="color: var(--primary); margin-right: 6px;"></i> Due Date</th>
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
                                        </td>
                                        <td>
                                            <span style="color: var(--text-muted); font-size: 13px;">
                                                <i class="far fa-clock" style="margin-right: 4px;"></i> ${t.dueDate}
                                            </span>
                                        </td>
                                        <td style="text-align: center;">
                                            <a href="${pageContext.request.contextPath}/student/tasks/${t.id}/submit" class="mini-btn" style="text-decoration: none; padding: 6px 14px; font-size: 12.5px; display: inline-flex; align-items: center; gap: 5px;">
                                                <i class="fas fa-upload"></i> Submit
                                            </a>
                                        </td>
                                    </tr>
                                </c:forEach>
                            </c:when>
                            <c:otherwise>
                                <tr>
                                    <td colspan="3" style="text-align: center; padding: 24px; color: var(--text-muted);">
                                        <i class="fas fa-clipboard-check" style="margin-right: 6px; font-size: 18px;"></i> No tasks assigned in this batch yet.
                                    </td>
                                </tr>
                            </c:otherwise>
                        </c:choose>
                    </tbody>
                </table>
            </div>

        </div>

    </main>
</div>

</body>
</html>