<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Students Roster - EduManage</title>
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
                    <h2><i class="fas fa-user-graduate" style="color: var(--primary);"></i> Students in ${batch.batchName}</h2>
                    <span style="color: var(--text-muted); font-size: 13.5px;">Active student cohort enrolled under <strong>${batch.courseName}</strong> track.</span>
                </div>
                
                <a href="${pageContext.request.contextPath}/trainer/dashboard" style="text-decoration: none;">
                    <button type="button" class="mini-btn" style="padding: 10px 18px; font-size: 13px;">
                        <i class="fas fa-arrow-left"></i> Back to Dashboard
                    </button>
                </a>
            </div>

            <!-- Students List Card -->
            <div class="dashboard-card" style="padding: 26px; border-radius: 18px; box-shadow: var(--shadow);">
                
                <div class="card-header-custom" style="margin-bottom: 18px; border-bottom: 1px solid var(--border); padding-bottom: 12px; display: flex; align-items: center; justify-content: space-between;">
                    <div>
                        <h6 style="margin: 0; font-size: 16px; color: var(--text); font-weight: 700;">
                            <i class="fas fa-users" style="color: var(--primary); margin-right: 6px;"></i> Batch Student Directory
                        </h6>
                        <small style="color: var(--text-muted); font-size: 12.5px;">Contact and identity details of linked students</small>
                    </div>
                    <span class="badge badge-approved" style="font-size: 12px; font-weight: 600;">
                        ${fn:length(students)} Enrolled
                    </span>
                </div>

                <div class="table-wrapper">
                    <table>
                        <thead>
                            <tr>
                                <th style="width: 70px; text-align: center;">#</th>
                                <th><i class="fas fa-user" style="color: var(--primary); margin-right: 6px;"></i> Student Name</th>
                                <th><i class="fas fa-user-tag" style="color: var(--primary); margin-right: 6px;"></i> Username</th>
                                <th><i class="fas fa-envelope" style="color: var(--primary); margin-right: 6px;"></i> Email Address</th>
                                <th><i class="fas fa-phone-alt" style="color: var(--primary); margin-right: 6px;"></i> Phone Number</th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:choose>
                                <c:when test="${not empty students}">
                                    <c:forEach var="s" items="${students}" varStatus="status">
                                        <tr>
                                            <td style="text-align: center; color: var(--text-muted); font-weight: 600;">
                                                ${status.count}
                                            </td>
                                            <td>
                                                <strong style="color: var(--text); font-size: 14px;">${s.fullName}</strong>
                                            </td>
                                            <td>
                                                <span class="badge" style="background: rgba(79, 110, 247, 0.1); color: var(--primary); font-family: monospace; font-size: 12.5px; font-weight: 700;">
                                                    @${s.username}
                                                </span>
                                            </td>
                                            <td>
                                                <span style="color: var(--text-muted); font-size: 13.5px;">
                                                    ${s.email != null ? s.email : '-'}
                                                </span>
                                            </td>
                                            <td>
                                                <span style="color: var(--text); font-size: 13px; font-weight: 600;">
                                                    <i class="fas fa-phone" style="color: var(--primary); font-size: 11px; margin-right: 4px;"></i>
                                                    ${s.phone != null ? s.phone : '-'}
                                                </span>
                                            </td>
                                        </tr>
                                    </c:forEach>
                                </c:when>
                                <c:otherwise>
                                    <tr>
                                        <td colspan="5" style="text-align: center; padding: 36px; color: var(--text-muted);">
                                            <i class="fas fa-user-slash" style="font-size: 28px; color: var(--primary); margin-bottom: 10px; display: block;"></i>
                                            <strong>No Students Enrolled</strong>
                                            <p style="margin: 4px 0 0; font-size: 13px;">No students have been assigned to this batch yet.</p>
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