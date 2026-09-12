<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Trainer Management - EduManage</title>
    <!-- FontAwesome for Vector Icons -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
    <style>
        .trainers-page-container {
            width: 100%;
            max-width: 100%;
            box-sizing: border-box;
        }
        .trainer-table-card {
            background: var(--surface, #ffffff);
            border: 1px solid var(--border, #e2e8f0);
            border-radius: 16px;
            padding: 24px;
            box-shadow: var(--shadow, 0 4px 6px -1px rgba(0,0,0,0.05));
            overflow: hidden;
        }
        .table-responsive {
            width: 100%;
            overflow-x: auto;
            margin-top: 10px;
        }
        .custom-trainer-table {
            width: 100%;
            border-collapse: collapse;
            text-align: left;
        }
        .custom-trainer-table th {
            background: var(--bg, #f8fafc);
            color: var(--text, #1e293b);
            font-size: 13px;
            font-weight: 700;
            padding: 14px 16px;
            border-bottom: 2px solid var(--border, #e2e8f0);
            white-space: nowrap;
        }
        .custom-trainer-table td {
            padding: 14px 16px;
            font-size: 13.5px;
            color: var(--text, #334155);
            border-bottom: 1px solid var(--border, #e2e8f0);
            vertical-align: middle;
        }
        .custom-trainer-table tr:last-child td {
            border-bottom: none;
        }
        .custom-trainer-table tr:hover {
            background: rgba(79, 110, 247, 0.03);
        }
        .btn-action-edit {
            background: var(--primary, #4f6ef7);
            color: #fff !important;
            padding: 6px 12px;
            border-radius: 8px;
            font-size: 12.5px;
            font-weight: 600;
            text-decoration: none;
            display: inline-flex;
            align-items: center;
            gap: 5px;
            border: none;
            transition: opacity 0.2s;
        }
        .btn-action-edit:hover {
            opacity: 0.9;
        }
        .btn-action-delete {
            background: rgba(239, 68, 68, 0.12);
            color: #ef4444;
            border: 1px solid rgba(239, 68, 68, 0.3);
            padding: 6px 12px;
            font-size: 12.5px;
            font-weight: 600;
            border-radius: 8px;
            display: inline-flex;
            align-items: center;
            gap: 5px;
            cursor: pointer;
            transition: background 0.2s;
        }
        .btn-action-delete:hover {
            background: #ef4444;
            color: #fff;
        }
    </style>
</head>
<body>

<div class="dashboard-layout">
    <!-- Sidebar Navigation -->
    <jsp:include page="/WEB-INF/views/common/admin-sidebar.jsp"/>

    <!-- Main Content Area -->
    <main class="main-content">
        <div class="trainers-page-container">
            
            <!-- Header Bar -->
            <div class="header-bar" style="margin-bottom: 24px; display: flex; justify-content: space-between; align-items: center; flex-wrap: wrap; gap: 15px;">
                <div>
                    <h2 style="margin: 0; font-size: 22px; font-weight: 800; color: var(--text, #0f172a);">
                        <i class="fas fa-chalkboard-teacher" style="color: var(--primary, #4f6ef7); margin-right: 8px;"></i> Trainer Management
                    </h2>
                    <span style="color: var(--text-muted, #64748b); font-size: 13.5px;">Manage faculty instructors, access credentials, and teaching assignments.</span>
                </div>
                <a href="${pageContext.request.contextPath}/admin/trainers/add" style="text-decoration: none;">
                    <button type="button" class="btn-primary" style="padding: 10px 18px; font-size: 13.5px; font-weight: 700; border-radius: 10px; display: inline-flex; align-items: center; gap: 8px; cursor: pointer; border: none;">
                        <i class="fas fa-plus"></i> ADD TRAINER
                    </button>
                </a>
            </div>

            <!-- Trainer Directory Card -->
            <div class="trainer-table-card">
                
                <div style="display: flex; justify-content: space-between; align-items: center; border-bottom: 1px solid var(--border, #e2e8f0); padding-bottom: 14px; margin-bottom: 10px;">
                    <div>
                        <h5 style="margin: 0; font-size: 16px; font-weight: 700; color: var(--text, #1e293b);">
                            <i class="fas fa-user-tie" style="color: var(--primary, #4f6ef7); margin-right: 6px;"></i> Faculty Instructor Directory
                        </h5>
                        <small style="color: var(--text-muted, #64748b); font-size: 12.5px;">All verified and active faculty accounts</small>
                    </div>
                    <span class="badge badge-approved" style="font-size: 12px; font-weight: 700;">
                        <i class="fas fa-id-badge" style="margin-right: 4px;"></i> Total: ${fn:length(trainers)}
                    </span>
                </div>

                <div class="table-responsive">
                    <table class="custom-trainer-table">
                        <thead>
                            <tr>
                                <th style="width: 60px;">ID</th>
                                <th><i class="fas fa-user" style="color: var(--primary, #4f6ef7); margin-right: 6px;"></i> Full Name</th>
                                <th><i class="fas fa-user-tag" style="color: var(--primary, #4f6ef7); margin-right: 6px;"></i> Username</th>
                                <th><i class="fas fa-envelope" style="color: var(--primary, #4f6ef7); margin-right: 6px;"></i> Email</th>
                                <th><i class="fas fa-phone-alt" style="color: var(--primary, #4f6ef7); margin-right: 6px;"></i> Phone</th>
                                <th style="text-align: center;"><i class="fas fa-shield-alt" style="color: var(--primary, #4f6ef7); margin-right: 6px;"></i> Status</th>
                                <th style="text-align: center;"><i class="fas fa-cog" style="color: var(--primary, #4f6ef7); margin-right: 6px;"></i> Actions</th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:choose>
                                <c:when test="${not empty trainers}">
                                    <c:forEach var="t" items="${trainers}">
                                        <tr>
                                            <td>
                                                <strong style="color: var(--text-muted, #64748b); font-size: 12.5px;">#${t.id}</strong>
                                            </td>
                                            <td>
                                                <strong style="color: var(--text, #0f172a); font-size: 14px;">${t.fullName}</strong>
                                            </td>
                                            <td>
                                                <span style="font-family: monospace; font-size: 13px; color: var(--primary, #4f6ef7); font-weight: 600; background: rgba(79, 110, 247, 0.08); padding: 3px 8px; border-radius: 6px;">
                                                    @${t.username}
                                                </span>
                                            </td>
                                            <td>
                                                <span style="color: var(--text, #334155); font-size: 13px;">${t.email != null ? t.email : '-'}</span>
                                            </td>
                                            <td>
                                                <span style="color: var(--text, #334155); font-size: 13px;">${t.phone != null ? t.phone : '-'}</span>
                                            </td>
                                            <td style="text-align: center;">
                                                <c:choose>
                                                    <c:when test="${t.active}">
                                                        <span class="badge badge-approved" style="font-size: 12px;">
                                                            <i class="fas fa-check-circle" style="margin-right: 3px;"></i> Active
                                                        </span>
                                                    </c:when>
                                                    <c:otherwise>
                                                        <span class="badge badge-rejected" style="font-size: 12px;">
                                                            <i class="fas fa-ban" style="margin-right: 3px;"></i> Inactive
                                                        </span>
                                                    </c:otherwise>
                                                </c:choose>
                                            </td>
                                            <td style="text-align: center;">
                                                <div style="display: inline-flex; align-items: center; gap: 8px; justify-content: center;">
                                                    <a href="${pageContext.request.contextPath}/admin/trainers/edit/${t.id}" class="btn-action-edit">
                                                        <i class="fas fa-edit"></i> Edit
                                                    </a>

                                                    <form action="${pageContext.request.contextPath}/admin/trainers/delete/${t.id}" method="post" style="display: inline; margin: 0;" onsubmit="return confirm('Are you sure you want to delete this trainer? All linked batch assignments will be reset.');">
                                                        <button type="submit" class="btn-action-delete">
                                                            <i class="fas fa-trash-alt"></i> Delete
                                                        </button>
                                                    </form>
                                                </div>
                                            </td>
                                        </tr>
                                    </c:forEach>
                                </c:when>
                                <c:otherwise>
                                    <tr>
                                        <td colspan="7" style="text-align: center; padding: 28px; color: var(--text-muted, #64748b);">
                                            <i class="fas fa-chalkboard-teacher" style="margin-right: 6px; font-size: 18px;"></i> No trainers registered in the system.
                                        </td>
                                    </tr>
                                </c:otherwise>
                            </c:choose>
                        </tbody>
                    </table>
                </div>

            </div>

           
        </div>
    </main>
</div>

</body>
</html>