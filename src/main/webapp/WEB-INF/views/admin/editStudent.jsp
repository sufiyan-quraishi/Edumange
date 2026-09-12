<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Edit Student - EduManage</title>
    <!-- FontAwesome Vector Icons -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
</head>
<body>

<div class="dashboard-layout">
    <!-- Sidebar Navigation -->
    <jsp:include page="/WEB-INF/views/common/admin-sidebar.jsp"/>

    <!-- Main Content Area -->
    <main class="main-content">
        
        <!-- Header Bar -->
        <div class="header-bar" style="margin-bottom: 24px;">
            <div>
                <h2><i class="fas fa-user-edit" style="color: var(--primary);"></i> Edit Student Details</h2>
                <span style="color: var(--text-muted); font-size: 13.5px;">Update personal profile, contact information, credentials, and account status.</span>
            </div>
            <a href="${pageContext.request.contextPath}/admin/students" style="text-decoration: none;">
                <button type="button" class="mini-btn" style="padding: 10px 18px; font-size: 13.5px;">
                    <i class="fas fa-arrow-left"></i> Back to Students
                </button>
            </a>
        </div>

        <!-- Centered Edit Form Card -->
        <div class="center-container" style="display: flex; justify-content: center; align-items: flex-start; padding-top: 10px;">
            <div class="form-container dashboard-card" style="width: 100%; max-width: 620px; padding: 32px; border-radius: 20px; box-shadow: var(--shadow-lg);">
                
                <div style="margin-bottom: 24px; border-bottom: 1px solid var(--border); padding-bottom: 14px; display: flex; align-items: center; justify-content: space-between;">
                    <div>
                        <h5 style="margin: 0 0 4px 0; font-size: 18px; color: var(--text); font-weight: 700;">
                            <i class="fas fa-id-card-alt" style="color: var(--primary); margin-right: 6px;"></i> Profile Information
                        </h5>
                        <small style="color: var(--text-muted); font-size: 13px;">Editing record for: <strong>${student.fullName}</strong></small>
                    </div>
                    <span class="badge ${student.active ? 'badge-approved' : 'badge-pending'}" style="font-size: 12px;">
                        ${student.active ? 'Active Account' : 'Inactive Account'}
                    </span>
                </div>

                <!-- Unchanged Form Logic & Action -->
                <form action="${pageContext.request.contextPath}/admin/students/${student.id}/update" method="post">
                    
                    <!-- Hidden ID -->
                    <input type="hidden" name="id" value="${student.id}">

                    <div class="form-group" style="margin-bottom: 18px;">
                        <label style="display: block; font-weight: 600; font-size: 13.5px; color: var(--text); margin-bottom: 7px;">
                            <i class="fas fa-user" style="color: var(--primary); width: 18px;"></i> Full Name <span style="color: #ef4444;">*</span>
                        </label>
                        <input type="text" name="fullName" value="${student.fullName}" required style="width: 100%; box-sizing: border-box;">
                    </div>

                    <div style="display: grid; grid-template-columns: 1fr 1fr; gap: 16px; margin-bottom: 18px;">
                        <div class="form-group" style="margin-bottom: 0;">
                            <label style="display: block; font-weight: 600; font-size: 13.5px; color: var(--text); margin-bottom: 7px;">
                                <i class="fas fa-envelope" style="color: var(--primary); width: 18px;"></i> Email Address
                            </label>
                            <input type="email" name="email" value="${student.email}" style="width: 100%; box-sizing: border-box;">
                        </div>

                        <div class="form-group" style="margin-bottom: 0;">
                            <label style="display: block; font-weight: 600; font-size: 13.5px; color: var(--text); margin-bottom: 7px;">
                                <i class="fas fa-phone-alt" style="color: var(--primary); width: 18px;"></i> Contact Phone
                            </label>
                            <input type="text" name="phone" value="${student.phone}" style="width: 100%; box-sizing: border-box;">
                        </div>
                    </div>

                    <div style="display: grid; grid-template-columns: 1fr 1fr; gap: 16px; margin-bottom: 18px;">
                        <div class="form-group" style="margin-bottom: 0;">
                            <label style="display: block; font-weight: 600; font-size: 13.5px; color: var(--text); margin-bottom: 7px;">
                                <i class="fas fa-user-tag" style="color: var(--primary); width: 18px;"></i> Username <span style="color: #ef4444;">*</span>
                            </label>
                            <input type="text" name="username" value="${student.username}" required style="width: 100%; box-sizing: border-box;">
                        </div>

                        <div class="form-group" style="margin-bottom: 0;">
                            <label style="display: block; font-weight: 600; font-size: 13.5px; color: var(--text); margin-bottom: 7px;">
                                <i class="fas fa-toggle-on" style="color: var(--primary); width: 18px;"></i> Account Status
                            </label>
                            <select name="active" style="width: 100%; box-sizing: border-box; padding: 10.5px 12px; border-radius: 10px; border: 1px solid var(--border); background: var(--surface); color: var(--text); font-size: 13.5px;">
                                <option value="true" ${student.active ? "selected" : ""}>Active</option>
                                <option value="false" ${!student.active ? "selected" : ""}>Inactive</option>
                            </select>
                        </div>
                    </div>

                    <div class="form-group" style="margin-bottom: 26px;">
                        <label style="display: block; font-weight: 600; font-size: 13.5px; color: var(--text); margin-bottom: 7px;">
                            <i class="fas fa-lock" style="color: var(--primary); width: 18px;"></i> New Password
                        </label>
                        <input type="password" name="password" placeholder="Leave blank to keep current password" style="width: 100%; box-sizing: border-box;">
                    </div>

                    <div style="display: flex; gap: 14px; align-items: center;">
                        <button type="submit" class="btn-primary" style="flex: 1; padding: 12px; font-size: 14.5px; font-weight: 700; border-radius: 10px; display: flex; align-items: center; justify-content: center; gap: 8px;">
                            <i class="fas fa-save"></i> Update Student
                        </button>

                        <a href="${pageContext.request.contextPath}/admin/students" class="btn-secondary" style="padding: 12px 20px; font-size: 14px; font-weight: 600; border-radius: 10px; text-decoration: none; display: inline-flex; align-items: center; justify-content: center;">
                            Cancel
                        </a>
                    </div>
                </form>

            </div>
        </div>

      
    </main>
</div>

</body>
</html>