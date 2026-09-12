<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Assign Batch - EduManage</title>
    <!-- FontAwesome for Vector Icons -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
</head>
<body>

<div class="dashboard-layout">
    <!-- Sidebar Include -->
    <jsp:include page="/WEB-INF/views/common/admin-sidebar.jsp" />

    <!-- Main Content Area -->
    <main class="main-content">
        
        <!-- Header Bar -->
        <div class="header-bar" style="margin-bottom: 24px;">
            <div>
                <h2><i class="fas fa-layer-group" style="color: var(--primary);"></i> Batch Allocation</h2>
                <span style="color: var(--text-muted); font-size: 13.5px;">Assign instructors and map enrolled students to batch: <strong>${batch.batchName}</strong></span>
            </div>
            <a href="${pageContext.request.contextPath}/admin/batches" style="text-decoration: none;">
                <button type="button" class="mini-btn" style="padding: 10px 18px; font-size: 13.5px;">
                    <i class="fas fa-arrow-left"></i> Back to Batches
                </button>
            </a>
        </div>

        <!-- 2-Column Responsive Form Layout -->
        <div style="display: grid; grid-template-columns: repeat(auto-fit, minmax(360px, 1fr)); gap: 24px; align-items: start;">
            
            <!-- 1. Trainer Assignment Card -->
            <div class="dashboard-card" style="padding: 26px; border-radius: 18px; box-shadow: var(--shadow);">
                <div class="card-header-custom" style="margin-bottom: 20px; border-bottom: 1px solid var(--border); padding-bottom: 12px;">
                    <h6 style="margin: 0; font-size: 16px; color: var(--text);">
                        <i class="fas fa-chalkboard-teacher" style="color: var(--primary); margin-right: 6px;"></i> Assign Lead Trainer
                    </h6>
                    <span style="font-size: 12px; color: var(--text-muted);">Faculty Head</span>
                </div>

                <form action="${pageContext.request.contextPath}/admin/batches/${batch.id}/assign-trainer" method="post">
                    <div class="form-group" style="margin-bottom: 20px;">
                        <label style="display: block; font-weight: 600; font-size: 13.5px; color: var(--text); margin-bottom: 8px;">
                            Select Trainer / Mentor <span style="color: #ef4444;">*</span>
                        </label>
                        <select name="trainerId" required style="width: 100%; box-sizing: border-box; padding: 11px 14px; border-radius: 10px; border: 1px solid var(--border); background: var(--surface); color: var(--text); font-size: 14px;">
                            <option value="">-- Choose Assigned Trainer --</option>
                            <c:forEach var="t" items="${trainers}">
                                <option value="${t.id}">${t.fullName} (${t.email != null ? t.email : t.username})</option>
                            </c:forEach>
                        </select>
                    </div>

                    <button type="submit" class="btn-primary" style="width: 100%; padding: 12px; font-size: 14.5px; font-weight: 700; border-radius: 10px; display: flex; align-items: center; justify-content: center; gap: 8px;">
                        <i class="fas fa-user-check"></i> Update Trainer
                    </button>
                </form>
            </div>

            <!-- 2. Student Multi-Selection Card -->
            <div class="dashboard-card" style="padding: 26px; border-radius: 18px; box-shadow: var(--shadow);">
                <div class="card-header-custom" style="margin-bottom: 20px; border-bottom: 1px solid var(--border); padding-bottom: 12px;">
                    <h6 style="margin: 0; font-size: 16px; color: var(--text);">
                        <i class="fas fa-user-graduate" style="color: var(--primary); margin-right: 6px;"></i> Assign Students
                    </h6>
                    <span style="font-size: 12px; color: var(--text-muted);">Batch Enrolment</span>
                </div>

                <form action="${pageContext.request.contextPath}/admin/batches/${batch.id}/assign-students" method="post">
                    
                    <label style="display: block; font-weight: 600; font-size: 13.5px; color: var(--text); margin-bottom: 8px;">
                        Select Students to Map:
                    </label>

                    <div class="form-group" style="max-height: 260px; overflow-y: auto; padding: 12px; border: 1px solid var(--border); border-radius: 12px; background: var(--bg); margin-bottom: 20px; display: flex; flex-direction: column; gap: 10px;">
                        <c:forEach var="s" items="${students}">
                            <label style="font-weight: 500; font-size: 13.5px; color: var(--text); display: flex; align-items: center; gap: 10px; cursor: pointer; padding: 6px 8px; border-radius: 6px; transition: background 0.2s;" onmouseover="this.style.background='var(--surface)'" onmouseout="this.style.background='transparent'">
                                <input type="checkbox" name="studentIds" value="${s.id}" style="width: 16px; height: 16px; accent-color: var(--primary); cursor: pointer;">
                                <span><strong>${s.fullName}</strong> <small style="color: var(--text-muted); margin-left: 4px;">(@${s.username})</small></span>
                            </label>
                        </c:forEach>
                    </div>

                    <button type="submit" class="btn-primary" style="width: 100%; padding: 12px; font-size: 14.5px; font-weight: 700; border-radius: 10px; display: flex; align-items: center; justify-content: center; gap: 8px;">
                        <i class="fas fa-users-cog"></i> Save Student Allocation
                    </button>
                </form>
            </div>

        </div>

    </main>
    
</div>

</body>
</html>