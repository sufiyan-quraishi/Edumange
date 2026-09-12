<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>My Profile - EduManage</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
    <style>
        .profile-layout {
            display: grid;
            grid-template-columns: 320px 1fr;
            gap: 24px;
            margin-top: 20px;
        }
        @media (max-width: 900px) {
            .profile-layout {
                grid-template-columns: 1fr;
            }
        }
        .profile-card {
            background: var(--surface, #ffffff);
            border: 1px solid var(--border, #e2e8f0);
            border-radius: 16px;
            padding: 28px;
            box-shadow: var(--shadow, 0 4px 6px -1px rgba(0,0,0,0.05));
            box-sizing: border-box;
        }
        .profile-avatar-box {
            display: flex;
            flex-direction: column;
            align-items: center;
            text-align: center;
        }
        .avatar-circle {
            width: 90px;
            height: 90px;
            border-radius: 50%;
            background: linear-gradient(135deg, var(--primary, #4f6ef7), #3b82f6);
            color: #fff;
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 36px;
            font-weight: 700;
            margin-bottom: 14px;
            box-shadow: 0 6px 16px rgba(79, 110, 247, 0.3);
        }
        .info-grid {
            display: grid;
            grid-template-columns: 1fr 1fr;
            gap: 18px;
        }
        @media (max-width: 600px) {
            .info-grid {
                grid-template-columns: 1fr;
            }
        }
        .form-group {
            display: flex;
            flex-direction: column;
            gap: 6px;
        }
        .form-group label {
            font-size: 13px;
            font-weight: 700;
            color: var(--text-muted, #64748b);
            display: flex;
            align-items: center;
            gap: 6px;
        }
        .form-control-custom {
            width: 100%;
            padding: 10px 14px;
            border-radius: 10px;
            border: 1px solid var(--border, #e2e8f0);
            background: var(--bg, #f8fafc);
            color: var(--text, #1e293b);
            font-size: 14px;
            box-sizing: border-box;
            outline: none;
            transition: border-color 0.2s;
        }
        .form-control-custom:focus {
            border-color: var(--primary, #4f6ef7);
        }
        .form-control-custom[readonly] {
            opacity: 0.8;
            cursor: not-allowed;
            background: var(--border, #e2e8f0);
        }
    </style>
</head>
<body>

<div class="dashboard-layout">
    <jsp:include page="/WEB-INF/views/common/trainer-sidebar.jsp"/>

    <main class="main-content">
        <!-- Header Bar -->
        <div class="header-bar" style="margin-bottom: 20px; display: flex; justify-content: space-between; align-items: center; flex-wrap: wrap; gap: 10px;">
            <div>
                <h2 style="margin: 0; font-size: 22px; font-weight: 800; color: var(--text, #0f172a);">
                    <i class="fas fa-id-badge" style="color: var(--primary, #4f6ef7); margin-right: 8px;"></i> Faculty Profile
                </h2>
                <span style="color: var(--text-muted, #64748b); font-size: 13.5px;">View and manage your registered instructor credentials and account details.</span>
            </div>
            <c:if test="${not empty message}">
                <span class="badge badge-approved" style="font-size: 12px; padding: 6px 12px;">
                    <i class="fas fa-check-circle" style="margin-right: 4px;"></i> ${message}
                </span>
            </c:if>
        </div>

        <div class="profile-layout">
            <!-- Left Side Summary Card -->
            <div class="profile-card profile-avatar-box">
                <div class="avatar-circle">
                    ${trainer.fullName != null && not empty trainer.fullName ? trainer.fullName.substring(0, 1).toUpperCase() : 'T'}
                </div>
                <h3 style="margin: 0 0 4px 0; font-size: 18px; font-weight: 800; color: var(--text, #0f172a);">${trainer.fullName}</h3>
                <span style="color: var(--primary, #4f6ef7); font-weight: 600; font-size: 13px; font-family: monospace;">@${trainer.username}</span>
                
                <div style="margin-top: 14px;">
                    <c:choose>
                        <c:when test="${trainer.active}">
                            <span class="badge badge-approved" style="font-size: 12px;">
                                <i class="fas fa-check-circle" style="margin-right: 4px;"></i> Verified Faculty
                            </span>
                        </c:when>
                        <c:otherwise>
                            <span class="badge badge-rejected" style="font-size: 12px;">
                                <i class="fas fa-ban" style="margin-right: 4px;"></i> Inactive
                            </span>
                        </c:otherwise>
                    </c:choose>
                </div>

                <div style="width: 100%; border-top: 1px solid var(--border, #e2e8f0); margin-top: 20px; padding-top: 16px; text-align: left;">
                    <div style="font-size: 12.5px; color: var(--text-muted, #64748b); margin-bottom: 8px;">
                        <i class="fas fa-envelope" style="width: 16px; color: var(--primary);"></i> ${trainer.email != null ? trainer.email : 'Not Provided'}
                    </div>
                    <div style="font-size: 12.5px; color: var(--text-muted, #64748b);">
                        <i class="fas fa-phone-alt" style="width: 16px; color: var(--primary);"></i> ${trainer.phone != null ? trainer.phone : 'Not Provided'}
                    </div>
                </div>
            </div>

            <!-- Right Side Editable Form Card -->
            <div class="profile-card">
                <div style="border-bottom: 1px solid var(--border, #e2e8f0); padding-bottom: 12px; margin-bottom: 20px;">
                    <h5 style="margin: 0; font-size: 16px; font-weight: 700; color: var(--text, #1e293b);">
                        <i class="fas fa-user-edit" style="color: var(--primary, #4f6ef7); margin-right: 6px;"></i> Registration Details
                    </h5>
                    <small style="color: var(--text-muted, #64748b); font-size: 12.5px;">Your core profile records linked with the EduManage system</small>
                </div>

                <form action="${pageContext.request.contextPath}/trainer/profile/update" method="post">
                    <div class="info-grid">
                        <div class="form-group">
                            <label><i class="fas fa-user"></i> Full Name</label>
                            <input type="text" name="fullName" class="form-control-custom" value="${trainer.fullName}" required>
                        </div>

                        <div class="form-group">
                            <label><i class="fas fa-user-tag"></i> Username</label>
                            <input type="text" class="form-control-custom" value="${trainer.username}" readonly>
                        </div>

                        <div class="form-group">
                            <label><i class="fas fa-envelope"></i> Email Address</label>
                            <input type="email" name="email" class="form-control-custom" value="${trainer.email}" required>
                        </div>

                        <div class="form-group">
                            <label><i class="fas fa-phone-alt"></i> Phone Number</label>
                            <input type="tel" name="phone" class="form-control-custom" value="${trainer.phone}">
                        </div>

                        <div class="form-group">
                            <label><i class="fas fa-graduation-cap"></i> Assigned Specialization / Role</label>
                            <input type="text" class="form-control-custom" value="${trainer.role != null ? trainer.role : 'Senior Trainer / Faculty'}" readonly>
                        </div>

                        <div class="form-group">
                            <label><i class="fas fa-id-card"></i> Trainer ID</label>
                            <input type="text" class="form-control-custom" value="#TR-${trainer.id}" readonly>
                        </div>
                    </div>

                    <div style="margin-top: 24px; display: flex; justify-content: flex-end; gap: 10px;">
                        <button type="submit" class="btn-primary" style="padding: 10px 22px; font-size: 13.5px; font-weight: 700; border-radius: 10px; cursor: pointer; border: none; display: inline-flex; align-items: center; gap: 6px;">
                            <i class="fas fa-save"></i> Save Changes
                        </button>
                    </div>
                </form>
            </div>
        </div>

      
    </main>
</div>
   
</body>
</html>