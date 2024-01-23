<%@page import="model.bean.ThuongHieu"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>Trang thêm mới sản phẩm</title>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css"
	integrity="sha512-z3gLpd7yknf1YoNbCzqRKc4qyor8gaKU1qmn+CShxbuBusANI9QpRohGBreCFkKxLhei6S9CQXFEbbKuqLg0DA=="
	crossorigin="anonymous" referrerpolicy="no-referrer" />
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css"
	integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N"
	crossorigin="anonymous" />
<link rel="stylesheet" href="css/style.css" />
</head>
<body>
	<%
	if (session.getAttribute("accountInfo") == null) {
		response.sendRedirect("login.jsp?error=2");
	} else {
		ArrayList<ThuongHieu> dsThuongHieu = (ArrayList<ThuongHieu>)request.getAttribute("dsThuongHieu");
		
		String errorMessage = request.getParameter("errorMessage");
		
		String tenSanPham = request.getParameter("tenSanPham") != null ? request.getParameter("tenSanPham") : "" ;
		String idThuongHieu = request.getParameter("idThuongHieu") != null ? request.getParameter("idThuongHieu"): "";
		String donGiaNhap = request.getParameter("donGiaNhap") != null ? request.getParameter("donGiaNhap"): "";
		String donGiaBan = request.getParameter("donGiaBan") != null ? request.getParameter("donGiaBan"): "";
		String linkHinhAnh = request.getParameter("linkHinhAnh") != null ? request.getParameter("linkHinhAnh") : "";
		String moTa = request.getParameter("moTa") != null ? request.getParameter("moTa") : "";
	%>

	<jsp:include page="header.jsp" />

	<div class="container-fluid">
		<h2 class="text-center mt-2">Thêm mới sản phẩm</h2>
		<p class="text-center text-danger"><%="1".equals(errorMessage) ? "Mã sản phẩm đã tồn tại. Vui lòng thử lại" : ""%></p>
		<p class="text-center text-danger"><%="2".equals(errorMessage) ? "Mã thương hiệu không tồn tại. Vui lòng chọn đúng thương hiệu" : ""%></p>
		<p class="text-center text-danger"><%="3".equals(errorMessage) ? "Lỗi chưa nhập Tên sản phẩm, Thương hiệu, Đơn giá nhập, Đơn giá bán!" : ""%></p>
		<p class="text-center text-danger"><%="4".equals(errorMessage) ? "Id Thương hiệu phải là số" : ""%></p>
		<p class="text-center text-danger"><%="5".equals(errorMessage) ? "Đơn giá nhập phải là số" : ""%></p>
		<p class="text-center text-danger"><%="6".equals(errorMessage) ? "Đơn giá bán phải là số" : ""%></p>
		<p class="text-center text-danger"><%="7".equals(errorMessage) ? "Xảy ra lỗi không xác định, Vui lòng thử lại" : ""%></p>
		<div class="row d-flex justify-content-center">
			<form action="CreateProductServlet" method="post" class="w-75 mt-2">
				<!-- <div class="row d-flex justify-content-center">
					<div class="form-outline mb-4 w-50 text-center">
						<label
							class="form-label text-center text-primary font-weight-bold"
							for="maSanPham">Mã sản
							phẩm</label>
							 <input type="text" class="form-control text-center" disabled />
						<input type="text" name="maSanPham" id="maSanPham"
							class="form-control text-center" placeholder="Mã sản phẩm" /> 
					</div>
				</div> -->
				<div class="row">
					<div class="col-md-6 col-xs-12">
						<div class="form-outline mb-4">
							<label class="form-label text-primary font-weight-bold"
								for="tenSanPham">Tên sản phẩm</label> <input type="text"
								name="tenSanPham" id="tenSanPham" class="form-control"
								placeholder="Tên sản phẩm" value="<%=tenSanPham%>" />
						</div>
						<div class="form-outline mb-4">
							<label class="form-label text-primary font-weight-bold"
								for="dsThuongHieu">Thương hiệu</label> <select
								class="form-control d-inline-block" name="idThuongHieu"
								id="dsThuongHieu">
								<option value="">Chọn thương hiệu</option>
								<% for (ThuongHieu th: dsThuongHieu) { %>
									<option value="<%=th.getId()%>"><%=th.getTenThuongHieu()%></option>
								<% } %>
							</select>
						</div>
						<div class="form-outline mb-4">
							<label class="form-label text-primary font-weight-bold"
								for="donGiaNhap">Đơn giá nhập</label> <input type="number"
								name="donGiaNhap" id="donGiaNhap" class="form-control"
								placeholder="Đơn giá nhập" value="<%=donGiaNhap%>" />
						</div>
					</div>
					<div class="col-md-6 col-xs-12">
						<div class="form-outline mb-4">
							<label class="form-label text-primary font-weight-bold"
								for="donGiaBan">Đơn giá bán</label> <input type="number"
								name="donGiaBan" id="donGiaBan" class="form-control"
								placeholder="Đơn giá bán" value="<%=donGiaBan%>" />
						</div>
						<div class="form-outline mb-4">
							<label class="form-label text-primary font-weight-bold"
								for="linkHinhAnh">Link hình ảnh</label> <input type="text"
								name="linkHinhAnh" id="linkHinhAnh" class="form-control"
								placeholder="Link hình ảnh" value="<%=linkHinhAnh%>" />
						</div>
						<div class="form-outline mb-4">
							<label class="form-label text-primary font-weight-bold"
								for="moTa">Mô tả</label> <input type="text" name="moTa"
								id="moTa" class="form-control" placeholder="Mô tả" value="<%=moTa%>" />
						</div>
					</div>
				</div>
				<div class="row d-flex justify-content-center">
					<input type="submit" class="btn btn-primary w-25 mr-1" value="Thêm" />
					<input type="reset" class="btn btn-secondary w-25"
						value="Reset" />
				</div>
			</form>
		</div>
	</div>
	
	<script
		src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js"
		integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj"
		crossorigin="anonymous"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-Fy6S3B9q64WdZWQUiU+q4/2Lc9npb8tCaSX9FK7E8HnRr0Jz8D6OP9dO5Vg3Q9ct"
		crossorigin="anonymous"></script>
	
	<script>
		$(document).ready(function() {
			$('#dsThuongHieu').val('<%=idThuongHieu%>');
		});
	</script>
	<%
	}
	%>
</body>
</html>
