<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Mark Attendance - EduManage</title>
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
                    <h2><i class="fas fa-calendar-check" style="color: var(--primary);"></i> Mark Batch Attendance</h2>
                    <span style="color: var(--text-muted); font-size: 13.5px;">Record daily attendance status for cohort <strong>${batch.batchName}</strong> (${batch.courseName}).</span>
                </div>
                
                <a href="${pageContext.request.contextPath}/trainer/dashboard" style="text-decoration: none;">
                    <button type="button" class="mini-btn" style="padding: 10px 18px; font-size: 13px;">
                        <i class="fas fa-arrow-left"></i> Back to Dashboard
                    </button>
                </a>
            </div>

            <!-- Attendance Form Container -->
            <div class="dashboard-card" style="padding: 26px; border-radius: 18px; box-shadow: var(--shadow);">
                
                <c:choose>
                    <c:when test="${not empty batch.students}">
                        <form action="${pageContext.request.contextPath}/trainer/batch/${batch.id}/attendance" method="post">
                            
                            <!-- Date Selection Header Strip -->
                            <div style="display: flex; justify-content: space-between; align-items: center; flex-wrap: wrap; gap: 16px; margin-bottom: 20px; padding-bottom: 16px; border-bottom: 1px solid var(--border);">
                                <div style="display: flex; align-items: center; gap: 10px;">
                                    <label style="font-size: 14px; font-weight: 700; color: var(--text); margin: 0; display: flex; align-items: center; gap: 6px;">
                                        <i class="far fa-calendar-alt" style="color: var(--primary);"></i> Attendance Date:
                                    </label>
                                    <input type="date" name="date" value="${today}" required style="padding: 9px 14px; border: 1px solid var(--border); border-radius: 10px; background: var(--surface-alt); color: var(--text); font-size: 13.5px; outline: none;">
                                </div>

                                <span class="badge badge-approved" style="font-size: 12px; font-weight: 600;">
                                    ${fn:length(batch.students)} Enrolled Students
                                </span>
                            </div>

                            <!-- Students Table -->
                            <div class="table-wrapper">
                                <table>
                                    <thead>
                                        <tr>
                                            <th style="width: 70px; text-align: center;">#</th>
                                            <th><i class="fas fa-user-graduate" style="color: var(--primary); margin-right: 6px;"></i> Student Name</th>
                                            <th><i class="fas fa-envelope" style="color: var(--primary); margin-right: 6px;"></i> Email Address</th>
                                            <th style="width: 220px; text-align: center;"><i class="fas fa-fingerprint" style="color: var(--primary); margin-right: 6px;"></i> Attendance Status</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <c:forEach var="s" items="${batch.students}" varStatus="status">
                                            <tr>
                                                <td style="text-align: center; color: var(--text-muted); font-weight: 600;">
                                                    ${status.count}
                                                </td>
                                                <td>
                                                    <strong style="color: var(--text); font-size: 14px;">${s.fullName}</strong>
                                                    <span style="display: block; font-size: 11.5px; color: var(--primary); font-family: monospace;">@${s.username}</span>
                                                </td>
                                                <td>
                                                    <span style="color: var(--text-muted); font-size: 13px;">${s.email != null ? s.email : '-'}</span>
                                                </td>
                                                <td style="text-align: center;">
                                                    <select name="status_${s.id}" style="padding: 8px 12px; border: 1px solid var(--border); border-radius: 8px; background: var(--surface-alt); color: var(--text); font-size: 13px; font-weight: 600; outline: none; width: 100%; max-width: 170px;">
                                                        <option value="PRESENT" style="color: #10b981; font-weight: 700;">Present</option>
                                                        <option value="ABSENT" style="color: #ef4444; font-weight: 700;">Absent</option>
                                                        <option value="LATE" style="color: #f59e0b; font-weight: 700;">Late</option>
                                                    </select>
                                                </td>
                                            </tr>
                                        </c:forEach>
                                    </tbody>
                                </table>
                            </div>

                            <!-- Form Submit Button -->
                            <div style="margin-top: 24px; display: flex; justify-content: flex-end;">
                                <button type="submit" class="btn-primary" style="width: auto; padding: 12px 28px; font-size: 14px; border-radius: 10px; display: inline-flex; align-items: center; gap: 8px;">
                                    <i class="fas fa-save"></i> Save Attendance Records
                                </button>
                            </div>

                        </form>
                    </c:when>
                    <c:otherwise>
                        <div style="text-align: center; padding: 36px; color: var(--text-muted);">
                            <i class="fas fa-users-slash" style="font-size: 28px; color: var(--primary); margin-bottom: 10px; display: block;"></i>
                            <strong>No Students Enrolled</strong>
                            <p style="margin: 4px 0 0; font-size: 13px;">There are no students assigned to this cohort yet.</p>
                        </div>
                    </c:otherwise>
                </c:choose>

            </div>
        </div>

     

    </main>
</div>

</body>
</html>