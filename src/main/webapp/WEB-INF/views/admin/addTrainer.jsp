<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Create Trainer - EduManage</title>
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
                <h2><i class="fas fa-chalkboard-teacher" style="color: var(--primary);"></i> Add New Trainer</h2>
                <span style="color: var(--text-muted); font-size: 13.5px;">Register a new faculty instructor and configure their system login.</span>
            </div>
            <a href="${pageContext.request.contextPath}/admin/trainers" style="text-decoration: none;">
                <button type="button" class="mini-btn" style="padding: 10px 18px; font-size: 13.5px;">
                    <i class="fas fa-arrow-left"></i> Back to Trainers
                </button>
            </a>
        </div>

        <!-- Centered Modern Form Card -->
        <div class="center-container" style="display: flex; justify-content: center; align-items: flex-start; padding-top: 10px;">
            <div class="form-container dashboard-card" style="width: 100%; max-width: 580px; padding: 32px; border-radius: 20px; box-shadow: var(--shadow-lg);">
                
                <div style="margin-bottom: 24px; border-bottom: 1px solid var(--border); padding-bottom: 14px;">
                    <h5 style="margin: 0 0 6px 0; font-size: 18px; color: var(--text); font-weight: 700;">
                        <i class="fas fa-id-card" style="color: var(--primary); margin-right: 6px;"></i> Trainer Credentials & Info
                    </h5>
                    <small style="color: var(--text-muted); font-size: 13px;">All fields marked with required are mandatory for account creation.</small>
                </div>

                <!-- Unchanged Form Logic & Action -->
                <form action="${pageContext.request.contextPath}/admin/trainers/add" method="post">
                    
                    <div class="form-group" style="margin-bottom: 18px;">
                        <label style="display: block; font-weight: 600; font-size: 13.5px; color: var(--text); margin-bottom: 7px;">
                            <i class="fas fa-user" style="color: var(--primary); width: 18px;"></i> Full Name <span style="color: #ef4444;">*</span>
                        </label>
                        <input type="text" name="fullName" placeholder="e.g. Amit Sharma" required style="width: 100%; box-sizing: border-box;">
                    </div>

                    <div style="display: grid; grid-template-columns: 1fr 1fr; gap: 16px; margin-bottom: 18px;">
                        <div class="form-group" style="margin-bottom: 0;">
                            <label style="display: block; font-weight: 600; font-size: 13.5px; color: var(--text); margin-bottom: 7px;">
                                <i class="fas fa-envelope" style="color: var(--primary); width: 18px;"></i> Email Address
                            </label>
                            <input type="email" name="email" placeholder="trainer@edumanage.com" style="width: 100%; box-sizing: border-box;">
                        </div>

                        <div class="form-group" style="margin-bottom: 0;">
                            <label style="display: block; font-weight: 600; font-size: 13.5px; color: var(--text); margin-bottom: 7px;">
                                <i class="fas fa-phone-alt" style="color: var(--primary); width: 18px;"></i> Contact Phone
                            </label>
                            <input type="text" name="phone" placeholder="+91 9876543210" style="width: 100%; box-sizing: border-box;">
                        </div>
                    </div>

                    <div style="display: grid; grid-template-columns: 1fr 1fr; gap: 16px; margin-bottom: 24px;">
                        <div class="form-group" style="margin-bottom: 0;">
                            <label style="display: block; font-weight: 600; font-size: 13.5px; color: var(--text); margin-bottom: 7px;">
                                <i class="fas fa-user-tag" style="color: var(--primary); width: 18px;"></i> Username <span style="color: #ef4444;">*</span>
                            </label>
                            <input type="text" name="username" placeholder="e.g. amit_trainer" required style="width: 100%; box-sizing: border-box;">
                        </div>

                        <div class="form-group" style="margin-bottom: 0;">
                            <label style="display: block; font-weight: 600; font-size: 13.5px; color: var(--text); margin-bottom: 7px;">
                                <i class="fas fa-key" style="color: var(--primary); width: 18px;"></i> Password <span style="color: #ef4444;">*</span>
                            </label>
                            <input type="password" name="password" placeholder="••••••••" required style="width: 100%; box-sizing: border-box;">
                        </div>
                    </div>

                    <button type="submit" class="btn-primary" style="width: 100%; padding: 13px; font-size: 15px; font-weight: 700; border-radius: 12px; display: flex; align-items: center; justify-content: center; gap: 8px;">
                        <i class="fas fa-user-plus"></i> Create Trainer Account
                    </button>
                </form>

            </div>
        </div>


    </main>
</div>


</body>
</html>