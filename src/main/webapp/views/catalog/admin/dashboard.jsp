<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Admin Dashboard</title>
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

.stat-card {
	border-radius: 16px;
	border: none;
	transition: transform 0.2s;
}

.stat-card:hover {
	transform: translateY(-3px);
}

.avatar-lg {
	width: 100px;
	height: 100px;
	object-fit: cover;
	border-radius: 50%;
	border: 3px solid #ef4444;
}

.prod-thumb {
	width: 50px;
	height: 50px;
	object-fit: cover;
	border-radius: 8px;
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
					<h4 class="m-0 fw-bold text-dark">Trang Quản Trị Hệ Thống</h4>
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
				<div class="row g-4 mb-4">
					<div class="col-md-6">
						<div class="card stat-card bg-primary text-white p-3 shadow-sm">
							<div class="d-flex justify-content-between align-items-center">
								<div>
									<h6 class="text-white-50 text-uppercase fw-bold mb-2 fs-6">Tổng
										Danh Mục</h6>
									<h2 class="display-5 fw-bold mb-0">${countCategories}</h2>
								</div>
								<i class="fa fa-list fa-3x opacity-50"></i>
							</div>
						</div>
					</div>
					<div class="col-md-6">
						<div class="card stat-card bg-success text-white p-3 shadow-sm">
							<div class="d-flex justify-content-between align-items-center">
								<div>
									<h6 class="text-white-50 text-uppercase fw-bold mb-2 fs-6">Tổng
										Sản Phẩm</h6>
									<h2 class="display-5 fw-bold mb-0">${countProducts}</h2>
								</div>
								<i class="fa fa-layer-group fa-3x opacity-50"></i>
							</div>
						</div>
					</div>
				</div>
				<div class="card border-0 shadow-sm rounded-4 overflow-hidden mb-4">
					<div
						class="card-header bg-white fw-bold py-3 fs-5 d-flex justify-content-between align-items-center">
						<span><i class="fa fa-fire text-danger me-2"></i>10 Sản
							Phẩm Mới Nhất (Top 10 News)</span> <a
							href="${pageContext.request.contextPath}/admin/product"
							class="btn btn-sm btn-outline-primary rounded-pill">Xem tất
							cả</a>
					</div>
					<div class="card-body p-0">
						<div class="table-responsive">
							<table class="table table-hover align-middle mb-0">
								<thead class="table-light">
									<tr class="fs-6 text-uppercase text-secondary">
										<th style="width: 60px;" class="ps-4">STT</th>
										<th style="width: 80px;">Ảnh</th>
										<th>Tên sản phẩm</th>
										<th>Danh mục</th>
										<th>Giá bán</th>
										<th class="text-center" style="width: 150px;">Chi tiết</th>
									</tr>
								</thead>
								<tbody>
									<c:forEach items="${top10Products}" var="p" varStatus="loop">
										<tr>
											<td class="ps-4 fw-bold text-muted">${loop.index + 1}</td>
											<td><img
												src="${pageContext.request.contextPath}/uploads/${p.image}"
												class="prod-thumb" alt="Product Image"
												onerror="this.onerror=null; this.src='https://via.placeholder.com/50?text=No+Img';">
											</td>
											<td class="fw-bold text-dark">${p.productName}</td>
											<td><span class="badge bg-info text-dark rounded-pill">${p.category.cateName}</span></td>
											<td class="text-danger fw-bold"><fmt:formatNumber
													value="${p.price}" pattern="#,###" /> VNĐ</td>
											<td class="text-center">
												<button
													class="btn btn-sm btn-outline-info rounded-pill px-3"
													data-bs-toggle="modal" data-bs-target="#detailModal${p.id}">
													<i class="fa fa-eye me-1"></i>Xem
												</button>
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
				</div>
			</div>
		</div>
	</div>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
	<script>
		document.getElementById('toggleBtn').addEventListener('click', function() {
			document.getElementById('sidebar').classList.toggle('collapsed');
		});
	</script>
</body>
</html>