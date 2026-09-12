(function () {
  // Context Path Fallback
  var ctx = window.EDUMANAGE_CONTEXT_PATH || '';

  // Comprehensive Knowledge Base
  var FAQ = [
    // Greetings & Introduction
    {
      keys: ['hi', 'hello', 'hey', 'namaste', 'start', 'help'],
      answer: 'Hello! 👋 Welcome to <b>EduManage Portal</b>.<br><br>I can assist you with:<ul><li>Course Details & Syllabus</li><li>Admission & Registration Process</li><li>Fees, Discounts & Payment Modes</li><li>Batch Timings & Trainer Details</li><li>Student Login & Dashboard Access</li><li>Placement & Certification Support</li><li>Contact Details & WhatsApp Support</li></ul>How can I help you today?'
    },

    // WhatsApp Support
    {
      keys: ['whatsapp', 'wa', 'chat support', 'number', 'mobile'],
      answer: '📱 <b>Official WhatsApp Support:</b><br>You can instantly connect with our counselor on WhatsApp:<br><a href="https://wa.me/919876543210" target="_blank" style="color: #2563eb; font-weight: bold; text-decoration: underline;">👉 Click here to Chat on WhatsApp (+91 98765 43210)</a><br><br>Working Hours: Mon - Sat (9:00 AM to 7:00 PM).'
    },

    // Contact & Email & Location
    {
      keys: ['contact', 'email', 'mail', 'phone', 'call', 'address', 'location', 'office'],
      answer: '📞 <b>EduManage Contact & Office Details:</b><br><ul><li><b>Email:</b> <a href="mailto:info@edumanage.com">info@edumanage.com</a> / <a href="mailto:admissions@edumanage.com">admissions@edumanage.com</a></li><li><b>Helpline:</b> +91 98765 43210 / +91 98765 43211</li><li><b>Office Location:</b> IT Park Main Campus, Tech City, India</li><li><b>Website Page:</b> <a href="' + ctx + '/contact" style="color:#2563eb;">Visit Contact Us Page</a></li></ul>'
    },

    // Registration Process
    {
      keys: ['register', 'registration', 'admission', 'apply', 'join', 'enroll', 'new student', 'how to join'],
      answer: '📝 <b>Admission & Registration Steps:</b><br><ol><li>Go to the <a href="' + ctx + '/registration" style="color:#2563eb; font-weight: bold;">Registration Page</a>.</li><li>Fill in your Full Name, Email, Phone Number, and select your desired Course.</li><li>Submit the form. Our Admission Team will review your application.</li><li>Within 2 to 4 hours, you will receive your Student ID & temporary login credentials via Email/SMS.</li><li>Login, complete verification, and your batch will be assigned!</li></ol>'
    },

    // Login & Password Issues
    {
      keys: ['login', 'sign in', 'signin', 'password', 'forgot password', 'account', 'portal access'],
      answer: '🔐 <b>Student & Trainer Login:</b><br><ul><li>You can log in directly here: <a href="' + ctx + '/login" style="color:#2563eb; font-weight: bold;">Go to Login Page</a></li><li>Use the <b>Username / Email</b> and password sent to your registered email.</li><li><b>Forgot Password?</b> Contact support at <a href="mailto:support@edumanage.com">support@edumanage.com</a> for an instant reset.</li></ul>'
    },

    // All Courses
    {
      keys: ['course', 'courses', 'programs', 'offer', 'all course', 'what do you teach'],
      answer: '🎓 <b>Industry-Ready Programs Offered:</b><br><ol><li><b>Java Full Stack Development:</b> Core Java, Advanced Java, Spring Boot, Microservices, Hibernate, REST APIs, MySQL, PostgreSQL, React/Angular.</li><li><b>Python & Data Science:</b> Python, Pandas, NumPy, Machine Learning, Deep Learning, SQL & Tableau.</li><li><b>Frontend Development:</b> HTML5, CSS3, JavaScript (ES6+), React.js, Tailwind CSS, Bootstrap.</li><li><b>Digital Marketing & SEO:</b> Search Engine Optimization, Google Ads, Meta Ads, Analytics, Content Strategy.</li></ol>Check our <a href="' + ctx + '/courses" style="color:#2563eb;">Courses Page</a> for syllabus details.'
    },

    // Java Course Specific
    {
      keys: ['java', 'spring', 'springboot', 'hibernate', 'microservices', 'backend'],
      answer: '☕ <b>Java Full Stack Development Track:</b><br><ul><li><b>Core & Advanced Java:</b> OOPs, Collections, Exception Handling, Multithreading, JDBC, Servlets & JSP.</li><li><b>Frameworks:</b> Spring Core, Spring Boot, Spring Data JPA, Hibernate, RESTful Web Services.</li><li><b>Database:</b> MySQL, PostgreSQL & Database Indexing/Optimization.</li><li><b>Frontend:</b> HTML, CSS, JavaScript & React.js integration.</li><li><b>Tools:</b> Git, GitHub, Maven, Postman, Docker basics.</li><li><b>Outcome:</b> Build 3+ Enterprise level live projects with placement readiness.</li></ul>'
    },

    // Python & Data Science
    {
      keys: ['python', 'data science', 'machine learning', 'ml', 'ai', 'data analytics'],
      answer: '🐍 <b>Python & Data Science Program:</b><br><ul><li>Python core programming & Data Structures.</li><li>Data Analysis with NumPy, Pandas, and Matplotlib/Seaborn.</li><li>Machine Learning algorithms, Scikit-Learn & Model deployment.</li><li>SQL querying & PowerBI/Tableau dashboard creation.</li><li>Real-world case studies and industry datasets.</li></ul>'
    },

    // Fees & Payment Options
    {
      keys: ['fee', 'fees', 'price', 'cost', 'installment', 'discount', 'scholarship', 'emi'],
      answer: '💰 <b>Fee Structure & Payment Options:</b><br><ul><li>Course fees range depending on the domain and specialization (Certificate vs Full-Stack Professional tracks).</li><li><b>Payment Modes:</b> UPI, Net Banking, Credit/Debit Cards, and No-Cost EMI (3 to 6 months).</li><li><b>Discounts:</b> Early-bird discounts and merit scholarships are available for new batches.</li><li>For exact course-wise fee quotes, please connect via our <a href="' + ctx + '/contact" style="color:#2563eb;">Inquiry Form</a> or chat directly with our finance desk on WhatsApp.</li></ul>'
    },

    // Batches & Timings
    {
      keys: ['batch', 'batches', 'schedule', 'timing', 'time', 'weekend', 'weekday', 'morning', 'evening'],
      answer: '⏰ <b>Batch Schedules & Flexibility:</b><br><ul><li><b>Weekday Batches:</b> Monday to Friday (Morning: 8:00 AM - 10:00 AM | Evening: 6:30 PM - 8:30 PM).</li><li><b>Weekend Batches:</b> Saturday & Sunday (Specialized for working professionals: 10:00 AM - 2:00 PM).</li><li>Batches run in small interactive groups (maximum 20-25 students) for personal mentorship.</li><li>Missed a class? Full HD recorded sessions are updated on your dashboard within 2 hours.</li></ul>'
    },

    // Trainers & Instructors
    {
      keys: ['trainer', 'trainers', 'teacher', 'faculty', 'instructor', 'mentor'],
      answer: '👨‍🏫 <b>Expert Faculty & Mentorship:</b><br><ul><li>All our instructors are Senior Software Engineers & Tech Leads with 6+ years of industry experience.</li><li>Dedicated doubt-clearing sessions are conducted after every lecture.</li><li>Once enrolled, your assigned trainer profile and direct support window appear on your Student Dashboard.</li></ul>'
    },

    // Placements & Job Support
    {
      keys: ['placement', 'job', 'interview', 'resume', 'hiring', 'companies', 'career', 'salary'],
      answer: '🚀 <b>100% Placement Assistance:</b><br><ul><li>Dedicated placement cell with 150+ hiring partner companies.</li><li>Resume building, GitHub portfolio review, and LinkedIn profile optimization.</li><li>Unlimited mock technical and HR interviews before client drives.</li><li>Average Package: 4.5 LPA to 8.5 LPA (depending on skills and track).</li></ul>'
    },

    // Tasks & Assignments
    {
      keys: ['task', 'tasks', 'assignment', 'assignments', 'homework', 'project', 'exam', 'test'],
      answer: '💻 <b>Assignments & Projects Portal:</b><br><ul><li>After every module, practical tasks are uploaded under <b>My Tasks</b> in your Student Dashboard.</li><li>Code submissions are reviewed with feedback from trainers within 48 hours.</li><li>Weekly coding assessments and a Capstone Live Project submission are required for course completion.</li></ul>'
    },

    // Attendance & Progress
    {
      keys: ['attendance', 'track', 'progress', 'portal'],
      answer: '📊 <b>Attendance & Progress Tracking:</b><br>Trainers mark daily class presence automatically. You can track your overall percentage, module progress, and task grading under the <b>My Attendance & Analytics</b> tab on your dashboard.'
    },

    // Certificate
    {
      keys: ['certificate', 'certification', 'iso', 'verified'],
      answer: '📜 <b>Course Certification:</b><br>Upon successful completion of the coursework, live projects, and final assessment, you receive an ISO-certified, globally verifiable EduManage Certificate with a unique QR code for LinkedIn verification.'
    },

    // Refund Policy
    {
      keys: ['refund', 'cancel', 'cancellation', 'money back'],
      answer: '🔄 <b>Refund & Policy:</b><br>We provide a 7-day money-back guarantee if requested before the start of the 3rd live class of the batch. For more terms, contact <a href="mailto:support@edumanage.com">support@edumanage.com</a>.'
    }
  ];

  var QUICK_REPLIES = [
    'Courses & Syllabus', 
    'Admission & Apply', 
    'Fees & EMI', 
    'WhatsApp Help', 
    'Student Login', 
    'Placement Support'
  ];

  function findAnswer(text) {
    var lower = text.toLowerCase();
    for (var i = 0; i < FAQ.length; i++) {
      for (var j = 0; j < FAQ[i].keys.length; j++) {
        if (lower.indexOf(FAQ[i].keys[j]) !== -1) {
          return FAQ[i].answer;
        }
      }
    }
    return "I couldn't find a direct answer for your query. 🤔<br><br>You can chat directly with our counselor on WhatsApp: <a href='https://wa.me/919876543210' target='_blank' style='color:#2563eb; font-weight:bold;'>Click Here (+91 98765 43210)</a> or drop an email at <b>info@edumanage.com</b>.";
  }

  function addMessage(container, htmlContent, cls) {
    if (!container) return;
    var div = document.createElement('div');
    div.className = 'chat-msg ' + cls;
    div.innerHTML = htmlContent;
    container.appendChild(div);
    container.scrollTop = container.scrollHeight;
  }

  function initChatbot() {
    var bubble = document.getElementById('chatbotBubble');
    var panel = document.getElementById('chatbotPanel');
    var closeBtn = document.getElementById('chatbotClose');
    var messages = document.getElementById('chatbotMessages');
    var input = document.getElementById('chatbotInput');
    var sendBtn = document.getElementById('chatbotSend');
    var quickWrap = document.getElementById('chatbotQuick');

    if (!bubble || !panel) return;

    // Toggle Chat Panel safely
    bubble.onclick = function (e) {
      e.stopPropagation();
      var currentDisplay = window.getComputedStyle(panel).display;
      if (currentDisplay === 'none') {
        panel.style.display = 'flex';
        if (input) input.focus();
      } else {
        panel.style.display = 'none';
      }
    };

    if (closeBtn) {
      closeBtn.onclick = function (e) {
        e.stopPropagation();
        panel.style.display = 'none';
      };
    }

    // Load Quick Action Chips
    if (quickWrap) {
      quickWrap.innerHTML = '';
      QUICK_REPLIES.forEach(function (label) {
        var b = document.createElement('button');
        b.type = 'button';
        b.className = 'quick-chip';
        b.textContent = label;
        b.onclick = function (e) {
          e.preventDefault();
          handleUserMessage(label);
        };
        quickWrap.appendChild(b);
      });
    }

    function handleUserMessage(text) {
      if (!text || !text.trim()) return;
      var cleanText = text.trim();

      // Add user message
      var userDiv = document.createElement('div');
      userDiv.className = 'chat-msg user';
      userDiv.textContent = cleanText;
      messages.appendChild(userDiv);
      messages.scrollTop = messages.scrollHeight;

      if (input) input.value = '';

      // Simulate bot reply
      setTimeout(function () {
        addMessage(messages, findAnswer(cleanText), 'bot');
      }, 300);
    }

    if (sendBtn) {
      sendBtn.onclick = function (e) {
        e.preventDefault();
        if (input) handleUserMessage(input.value);
      };
    }

    if (input) {
      input.onkeydown = function (e) {
        if (e.key === 'Enter') {
          e.preventDefault();
          handleUserMessage(input.value);
        }
      };
    }
  }

  // Multi-state initialization (handles both synchronous and asynchronous load)
  if (document.readyState === 'loading') {
    document.addEventListener('DOMContentLoaded', initChatbot);
  } else {
    initChatbot();
  }
})();