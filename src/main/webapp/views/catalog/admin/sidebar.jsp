<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>

<div id="sidebar" class="d-flex flex-column p-2 shadow" style="width: 260px; min-width: 260px; max-width: 260px; background-color: #1e293b; min-height: 100vh; overflow: hidden; color: #fff;">
    <div class="text-center py-4">
        <c:choose>
            <c:when test="${not empty sessionScope.account.avatar}">
                <img src="${pageContext.request.contextPath}/uploads/${sessionScope.account.avatar}" class="avatar-lg mb-2" alt="Avatar" style="width: 80px; height: 80px; object-fit: cover; border-radius: 50%; border: 3px solid #ef4444; display: inline-block;">
            </c:when>
            <c:otherwise>
                <img src="https://cdn-icons-png.flaticon.com/512/149/149071.png" class="avatar-lg mb-2" alt="Default Avatar" style="width: 80px; height: 80px; object-fit: cover; border-radius: 50%; border: 3px solid #ef4444; display: inline-block;">
            </c:otherwise>
        </c:choose>
        <h6 class="mb-1 fw-bold text-white">${sessionScope.account.fullname}</h6>
        <span class="badge bg-danger px-3 py-1">Admin</span>
    </div>
    <hr class="border-secondary mx-3" style="opacity: 0.25;">
    <a href="${pageContext.request.contextPath}/admin/dashboard"><i class="fa fa-gauge me-2"></i>Dashboard</a> 
    <a href="${pageContext.request.contextPath}/admin/category"><i class="fa fa-list me-2"></i>Quản lý Danh mục</a> 
    <a href="${pageContext.request.contextPath}/product"><i class="fa fa-layer-group me-2"></i>Quản lý Sản phẩm</a> 
    <a href="${pageContext.request.contextPath}/admin/user"><i class="fa fa-users-gear me-2"></i>Quản lý Tài khoản</a>
    <a href="${pageContext.request.contextPath}/account/profile"><i class="fa fa-user-gear me-2"></i>Thông tin cá nhân</a>
</div>