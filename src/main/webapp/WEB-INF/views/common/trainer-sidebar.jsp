<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!-- FontAwesome Icons -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css">

<div class="sidebar">

    <!-- Brand Header -->
    <div class="sidebar-header" style="padding: 16px 14px 18px 14px; border-bottom: 1px solid rgba(255, 255, 255, 0.08);">
        <a href="${pageContext.request.contextPath}/trainer/dashboard" style="text-decoration: none; display: flex; align-items: center; gap: 12px;">
            <div style="width: 38px; height: 38px; border-radius: 10px; background: #4f6ef7; display: flex; align-items: center; justify-content: center; color: #ffffff; font-size: 19px; flex-shrink: 0;">
                <i class="fas fa-chalkboard-teacher"></i>
            </div>
            <div style="display: flex; flex-direction: column; align-items: flex-start; gap: 2px;">
                <span style="font-size: 16px; font-weight: 800; color: #ffffff; line-height: 1.1; letter-spacing: 0.5px;">EDUMANAGE</span>
                <span class="badge badge-approved" style="font-size: 9.5px; padding: 2px 7px; font-weight: 700; border-radius: 4px; line-height: 1.2;">TRAINER PORTAL</span>
            </div>
        </a>
    </div>

    <!-- Navigation Menu -->
    <div class="sidebar-menu" style="padding-top: 10px;">
        
        <p class="sidebar-label" style="padding: 10px 14px 4px; font-size: 11px; color: #64748b; font-weight: 700; text-transform: uppercase; margin: 0;">
            MAIN MENU
        </p>

        <!-- 1. Dashboard Link Added -->
        <a href="${pageContext.request.contextPath}/trainer/dashboard" class="sidebar-link">
            <i class="fas fa-th-large"></i>
            <span>Dashboard</span>
        </a>

        <!-- 2. My Batches -->
        <a href="${pageContext.request.contextPath}/trainer/batches" class="sidebar-link">
            <i class="fas fa-layer-group"></i>
            <span>My Batches</span>
        </a>

        <!-- 3. My Students -->
        <a href="${pageContext.request.contextPath}/trainer/students" class="sidebar-link">
            <i class="fas fa-user-graduate"></i>
            <span>My Students</span>
        </a>

        <!-- 4. My Tasks -->
        <a href="${pageContext.request.contextPath}/trainer/tasks" class="sidebar-link">
            <i class="fas fa-tasks"></i>
            <span>My Tasks</span>
        </a>

        <p class="sidebar-label" style="padding: 16px 14px 4px; font-size: 11px; color: #64748b; font-weight: 700; text-transform: uppercase; margin: 0;">
            ACCOUNT SETTINGS
        </p>

        <!-- 5. My Profile Link -->
        <a href="${pageContext.request.contextPath}/trainer/profile" class="sidebar-link">
            <i class="fas fa-user-circle"></i>
            <span>My Profile</span>
        </a>

        <!-- 6. Theme Toggle Item -->
        <a href="javascript:void(0);" id="sidebarThemeBtn" class="sidebar-link" style="cursor: pointer; display: flex; align-items: center; justify-content: space-between;">
            <div style="display: flex; align-items: center; gap: 10px;">
                <i id="sidebarThemeIcon" class="fas fa-moon"></i>
                <span id="sidebarThemeLabel">Theme Mode</span>
            </div>
            <span id="themeBadge" class="badge" style="font-size: 10px; padding: 2px 6px; background: rgba(255, 255, 255, 0.1); color: #cbd5e1;">Dark</span>
        </a>

        <!-- 7. Logout -->
        <a href="${pageContext.request.contextPath}/logout" class="sidebar-link" style="color: #ef4444 !important; margin-top: 14px;">
            <i class="fas fa-sign-out-alt" style="color: #ef4444;"></i>
            <span>Logout</span>
        </a>

    </div>

</div>

<script>
  document.addEventListener('DOMContentLoaded', function() {
    const currentPath = window.location.pathname;
    const links = document.querySelectorAll('.sidebar .sidebar-link');

    links.forEach(link => {
      const href = link.getAttribute('href');
      if (href && (currentPath === href || currentPath.endsWith(href)) && !href.includes('/logout')) {
        link.classList.add('active');
      }
    });

    const themeBtn = document.getElementById('sidebarThemeBtn');
    const themeIcon = document.getElementById('sidebarThemeIcon');
    const themeBadge = document.getElementById('themeBadge');

    function syncThemeUI() {
      const currentTheme = document.documentElement.getAttribute('data-theme') || localStorage.getItem('theme') || 'light';
      if (currentTheme === 'dark') {
        if (themeIcon) { themeIcon.className = 'fas fa-sun'; themeIcon.style.color = '#f59e0b'; }
        if (themeBadge) { themeBadge.textContent = 'Light'; }
      } else {
        if (themeIcon) { themeIcon.className = 'fas fa-moon'; themeIcon.style.color = ''; }
        if (themeBadge) { themeBadge.textContent = 'Dark'; }
      }
    }

    syncThemeUI();

    if (themeBtn) {
      themeBtn.addEventListener('click', function() {
        const currentTheme = document.documentElement.getAttribute('data-theme') || localStorage.getItem('theme') || 'light';
        const newTheme = currentTheme === 'dark' ? 'light' : 'dark';
        
        document.documentElement.setAttribute('data-theme', newTheme);
        localStorage.setItem('theme', newTheme);
        
        const mainToggle = document.getElementById('themeToggleBtn');
        if (mainToggle) mainToggle.click();
        
        syncThemeUI();
      });
    }
  });
</script>