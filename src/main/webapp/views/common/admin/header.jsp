<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<div class="top-navbar d-flex justify-content-between align-items-center p-3 shadow-sm bg-white border-bottom">
    <div class="d-flex align-items-center">
        <button id="toggleBtn" class="btn btn-light me-3 border">
            <i class="fa fa-bars fs-5"></i>
        </button>
        <h4 class="m-0 fw-bold text-dark">Hệ Thống Quản Trị</h4>
    </div>
    <div>
        <span class="me-3 text-secondary">Xin chào, <strong class="text-dark">${sessionScope.account.fullname} (Admin)</strong></span>
        <a href="${pageContext.request.contextPath}/logout" class="btn btn-outline-danger btn-sm px-3 rounded-pill">
            <i class="fa fa-right-from-bracket me-1"></i>Đăng xuất
        </a>
    </div>
</div>