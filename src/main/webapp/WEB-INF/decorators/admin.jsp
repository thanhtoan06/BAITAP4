<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title><sitemesh:write property="title"/></title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" rel="stylesheet">
    <style>
        body { font-family: 'Segoe UI', system-ui, -apple-system, sans-serif; background-color: #f4f6f9; }
        .sidebar { width: 260px; min-height: 100vh; background-color: #1e2836; color: #fff; }
        .sidebar .nav-link { color: #b0c4de; padding: 12px 20px; margin: 3px 12px; border-radius: 8px; transition: 0.2s; }
        .sidebar .nav-link:hover, .sidebar .nav-link.active { background-color: rgba(255, 255, 255, 0.12); color: #fff; }
        .sidebar .nav-link.active { border: 1px solid rgba(255, 255, 255, 0.25); font-weight: 600; }
        .main-content { flex: 1; min-height: 100vh; display: flex; flex-direction: column; }
        .top-header { background: #fff; border-bottom: 1px solid #e2e8f0; padding: 14px 28px; }
    </style>
    <sitemesh:write property="head"/>
</head>
<body>

<div class="d-flex">
    <div class="sidebar d-flex flex-column p-3">
        <div class="text-center py-3 mb-3 border-bottom border-secondary">
            <c:choose>
                <c:when test="${not empty sessionScope.account.avatar}">
                    <img src="${pageContext.request.contextPath}/uploads/${sessionScope.account.avatar}" class="rounded-circle mb-2 border border-2 border-danger" style="width: 70px; height: 70px; object-fit: cover;" alt="Avatar">
                </c:when>
                <c:otherwise>
                    <img src="https://cdn-icons-png.flaticon.com/512/149/149071.png" class="rounded-circle mb-2 border border-2 border-danger" style="width: 70px; height: 70px; object-fit: cover;" alt="Avatar">
                </c:otherwise>
            </c:choose>
            <h6 class="fw-bold mb-1 text-white">${not empty sessionScope.account.fullname ? sessionScope.account.fullname : 'Lê Thanh Toàn'}</h6>
            <span class="badge bg-danger rounded-pill px-3">Admin</span>
        </div>

        <ul class="nav nav-pills flex-column mb-auto">
            <li class="nav-item">
                <a href="${pageContext.request.contextPath}/admin/dashboard" class="nav-link">
                    <i class="fa-solid fa-chart-line me-2"></i> Dashboard
                </a>
            </li>
            <li>
                <a href="${pageContext.request.contextPath}/admin/categories" class="nav-link">
                    <i class="fa-solid fa-list-check me-2"></i> Quản lý Danh mục
                </a>
            </li>
            <li>
                <a href="${pageContext.request.contextPath}/admin/products" class="nav-link">
                    <i class="fa-solid fa-layer-group me-2"></i> Quản lý Sản phẩm
                </a>
            </li>
            <li>
                <a href="${pageContext.request.contextPath}/admin/accounts" class="nav-link">
                    <i class="fa-solid fa-users-gear me-2"></i> Quản lý Tài khoản
                </a>
            </li>
            <li>
                <a href="${pageContext.request.contextPath}/account/profile" class="nav-link active">
                    <i class="fa-solid fa-user-gear me-2"></i> Thông tin cá nhân
                </a>
            </li>
        </ul>
    </div>

    <div class="main-content">
        <div class="top-header d-flex justify-content-between align-items-center">
            <div class="d-flex align-items-center">
                <i class="fa-solid fa-bars fs-5 me-3 text-secondary" style="cursor: pointer;"></i>
                <h5 class="fw-bold mb-0 text-dark">Trang Quản Trị Hệ Thống</h5>
            </div>
            <div class="d-flex align-items-center gap-3">
                <span class="text-secondary">Xin chào, <strong class="text-dark">${not empty sessionScope.account.fullname ? sessionScope.account.fullname : 'Lê Thanh Toàn'}</strong></span>
                <a href="${pageContext.request.contextPath}/logout" class="btn btn-outline-danger btn-sm rounded-pill px-3">
                    <i class="fa-solid fa-right-from-bracket me-1"></i> Đăng xuất
                </a>
            </div>
        </div>

        <div class="p-4 flex-grow-1">
            <sitemesh:write property="body"/>
        </div>
    </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>