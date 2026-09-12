<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>My Profile - EduManage</title>
    <!-- FontAwesome Vector Icons -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css">
    <!-- Project Stylesheet -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
    
    <style>
        .profile-container-grid {
            display: grid;
            grid-template-columns: 340px 1fr;
            gap: 24px;
            margin-top: 15px;
        }

        @media (max-width: 950px) {
            .profile-container-grid {
                grid-template-columns: 1fr;
            }
        }

        .avatar-holder {
            width: 96px;
            height: 96px;
            border-radius: 50%;
            background: linear-gradient(135deg, var(--primary), #8b5cf6);
            color: #ffffff;
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 38px;
            font-weight: 800;
            margin: 0 auto 16px auto;
            box-shadow: 0 10px 25px rgba(79, 110, 247, 0.35);
            border: 4px solid var(--surface-alt);
        }

        .profile-fields-grid {
            display: grid;
            grid-template-columns: repeat(2, 1fr);
            gap: 20px;
        }

        @media (max-width: 600px) {
            .profile-fields-grid {
                grid-template-columns: 1fr;
            }
        }

        .profile-input-control {
            width: 100%;
            padding: 12px 16px;
            border: 1px solid var(--border);
            border-radius: 12px;
            background: var(--surface-alt);
            color: var(--text);
            font-size: 14px;
            box-sizing: border-box;
            outline: none;
            transition: all 0.25s ease;
        }

        .profile-input-control:focus {
            border-color: var(--primary);
            box-shadow: 0 0 0 3px var(--primary-soft);
            background: var(--surface);
        }

        .profile-input-control[readonly] {
            cursor: not-allowed;
            background: var(--border);
            opacity: 0.8;
        }
    </style>
</head>
<body style="min-height: 100vh; display: flex; flex-direction: column; margin: 0;">

<div class="dashboard-layout" style="flex: 1; display: flex; min-height: 100vh;">
    
    <!-- 1. SIDEBAR NAVIGATION -->
    <jsp:include page="/WEB-INF/views/common/student-sidebar.jsp" />

    <!-- 2. MAIN CONTENT AREA -->
    <main class="main-content" style="flex: 1; display: flex; flex-direction: column; justify-content: space-between; padding: 30px; box-sizing: border-box;">
        
        <div>
            <!-- Header Bar -->
            <div class="header-bar" style="margin-bottom: 24px; display: flex; justify-content: space-between; align-items: center; flex-wrap: wrap; gap: 12px;">
                <div>
                    <h2><i class="fas fa-id-card-alt" style="color: var(--primary);"></i> Student Profile & Account</h2>
                    <span style="color: var(--text-muted); font-size: 14px;">Manage your personal records, registration identity, and contact information.</span>
                </div>

                <c:if test="${not empty message}">
                    <span class="badge badge-approved" style="font-size: 13px; padding: 8px 16px;">
                        <i class="fas fa-check-circle" style="margin-right: 5px;"></i> ${message}
                    </span>
                </c:if>
            </div>

            <!-- Profile Grid -->
            <div class="profile-container-grid">
                
                <!-- Left Summary Card -->
                <div class="dashboard-card" style="padding: 30px 24px; text-align: center; border-radius: 20px;">
                    <div class="avatar-holder">
                        ${student.fullName != null && not empty student.fullName ? student.fullName.substring(0, 1).toUpperCase() : 'S'}
                    </div>

                    <h3 style="margin: 0 0 4px 0; font-size: 20px; font-weight: 800; color: var(--text);">${student.fullName}</h3>
                    <span style="color: var(--primary); font-weight: 700; font-size: 13.5px; font-family: monospace;">@${student.username}</span>

                    <div style="margin-top: 14px;">
                        <span class="badge badge-approved" style="font-size: 12px; padding: 5px 14px;">
                            <i class="fas fa-shield-check" style="margin-right: 4px;"></i> Verified Student
                        </span>
                    </div>

                    <div style="margin-top: 24px; padding-top: 20px; border-top: 1px solid var(--border); text-align: left; display: flex; flex-direction: column; gap: 14px;">
                        <div style="font-size: 13px; color: var(--text-muted); display: flex; align-items: center; gap: 12px;">
                            <i class="fas fa-id-badge" style="color: var(--primary); width: 18px; font-size: 15px;"></i>
                            <span>Student ID: <strong style="color: var(--text);">#STU-${student.id}</strong></span>
                        </div>
                        <div style="font-size: 13px; color: var(--text-muted); display: flex; align-items: center; gap: 12px;">
                            <i class="fas fa-envelope" style="color: var(--primary); width: 18px; font-size: 15px;"></i>
                            <span>${student.email != null ? student.email : 'Not Provided'}</span>
                        </div>
                        <div style="font-size: 13px; color: var(--text-muted); display: flex; align-items: center; gap: 12px;">
                            <i class="fas fa-phone-alt" style="color: var(--primary); width: 18px; font-size: 15px;"></i>
                            <span>${student.phone != null ? student.phone : 'Not Provided'}</span>
                        </div>
                    </div>
                </div>

                <!-- Right Registration Details Form Card -->
                <div class="dashboard-card" style="padding: 28px; border-radius: 20px;">
                    <div class="card-header-custom" style="margin-bottom: 22px; border-bottom: 1px solid var(--border); padding-bottom: 16px;">
                        <div>
                            <h6 style="margin: 0; font-size: 17px; font-weight: 800; color: var(--text);">
                                <i class="fas fa-user-edit" style="color: var(--primary); margin-right: 8px;"></i> Registration Details
                            </h6>
                            <small style="color: var(--text-muted); font-size: 13px;">Official profile parameters linked with EduManage system</small>
                        </div>
                    </div>

                    <form action="${pageContext.request.contextPath}/student/profile/update" method="post">
                        <div class="profile-fields-grid">
                            
                            <div class="form-group">
                                <label style="font-size: 13.5px; font-weight: 700; margin-bottom: 8px; display: flex; align-items: center; gap: 6px;">
                                    <i class="fas fa-user" style="color: var(--primary);"></i> Full Name
                                </label>
                                <input type="text" name="fullName" class="profile-input-control" value="${student.fullName}" required>
                            </div>

                            <div class="form-group">
                                <label style="font-size: 13.5px; font-weight: 700; margin-bottom: 8px; display: flex; align-items: center; gap: 6px;">
                                    <i class="fas fa-user-tag" style="color: var(--primary);"></i> Username (Locked)
                                </label>
                                <input type="text" class="profile-input-control" value="${student.username}" readonly>
                            </div>

                            <div class="form-group">
                                <label style="font-size: 13.5px; font-weight: 700; margin-bottom: 8px; display: flex; align-items: center; gap: 6px;">
                                    <i class="fas fa-envelope" style="color: var(--primary);"></i> Email Address
                                </label>
                                <input type="email" name="email" class="profile-input-control" value="${student.email}" required>
                            </div>

                            <div class="form-group">
                                <label style="font-size: 13.5px; font-weight: 700; margin-bottom: 8px; display: flex; align-items: center; gap: 6px;">
                                    <i class="fas fa-phone-alt" style="color: var(--primary);"></i> Phone Number
                                </label>
                                <input type="tel" name="phone" class="profile-input-control" value="${student.phone}">
                            </div>

                            <div class="form-group">
                                <label style="font-size: 13.5px; font-weight: 700; margin-bottom: 8px; display: flex; align-items: center; gap: 6px;">
                                    <i class="fas fa-user-graduate" style="color: var(--primary);"></i> Assigned Role
                                </label>
                                <input type="text" class="profile-input-control" value="${student.role != null ? student.role : 'STUDENT'}" readonly>
                            </div>

                            <div class="form-group">
                                <label style="font-size: 13.5px; font-weight: 700; margin-bottom: 8px; display: flex; align-items: center; gap: 6px;">
                                    <i class="fas fa-shield-alt" style="color: var(--primary);"></i> Account Status
                                </label>
                                <input type="text" class="profile-input-control" value="Active & Enrolled" readonly>
                            </div>

                        </div>

                        <div style="margin-top: 26px; display: flex; justify-content: flex-end; gap: 12px;">
                            <button type="submit" class="mini-btn" style="padding: 11px 24px; font-size: 14px; border-radius: 10px; display: inline-flex; align-items: center; gap: 8px;">
                                <i class="fas fa-save"></i> Save Changes
                            </button>
                        </div>
                    </form>
                </div>

            </div>
        </div>

      

    </main>
</div>

</body>
</html>