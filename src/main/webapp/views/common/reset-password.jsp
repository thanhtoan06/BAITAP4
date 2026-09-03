<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Đặt Lại Mật Khẩu</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body class="bg-light min-vh-100 d-flex align-items-center justify-content-center">
<div class="container" style="max-width: 450px;">
    <div class="card border-0 shadow-lg rounded-4 p-4">
        <h3 class="text-center fw-bold text-primary mb-3">ĐẶT LẠI MẬT KHẨU</h3>
        <p class="text-center text-muted small mb-4">Nhập mã OTP vừa nhận từ email và mật khẩu mới của bạn</p>

        <c:if test="${not empty error}">
            <div class="alert alert-danger text-center py-2">${error}</div>
        </c:if>

        <form action="${pageContext.request.contextPath}/reset-password" method="post">
            <div class="mb-3">
                <label class="form-label font-weight-bold">Mã OTP (6 chữ số)</label>
                <input type="text" name="otp" class="form-control text-center fs-4 tracking-widest" maxlength="6" placeholder="------" required autofocus>
            </div>
            
            <div class="mb-3">
                <label class="form-label font-weight-bold">Mật khẩu mới</label>
                <input type="password" name="newPassword" class="form-control" placeholder="Nhập mật khẩu mới..." required>
            </div>

            <button type="submit" id="btnSubmit" class="btn btn-primary w-100 py-2 rounded-3 fw-bold mb-3">Xác Nhận Đổi Mật Khẩu</button>
        </form>

        <div class="text-center small text-secondary">
            Mã OTP hết hạn sau: <span id="countdown" class="fw-bold text-danger">01:00</span>
        </div>

        <div class="text-center mt-3">
            <a href="${pageContext.request.contextPath}/login" class="text-decoration-none small">Quay lại Đăng nhập</a>
        </div>
    </div>
</div>

<script>
    <% 
        Long resetExpireTime = (Long) session.getAttribute("resetExpireTime");
        long remainingResetSeconds = 0;
        if (resetExpireTime != null) {
            remainingResetSeconds = Math.max(0, (resetExpireTime - System.currentTimeMillis()) / 1000);
        }
    %>
    var timeLeft = <%= remainingResetSeconds %>;
    var countdownElement = document.getElementById('countdown');
    var btnSubmit = document.getElementById('btnSubmit');

    function updateTimer() {
        if (timeLeft <= 0) {
            countdownElement.textContent = "Đã hết hạn! Đang chuyển hướng...";
            btnSubmit.disabled = true;
            btnSubmit.classList.add('btn-secondary');
            btnSubmit.classList.remove('btn-primary');
            setTimeout(function() {
                window.location.href = "${pageContext.request.contextPath}/forgot-password";
            }, 1000);
            return;
        }

        var minutes = Math.floor(timeLeft / 60);
        var seconds = timeLeft % 60;
        
        if (seconds < 10) seconds = '0' + seconds;
        if (minutes < 10) minutes = '0' + minutes;

        countdownElement.textContent = minutes + ':' + seconds;
        timeLeft--;
    }

    updateTimer();
    var timer = setInterval(updateTimer, 1000);
</script>
</body>
</html>