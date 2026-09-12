<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>My Attendance - EduManage</title>
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
                <h2><i class="fas fa-calendar-check" style="color: var(--primary);"></i> My Attendance</h2>
                <span style="color: var(--text-muted); font-size: 13.5px;">Track your daily lecture presence, session dates, and batch records.</span>
            </div>
            <a href="${pageContext.request.contextPath}/student/dashboard" style="text-decoration: none;">
                <button type="button" class="mini-btn" style="padding: 10px 18px; font-size: 13.5px;">
                    <i class="fas fa-arrow-left"></i> Back to Dashboard
                </button>
            </a>
        </div>

        <!-- Attendance Table Card -->
        <div class="dashboard-card" style="padding: 24px; border-radius: 18px; box-shadow: var(--shadow);">
            
            <div class="card-header-custom" style="margin-bottom: 18px; border-bottom: 1px solid var(--border); padding-bottom: 12px; display: flex; align-items: center; justify-content: space-between;">
                <div>
                    <h6 style="margin: 0; font-size: 16px; color: var(--text); font-weight: 700;">
                        <i class="fas fa-history" style="color: var(--primary); margin-right: 6px;"></i> Session Log
                    </h6>
                    <small style="color: var(--text-muted); font-size: 12.5px;">Total attendance entries recorded</small>
                </div>
                <span class="badge" style="background: var(--bg); color: var(--text); border: 1px solid var(--border); font-size: 12px; font-weight: 600;">
                    ${fn:length(attendanceList)} Entries Logged
                </span>
            </div>

            <div class="table-wrapper">
                <table>
                    <thead>
                        <tr>
                            <th style="width: 180px;"><i class="fas fa-calendar-alt" style="color: var(--primary); margin-right: 6px;"></i> Date</th>
                            <th><i class="fas fa-layer-group" style="color: var(--primary); margin-right: 6px;"></i> Batch Title</th>
                            <th style="text-align: center; width: 160px;"><i class="fas fa-shield-alt" style="color: var(--primary); margin-right: 6px;"></i> Attendance Status</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:choose>
                            <c:when test="${not empty attendanceList}">
                                <c:forEach var="a" items="${attendanceList}">
                                    <tr>
                                        <td>
                                            <strong style="color: var(--text); font-size: 13.5px;">
                                                <i class="far fa-clock" style="color: var(--text-muted); margin-right: 4px;"></i> ${a.attendanceDate}
                                            </strong>
                                        </td>
                                        <td>
                                            <span style="color: var(--text); font-weight: 600;">
                                                ${a.batch != null ? a.batch.batchName : 'General Cohort'}
                                            </span>
                                        </td>
                                        <td style="text-align: center;">
                                            <c:choose>
                                                <c:when test="${a.status == 'PRESENT' || a.status == 'Present'}">
                                                    <span class="badge badge-approved" style="font-size: 12px;">
                                                        <i class="fas fa-check-circle" style="margin-right: 4px;"></i> Present
                                                    </span>
                                                </c:when>
                                                <c:when test="${a.status == 'ABSENT' || a.status == 'Absent'}">
                                                    <span class="badge badge-rejected" style="font-size: 12px;">
                                                        <i class="fas fa-times-circle" style="margin-right: 4px;"></i> Absent
                                                    </span>
                                                </c:when>
                                                <c:otherwise>
                                                    <span class="badge badge-pending" style="font-size: 12px;">
                                                        <i class="fas fa-info-circle" style="margin-right: 4px;"></i> ${a.status}
                                                    </span>
                                                </c:otherwise>
                                            </c:choose>
                                        </td>
                                    </tr>
                                </c:forEach>
                            </c:when>
                            <c:otherwise>
                                <tr>
                                    <td colspan="3" style="text-align: center; padding: 24px; color: var(--text-muted);">
                                        <i class="fas fa-user-clock" style="margin-right: 6px; font-size: 18px;"></i> No attendance logs recorded yet.
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