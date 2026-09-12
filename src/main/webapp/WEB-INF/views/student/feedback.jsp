<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>My Feedback - EduManage</title>
    <!-- FontAwesome Icons -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css">
    <!-- Project Stylesheet -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
</head>
<body style="min-height: 100vh; display: flex; flex-direction: column; margin: 0;">

<div class="dashboard-layout" style="flex: 1; display: flex; min-height: 100vh;">
    <!-- Student Sidebar Navigation -->
    <jsp:include page="/WEB-INF/views/common/student-sidebar.jsp" />

    <!-- Main Content Area -->
    <main class="main-content" style="flex: 1; display: flex; flex-direction: column; justify-content: space-between; padding: 30px; box-sizing: border-box;">
        
        <div>
            <!-- Header Bar -->
            <div class="header-bar" style="margin-bottom: 24px;">
                <div>
                    <h2><i class="fas fa-comment-dots" style="color: var(--primary);"></i> Trainer Feedback & Reviews</h2>
                    <span style="color: var(--text-muted); font-size: 13.5px;">View assessment grades, evaluation scores, and faculty review remarks on your submissions.</span>
                </div>
                <a href="${pageContext.request.contextPath}/student/dashboard" style="text-decoration: none;">
                    <button type="button" class="mini-btn" style="padding: 10px 18px; font-size: 13px;">
                        <i class="fas fa-arrow-left"></i> Back to Dashboard
                    </button>
                </a>
            </div>

            <!-- Feedback Table Card -->
            <div class="dashboard-card" style="padding: 24px; border-radius: 18px; box-shadow: var(--shadow);">
                
                <div class="card-header-custom" style="margin-bottom: 18px; border-bottom: 1px solid var(--border); padding-bottom: 12px; display: flex; align-items: center; justify-content: space-between;">
                    <div>
                        <h6 style="margin: 0; font-size: 16px; color: var(--text); font-weight: 700;">
                            <i class="fas fa-clipboard-check" style="color: var(--primary); margin-right: 6px;"></i> Submission Evaluations
                        </h6>
                        <small style="color: var(--text-muted); font-size: 12.5px;">Tasks reviewed by batch instructors</small>
                    </div>
                    <span class="badge badge-approved" style="font-size: 12px; font-weight: 600;">
                        ${fn:length(submissions)} Total Submissions
                    </span>
                </div>

                <div class="table-wrapper">
                    <table>
                        <thead>
                            <tr>
                                <th><i class="fas fa-file-alt" style="color: var(--primary); margin-right: 6px;"></i> Task Title</th>
                                <th style="width: 140px; text-align: center;"><i class="fas fa-star" style="color: #f59e0b; margin-right: 6px;"></i> Score / Marks</th>
                                <th><i class="fas fa-comments" style="color: var(--primary); margin-right: 6px;"></i> Faculty Feedback</th>
                                <th style="text-align: center; width: 160px;"><i class="fas fa-shield-alt" style="color: var(--primary); margin-right: 6px;"></i> Status</th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:choose>
                                <c:when test="${not empty submissions}">
                                    <c:forEach var="s" items="${submissions}">
                                        <tr>
                                            <td>
                                                <strong style="color: var(--text); font-size: 14px;">
                                                    ${s.task != null ? s.task.title : 'General Assignment'}
                                                </strong>
                                                <c:if test="${s.task != null && s.task.batch != null}">
                                                    <span style="display: block; font-size: 11.5px; color: var(--text-muted); margin-top: 2px;">
                                                        <i class="fas fa-layer-group"></i> ${s.task.batch.batchName}
                                                    </span>
                                                </c:if>
                                            </td>
                                            <td style="text-align: center;">
                                                <c:choose>
                                                    <c:when test="${s.marks != null}">
                                                        <span class="badge" style="background: rgba(79, 110, 247, 0.12); color: var(--primary); font-size: 13px; font-weight: 800; padding: 4px 10px;">
                                                            ${s.marks} / 100
                                                        </span>
                                                    </c:when>
                                                    <c:otherwise>
                                                        <span style="color: var(--text-muted); font-size: 13px; font-weight: 600;">-</span>
                                                    </c:otherwise>
                                                </c:choose>
                                            </td>
                                            <td>
                                                <c:choose>
                                                    <c:when test="${not empty s.feedback}">
                                                        <span style="color: var(--text); font-size: 13.5px; line-height: 1.4;">
                                                            <i class="fas fa-quote-left" style="color: var(--primary); font-size: 10px; margin-right: 4px;"></i>
                                                            ${s.feedback}
                                                        </span>
                                                    </c:when>
                                                    <c:otherwise>
                                                        <span style="color: var(--text-muted); font-style: italic; font-size: 13px;">
                                                            <i class="far fa-clock" style="margin-right: 4px;"></i> Awaiting review from instructor
                                                        </span>
                                                    </c:otherwise>
                                                </c:choose>
                                            </td>
                                            <td style="text-align: center;">
                                                <c:choose>
                                                    <c:when test="${s.status == 'GRADED' || s.status == 'APPROVED' || s.status == 'Graded'}">
                                                        <span class="badge badge-approved" style="font-size: 12px;">
                                                            <i class="fas fa-check-circle" style="margin-right: 4px;"></i> Reviewed
                                                        </span>
                                                    </c:when>
                                                    <c:when test="${s.status == 'REJECTED' || s.status == 'Rejected'}">
                                                        <span class="badge badge-rejected" style="font-size: 12px;">
                                                            <i class="fas fa-times-circle" style="margin-right: 4px;"></i> Rejected
                                                        </span>
                                                    </c:when>
                                                    <c:otherwise>
                                                        <span class="badge badge-pending" style="font-size: 12px;">
                                                            <i class="fas fa-hourglass-half" style="margin-right: 4px;"></i> ${s.status != null ? s.status : 'Pending'}
                                                        </span>
                                                    </c:otherwise>
                                                </c:choose>
                                            </td>
                                        </tr>
                                    </c:forEach>
                                </c:when>
                                <c:otherwise>
                                    <tr>
                                        <td colspan="4" style="text-align: center; padding: 32px; color: var(--text-muted);">
                                            <i class="fas fa-comment-slash" style="font-size: 22px; color: var(--primary); margin-bottom: 8px; display: block;"></i>
                                            <strong>No Feedback Available</strong>
                                            <p style="margin: 4px 0 0; font-size: 13px;">You haven't submitted any tasks or assignments for review yet.</p>
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