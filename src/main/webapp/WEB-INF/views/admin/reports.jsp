<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Reports & Analytics - EduManage</title>
    <!-- FontAwesome for Vector Icons -->
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
                <h2><i class="fas fa-chart-line" style="color: var(--primary);"></i> Reports & Analytics</h2>
                <span style="color: var(--text-muted); font-size: 13.5px;">Comprehensive overview of academic batches, enrolled students, and faculty strength.</span>
            </div>
            <a href="${pageContext.request.contextPath}/admin/dashboard" style="text-decoration: none;">
                <button type="button" class="mini-btn" style="padding: 10px 18px; font-size: 13.5px;">
                    <i class="fas fa-arrow-left"></i> Back to Dashboard
                </button>
            </a>
        </div>

        <!-- Metric Stat Cards Grid -->
        <div class="stat-grid" style="display: grid; grid-template-columns: repeat(auto-fit, minmax(240px, 1fr)); gap: 20px; margin-bottom: 28px;">
            
            <!-- 1. Total Batches Card -->
            <div class="stat-card dashboard-card" style="padding: 22px; border-radius: 18px; display: flex; align-items: center; justify-content: space-between; box-shadow: var(--shadow);">
                <div>
                    <div class="num" style="font-size: 32px; font-weight: 800; color: var(--text); line-height: 1.1;">
                        ${fn:length(batches)}
                    </div>
                    <div class="label" style="font-size: 13.5px; color: var(--text-muted); font-weight: 600; margin-top: 4px;">
                        Total Batches
                    </div>
                </div>
                <div style="width: 48px; height: 48px; border-radius: 14px; background: rgba(59, 130, 246, 0.12); color: #3b82f6; display: flex; align-items: center; justify-content: center; font-size: 22px;">
                    <i class="fas fa-cubes"></i>
                </div>
            </div>

            <!-- 2. Total Students Card -->
            <div class="stat-card dashboard-card" style="padding: 22px; border-radius: 18px; display: flex; align-items: center; justify-content: space-between; box-shadow: var(--shadow);">
                <div>
                    <div class="num" style="font-size: 32px; font-weight: 800; color: var(--text); line-height: 1.1;">
                        ${fn:length(students)}
                    </div>
                    <div class="label" style="font-size: 13.5px; color: var(--text-muted); font-weight: 600; margin-top: 4px;">
                        Enrolled Students
                    </div>
                </div>
                <div style="width: 48px; height: 48px; border-radius: 14px; background: rgba(16, 185, 129, 0.12); color: #10b981; display: flex; align-items: center; justify-content: center; font-size: 22px;">
                    <i class="fas fa-user-graduate"></i>
                </div>
            </div>

            <!-- 3. Total Trainers Card -->
            <div class="stat-card dashboard-card" style="padding: 22px; border-radius: 18px; display: flex; align-items: center; justify-content: space-between; box-shadow: var(--shadow);">
                <div>
                    <div class="num" style="font-size: 32px; font-weight: 800; color: var(--text); line-height: 1.1;">
                        ${fn:length(trainers)}
                    </div>
                    <div class="label" style="font-size: 13.5px; color: var(--text-muted); font-weight: 600; margin-top: 4px;">
                        Active Trainers
                    </div>
                </div>
                <div style="width: 48px; height: 48px; border-radius: 14px; background: rgba(139, 92, 246, 0.12); color: #8b5cf6; display: flex; align-items: center; justify-content: center; font-size: 22px;">
                    <i class="fas fa-chalkboard-teacher"></i>
                </div>
            </div>

        </div>

        <!-- Batch Summary Report Card & Table -->
        <div class="dashboard-card" style="padding: 24px; border-radius: 18px; box-shadow: var(--shadow);">
            
            <div class="card-header-custom" style="margin-bottom: 18px; border-bottom: 1px solid var(--border); padding-bottom: 12px; display: flex; align-items: center; justify-content: space-between;">
                <div>
                    <h6 style="margin: 0; font-size: 16px; color: var(--text); font-weight: 700;">
                        <i class="fas fa-table-list" style="color: var(--primary); margin-right: 6px;"></i> Batch-wise Summary Report
                    </h6>
                    <small style="color: var(--text-muted); font-size: 12.5px;">Live student enrolment distribution across batches</small>
                </div>
                <span class="badge" style="background: var(--bg); color: var(--text); border: 1px solid var(--border); font-size: 12px;">
                    ${fn:length(batches)} Active Batches
                </span>
            </div>

            <div class="table-wrapper">
                <table>
                    <thead>
                        <tr>
                            <th><i class="fas fa-tag" style="color: var(--primary); margin-right: 6px;"></i> Batch Name</th>
                            <th><i class="fas fa-book" style="color: var(--primary); margin-right: 6px;"></i> Course Track</th>
                            <th><i class="fas fa-user-tie" style="color: var(--primary); margin-right: 6px;"></i> Lead Instructor</th>
                            <th style="text-align: center;"><i class="fas fa-users" style="color: var(--primary); margin-right: 6px;"></i> Strength</th>
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
                                            <span style="color: var(--text-muted); font-weight: 500;">${b.courseName}</span>
                                        </td>
                                        <td>
                                            <c:choose>
                                                <c:when test="${b.trainer != null}">
                                                    <span style="color: var(--text); font-weight: 600;">${b.trainer.fullName}</span>
                                                </c:when>
                                                <c:otherwise>
                                                    <span class="badge badge-pending" style="font-size: 11.5px;">Not Assigned</span>
                                                </c:otherwise>
                                            </c:choose>
                                        </td>
                                        <td style="text-align: center;">
                                            <span class="badge badge-approved" style="font-size: 12.5px; font-weight: 700; padding: 5px 12px;">
                                                ${fn:length(b.students)} Students
                                            </span>
                                        </td>
                                    </tr>
                                </c:forEach>
                            </c:when>
                            <c:otherwise>
                                <tr>
                                    <td colspan="4" style="text-align: center; padding: 24px; color: var(--text-muted);">
                                        <i class="fas fa-info-circle" style="margin-right: 6px;"></i> No batch report data found.
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