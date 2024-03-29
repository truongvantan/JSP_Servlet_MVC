<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>Trang Đăng Nhập</title>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css"
	integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N"
	crossorigin="anonymous" />
<link rel="stylesheet" href="css/style.css" />
</head>
<body>
	<%
	String errorMsg = "";
	String error = request.getParameter("error");
	if ("1".equals(error)) {
		errorMsg = "Sai thông tin tài khoản";
	} else if ("2".equals(error)) {
		errorMsg = "Vui lòng đăng nhập tài khoản của bạn";
	}
	%>
	<div class="container-fluid mt-4">
		<h1 class="text-center">Đăng nhập</h1>
		<p class="text-center text-danger"><%=errorMsg%></p>
		<div class="row mt-4">
			<div class="col-md-12 d-flex justify-content-center">
				<form action="CheckLoginServlet" method="post" class="w-50">
					<div class="form-outline mb-4">
						<label class="form-label text-primary font-weight-bold"
							for="tenDangNhap">Tên
							đăng nhập</label> <input name="tenDangNhap" type="text" id="tenDangNhap"
							class="form-control" placeholder="Tên đăng nhập" />
					</div>
					<div class="form-outline mb-4">
						<label class="form-label text-primary font-weight-bold"
							for="matKhau">Mật khẩu</label>
						<input name="matKhau" type="password" id="matKhau"
							class="form-control" placeholder="Mật khẩu" />
					</div>
					<input type="submit" class="btn btn-primary w-100"
						value="Đăng nhập" />
				</form>
			</div>
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
</body>
</html>
