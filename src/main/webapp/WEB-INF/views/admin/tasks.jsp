<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Tasks Overview - EduManage</title>
    <!-- FontAwesome Vector Icons -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
</head>
<body>

<div class="dashboard-layout">
    <!-- Sidebar Navigation -->
    <jsp:include page="/WEB-INF/views/common/admin-sidebar.jsp" />

    <!-- Main Content Area -->
    <main class="main-content">
        
        <!-- Header Bar -->
        <div class="header-bar" style="margin-bottom: 24px;">
            <div>
                <h2><i class="fas fa-tasks" style="color: var(--primary);"></i> Tasks & Assignments Overview</h2>
                <span style="color: var(--text-muted); font-size: 13.5px;">Monitor academic projects and assignments configured across batches.</span>
            </div>
            <a href="${pageContext.request.contextPath}/admin/dashboard" style="text-decoration: none;">
                <button type="button" class="mini-btn" style="padding: 10px 18px; font-size: 13.5px;">
                    <i class="fas fa-arrow-left"></i> Back to Dashboard
                </button>
            </a>
        </div>

        <!-- Tasks / Batch Directory Card -->
        <div class="dashboard-card" style="padding: 24px; border-radius: 18px; box-shadow: var(--shadow);">
            
            <div class="card-header-custom" style="margin-bottom: 18px; border-bottom: 1px solid var(--border); padding-bottom: 12px; display: flex; align-items: center; justify-content: space-between;">
                <div>
                    <h6 style="margin: 0; font-size: 16px; color: var(--text); font-weight: 700;">
                        <i class="fas fa-layer-group" style="color: var(--primary); margin-right: 6px;"></i> Active Cohort Mapping
                    </h6>
                    <small style="color: var(--text-muted); font-size: 12.5px;">Batches with linked course curriculums</small>
                </div>
                <span class="badge" style="background: var(--bg); color: var(--text); border: 1px solid var(--border); font-size: 12px; font-weight: 600;">
                    ${fn:length(batches)} Batches Tracked
                </span>
            </div>

            <div class="table-wrapper">
                <table>
                    <thead>
                        <tr>
                            <th><i class="fas fa-chalkboard" style="color: var(--primary); margin-right: 6px;"></i> Batch Title</th>
                            <th><i class="fas fa-book-open" style="color: var(--primary); margin-right: 6px;"></i> Course Track</th>
                            <th><i class="fas fa-user-tie" style="color: var(--primary); margin-right: 6px;"></i> Assigned Lead Trainer</th>
                            <th style="text-align: center;"><i class="fas fa-info-circle" style="color: var(--primary); margin-right: 6px;"></i> Allocation Status</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:choose>
                            <c:when test="${not empty batches}">
                                <c:forEach var="b" items="${batches}">
                                    <tr>
                                        <td>
                                            <strong style="color: var(--text); font-size: 14px;">${b.batchName}</strong>
                                        </td>
                                        <td>
                                            <span style="color: var(--text-muted); font-weight: 500;">
                                                ${b.courseName != null ? b.courseName : 'General Curriculum'}
                                            </span>
                                        </td>
                                        <td>
                                            <c:choose>
                                                <c:when test="${b.trainer != null}">
                                                    <strong style="color: var(--text); font-size: 13.5px;">
                                                        <i class="fas fa-chalkboard-teacher" style="color: var(--primary); margin-right: 4px;"></i> ${b.trainer.fullName}
                                                    </strong>
                                                </c:when>
                                                <c:otherwise>
                                                    <span style="color: var(--text-muted); font-style: italic;">Not Assigned</span>
                                                </c:otherwise>
                                            </c:choose>
                                        </td>
                                        <td style="text-align: center;">
                                            <c:choose>
                                                <c:when test="${b.trainer != null}">
                                                    <span class="badge badge-approved" style="font-size: 12px;">
                                                        <i class="fas fa-check-circle" style="margin-right: 4px;"></i> Active Trainer
                                                    </span>
                                                </c:when>
                                                <c:otherwise>
                                                    <span class="badge badge-pending" style="font-size: 12px;">
                                                        <i class="fas fa-clock" style="margin-right: 4px;"></i> Unassigned
                                                    </span>
                                                </c:otherwise>
                                            </c:choose>
                                        </td>
                                    </tr>
                                </c:forEach>
                            </c:when>
                            <c:otherwise>
                                <tr>
                                    <td colspan="4" style="text-align: center; padding: 24px; color: var(--text-muted);">
                                        <i class="fas fa-folder-open" style="margin-right: 6px;"></i> No batch task records found.
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