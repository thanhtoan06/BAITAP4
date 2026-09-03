<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Đăng Nhập Quản Trị Viên</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" rel="stylesheet">
<style>
    body { background-color: #f8f9fa; display: flex; align-items: center; justify-content: center; min-height: 100vh; }
    .login-card { width: 100%; max-width: 450px; border: 1px solid #e0e0e0; border-radius: 8px; background: #fff; padding: 30px; }
    .input-group-text { background: #fff; }
</style>
</head>
<body>
<div class="login-card shadow-sm">
    <div class="mb-3">
        <a href="${pageContext.request.contextPath}/" class="text-secondary text-decoration-none fs-6">
            <i class="fa fa-arrow-left me-1"></i> Quay về trang chủ
        </a>
    </div>

    <h4 class="text-center text-primary mb-3 fw-bold">Đăng Nhập Quản Trị Viên</h4>
    

    <c:if test="${not empty error}">
        <div class="alert alert-danger py-2 fs-6">${error}</div>
    </c:if>
    <c:if test="${not empty message}">
        <div class="alert alert-success py-2 fs-6">${message}</div>
    </c:if>
    
    <form action="${pageContext.request.contextPath}/login" method="post">
        <div class="input-group mb-3">
            <span class="input-group-text"><i class="fa fa-user text-muted"></i></span>
            <input type="text" name="username" class="form-control" placeholder="Tên đăng nhập Admin" value="${username}" required>
        </div>
        <div class="input-group mb-3">
            <span class="input-group-text"><i class="fa fa-lock text-muted"></i></span>
            <input type="password" name="password" class="form-control" placeholder="Mật khẩu" value="${password}" required>
        </div>
        
        <div class="d-flex justify-content-between align-items-center mb-3 fs-6">
            <div class="form-check">
                <input class="form-check-input" type="checkbox" name="remember" id="remember" ${not empty username ? 'checked' : ''}>
                <label class="form-check-label text-secondary" for="remember">Nhớ tôi</label>
            </div>
            <a href="${pageContext.request.contextPath}/forgot-password" class="text-danger text-decoration-none small">Quên mật khẩu?</a>
        </div>

        <button type="submit" class="btn btn-primary w-100 py-2 fs-5">Đăng nhập Admin</button>
    </form>
    
    <div class="text-center mt-4 text-secondary fs-6 border-top pt-3">
        Chưa có tài khoản Quản trị? <a href="${pageContext.request.contextPath}/register" class="text-primary text-decoration-none fw-bold">Đăng ký Admin mới</a>
    </div>
</div>
</body>
</html>