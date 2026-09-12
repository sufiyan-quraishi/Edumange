<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Inquiries Management - EduManage</title>
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
                <h2><i class="fas fa-envelope-open-text" style="color: var(--primary);"></i> Student Inquiries & Leads</h2>
                <span style="color: var(--text-muted); font-size: 13.5px;">Monitor prospect queries, track communication status, and manage conversions.</span>
            </div>
            <a href="${pageContext.request.contextPath}/admin/dashboard" style="text-decoration: none;">
                <button type="button" class="mini-btn" style="padding: 10px 18px; font-size: 13.5px;">
                    <i class="fas fa-arrow-left"></i> Back to Dashboard
                </button>
            </a>
        </div>

        <!-- Success/Info Flash Alert Message -->
        <c:if test="${not empty message}">
            <div style="background: rgba(16, 185, 129, 0.12); border: 1px solid rgba(16, 185, 129, 0.35); color: #10b981; padding: 13px 18px; border-radius: 12px; margin-bottom: 20px; display: flex; align-items: center; gap: 10px; font-size: 14px; font-weight: 600;">
                <i class="fas fa-check-circle" style="font-size: 16px;"></i>
                <span>${message}</span>
            </div>
        </c:if>

        <!-- Inquiries Table Card -->
        <div class="dashboard-card" style="padding: 24px; border-radius: 18px; box-shadow: var(--shadow);">
            
            <div class="card-header-custom" style="margin-bottom: 18px; border-bottom: 1px solid var(--border); padding-bottom: 12px;">
                <h6 style="margin: 0; font-size: 16px; color: var(--text);">
                    <i class="fas fa-list-alt" style="color: var(--primary); margin-right: 6px;"></i> All Inquiries List
                </h6>
                <span style="font-size: 12.5px; color: var(--text-muted);">Total: ${fn:length(inquiries)} Leads</span>
            </div>

            <div class="table-wrapper">
                <table>
                    <thead>
                        <tr>
                            <th><i class="fas fa-user" style="color: var(--primary); margin-right: 6px;"></i> Prospect Name</th>
                            <th><i class="fas fa-address-book" style="color: var(--primary); margin-right: 6px;"></i> Contact Info</th>
                            <th><i class="fas fa-graduation-cap" style="color: var(--primary); margin-right: 6px;"></i> Course Interested</th>
                            <th style="text-align: center;"><i class="fas fa-info-circle" style="color: var(--primary); margin-right: 6px;"></i> Current Status</th>
                            <th style="text-align: center;"><i class="fas fa-tasks" style="color: var(--primary); margin-right: 6px;"></i> Update Status</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:choose>
                            <c:when test="${not empty inquiries}">
                                <c:forEach var="inq" items="${inquiries}">
                                    <tr>
                                        <td>
                                            <strong style="color: var(--text); font-size: 14px;">${inq.name}</strong>
                                        </td>
                                        <td>
                                            <div style="display: flex; flex-direction: column; gap: 3px;">
                                                <span style="font-size: 13px; color: var(--text);"><i class="fas fa-phone-alt" style="width: 14px; color: var(--text-muted); font-size: 11px;"></i> ${inq.phone != null ? inq.phone : 'N/A'}</span>
                                                <small style="color: var(--text-muted);"><i class="fas fa-envelope" style="width: 14px; font-size: 11px;"></i> ${inq.email != null ? inq.email : 'N/A'}</small>
                                            </div>
                                        </td>
                                        <td>
                                            <span style="font-weight: 600; color: var(--primary); font-size: 13.5px;">
                                                ${inq.courseInterested != null ? inq.courseInterested : 'General Inquiry'}
                                            </span>
                                        </td>
                                        <td style="text-align: center;">
                                            <c:choose>
                                                <c:when test="${inq.status == 'NEW'}">
                                                    <span class="badge badge-pending" style="background: rgba(59, 130, 246, 0.12); color: #3b82f6; border-color: rgba(59, 130, 246, 0.25);">New</span>
                                                </c:when>
                                                <c:when test="${inq.status == 'FOLLOWED_UP'}">
                                                    <span class="badge badge-pending" style="background: rgba(249, 115, 22, 0.12); color: #f97316; border-color: rgba(249, 115, 22, 0.25);">Followed Up</span>
                                                </c:when>
                                                <c:when test="${inq.status == 'CONVERTED'}">
                                                    <span class="badge badge-approved" style="background: rgba(16, 185, 129, 0.12); color: #10b981; border-color: rgba(16, 185, 129, 0.25);">Converted</span>
                                                </c:when>
                                                <c:otherwise>
                                                    <span class="badge" style="background: rgba(100, 116, 139, 0.12); color: #64748b; border: 1px solid rgba(100, 116, 139, 0.25);">Closed</span>
                                                </c:otherwise>
                                            </c:choose>
                                        </td>
                                        <td style="text-align: center;">
                                            <form action="${pageContext.request.contextPath}/admin/inquiries/${inq.id}/status" method="post" style="display: inline-flex; align-items: center; gap: 8px; margin: 0;">
                                                <select name="status" style="padding: 7px 10px; border-radius: 8px; border: 1px solid var(--border); background: var(--surface); color: var(--text); font-size: 12.5px; font-weight: 500;">
                                                    <option value="NEW" ${inq.status == 'NEW' ? 'selected' : ''}>New</option>
                                                    <option value="FOLLOWED_UP" ${inq.status == 'FOLLOWED_UP' ? 'selected' : ''}>Followed Up</option>
                                                    <option value="CONVERTED" ${inq.status == 'CONVERTED' ? 'selected' : ''}>Converted</option>
                                                    <option value="CLOSED" ${inq.status == 'CLOSED' ? 'selected' : ''}>Closed</option>
                                                </select>
                                                <button class="mini-btn" type="submit" style="padding: 7px 12px; font-size: 12.5px; display: inline-flex; align-items: center; gap: 4px;">
                                                    <i class="fas fa-check"></i> Update
                                                </button>
                                            </form>
                                        </td>
                                    </tr>
                                </c:forEach>
                            </c:when>
                            <c:otherwise>
                                <tr>
                                    <td colspan="5" style="text-align: center; padding: 24px; color: var(--text-muted);">
                                        <i class="fas fa-inbox" style="margin-right: 6px;"></i> No inquiries found in the records.
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