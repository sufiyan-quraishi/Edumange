<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Batches Management - EduManage</title>
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
                <h2><i class="fas fa-cubes" style="color: var(--primary);"></i> Batch Scheduling & Management</h2>
                <span style="color: var(--text-muted); font-size: 13.5px;">Create active course cohorts, set timelines, assign faculty, and track student strength.</span>
            </div>
            <a href="${pageContext.request.contextPath}/admin/dashboard" style="text-decoration: none;">
                <button type="button" class="mini-btn" style="padding: 10px 18px; font-size: 13.5px;">
                    <i class="fas fa-arrow-left"></i> Back to Dashboard
                </button>
            </a>
        </div>

        <!-- 2-Column Responsive Layout: Create Form (Left) + Live Batches Table (Right) -->
        <div style="display: grid; grid-template-columns: 380px 1fr; gap: 24px; align-items: start;">
            
            <!-- 1. Create Batch Form Card -->
            <div class="dashboard-card" style="padding: 24px; border-radius: 18px; box-shadow: var(--shadow);">
                <div class="card-header-custom" style="margin-bottom: 18px; border-bottom: 1px solid var(--border); padding-bottom: 12px;">
                    <h6 style="margin: 0; font-size: 16px; color: var(--text);">
                        <i class="fas fa-calendar-plus" style="color: var(--primary); margin-right: 6px;"></i> Create New Batch
                    </h6>
                    <span style="font-size: 12px; color: var(--text-muted);">New Cohort</span>
                </div>

                <form action="${pageContext.request.contextPath}/admin/batches" method="post">
                    
                    <div class="form-group" style="margin-bottom: 14px;">
                        <label style="display: block; font-weight: 600; font-size: 13px; color: var(--text); margin-bottom: 6px;">
                            <i class="fas fa-tag" style="color: var(--primary); width: 16px;"></i> Batch Title <span style="color: #ef4444;">*</span>
                        </label>
                        <input type="text" name="batchName" placeholder="e.g. Java Full Stack - Morning" required style="width: 100%; box-sizing: border-box;">
                    </div>

                    <div class="form-group" style="margin-bottom: 14px;">
                        <label style="display: block; font-weight: 600; font-size: 13px; color: var(--text); margin-bottom: 6px;">
                            <i class="fas fa-book" style="color: var(--primary); width: 16px;"></i> Course Name <span style="color: #ef4444;">*</span>
                        </label>
                        <input type="text" name="courseName" placeholder="e.g. Full Stack Web Dev" required style="width: 100%; box-sizing: border-box;">
                    </div>

                    <div style="display: grid; grid-template-columns: 1fr 1fr; gap: 12px; margin-bottom: 14px;">
                        <div class="form-group" style="margin-bottom: 0;">
                            <label style="display: block; font-weight: 600; font-size: 13px; color: var(--text); margin-bottom: 6px;">
                                <i class="fas fa-calendar-alt" style="color: var(--primary); width: 16px;"></i> Start Date
                            </label>
                            <input type="date" name="startDate" style="width: 100%; box-sizing: border-box;">
                        </div>

                        <div class="form-group" style="margin-bottom: 0;">
                            <label style="display: block; font-weight: 600; font-size: 13px; color: var(--text); margin-bottom: 6px;">
                                <i class="fas fa-calendar-check" style="color: var(--primary); width: 16px;"></i> End Date
                            </label>
                            <input type="date" name="endDate" style="width: 100%; box-sizing: border-box;">
                        </div>
                    </div>

                    <div class="form-group" style="margin-bottom: 20px;">
                        <label style="display: block; font-weight: 600; font-size: 13px; color: var(--text); margin-bottom: 6px;">
                            <i class="fas fa-chalkboard-teacher" style="color: var(--primary); width: 16px;"></i> Assign Trainer
                        </label>
                        <select name="trainerId" style="width: 100%; box-sizing: border-box; padding: 10px 12px; border-radius: 10px; border: 1px solid var(--border); background: var(--surface); color: var(--text); font-size: 13.5px;">
                            <option value="">-- Not Assigned --</option>
                            <c:forEach var="t" items="${trainers}">
                                <option value="${t.id}">${t.fullName} (@${t.username})</option>
                            </c:forEach>
                        </select>
                    </div>

                    <button type="submit" class="btn-primary" style="width: 100%; padding: 12px; font-size: 14.5px; font-weight: 700; border-radius: 10px; display: flex; align-items: center; justify-content: center; gap: 8px;">
                        <i class="fas fa-plus-circle"></i> Create Batch
                    </button>
                </form>
            </div>

            <!-- 2. Batches List Table Card -->
            <div class="dashboard-card" style="padding: 24px; border-radius: 18px; box-shadow: var(--shadow);">
                <div class="card-header-custom" style="margin-bottom: 18px; border-bottom: 1px solid var(--border); padding-bottom: 12px;">
                    <h6 style="margin: 0; font-size: 16px; color: var(--text);">
                        <i class="fas fa-layer-group" style="color: var(--primary); margin-right: 6px;"></i> Existing Batches Roster
                    </h6>
                    <span style="font-size: 12.5px; color: var(--text-muted);">Total: ${fn:length(batches)} Batches</span>
                </div>

                <div class="table-wrapper">
                    <table>
                        <thead>
                            <tr>
                                <th>Batch Title</th>
                                <th>Course</th>
                                <th>Faculty / Trainer</th>
                                <th style="text-align: center;">Students</th>
                                <th style="text-align: center;">Actions</th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:choose>
                                <c:when test="${not empty batches}">
                                    <c:forEach var="b" items="${batches}">
                                        <tr>
                                            <td>
                                                <strong style="color: var(--text);">${b.batchName}</strong>
                                            </td>
                                            <td>
                                                <span style="color: var(--text-muted); font-weight: 500;">${b.courseName}</span>
                                            </td>
                                            <td>
                                                <c:choose>
                                                    <c:when test="${b.trainer != null}">
                                                        <div style="display: flex; flex-direction: column;">
                                                            <strong>${b.trainer.fullName}</strong>
                                                            <small style="color: var(--text-muted);">@${b.trainer.username}</small>
                                                        </div>
                                                    </c:when>
                                                    <c:otherwise>
                                                        <span class="badge badge-pending">Not Assigned</span>
                                                    </c:otherwise>
                                                </c:choose>
                                            </td>
                                            <td style="text-align: center;">
                                                <span class="badge badge-approved" style="font-size: 12px;">
                                                    <i class="fas fa-user-graduate" style="margin-right: 4px;"></i> ${fn:length(b.students)}
                                                </span>
                                            </td>
                                            <td style="text-align: center;">
                                                <a href="${pageContext.request.contextPath}/admin/batches/${b.id}/assign" class="mini-btn" style="display: inline-flex; align-items: center; gap: 6px; padding: 7px 14px;">
                                                    <i class="fas fa-users-cog"></i> Assign
                                                </a>
                                            </td>
                                        </tr>
                                    </c:forEach>
                                </c:when>
                                <c:otherwise>
                                    <tr>
                                        <td colspan="5" style="text-align: center; padding: 24px; color: var(--text-muted);">
                                            <i class="fas fa-info-circle" style="margin-right: 6px;"></i> No batches scheduled yet. Create one using the form on the left.
                                        </td>
                                    </tr>
                                </c:otherwise>
                            </c:choose>
                        </tbody>
                    </table>
                </div>
            </div>

        </div>

    </main>
</div>


</body>
</html>