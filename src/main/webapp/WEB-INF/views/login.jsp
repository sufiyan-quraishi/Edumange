<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Portal Login | EduManage</title>
    <!-- FontAwesome Vector Icons -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css">
    <!-- Existing Project Stylesheet -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
</head>
<body style="min-height: 100vh; display: flex; flex-direction: column; margin: 0; background: var(--bg);">

<!-- 1. NAVIGATION -->
<jsp:include page="common/navbar.jsp" />

<!-- 2. LOGIN CARD -->
<main style="flex: 1; display: flex; align-items: center; justify-content: center; padding: 60px 20px;">
    <div class="dashboard-card" style="max-width: 460px; width: 100%; padding: 40px 32px; border-radius: 24px; box-shadow: var(--shadow-xl); box-sizing: border-box;">
        
        <!-- Top Icon -->
        <div style="width: 52px; height: 52px; border-radius: 16px; background: rgba(79, 110, 247, 0.12); color: var(--primary); display: flex; align-items: center; justify-content: center; font-size: 22px; margin: 0 auto 16px;">
            <i class="fas fa-lock"></i>
        </div>

        <div style="text-align: center; margin-bottom: 24px;">
            <h2 style="margin: 0 0 6px; font-size: 24px; font-weight: 800; color: var(--text);">Welcome Back</h2>
            <p style="margin: 0; font-size: 13.5px; color: var(--text-muted);">Sign in to access your EduManage portal</p>
        </div>

        <!-- Error Feedback Alert -->
        <c:if test="${param.error != null}">
            <div class="badge badge-danger" style="display: flex; align-items: center; gap: 8px; width: 100%; padding: 12px; margin-bottom: 18px; font-size: 13px; box-sizing: border-box; border-radius: 10px; justify-content: center;">
                <i class="fas fa-circle-exclamation"></i>
                <span>Invalid username or password.</span>
            </div>
        </c:if>

        <!-- Logout Feedback Alert -->
        <c:if test="${param.logout != null}">
            <div class="badge badge-approved" style="display: flex; align-items: center; gap: 8px; width: 100%; padding: 12px; margin-bottom: 18px; font-size: 13px; box-sizing: border-box; border-radius: 10px; justify-content: center;">
                <i class="fas fa-circle-check"></i>
                <span>You have been logged out securely.</span>
            </div>
        </c:if>

        <!-- Login Form -->
        <form action="${pageContext.request.contextPath}/perform_login" method="post">
            
            <!-- Username Input -->
            <div class="form-group" style="margin-bottom: 18px;">
                <label style="font-size: 13px; font-weight: 700; color: var(--text); display: block; margin-bottom: 6px;">
                    Username <span style="color: var(--danger);">*</span>
                </label>
                <div style="position: relative;">
                    <i class="fas fa-user" style="position: absolute; left: 14px; top: 50%; transform: translateY(-50%); color: var(--text-muted); font-size: 14px;"></i>
                    <input type="text" name="username" placeholder="Enter your username" required style="width: 100%; box-sizing: border-box; padding: 12px 14px 12px 40px; border-radius: 10px; border: 1px solid var(--border); background: var(--surface-alt); color: var(--text); font-size: 13.5px; outline: none;">
                </div>
            </div>

            <!-- Password Input -->
            <div class="form-group" style="margin-bottom: 22px;">
                <label style="font-size: 13px; font-weight: 700; color: var(--text); display: block; margin-bottom: 6px;">
                    Password <span style="color: var(--danger);">*</span>
                </label>
                <div style="position: relative;">
                    <i class="fas fa-key" style="position: absolute; left: 14px; top: 50%; transform: translateY(-50%); color: var(--text-muted); font-size: 14px;"></i>
                    <input type="password" id="loginPassword" name="password" placeholder="Enter your password" required style="width: 100%; box-sizing: border-box; padding: 12px 42px 12px 40px; border-radius: 10px; border: 1px solid var(--border); background: var(--surface-alt); color: var(--text); font-size: 13.5px; outline: none;">
                    <button type="button" onclick="togglePasswordVisibility()" style="position: absolute; right: 12px; top: 50%; transform: translateY(-50%); background: transparent; border: none; color: var(--text-muted); cursor: pointer; padding: 4px;">
                        <i class="far fa-eye" id="togglePasswordIcon"></i>
                    </button>
                </div>
            </div>

            <!-- Submit Button -->
            <button type="submit" class="btn-primary" style="width: 100%; padding: 12px; font-size: 14.5px; font-weight: 700; border-radius: 10px; display: flex; align-items: center; justify-content: center; gap: 8px;">
                <span>Sign In</span>
                <i class="fas fa-arrow-right-to-bracket"></i>
            </button>
        </form>

        <!-- Role Hint Block -->
        <div style="background: var(--surface-alt); border: 1px solid var(--border); border-radius: 12px; padding: 12px 14px; margin-top: 22px; display: flex; align-items: flex-start; gap: 10px; font-size: 12.5px; color: var(--text-muted); line-height: 1.5;">
            <i class="fas fa-shield-halved" style="color: var(--primary); font-size: 16px; margin-top: 2px;"></i>
            <span>Admin, Trainer, and Student accounts login here and are redirected to their designated dashboard automatically.</span>
        </div>

        <div style="text-align: center; margin-top: 18px; font-size: 13px; color: var(--text-muted);">
            Don't have an account? 
            <a href="${pageContext.request.contextPath}/registration" style="color: var(--primary); font-weight: 700; text-decoration: none;">
                Register Here
            </a>
        </div>

    </div>
</main>

<!-- 3. COMMON FOOTER -->
<jsp:include page="common/admin-footer.jsp" />

<!-- 4. SCRIPT -->
<script>
    function togglePasswordVisibility() {
        const passField = document.getElementById('loginPassword');
        const icon = document.getElementById('togglePasswordIcon');
        if (passField.type === 'password') {
            passField.type = 'text';
            icon.classList.remove('fa-eye');
            icon.classList.add('fa-eye-slash');
        } else {
            passField.type = 'password';
            icon.classList.remove('fa-eye-slash');
            icon.classList.add('fa-eye');
        }
    }
</script>

</body>
</html>