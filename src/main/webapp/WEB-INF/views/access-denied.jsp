<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>403 - Access Denied | EduManage</title>
    <!-- FontAwesome Vector Icons -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css">
    <!-- Project Stylesheet -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
</head>
<body style="min-height: 100vh; display: flex; flex-direction: column; margin: 0; background: var(--bg);">

<!-- 1. NAVBAR -->
<jsp:include page="common/navbar.jsp" />

<!-- 2. ACCESS DENIED MAIN SECTION -->
<main style="flex: 1; display: flex; align-items: center; justify-content: center; padding: 60px 20px;">
    
    <div class="dashboard-card" style="max-width: 520px; width: 100%; text-align: center; padding: 45px 35px; border-radius: 24px; box-shadow: var(--shadow-xl);">
        
        <!-- Icon Badge -->
        <div style="width: 72px; height: 72px; border-radius: 20px; background: rgba(239, 68, 68, 0.12); color: var(--danger); display: flex; align-items: center; justify-content: center; font-size: 32px; margin: 0 auto 20px;">
            <i class="fas fa-shield-halved"></i>
        </div>

        <!-- Error Badge -->
        <span class="badge" style="background: rgba(239, 68, 68, 0.12); color: var(--danger); font-weight: 800; font-size: 12px; padding: 5px 14px; margin-bottom: 12px; display: inline-block;">
            HTTP 403 ERROR
        </span>

        <!-- Title & Subtitle -->
        <h2 style="font-size: 24px; font-weight: 800; color: var(--text); margin: 0 0 10px;">
            Access Denied
        </h2>
        
        <p style="color: var(--text-muted); font-size: 14.5px; line-height: 1.6; margin: 0 auto 26px; max-width: 400px;">
            You do not have permission to view this resource. Please sign in with an authorized account or return to the dashboard.
        </p>

        <!-- Actions -->
        <div style="display: flex; align-items: center; justify-content: center; gap: 12px; flex-wrap: wrap;">
            <a href="${pageContext.request.contextPath}/login" class="btn-primary" style="display: inline-flex; align-items: center; gap: 8px; width: auto; padding: 10px 22px; text-decoration: none; font-size: 13.5px;">
                <i class="fas fa-sign-in-alt"></i>
                <span>Switch Account</span>
            </a>
            
            <a href="javascript:history.back()" class="btn-secondary" style="display: inline-flex; align-items: center; gap: 8px; width: auto; padding: 10px 20px; text-decoration: none; font-size: 13.5px;">
                <i class="fas fa-arrow-left"></i>
                <span>Go Back</span>
            </a>
        </div>

    </div>

</main>

<!-- 3. COMMON FOOTER -->
<jsp:include page="common/admin-footer.jsp" />

</body>
</html>