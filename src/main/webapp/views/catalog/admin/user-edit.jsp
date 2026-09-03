<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Chỉnh sửa Tài khoản Admin</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" rel="stylesheet">
<style>
    body { background-color: #f1f5f9; font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif; }
    #sidebar { min-width: 260px; max-width: 260px; background: #1e293b; color: #fff; transition: all 0.3s; min-height: 100vh; }
    #sidebar.collapsed { margin-left: -260px; }
    #sidebar a { color: #cbd5e1; text-decoration: none; padding: 12px 20px; display: block; border-radius: 8px; margin: 4px 12px; }
    #sidebar a:hover, #sidebar a.active { background: #334155; color: #fff; }
    .top-navbar { background: #ffffff; border-bottom: 1px solid #e2e8f0; }
    .avatar-preview { width: 90px; height: 90px; object-fit: cover; border-radius: 50%; border: 3px solid #cbd5e1; }
</style>
</head>
<body>
<div class="d-flex">
    <jsp:include page="/views/catalog/admin/sidebar.jsp" />

    <div class="flex-grow-1">
        <div class="top-navbar d-flex justify-content-between align-items-center p-3 shadow-sm">
            <div class="d-flex align-items-center">
                <button id="toggleBtn" class="btn btn-light me-3 border"><i class="fa fa-bars fs-5"></i></button>
                <h4 class="m-0 fw-bold text-dark">Chỉnh sửa Tài khoản Admin</h4>
            </div>
            <div>
                <span class="me-3 text-secondary">Xin chào, <strong class="text-dark">${sessionScope.account.fullname}</strong></span>
                <a href="${pageContext.request.contextPath}/logout" class="btn btn-outline-danger btn-sm px-3 rounded-pill"><i class="fa fa-right-from-bracket me-1"></i>Đăng xuất</a>
            </div>
        </div>

        <div class="p-4">
            <div class="card border-0 shadow-sm rounded-4">
                <div class="card-header bg-white fw-bold py-3 fs-5">
                    <i class="fa fa-user-pen me-2 text-primary"></i>Cập nhật thông tin Admin (ID: ${user.id})
                </div>
                <div class="card-body p-4">
                    <form action="${pageContext.request.contextPath}/admin/user/edit" method="post" enctype="multipart/form-data">
                        <input type="hidden" name="id" value="${user.id}">

                        <div class="text-center mb-4">
                            <c:choose>
                                <c:when test="${not empty user.avatar}">
                                    <img src="${pageContext.request.contextPath}/uploads/${user.avatar}" class="avatar-preview mb-2" alt="Avatar">
                                </c:when>
                                <c:otherwise>
                                    <img src="https://cdn-icons-png.flaticon.com/512/149/149071.png" class="avatar-preview mb-2" alt="Default Avatar">
                                </c:otherwise>
                            </c:choose>
                        </div>

                        <div class="row g-3">
                            <div class="col-md-6">
                                <label class="form-label fw-bold">Tên đăng nhập</label>
                                <input type="text" name="username" class="form-control" value="${user.username}" required>
                            </div>
                            <div class="col-md-6">
                                <label class="form-label fw-bold">Họ và tên</label>
                                <input type="text" name="fullname" class="form-control" value="${user.fullname}" required>
                            </div>
                            <div class="col-md-6">
                                <label class="form-label fw-bold">Email</label>
                                <input type="email" name="email" class="form-control" value="${user.email}" required>
                            </div>
                            <div class="col-md-6">
                                <label class="form-label fw-bold">Số điện thoại</label>
                                <input type="text" name="phone" class="form-control" value="${user.phone}">
                            </div>
                            <div class="col-md-6">
                                <label class="form-label fw-bold">Mật khẩu mới (Để trống nếu không muốn đổi)</label>
                                <input type="password" name="password" class="form-control" placeholder="••••••••">
                            </div>
                            <div class="col-md-6">
                                <label class="form-label fw-bold">Ảnh đại diện mới</label>
                                <input type="file" name="avatar" class="form-control" accept="image/*">
                            </div>
                            <div class="col-12 mt-4 text-end">
                                <a href="${pageContext.request.contextPath}/admin/user" class="btn btn-secondary px-4 me-2"><i class="fa fa-arrow-left me-1"></i>Hủy</a>
                                <button type="submit" class="btn btn-primary px-4 fw-bold"><i class="fa fa-floppy-disk me-1"></i>Lưu thay đổi</button>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
<script>
    var toggleBtn = document.getElementById('toggleBtn');
    if(toggleBtn) {
        toggleBtn.addEventListener('click', function() {
            var sidebar = document.getElementById('sidebar');
            if(sidebar) sidebar.classList.toggle('collapsed');
        });
    }
</script>
</body>
</html>