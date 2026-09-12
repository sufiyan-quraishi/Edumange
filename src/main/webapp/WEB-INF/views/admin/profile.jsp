<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin Profile - EduManage</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
</head>
<body style="min-height: 100vh; display: flex; flex-direction: column; margin: 0;">

<div class="dashboard-layout" style="flex: 1; display: flex; min-height: 100vh;">
    
    <!-- Admin Sidebar -->
    <jsp:include page="/WEB-INF/views/common/admin-sidebar.jsp" />

    <!-- Main Content -->
    <main class="main-content" style="flex: 1; display: flex; flex-direction: column; justify-content: space-between; padding: 30px; box-sizing: border-box;">
        
        <div>
            <!-- Header Bar -->
            <div class="header-bar" style="margin-bottom: 24px;">
                <h2><i class="fas fa-user-shield" style="color: var(--primary);"></i> Admin Account Information</h2>
                <span style="color: var(--text-muted); font-size: 13.5px;">Manage your personal profile and account credentials</span>
            </div>

            <!-- Success Alert -->
            <c:if test="${not empty successMsg}">
                <div style="background: rgba(16, 185, 129, 0.1); border: 1px solid #10b981; color: #10b981; padding: 12px 16px; border-radius: 8px; margin-bottom: 20px; font-size: 14px;">
                    <i class="fas fa-check-circle"></i> ${successMsg}
                </div>
            </c:if>

            <div style="display: grid; grid-template-columns: 320px 1fr; gap: 24px; align-items: start;">
                
                <!-- Profile Overview Card -->
                <div class="dashboard-card" style="padding: 24px; border-radius: 16px; text-align: center;">
                    <div style="width: 80px; height: 80px; border-radius: 50%; background: linear-gradient(135deg, var(--primary), #8b5cf6); color: #fff; display: flex; align-items: center; justify-content: center; font-size: 32px; font-weight: 700; margin: 0 auto 16px;">
                        ${admin.fullName.substring(0, 1).toUpperCase()}
                    </div>
                    <h3 style="margin: 0; font-size: 18px; color: var(--text);">${admin.fullName}</h3>
                    <span style="color: var(--text-muted); font-size: 13px; font-family: monospace;">@${admin.username}</span>
                    
                    <div style="margin-top: 14px;">
                        <span class="badge badge-approved" style="font-size: 12px; padding: 6px 14px;">
                            <i class="fas fa-shield-alt"></i> ${admin.role}
                        </span>
                    </div>

                    <div style="margin-top: 20px; text-align: left; border-top: 1px solid var(--border); padding-top: 14px; font-size: 13px; color: var(--text-muted);">
                        <p style="margin: 6px 0;"><i class="fas fa-envelope" style="width: 20px; color: var(--primary);"></i> ${admin.email}</p>
                        <p style="margin: 6px 0;"><i class="fas fa-phone" style="width: 20px; color: var(--primary);"></i> ${admin.phone}</p>
                        <p style="margin: 6px 0;"><i class="fas fa-toggle-on" style="width: 20px; color: var(--primary);"></i> Status: <strong style="color: #10b981;">Active</strong></p>
                    </div>
                </div>

                <!-- Profile Edit Form Card -->
                <div class="dashboard-card" style="padding: 24px; border-radius: 16px;">
                    <h4 style="margin: 0 0 18px 0; font-size: 16px; color: var(--text);">Update Account Details</h4>
                    
                    <form action="${pageContext.request.contextPath}/admin/profile/update" method="post">
                        
                        <div style="margin-bottom: 16px;">
                            <label style="font-size: 13px; font-weight: 600; display: block; margin-bottom: 6px;">Username (Cannot be changed)</label>
                            <input type="text" value="${admin.username}" disabled style="width: 100%; padding: 10px 12px; border: 1px solid var(--border); border-radius: 8px; background: rgba(0,0,0,0.05); color: var(--text-muted); font-size: 13.5px; box-sizing: border-box;">
                        </div>

                        <div style="margin-bottom: 16px;">
                            <label style="font-size: 13px; font-weight: 600; display: block; margin-bottom: 6px;">Full Name</label>
                            <input type="text" name="fullName" value="${admin.fullName}" required style="width: 100%; padding: 10px 12px; border: 1px solid var(--border); border-radius: 8px; background: var(--surface-alt); color: var(--text); font-size: 13.5px; box-sizing: border-box;">
                        </div>

                        <div style="display: grid; grid-template-columns: 1fr 1fr; gap: 16px; margin-bottom: 16px;">
                            <div>
                                <label style="font-size: 13px; font-weight: 600; display: block; margin-bottom: 6px;">Email Address</label>
                                <input type="email" name="email" value="${admin.email}" required style="width: 100%; padding: 10px 12px; border: 1px solid var(--border); border-radius: 8px; background: var(--surface-alt); color: var(--text); font-size: 13.5px; box-sizing: border-box;">
                            </div>
                            <div>
                                <label style="font-size: 13px; font-weight: 600; display: block; margin-bottom: 6px;">Phone Number</label>
                                <input type="text" name="phone" value="${admin.phone}" required style="width: 100%; padding: 10px 12px; border: 1px solid var(--border); border-radius: 8px; background: var(--surface-alt); color: var(--text); font-size: 13.5px; box-sizing: border-box;">
                            </div>
                        </div>

                        <div style="margin-bottom: 22px;">
                            <label style="font-size: 13px; font-weight: 600; display: block; margin-bottom: 6px;">New Password <span style="font-size: 11.5px; color: var(--text-muted); font-weight: normal;">(Leave empty to keep current password)</span></label>
                            <input type="password" name="password" placeholder="Enter new password if changing" style="width: 100%; padding: 10px 12px; border: 1px solid var(--border); border-radius: 8px; background: var(--surface-alt); color: var(--text); font-size: 13.5px; box-sizing: border-box;">
                        </div>

                        <button type="submit" class="btn-primary" style="padding: 10px 22px; font-size: 13.5px; border-radius: 8px; display: inline-flex; align-items: center; gap: 8px;">
                            <i class="fas fa-save"></i> Save Changes
                        </button>
                    </form>
                </div>

            </div>
        </div>

    </main>
</div>


</body>
</html>