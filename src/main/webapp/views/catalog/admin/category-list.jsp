<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<%@ taglib prefix="fn" uri="jakarta.tags.functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Quản lý Danh mục</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" rel="stylesheet">
<style>
body { background-color: #f1f5f9; font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif; overflow-x: hidden; }
#sidebar { width: 260px; min-width: 260px; max-width: 260px; background-color: #1e293b !important; color: #fff; transition: all 0.3s; min-height: 100vh; z-index: 1000; }
#sidebar.collapsed { margin-left: -260px; }
#sidebar a { color: #cbd5e1; text-decoration: none; padding: 12px 20px; display: block; border-radius: 8px; margin: 4px 12px; }
#sidebar a:hover, #sidebar a.active { background: #334155; color: #fff; }
.top-navbar { background: #ffffff; border-bottom: 1px solid #e2e8f0; }
.cate-icon-lg { width: 60px; height: 60px; object-fit: contain; border-radius: 12px; background: #ffffff; padding: 6px; border: 1px solid #e2e8f0; }
.prod-thumb { width: 45px; height: 45px; object-fit: contain; border-radius: 8px; border: 1px solid #e2e8f0; }
.table-medium td, .table-medium th { padding: 1rem !important; vertical-align: middle; }
</style>
</head>
<body>
	<div class="d-flex">
		<jsp:include page="/views/catalog/admin/sidebar.jsp" />

		<div class="flex-grow-1 overflow-hidden">
			<div class="top-navbar d-flex justify-content-between align-items-center p-3 shadow-sm">
				<div class="d-flex align-items-center">
					<button id="toggleBtn" class="btn btn-light me-3 border"><i class="fa fa-bars fs-5"></i></button>
					<h4 class="m-0 fw-bold text-dark">Quản lý Danh mục</h4>
				</div>
				<div>
					<span class="me-3 text-secondary">Xin chào, <strong class="text-dark">${sessionScope.account.fullname}</strong></span> 
					<a href="${pageContext.request.contextPath}/logout" class="btn btn-outline-danger btn-sm px-3 rounded-pill"><i class="fa fa-right-from-bracket me-1"></i>Đăng xuất</a>
				</div>
			</div>
			
			<div class="p-4">
				<div class="card border-0 shadow-sm rounded-4 mb-4">
					<div class="card-header bg-white fw-bold py-3 fs-6"><i class="fa fa-filter me-1 text-primary"></i>Tìm kiếm danh mục</div>
					<div class="card-body p-3">
						<form action="${pageContext.request.contextPath}/admin/category" method="get" class="row g-3">
							<div class="col-md-9">
								<input type="text" name="keyword" value="${keyword}" class="form-control form-control-lg fs-6" placeholder="Nhập tên danh mục cần tìm...">
							</div>
							<div class="col-md-3">
								<button type="submit" class="btn btn-primary btn-lg w-100 fs-6"><i class="fa fa-search me-1"></i>Tìm kiếm</button>
							</div>
						</form>
					</div>
				</div>

				<div class="card border-0 shadow-sm rounded-4 mb-4">
					<div class="card-header bg-white fw-bold py-3 fs-6"><i class="fa fa-plus me-1 text-success"></i>Thêm danh mục mới</div>
					<div class="card-body p-3">
						<form action="${pageContext.request.contextPath}/admin/category/add" method="post" enctype="multipart/form-data" class="row g-3">
							<div class="col-md-5">
								<input type="text" name="cateName" class="form-control form-control-lg fs-6" placeholder="Tên danh mục..." required>
							</div>
							<div class="col-md-4">
								<input type="file" name="icon" class="form-control form-control-lg fs-6" accept="image/*">
							</div>
							<div class="col-md-3">
								<button type="submit" class="btn btn-success btn-lg w-100 fs-6 fw-bold"><i class="fa fa-plus me-1"></i>Thêm mới</button>
							</div>
						</form>
					</div>
				</div>

				<div class="card border-0 shadow-sm rounded-4 overflow-hidden">
					<div class="card-header bg-white fw-bold py-3 fs-5">Danh sách danh mục</div>
					<div class="card-body p-0">
						<div class="table-responsive">
							<table class="table table-hover align-middle mb-0 table-medium">
								<thead class="table-light">
									<tr class="fs-6 text-uppercase text-secondary">
										<th style="width: 70px;" class="ps-4">STT</th>
										<th style="width: 100px;">Icon</th>
										<th>Tên danh mục</th>
										<th style="width: 300px;" class="text-center">Hành động</th>
									</tr>
								</thead>
								<tbody>
									<c:forEach items="${cateList}" var="c" varStatus="loop">
										<tr>
											<td class="ps-4 fs-5 fw-bold text-muted">${loop.index + 1}</td>
											<td>
												<img src="${pageContext.request.contextPath}/uploads/${c.icons}" class="cate-icon-lg" alt="Icon" onerror="this.onerror=null; this.src='https://via.placeholder.com/60?text=No+Img';">
											</td>
											<td class="fs-5 fw-bold text-dark">${c.cateName}</td>
											<td class="text-center">
												<a href="${pageContext.request.contextPath}/product?categoryId=${c.cateId}" class="btn btn-outline-info px-2.5 py-1.5 fw-semibold fs-6 me-1">
													<i class="fa fa-boxes-packing me-1"></i>Xem SP
												</a>
												<a href="${pageContext.request.contextPath}/admin/category/edit?id=${c.cateId}" class="btn btn-outline-primary px-3 py-1.5 fw-semibold fs-6 me-1">
													<i class="fa fa-pen me-1"></i>Sửa
												</a>
												<a href="${pageContext.request.contextPath}/admin/category/delete?id=${c.cateId}" class="btn btn-outline-danger px-3 py-1.5 fw-semibold fs-6" onclick="return confirm('Bạn có chắc muốn xóa danh mục này?')">
													<i class="fa fa-trash me-1"></i>Xóa
												</a>
											</td>
										</tr>
									</c:forEach>
								</tbody>
							</table>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
	<script>
		document.getElementById('toggleBtn').addEventListener('click', function() {
			var sb = document.getElementById('sidebar');
			if (sb) {
				sb.classList.toggle('collapsed');
			}
		});
	</script>
</body>
</html>