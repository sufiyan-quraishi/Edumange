<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Registration Submitted | EduManage</title>
    <!-- FontAwesome Vector Icons -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css">
    <!-- Existing Project Stylesheet -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
</head>
<body style="min-height: 100vh; display: flex; flex-direction: column; margin: 0; background: var(--bg);">

<!-- 1. NAVIGATION -->
<jsp:include page="common/navbar.jsp" />

<!-- 2. SUCCESS CONFIRMATION CONTAINER -->
<main style="flex: 1; display: flex; align-items: center; justify-content: center; padding: 60px 20px;">
    <div class="dashboard-card" style="max-width: 540px; width: 100%; padding: 45px 36px; border-radius: 24px; text-align: center; box-shadow: var(--shadow-xl); box-sizing: border-box;">
        
        <!-- Animated Success Icon Badge -->
        <div style="width: 70px; height: 70px; border-radius: 50%; background: rgba(16, 185, 129, 0.12); color: #10b981; display: flex; align-items: center; justify-content: center; font-size: 32px; margin: 0 auto 20px;">
            <i class="fas fa-circle-check"></i>
        </div>

        <h2 style="font-size: 24px; font-weight: 800; color: var(--text); margin: 0 0 10px;">
            Registration Received!
        </h2>
        
        <p style="color: var(--text-muted); font-size: 14.5px; line-height: 1.6; margin: 0 0 22px;">
            Thank you, <strong style="color: var(--text);">${registration.fullName}</strong>. Your enrollment request for <strong style="color: var(--primary);">${registration.courseApplied}</strong> has been successfully recorded.
        </p>

        <!-- Status Summary Strip -->
        <div style="background: var(--surface-alt); border: 1px solid var(--border); border-radius: 14px; padding: 14px 18px; margin-bottom: 22px; display: flex; align-items: center; justify-content: space-between;">
            <span style="font-size: 13.5px; font-weight: 600; color: var(--text-muted);">
                <i class="fas fa-clipboard-list" style="margin-right: 6px; color: var(--primary);"></i> Application Status:
            </span>
            <span class="badge badge-pending" style="font-size: 12px; font-weight: 800; padding: 5px 12px; border-radius: 20px;">
                PENDING REVIEW
            </span>
        </div>

        <!-- Information Note -->
        <div style="text-align: left; background: rgba(79, 110, 247, 0.06); border-left: 4px solid var(--primary); border-radius: 10px; padding: 12px 16px; margin-bottom: 28px; font-size: 13px; color: var(--text-muted); line-height: 1.55;">
            <p style="margin: 0;">
                <strong style="color: var(--text);">What happens next?</strong><br>
                Our administration team will review your application. Once verified and approved, your login credentials will be delivered to your registered email and phone.
            </p>
        </div>

        <!-- Action Links -->
        <div style="display: flex; justify-content: center; gap: 12px; flex-wrap: wrap;">
            <a href="${pageContext.request.contextPath}/" class="btn-primary" style="display: inline-flex; align-items: center; gap: 8px; width: auto; padding: 11px 24px; text-decoration: none; font-size: 13.5px; border-radius: 10px;">
                <i class="fas fa-home"></i> Back to Home
            </a>
            <a href="${pageContext.request.contextPath}/courses" class="btn-secondary" style="display: inline-flex; align-items: center; gap: 8px; width: auto; padding: 11px 22px; text-decoration: none; font-size: 13.5px; border-radius: 10px;">
                <i class="fas fa-layer-group"></i> Browse Courses
            </a>
        </div>

    </div>
</main>

<!-- 3. COMMON FOOTER -->
<jsp:include page="common/admin-footer.jsp" />

</body>
</html>