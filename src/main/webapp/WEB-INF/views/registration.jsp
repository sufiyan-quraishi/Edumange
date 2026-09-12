<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Student Registration | EduManage</title>
    <!-- FontAwesome Vector Icons -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css">
    <!-- Existing Project Stylesheet -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
</head>
<body style="min-height: 100vh; display: flex; flex-direction: column; margin: 0; background: var(--bg);">

<!-- 1. NAVIGATION -->
<jsp:include page="common/navbar.jsp" />

<!-- 2. REGISTRATION FORM CONTAINER -->
<main style="flex: 1; display: flex; align-items: center; justify-content: center; padding: 50px 20px;">
    <div class="dashboard-card" style="max-width: 620px; width: 100%; padding: 40px 34px; border-radius: 24px; box-shadow: var(--shadow-xl); box-sizing: border-box;">
        
        <!-- Header Icon & Titles -->
        <div style="width: 52px; height: 52px; border-radius: 16px; background: rgba(79, 110, 247, 0.12); color: var(--primary); display: flex; align-items: center; justify-content: center; font-size: 22px; margin: 0 auto 16px;">
            <i class="fas fa-user-plus"></i>
        </div>

        <div style="text-align: center; margin-bottom: 26px;">
            <h2 style="margin: 0 0 6px; font-size: 24px; font-weight: 800; color: var(--text);">Student Registration</h2>
            <p style="margin: 0; font-size: 13.5px; color: var(--text-muted);">Fill out your details to apply for admission & batch onboarding</p>
        </div>

        <!-- Registration Form -->
        <form action="${pageContext.request.contextPath}/register" method="post">
            
            <!-- Full Name -->
            <div class="form-group" style="margin-bottom: 18px;">
                <label style="font-size: 13px; font-weight: 700; color: var(--text); display: block; margin-bottom: 6px;">
                    Full Name <span style="color: var(--danger);">*</span>
                </label>
                <div style="position: relative;">
                    <i class="fas fa-user" style="position: absolute; left: 14px; top: 50%; transform: translateY(-50%); color: var(--text-muted); font-size: 14px;"></i>
                    <input type="text" name="fullName" placeholder="Enter your full name" required style="width: 100%; box-sizing: border-box; padding: 12px 14px 12px 40px; border-radius: 10px; border: 1px solid var(--border); background: var(--surface-alt); color: var(--text); font-size: 13.5px; outline: none;">
                </div>
            </div>

            <!-- Email & Phone in 2 Columns -->
            <div style="display: grid; grid-template-columns: 1fr 1fr; gap: 14px; margin-bottom: 18px;">
                <div class="form-group" style="margin-bottom: 0;">
                    <label style="font-size: 13px; font-weight: 700; color: var(--text); display: block; margin-bottom: 6px;">
                        Email Address <span style="color: var(--danger);">*</span>
                    </label>
                    <div style="position: relative;">
                        <i class="far fa-envelope" style="position: absolute; left: 14px; top: 50%; transform: translateY(-50%); color: var(--text-muted); font-size: 14px;"></i>
                        <input type="email" name="email" placeholder="name@example.com" required style="width: 100%; box-sizing: border-box; padding: 12px 14px 12px 40px; border-radius: 10px; border: 1px solid var(--border); background: var(--surface-alt); color: var(--text); font-size: 13.5px; outline: none;">
                    </div>
                </div>

                <div class="form-group" style="margin-bottom: 0;">
                    <label style="font-size: 13px; font-weight: 700; color: var(--text); display: block; margin-bottom: 6px;">
                        Phone Number <span style="color: var(--danger);">*</span>
                    </label>
                    <div style="position: relative;">
                        <i class="fas fa-phone" style="position: absolute; left: 14px; top: 50%; transform: translateY(-50%); color: var(--text-muted); font-size: 14px;"></i>
                        <input type="tel" name="phone" placeholder="+91 XXXXX XXXXX" required style="width: 100%; box-sizing: border-box; padding: 12px 14px 12px 40px; border-radius: 10px; border: 1px solid var(--border); background: var(--surface-alt); color: var(--text); font-size: 13.5px; outline: none;">
                    </div>
                </div>
            </div>

            <!-- Course Applied & Highest Qualification Dropdowns -->
            <div style="display: grid; grid-template-columns: 1fr 1fr; gap: 14px; margin-bottom: 18px;">
                <div class="form-group" style="margin-bottom: 0;">
                    <label style="font-size: 13px; font-weight: 700; color: var(--text); display: block; margin-bottom: 6px;">
                        Course Track <span style="color: var(--danger);">*</span>
                    </label>
                    <div style="position: relative;">
                        <i class="fas fa-graduation-cap" style="position: absolute; left: 14px; top: 50%; transform: translateY(-50%); color: var(--text-muted); font-size: 14px; z-index: 1;"></i>
                        <select name="courseApplied" required style="width: 100%; box-sizing: border-box; padding: 12px 14px 12px 40px; border-radius: 10px; border: 1px solid var(--border); background: var(--surface-alt); color: var(--text); font-size: 13.5px; outline: none; cursor: pointer;">
                            <option value="">Select a Course</option>
                            <option value="Java Full Stack Development">Java Full Stack Development</option>
                            <option value="Python & Data Science">Python & Data Science</option>
                            <option value="Frontend Development">Frontend Development</option>
                            <option value="React JS Development">React JS Development</option>
                            <option value="Spring Boot & Microservices">Spring Boot & Microservices</option>
                            <option value="SQL & Database Management">SQL & Database Management</option>
                            <option value="DevOps & Cloud Computing">DevOps & Cloud Computing</option>
                        </select>
                    </div>
                </div>

                <div class="form-group" style="margin-bottom: 0;">
                    <label style="font-size: 13px; font-weight: 700; color: var(--text); display: block; margin-bottom: 6px;">
                        Highest Qualification <span style="color: var(--danger);">*</span>
                    </label>
                    <div style="position: relative;">
                        <i class="fas fa-certificate" style="position: absolute; left: 14px; top: 50%; transform: translateY(-50%); color: var(--text-muted); font-size: 14px; z-index: 1;"></i>
                        <select name="qualification" required style="width: 100%; box-sizing: border-box; padding: 12px 14px 12px 40px; border-radius: 10px; border: 1px solid var(--border); background: var(--surface-alt); color: var(--text); font-size: 13.5px; outline: none; cursor: pointer;">
                            <option value="">Select Qualification</option>
                            <option value="BCA">BCA</option>
                            <option value="MCA">MCA</option>
                            <option value="B.Tech / B.E. (CS/IT)">B.Tech / B.E. (CS/IT)</option>
                            <option value="B.Tech / B.E. (Other)">B.Tech / B.E. (Other)</option>
                            <option value="B.Sc / M.Sc Computer Science">B.Sc / M.Sc (CS/IT)</option>
                            <option value="Diploma">Diploma in Engineering</option>
                            <option value="Other">Other Graduate / Post Graduate</option>
                        </select>
                    </div>
                </div>
            </div>

            <!-- Residential Address -->
            <div class="form-group" style="margin-bottom: 22px;">
                <label style="font-size: 13px; font-weight: 700; color: var(--text); display: block; margin-bottom: 6px;">
                    Residential Address
                </label>
                <div style="position: relative;">
                    <i class="fas fa-location-dot" style="position: absolute; left: 14px; top: 16px; color: var(--text-muted); font-size: 14px;"></i>
                    <textarea name="address" rows="2" placeholder="Enter city, state & address..." style="width: 100%; box-sizing: border-box; padding: 12px 14px 12px 40px; border-radius: 10px; border: 1px solid var(--border); background: var(--surface-alt); color: var(--text); font-size: 13.5px; outline: none; resize: vertical;"></textarea>
                </div>
            </div>

            <!-- Submit Button -->
            <button type="submit" class="btn-primary" style="width: 100%; padding: 12px; font-size: 14.5px; font-weight: 700; border-radius: 10px; display: flex; align-items: center; justify-content: center; gap: 8px; border: none; cursor: pointer;">
                <span>Submit Registration</span>
                <i class="fas fa-paper-plane"></i>
            </button>
        </form>

        <div style="text-align: center; margin-top: 18px; font-size: 13px; color: var(--text-muted);">
            Already have an account? 
            <a href="${pageContext.request.contextPath}/login" style="color: var(--primary); font-weight: 700; text-decoration: none;">
                Sign In
            </a>
        </div>

    </div>
</main>

<!-- 3. COMMON FOOTER -->
<jsp:include page="common/admin-footer.jsp" />

</body>
</html>