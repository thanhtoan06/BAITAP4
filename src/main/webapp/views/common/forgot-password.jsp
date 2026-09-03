<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Quên Mật Khẩu</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body class="bg-light min-vh-100 d-flex align-items-center justify-content-center">
<div class="container" style="max-width: 450px;">
    <div class="card border-0 shadow-lg rounded-4 p-4">
        <h3 class="text-center fw-bold text-primary mb-3">QUÊN MẬT KHẨU</h3>
        <p class="text-center text-muted small mb-4">Nhập email đã đăng ký để nhận mã OTP khôi phục</p>

        <c:if test="${not empty error}">
            <div class="alert alert-danger text-center py-2">${error}</div>
        </c:if>

        <form action="${pageContext.request.contextPath}/forgot-password" method="post">
            <div class="mb-3">
                <label class="form-label">Email tài khoản Admin</label>
                <input type="email" name="email" class="form-control" required>
            </div>
            <button type="submit" class="btn btn-primary w-100 py-2 rounded-3 fw-bold">Gửi Mã OTP</button>
        </form>
        <div class="text-center mt-3">
            <a href="${pageContext.request.contextPath}/login" class="text-decoration-none small">Quay lại Đăng nhập</a>
        </div>
    </div>
</div>
</body>
</html>