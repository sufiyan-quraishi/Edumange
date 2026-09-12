<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Student Registrations - EduManage</title>
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
                <h2><i class="fas fa-user-check" style="color: var(--primary);"></i> Student Registrations</h2>
                <span style="color: var(--text-muted); font-size: 13.5px;">Review admission applications, verify applicant details, and approve/reject credentials.</span>
            </div>
            <a href="${pageContext.request.contextPath}/admin/dashboard" style="text-decoration: none;">
                <button type="button" class="mini-btn" style="padding: 10px 18px; font-size: 13.5px;">
                    <i class="fas fa-arrow-left"></i> Back to Dashboard
                </button>
            </a>
        </div>

        <!-- Approved / Rejected Message Alert -->
        <c:if test="${not empty approvedMessage}">
            <div style="background: rgba(16, 185, 129, 0.12); border: 1px solid rgba(16, 185, 129, 0.35); color: #10b981; padding: 13px 18px; border-radius: 12px; margin-bottom: 20px; display: flex; align-items: center; gap: 10px; font-size: 14px; font-weight: 600;">
                <i class="fas fa-info-circle" style="font-size: 17px;"></i>
                <span>${approvedMessage}</span>
            </div>
        </c:if>

        <!-- Registrations Table Card -->
        <div class="dashboard-card" style="padding: 24px; border-radius: 18px; box-shadow: var(--shadow);">
            
            <div class="card-header-custom" style="margin-bottom: 18px; border-bottom: 1px solid var(--border); padding-bottom: 12px;">
                <h6 style="margin: 0; font-size: 16px; color: var(--text);">
                    <i class="fas fa-list-check" style="color: var(--primary); margin-right: 6px;"></i> Applications Queue
                </h6>
                <span style="font-size: 12.5px; color: var(--text-muted);">Total: ${fn:length(registrations)} Applications</span>
            </div>

            <div class="table-wrapper">
                <table>
                    <thead>
                        <tr>
                            <th><i class="fas fa-user" style="color: var(--primary); margin-right: 6px;"></i> Applicant Name</th>
                            <th><i class="fas fa-envelope" style="color: var(--primary); margin-right: 6px;"></i> Email Address</th>
                            <th><i class="fas fa-phone-alt" style="color: var(--primary); margin-right: 6px;"></i> Contact</th>
                            <th><i class="fas fa-graduation-cap" style="color: var(--primary); margin-right: 6px;"></i> Applied Course</th>
                            <th style="text-align: center;"><i class="fas fa-info-circle" style="color: var(--primary); margin-right: 6px;"></i> Application Status</th>
                            <th style="text-align: center;"><i class="fas fa-cog" style="color: var(--primary); margin-right: 6px;"></i> Actions</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:choose>
                            <c:when test="${not empty registrations}">
                                <c:forEach var="reg" items="${registrations}">
                                    <tr>
                                        <td>
                                            <strong style="color: var(--text);">${reg.fullName}</strong>
                                        </td>
                                        <td>
                                            <span style="color: var(--text-muted); font-size: 13.5px;">${reg.email}</span>
                                        </td>
                                        <td>
                                            <span style="color: var(--text); font-size: 13px;">${reg.phone != null ? reg.phone : '-'}</span>
                                        </td>
                                        <td>
                                            <span style="font-weight: 600; color: var(--primary); font-size: 13.5px;">
                                                ${reg.courseApplied != null ? reg.courseApplied : 'General Application'}
                                            </span>
                                        </td>
                                        <td style="text-align: center;">
                                            <c:choose>
                                                <c:when test="${reg.status == 'PENDING'}">
                                                    <span class="badge badge-pending" style="font-size: 12px;">
                                                        <i class="fas fa-clock" style="margin-right: 4px;"></i> PENDING
                                                    </span>
                                                </c:when>
                                                <c:when test="${reg.status == 'APPROVED'}">
                                                    <span class="badge badge-approved" style="font-size: 12px;">
                                                        <i class="fas fa-check-circle" style="margin-right: 4px;"></i> APPROVED
                                                    </span>
                                                </c:when>
                                                <c:otherwise>
                                                    <span class="badge badge-rejected" style="font-size: 12px;">
                                                        <i class="fas fa-times-circle" style="margin-right: 4px;"></i> REJECTED
                                                    </span>
                                                </c:otherwise>
                                            </c:choose>
                                        </td>
                                        <td style="text-align: center;">
                                            <c:if test="${reg.status == 'PENDING'}">
                                                <div style="display: inline-flex; align-items: center; gap: 8px;">
                                                    <form action="${pageContext.request.contextPath}/admin/registrations/${reg.id}/approve" method="post" style="display:inline; margin:0;">
                                                        <button class="mini-btn" type="submit" style="background: linear-gradient(135deg, #10b981, #059669); color: #fff; padding: 6px 12px; font-size: 12.5px; border-radius: 8px; display: inline-flex; align-items: center; gap: 4px; border:none; cursor:pointer;">
                                                            <i class="fas fa-check"></i> Approve
                                                        </button>
                                                    </form>
                                                    <form action="${pageContext.request.contextPath}/admin/registrations/${reg.id}/reject" method="post" style="display:inline; margin:0;">
                                                        <button class="mini-btn" type="submit" style="background: rgba(239, 68, 68, 0.12); color: #ef4444; border: 1px solid rgba(239, 68, 68, 0.3); padding: 6px 12px; font-size: 12.5px; border-radius: 8px; display: inline-flex; align-items: center; gap: 4px; cursor:pointer;">
                                                            <i class="fas fa-times"></i> Reject
                                                        </button>
                                                    </form>
                                                </div>
                                            </c:if>
                                            <c:if test="${reg.status != 'PENDING'}">
                                                <span style="color: var(--text-muted); font-size: 12px; font-style: italic;">Processed</span>
                                            </c:if>
                                        </td>
                                    </tr>
                                </c:forEach>
                            </c:when>
                            <c:otherwise>
                                <tr>
                                    <td colspan="6" style="text-align: center; padding: 24px; color: var(--text-muted);">
                                        <i class="fas fa-folder-open" style="margin-right: 6px;"></i> No registration applications found.
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