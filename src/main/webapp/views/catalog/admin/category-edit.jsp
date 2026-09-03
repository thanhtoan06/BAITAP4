<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Chỉnh sửa Danh mục</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" rel="stylesheet">
</head>
<body class="bg-light p-4">
    <div class="container" style="max-width: 600px;">
        <div class="card border-0 shadow-sm rounded-3">
            <div class="card-header bg-primary text-white py-3 fw-bold fs-5">
                <i class="fa fa-pen me-2"></i>Chỉnh sửa danh mục
            </div>
            <div class="card-body p-4">
                <form action="${pageContext.request.contextPath}/admin/category/edit" method="post" enctype="multipart/form-data">
                    <input type="hidden" name="cateId" value="${category.cateId}">
                    
                    <div class="mb-3">
                        <label class="form-label fw-bold">Tên danh mục:</label>
                        <input type="text" name="cateName" class="form-control" value="${category.cateName}" required>
                    </div>

                    <div class="mb-3">
                        <label class="form-label fw-bold">Icon hiện tại:</label><br>
                        <img src="${pageContext.request.contextPath}/uploads/${category.icons}" class="img-thumbnail mb-2" style="width: 80px; height: 80px; object-fit: contain;" onerror="this.onerror=null; this.src='https://via.placeholder.com/80?text=No+Img';">
                        <br>
                        <label class="form-label fw-bold text-muted small">Tải icon mới (để trống nếu không đổi):</label>
                        <input type="file" name="icon" class="form-control" accept="image/*">
                    </div>

                    <div class="d-flex justify-content-between pt-3">
                        <a href="${pageContext.request.contextPath}/admin/category" class="btn btn-secondary px-4"><i class="fa fa-arrow-left me-1"></i>Hủy</a>
                        <button type="submit" class="btn btn-success px-4"><i class="fa fa-save me-1"></i>Lưu lại</button>
                    </div>
                </form>
            </div>
        </div>
    </div>
</body>
</html>