<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<nav class="navbar sticky-top">
	<a href="#" class="navbar-brand"> <img src="./images/logo.png"
		alt="logo" height="50" />
	</a>
	<h2 class="text-white font-weight-bold">TÊN CỬA HÀNG</h2>
	<div class="row">
		<div class="dropdown d-flex align-items-center">
			<div
				class="logo d-inline-block rounded-circle text-center border-yellow">
				<i class="fa-solid fa-gear text-white"></i>
			</div>
			<button class="btn btn-default dropdown-toggle border-0 text-white"
				type="button" id="dropdownMenuButton" data-toggle="dropdown"
				aria-haspopup="true" aria-expanded="false">
				Xin chào
				<%=(String) session.getAttribute("accountInfo")%></button>
			<div class="dropdown-menu dropdown-menu-right"
				aria-labelledby="dropdownMenuButton">
				<a class="dropdown-item text-danger" href="LogoutServlet">Đăng
					xuất</a>
			</div>
		</div>
	</div>
</nav>
