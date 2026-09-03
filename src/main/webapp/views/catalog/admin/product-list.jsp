<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Quản lý Sản phẩm</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css"
	rel="stylesheet">
<link
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css"
	rel="stylesheet">
<style>
body {
	background-color: #f1f5f9;
	font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
}

#sidebar {
	min-width: 260px;
	max-width: 260px;
	background: #1e293b;
	color: #fff;
	transition: all 0.3s;
	min-height: 100vh;
}

#sidebar.collapsed {
	margin-left: -260px;
}

#sidebar a {
	color: #cbd5e1;
	text-decoration: none;
	padding: 12px 20px;
	display: block;
	border-radius: 8px;
	margin: 4px 12px;
}

#sidebar a:hover, #sidebar a.active {
	background: #334155;
	color: #fff;
}

.top-navbar {
	background: #ffffff;
	border-bottom: 1px solid #e2e8f0;
}

.prod-img-lg {
	width: 90px;
	height: 90px;
	object-fit: contain;
	border-radius: 12px;
	background: #ffffff;
	padding: 6px;
	border: 1px solid #e2e8f0;
	box-shadow: 0 2px 4px rgba(0, 0, 0, 0.05);
}

.avatar-lg {
	width: 100px;
	height: 100px;
	object-fit: cover;
	border-radius: 50%;
	border: 3px solid #ef4444;
}
</style>
</head>
<body>
	<div class="d-flex">
		<jsp:include page="/views/catalog/admin/sidebar.jsp" />

		<div class="flex-grow-1">
			<div
				class="top-navbar d-flex justify-content-between align-items-center p-3 shadow-sm">
				<div class="d-flex align-items-center">
					<button id="toggleBtn" class="btn btn-light me-3 border">
						<i class="fa fa-bars fs-5"></i>
					</button>
					<h4 class="m-0 fw-bold text-dark">Quản lý Sản phẩm</h4>
				</div>
				<div>
					<span class="me-3 text-secondary">Xin chào, <strong
						class="text-dark">${sessionScope.account.fullname}</strong></span> <a
						href="${pageContext.request.contextPath}/logout"
						class="btn btn-outline-danger btn-sm px-3 rounded-pill"><i
						class="fa fa-right-from-bracket me-1"></i>Đăng xuất</a>
				</div>
			</div>
			<div class="p-4">
				
				<div class="card border-0 shadow-sm rounded-4 mb-4">
					<div class="card-header bg-white fw-bold py-3 fs-6">
						<i class="fa fa-filter me-1 text-primary"></i>Lọc sản phẩm theo danh mục
					</div>
					<div class="card-body p-3">
						<form action="${pageContext.request.contextPath}/admin/product" method="get" class="row g-3 align-items-center">
							<div class="col-md-9">
								<select name="categoryId" class="form-select form-select-lg fs-6" onchange="this.form.submit()">
									<option value="">-- Tất cả danh mục --</option>
									<c:forEach items="${categories}" var="c">
										<option value="${c.cateId}" ${param.categoryId == c.cateId ? 'selected' : ''}>
											${c.cateName}
										</option>
									</c:forEach>
								</select>
							</div>
							<div class="col-md-3">
								<button type="submit" class="btn btn-primary btn-lg w-100 fs-6 fw-bold">
									<i class="fa fa-filter me-1"></i>Lọc dữ liệu
								</button>
							</div>
						</form>
					</div>
				</div>

				<div class="card border-0 shadow-sm rounded-4 mb-4">
					<div class="card-header bg-white fw-bold py-3 fs-6">
						<i class="fa fa-plus me-1 text-success"></i>Thêm sản phẩm mới
					</div>
					<div class="card-body p-3">
						<form
							action="${pageContext.request.contextPath}/admin/product/add"
							method="post" enctype="multipart/form-data" class="row g-3">
							<div class="col-md-3">
								<input type="text" name="productName" class="form-control"
									placeholder="Tên sản phẩm..." required>
							</div>
							<div class="col-md-2">
								<input type="number" step="0.01" name="price"
									class="form-control" placeholder="Giá bán..." required>
							</div>
							<div class="col-md-3">
								<select name="categoryId" class="form-select" required>
									<option value="">-- Chọn danh mục --</option>
									<c:forEach items="${categories}" var="c">
										<option value="${c.cateId}">${c.cateName}</option>
									</c:forEach>
								</select>
							</div>
							<div class="col-md-4">
								<input type="file" name="image" class="form-control" required>
							</div>
							<div class="col-md-9">
								<input type="text" name="description" class="form-control"
									placeholder="Mô tả sản phẩm...">
							</div>
							<div class="col-md-3">
								<button type="submit" class="btn btn-success w-100 fw-bold">
									<i class="fa fa-plus me-1"></i>Thêm mới
								</button>
							</div>
						</form>
					</div>
				</div>

				<div class="card border-0 shadow-sm rounded-4 overflow-hidden">
					<div class="card-header bg-white fw-bold py-3 fs-5">Danh sách
						sản phẩm (6 sp / trang)</div>
					<div class="card-body p-0">
						<div class="table-responsive">
							<table class="table table-hover align-middle mb-0">
								<thead class="table-light">
									<tr class="fs-6 text-uppercase text-secondary">
										<th style="width: 60px;" class="ps-4">STT</th>
										<th style="width: 120px;">Hình ảnh</th>
										<th>Tên sản phẩm</th>
										<th style="width: 160px;">Danh mục</th>
										<th style="width: 150px;">Giá bán</th>
										<th style="width: 250px;" class="text-center">Hành động</th>
									</tr>
								</thead>
								<tbody>
									<c:forEach items="${productList}" var="p" varStatus="loop">
										<tr>
											<td class="ps-4 fw-bold text-muted">${(currentPage - 1) * 6 + loop.index + 1}</td>
											<td><img
												src="${pageContext.request.contextPath}/uploads/${p.image}"
												class="prod-img-lg" alt="Product Image"
												onerror="this.onerror=null; this.src='https://via.placeholder.com/90?text=No+Img';">
											</td>
											<td class="fw-bold text-dark"><a href="#"
												class="text-decoration-none text-dark"
												data-bs-toggle="modal" data-bs-target="#detailModal${p.id}">
													${p.productName} </a></td>
											<td><span
												class="badge bg-info text-dark px-3 py-2 rounded-pill">${p.category.cateName}</span></td>
											<td class="text-danger fw-bold"><fmt:formatNumber
													value="${p.price}" pattern="#,###" /> VNĐ</td>
											<td class="text-center">
												<button class="btn btn-outline-info btn-sm px-2 py-1 me-1"
													data-bs-toggle="modal" data-bs-target="#detailModal${p.id}">
													<i class="fa fa-eye me-1"></i>Chi tiết
												</button> <a
												href="${pageContext.request.contextPath}/admin/product/edit?id=${p.id}"
												class="btn btn-outline-primary btn-sm px-2 py-1 me-1"><i
													class="fa fa-pen me-1"></i>Sửa</a> <a
												href="${pageContext.request.contextPath}/admin/product/delete?id=${p.id}"
												class="btn btn-outline-danger btn-sm px-2 py-1"
												onclick="return confirm('Bạn có chắc muốn xóa sản phẩm này?')"><i
													class="fa fa-trash me-1"></i>Xóa</a>
											</td>
										</tr>
										<div class="modal fade" id="detailModal${p.id}" tabindex="-1"
											aria-hidden="true">
											<div class="modal-dialog modal-dialog-centered">
												<div class="modal-content rounded-4 border-0">
													<div class="modal-header bg-primary text-white">
														<h5 class="modal-title fw-bold">
															<i class="fa fa-info-circle me-2"></i>Chi Tiết Sản Phẩm
														</h5>
														<button type="button" class="btn-close btn-close-white"
															data-bs-dismiss="modal" aria-label="Close"></button>
													</div>
													<div class="modal-body text-center p-4">
														<img
															src="${pageContext.request.contextPath}/uploads/${p.image}"
															class="img-fluid rounded-3 mb-3 shadow-sm"
															style="max-height: 200px; object-fit: contain;"
															onerror="this.onerror=null; this.src='https://via.placeholder.com/200?text=No+Img';">
														<h4 class="fw-bold text-dark mb-2">${p.productName}</h4>
														<span
															class="badge bg-info text-dark px-3 py-2 rounded-pill mb-3">${p.category.cateName}</span>
														<h3 class="text-danger fw-bold mb-3">
															<fmt:formatNumber value="${p.price}" pattern="#,###" />
															VNĐ
														</h3>
														<div class="bg-light p-3 rounded-3 text-start">
															<p class="mb-0 text-muted">
																<strong>Mô tả:</strong> ${p.description}
															</p>
														</div>
													</div>
													<div class="modal-footer">
														<button type="button"
															class="btn btn-secondary px-4 rounded-pill"
															data-bs-dismiss="modal">Đóng</button>
													</div>
												</div>
											</div>
										</div>
									</c:forEach>
								</tbody>
							</table>
						</div>
					</div>
					<c:if test="${totalPages > 1}">
						<div
							class="card-footer bg-white py-3 d-flex justify-content-center">
							<nav>
								<ul class="pagination mb-0">
									<li class="page-item ${currentPage == 1 ? 'disabled' : ''}">
										<a class="page-link"
										href="${pageContext.request.contextPath}/admin/product?page=${currentPage - 1}${not empty param.categoryId ? '&categoryId='.concat(param.categoryId) : ''}">Trước</a>
									</li>
									<c:forEach begin="1" end="${totalPages}" var="i">
										<li class="page-item ${currentPage == i ? 'active' : ''}">
											<a class="page-link"
											href="${pageContext.request.contextPath}/admin/product?page=${i}${not empty param.categoryId ? '&categoryId='.concat(param.categoryId) : ''}">${i}</a>
										</li>
									</c:forEach>
									<li
										class="page-item ${currentPage == totalPages ? 'disabled' : ''}">
										<a class="page-link"
										href="${pageContext.request.contextPath}/admin/product?page=${currentPage + 1}${not empty param.categoryId ? '&categoryId='.concat(param.categoryId) : ''}">Sau</a>
									</li>
								</ul>
							</nav>
						</div>
					</c:if>
				</div>
			</div>
		</div>
	</div>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
	<script>
		document.getElementById('toggleBtn').addEventListener(
				'click',
				function() {
					document.getElementById('sidebar').classList
							.toggle('collapsed');
				});
	</script>
</body>
</html>