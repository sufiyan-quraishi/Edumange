<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!-- FontAwesome Icons -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css">

<header class="custom-navbar">
  <div class="navbar-container">
    
    <!-- Logo -->
    <a href="${pageContext.request.contextPath}/home" class="navbar-logo">
      <i class="fa-solid fa-graduation-cap logo-icon"></i>
      <span class="logo-text">EduManage</span>
    </a>

    <!-- Navigation Links With Icons -->
    <nav class="nav-links">
      <a href="${pageContext.request.contextPath}/home" class="nav-link ">
        <i class="fa-solid fa-house"></i> Home
      </a>
      <a href="${pageContext.request.contextPath}/about" class="nav-link">
        <i class="fa-solid fa-circle-info"></i> About
      </a>
      <a href="${pageContext.request.contextPath}/courses" class="nav-link">
        <i class="fa-solid fa-book-open"></i> Courses
      </a>
      <a href="${pageContext.request.contextPath}/contact" class="nav-link">
        <i class="fa-solid fa-envelope"></i> Contact
      </a>
    </nav>

    <!-- Actions: Theme Toggle + Login Button -->
    <div class="navbar-actions">
      <!-- Theme Button with JS-safe icon span -->
      <button id="themeToggleBtn" class="theme-btn" aria-label="Toggle Theme" type="button" title="Toggle Theme">
        <span id="themeIcon">🌙</span>
      </button>
      
      <a href="${pageContext.request.contextPath}/login" class="login-btn">
        <i class="fa-solid fa-right-to-bracket"></i> Login
      </a>
    </div>

    <!-- Theme & Chatbot Included -->
    <jsp:include page="/WEB-INF/views/common/theme-chatbot.jsp" />

  </div>
</header>

<script>
  // Safe handler to ensure theme toggle never fails even with icons
  (function() {
    const btn = document.getElementById('themeToggleBtn');
    if (btn) {
      btn.addEventListener('click', function() {
        const currentTheme = document.documentElement.getAttribute('data-theme') || localStorage.getItem('theme');
        const iconSpan = document.getElementById('themeIcon');
        if (currentTheme === 'dark') {
          if (iconSpan) iconSpan.textContent = '☀️';
        } else {
          if (iconSpan) iconSpan.textContent = '🌙';
        }
      });
    }
  })();
</script>