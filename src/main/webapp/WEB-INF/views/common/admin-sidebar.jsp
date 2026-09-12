<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!-- CHANGED: Added FontAwesome CDN so icons show on every page automatically -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">

<div class="sidebar" style="display: flex; flex-direction: column; justify-content: space-between; padding-bottom: 20px;">
    
    <div>
        <!-- EduManage Brand Logo -->
        <a href="${pageContext.request.contextPath}/admin/dashboard" style="text-decoration: none; padding: 0;">
            <div class="brand">
                <div class="brand-icon">
                    <i class="fas fa-graduation-cap"></i>
                </div>
                <div class="brand-text">
                    <h4>EduManage</h4>
                    <small>ADMIN PANEL</small>
                </div>
            </div>
        </a>

        <!-- Menu Links with Icons -->
        <div class="menu-title">CORE MENU</div>
        <a href="${pageContext.request.contextPath}/admin/dashboard" class="nav-link-custom">
            <i class="fas fa-chart-pie"></i> Dashboard
        </a>
        <a href="${pageContext.request.contextPath}/admin/inquiries" class="nav-link-custom">
            <i class="fas fa-envelope-open-text"></i> Inquiries
        </a>
        <a href="${pageContext.request.contextPath}/admin/registrations" class="nav-link-custom">
            <i class="fas fa-user-check"></i> Registrations
        </a>
        <a href="${pageContext.request.contextPath}/admin/trainers" class="nav-link-custom">
            <i class="fas fa-chalkboard-teacher"></i> Trainers
        </a>
        <a href="${pageContext.request.contextPath}/admin/students" class="nav-link-custom">
            <i class="fas fa-user-graduate"></i> Students
        </a>
        <a href="${pageContext.request.contextPath}/admin/batches" class="nav-link-custom">
            <i class="fas fa-layer-group"></i> Batches
        </a>

        <div class="menu-title">OPERATIONS</div>
        <a href="${pageContext.request.contextPath}/admin/attendance" class="nav-link-custom">
            <i class="fas fa-calendar-alt"></i> Attendance
        </a>
        <a href="${pageContext.request.contextPath}/admin/tasks" class="nav-link-custom">
            <i class="fas fa-clipboard-list"></i> Tasks
        </a>
        <a href="${pageContext.request.contextPath}/admin/reports" class="nav-link-custom">
            <i class="fas fa-file-invoice-dollar"></i> Reports
        </a>

        <div class="menu-title">SETTINGS</div>
        <a href="${pageContext.request.contextPath}/admin/profile" class="nav-link-custom">
            <i class="fas fa-user-shield"></i> Account Info
        </a>
    </div>

    <!-- Bottom Actions -->
    <div style="padding: 0 10px; margin-top: 15px;">
        
        <!-- Dark/Light Theme Button -->
        <a href="javascript:void(0);" onclick="toggleAppTheme()" class="nav-link-custom" style="margin-bottom: 6px; cursor: pointer;">
            <i class="fas fa-moon" id="sidebarThemeIcon"></i> <span id="themeBtnText">Dark Mode</span>
        </a>

        <!-- Logout Button -->
        <a href="${pageContext.request.contextPath}/logout" class="nav-link-custom" style="color: #fb7185 !important; margin-bottom: 12px;">
            <i class="fas fa-power-off"></i> Logout
        </a>

        <!-- Clickable Admin Console -->
        <a href="${pageContext.request.contextPath}/admin/profile" style="text-decoration: none; display: block; padding: 0;" title="View My Account">
            <div class="admin-mini" style="position: static; cursor: pointer;">
                <div class="admin-avatar">
                    <i class="fas fa-user-shield"></i>
                </div>
                <div style="flex: 1;">
                    <div style="display: flex; align-items: center; justify-content: space-between;">
                        <strong style="color: #fff;">Admin Console</strong>
                        <i class="fas fa-chevron-right" style="font-size: 10px; color: #94a3b8;"></i>
                    </div>
                    <small style="color: #94a3b8;">View Account Settings</small>
                </div>
            </div>
        </a>
    </div>

</div>

<!-- Theme Script -->
<script>
    (function initSidebarTheme() {
        const savedTheme = localStorage.getItem('theme') || 'light';
        const icon = document.getElementById('sidebarThemeIcon');
        const text = document.getElementById('themeBtnText');
        
        if (savedTheme === 'dark') {
            document.documentElement.setAttribute('data-theme', 'dark');
            if(icon) icon.className = 'fas fa-sun';
            if(text) text.innerText = 'Light Mode';
        }
    })();

    function toggleAppTheme() {
        const isDark = document.documentElement.getAttribute('data-theme') === 'dark';
        const icon = document.getElementById('sidebarThemeIcon');
        const text = document.getElementById('themeBtnText');

        if (isDark) {
            document.documentElement.removeAttribute('data-theme');
            localStorage.setItem('theme', 'light');
            if(icon) icon.className = 'fas fa-moon';
            if(text) text.innerText = 'Dark Mode';
        } else {
            document.documentElement.setAttribute('data-theme', 'dark');
            localStorage.setItem('theme', 'dark');
            if(icon) icon.className = 'fas fa-sun';
            if(text) text.innerText = 'Light Mode';
        }
    }
</script>