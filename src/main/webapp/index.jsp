<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Hệ Thống Quản Trị - Trang Chủ</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" rel="stylesheet">
</head>
<body class="bg-light min-vh-100 d-flex align-items-center justify-content-center py-5">

<div class="container" style="max-width: 550px;">
    <div class="card border-0 shadow-lg rounded-4 overflow-hidden text-center">
        
        <div class="card-header bg-primary text-white py-5 border-0">
            <i class="fa fa-user-shield fa-4x mb-3"></i>
            <h2 class="fw-bold mb-2">HỆ THỐNG QUẢN TRỊ ADMIN</h2>
            <p class="mb-0 text-white-50 fs-6">Chào mừng bạn đến với trang quản trị hệ thống</p>
        </div>

        <div class="card-body p-4 p-md-5 bg-white">
            <p class="text-secondary fs-6 mb-4">Vui lòng đăng nhập bằng tài khoản Administrator để truy cập các chức năng quản lý danh mục và sản phẩm.</p>
            
            <div class="d-grid gap-3">
                <a href="${pageContext.request.contextPath}/login" 
                   class="btn btn-primary btn-lg py-3 rounded-3 shadow-sm fw-bold fs-5">
                    <i class="fa fa-right-to-bracket me-2"></i> Nhấn vào đây để đăng nhập
                </a>
            </div>
        </div>

        <div class="card-footer bg-light text-center py-3 border-0 text-muted small">
            &copy; 2026 Admin Portal - All Rights Reserved.
        </div>

    </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>