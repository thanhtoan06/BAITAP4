<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Đăng Ký Tài Khoản Admin</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" rel="stylesheet">
<style>
    body { background-color: #f8f9fa; display: flex; align-items: center; justify-content: center; min-height: 100vh; }
    .register-card { width: 100%; max-width: 500px; background: #fff; padding: 30px; border-radius: 8px; border: 1px solid #e0e0e0; }
</style>
</head>
<body>
<div class="register-card shadow-sm">
    <h3 class="text-center text-primary mb-3 fw-bold">Đăng Ký Quản Trị Viên</h3>
    <p class="text-center text-muted small mb-4">Mã xác thực OTP sẽ được gửi về Email của bạn để kích hoạt tài khoản.</p>

    <c:if test="${not empty error}">
        <div class="alert alert-danger py-2">${error}</div>
    </c:if>

    <form action="${pageContext.request.contextPath}/register" method="post">
        <div class="mb-3">
            <label class="form-label fw-bold">Tên đăng nhập Admin:</label>
            <input type="text" name="username" class="form-control" required placeholder="Nhập username">
        </div>
        <div class="mb-3">
            <label class="form-label fw-bold">Email nhận OTP:</label>
            <input type="email" name="email" class="form-control" required placeholder="example@gmail.com">
        </div>
        <div class="mb-3">
            <label class="form-label fw-bold">Họ và tên Admin:</label>
            <input type="text" name="fullname" class="form-control" required placeholder="Nhập họ và tên">
        </div>
        <div class="mb-3">
            <label class="form-label fw-bold">Số điện thoại:</label>
            <input type="text" name="phone" class="form-control" placeholder="Nhập số điện thoại">
        </div>
        <div class="mb-3">
            <label class="form-label fw-bold">Mật khẩu:</label>
            <input type="password" name="password" class="form-control" required placeholder="Nhập mật khẩu">
        </div>
        <button type="submit" class="btn btn-success w-100 py-2 fs-5">Đăng ký & Nhận mã OTP</button>
    </form>
    
    <div class="text-center mt-3">
        Đã có tài khoản? <a href="${pageContext.request.contextPath}/login" class="text-primary text-decoration-none fw-bold">Đăng nhập ngay</a>
    </div>
</div>
</body>
</html>