<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Attendance Overview - EduManage</title>
    <!-- FontAwesome for Vector Icons -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
</head>
<body>

<div class="dashboard-layout">
    <!-- Sidebar Include -->
    <jsp:include page="/WEB-INF/views/common/admin-sidebar.jsp" />

    <!-- Main Content Area -->
    <main class="main-content">
        
        <!-- Header Bar -->
        <div class="header-bar" style="margin-bottom: 24px;">
            <div>
                <h2><i class="fas fa-fingerprint" style="color: var(--primary);"></i> Attendance Overview</h2>
                <span style="color: var(--text-muted); font-size: 13.5px;">Select a batch to inspect daily student logs recorded by assigned instructors.</span>
            </div>
            <a href="${pageContext.request.contextPath}/admin/dashboard" style="text-decoration: none;">
                <button type="button" class="mini-btn" style="padding: 10px 18px; font-size: 13.5px;">
                    <i class="fas fa-arrow-left"></i> Back to Dashboard
                </button>
            </a>
        </div>

        <!-- Attendance Batches Card & Table -->
        <div class="dashboard-card" style="padding: 24px; border-radius: 18px; box-shadow: var(--shadow);">
            
            <div class="card-header-custom" style="margin-bottom: 18px; border-bottom: 1px solid var(--border); padding-bottom: 12px;">
                <h6 style="margin: 0; font-size: 16px; color: var(--text);">
                    <i class="fas fa-layer-group" style="color: var(--primary); margin-right: 6px;"></i> Active Course Batches
                </h6>
                <span style="font-size: 12.5px; color: var(--text-muted);">Real-time Registry</span>
            </div>

            <div class="table-wrapper">
                <table>
                    <thead>
                        <tr>
                            <th><i class="fas fa-chalkboard" style="color: var(--primary); margin-right: 6px;"></i> Batch Title</th>
                            <th><i class="fas fa-book-open" style="color: var(--primary); margin-right: 6px;"></i> Course Name</th>
                            <th><i class="fas fa-user-tie" style="color: var(--primary); margin-right: 6px;"></i> Assigned Trainer</th>
                            <th style="text-align: center;"><i class="fas fa-cog" style="color: var(--primary); margin-right: 6px;"></i> Action</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:choose>
                            <c:when test="${not empty batches}">
                                <c:forEach var="b" items="${batches}">
                                    <tr>
                                        <td>
                                            <strong>${b.batchName}</strong>
                                        </td>
                                        <td>
                                            <span style="color: var(--text-muted); font-weight: 500;">
                                                ${b.courseName != null ? b.courseName : 'General Curriculum'}
                                            </span>
                                        </td>
                                        <td>
                                            <c:choose>
                                                <c:when test="${b.trainer != null}">
                                                    <span class="badge badge-approved" style="font-size: 12.5px;">
                                                        <i class="fas fa-check-circle" style="margin-right: 4px;"></i> ${b.trainer.fullName}
                                                    </span>
                                                </c:when>
                                                <c:otherwise>
                                                    <span class="badge badge-pending" style="font-size: 12.5px;">
                                                        <i class="fas fa-exclamation-circle" style="margin-right: 4px;"></i> Not Assigned
                                                    </span>
                                                </c:otherwise>
                                            </c:choose>
                                        </td>
                                        <td style="text-align: center;">
                                            <a href="${pageContext.request.contextPath}/admin/batches/${b.id}/assign" class="mini-btn" style="display: inline-flex; align-items: center; gap: 6px; padding: 7px 14px;">
                                                <i class="fas fa-eye"></i> View / Manage
                                            </a>
                                        </td>
                                    </tr>
                                </c:forEach>
                            </c:when>
                            <c:otherwise>
                                <tr>
                                    <td colspan="4" style="text-align: center; padding: 24px; color: var(--text-muted);">
                                        <i class="fas fa-info-circle" style="margin-right: 6px;"></i> No batches available at the moment.
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