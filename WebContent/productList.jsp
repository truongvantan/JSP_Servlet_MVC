<%@page import="common.StringCommon"%>
<%@page import="model.bean.ThuongHieu"%>
<%@page import="model.bean.SanPham"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>Quản lí sản phẩm</title>
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
		ArrayList<SanPham> dsSanPham = (ArrayList<SanPham>) request.getAttribute("dsSanPham");
		ArrayList<ThuongHieu> dsThuongHieu = (ArrayList<ThuongHieu>)request.getAttribute("dsThuongHieu");
		
		String errorMessage = request.getParameter("errorMessage");
		String successMessage = request.getParameter("successMessage");
		
		String searchText = (String)session.getAttribute("searchProductText") != null ? (String)session.getAttribute("searchProductText") : "";
		String idThuongHieu = request.getParameter("idThuongHieu") != null ? request.getParameter("idThuongHieu") : "";
	%>
	
	<%
		String functionPrefix = "".equals(searchText) ? "ShowProductListServlet" : "SearchProductServlet";
		
		// cài đặt phân trang
   		//int currentPageNumer = 17; 
   		//int totalPageNumber = 21;
		int currentPageNumer = (Integer)request.getAttribute("currentPageNumer"); // Do server trả về 
   		int totalPageNumber = (Integer)request.getAttribute("totalPageNumber"); // Do server trả về
   		int[] pageNumberList = new int[10]; // Do client tự tính toán
   		int pageQuantity = 0; // Do client tự tính toán
   		
   		// Tình huống 1:
   		if (totalPageNumber <= 10) {
        	for (int j = 0; j < totalPageNumber; j++) {
            	pageNumberList[j] = j+1;
            	pageQuantity++;
            }
      	} else if (totalPageNumber > 10 && currentPageNumer <= 5) { // Tình huống 3:
            for (int j = 0; j < 10; j++) {
                pageNumberList[j] = j+1;
                pageQuantity++;
            }
  		} else if (totalPageNumber > 10 && currentPageNumer >= (totalPageNumber - 5)) { // Tình huống 4:***
            for (int j = 0; j < 10; j++) {
                pageNumberList[j] = totalPageNumber - (9 - j);
                pageQuantity++;
            }
  		} else if (totalPageNumber > 10 && currentPageNumer > 5 && currentPageNumer <= (totalPageNumber - 5)) { // Tình huống 5
   			for (int j = 0; j < 10; j++) {
                pageNumberList[j] = currentPageNumer - 3 + j;
                pageQuantity++;
   			}
   		}
	%>

	<jsp:include page="header.jsp" />

	<div class="container-fluid">
		<div class="panel panel-default panel-table mt-3">
			<div class="panel-heading">
				<form action="SearchProductServlet" method="post" class="row form-inline">
					<div class="col col-xs-4">
						<select class="form-control w-75 d-inline-block" name="idThuongHieu" id="dsThuongHieu">
							<option value="">Tất cả thương hiệu</option>
							<% for (ThuongHieu th : dsThuongHieu) { %>
								<option value="<%=th.getId()%>"><%=th.getTenThuongHieu()%></option>
							<%}%>
						</select>
					</div>
					<div class="col col-xs-6">
						<div class="form-inline">
							<input name="searchText" id="searchText" class="form-control mr-1 w-75"
								type="search" placeholder="Tìm kiếm tất cả thương hiệu..." aria-label="Search" value="<%=searchText%>" />
							<input class="btn btn-outline-success" type="submit" id="btnSearch"
								value="Tìm kiếm" />
						</div>
					</div>
					<div class="col col-xs-2 text-right">
						<a href="ShowCreateProductServlet" class="btn btn-primary btn-sm mr-4"> <i
							class="fa-solid fa-plus"></i> Thêm mới
						</a>
					</div>
				</form>
			</div>
			<div class="panel-body">
			 	<div class="row mt-2">
                    <div class="col-12">
                        <p class="text-center text-success"><%="1".equals(successMessage) ? "Xóa sản phẩm thành công." : ""%></p>
                        <p class="text-center text-success"><%="2".equals(successMessage) ? "Thêm sản phẩm thành công." : ""%></p>
                        <p class="text-center text-success"><%="3".equals(successMessage) ? "Chỉnh sửa sản phẩm thành công." : ""%></p>
                        <p class="text-center text-danger"><%="1".equals(errorMessage) ? "Xóa sản phẩm thất bại. Id của sản phẩm không phải là số!" : ""%></p>
                        <p class="text-center text-danger"><%="2".equals(errorMessage) ? "Lỗi không xác định. Vui lòng thử lại!" : ""%></p>
                        <p class="text-center text-danger"><%="3".equals(errorMessage) ? "Không thể chỉnh sửa sản phẩm. Sản phẩm không tồn tại!" : ""%></p>
                    </div>
                </div>
				<table class="table table-bordered table-striped">
					<thead>
						<tr class="d-flex">
							<th class="col col-1 text-center"><i
								class="fa-solid fa-gear fa-sm"></i></th>
							<th class="col col-1">STT</th>
							<th class="col">Mã Sản phẩm</th>
							<th class="col">Tên sản phẩm</th>
							<th class="col">Thương hiệu</th>
							<th class="col">Đơn giá nhập</th>
							<th class="col">Đơn giá bán</th>
							<th class="col">Hình ảnh</th>
							<th class="col">Mô tả</th>
						</tr>
					</thead>
					<tbody>
					<% int stt = (currentPageNumer - 1)*15 + 1; %>
						<%
						for (SanPham sp : dsSanPham) {
						%>

						<tr class="d-flex">
							<td class="col col-1 d-flex justify-content-center"><a
								href="ShowEditProductServlet?idProduct=<%=sp.getId()%>" class="btn btn-success mr-1"
								data-toggle="tooltip" title="Chỉnh sửa"> <i
									class="fa-solid fa-pencil fa-xs"></i>
							</a> <a onclick="return confirmDeleteProduct('<%=sp.getId()%>');" href="DeleteProductServlet?idProduct=<%=sp.getId()%>" class="btn btn-danger"
								data-toggle="tooltip" title="Xóa"> <i
									class="fa-solid fa-trash-can fa-xs"></i>
							</a></td>
							<td class="col col-1 d-flex align-items-center"><%=stt++%></td>
							<td class="col d-flex align-items-center"><%=sp.getId()%></td>
							<td class="col d-flex align-items-center"><%=sp.getTenSanPham()%></td>
							<td class="col d-flex align-items-center"><%=sp.getTenThuongHieu()%></td>
							<td class="col d-flex align-items-center"><%=StringCommon.formatCurrencyString(sp.getDonGiaNhap())%></td>
							<td class="col d-flex align-items-center"><%=StringCommon.formatCurrencyString(sp.getDonGiaBan())%></td>
							<td class="col d-flex align-items-center"><%=sp.getLinkHinhAnh()%></td>
							<td class="col d-flex align-items-center"><%=sp.getMoTa()%></td>
						</tr>
						<%
						}
						%>
					</tbody>
					<tfoot>
						<tr class="d-flex">
							<th class="col col-1 text-center"><i
								class="fa-solid fa-gear fa-sm"></i></th>
							<th class="col col-1">STT</th>
							<th class="col">Mã Sản phẩm</th>
							<th class="col">Tên sản phẩm</th>
							<th class="col">Thương hiệu</th>
							<th class="col">Đơn giá nhập</th>
							<th class="col">Đơn giá bán</th>
							<th class="col">Hình ảnh</th>
							<th class="col">Mô tả</th>
						</tr>
					</tfoot>
				</table>
			</div>
			<div class="panel-footer table-bordered">
				<div class="row align-items-center">
					<div class="col col-xs-4">
						<p class="panel-title mt-3 ml-3">Trang <b><%=currentPageNumer%></b> của <%=totalPageNumber%></p>
					</div>
					<div class="col col-xs-8">
						<nav aria-label="Page navigation example"
							class="d-flex justify-content-end mr-4 mt-3">
							<ul class="pagination">
								<% if (currentPageNumer > 1) { %>
									<li class="page-item"><a class="page-link" href='<%=functionPrefix%>?idThuongHieu=<%=idThuongHieu%>&page=1'>Đầu</a></li>
	   								<li class="page-item"><a class="page-link" href='<%=functionPrefix%>?idThuongHieu=<%=idThuongHieu%>&page=<%=currentPageNumer - 1%>'>Trước</a></li>
	   							<% } %>
	   							
	   							<% for (int k = 0; k < pageQuantity; k++) { %>
	   								<li class="page-item"><a class="page-link" href='<%=functionPrefix%>?idThuongHieu=<%=idThuongHieu%>&page=<%=pageNumberList[k]%>'><%= pageNumberList[k] %></a></li>
	   							<% } %>
	   
	   							<% if (currentPageNumer < totalPageNumber) { %>
		   							<li class="page-item"><a class="page-link" href='<%=functionPrefix%>?idThuongHieu=<%=idThuongHieu%>&page=<%=currentPageNumer + 1%>'>Tiếp</a></li>
		  							<li class="page-item"><a class="page-link" href='<%=functionPrefix%>?idThuongHieu=<%=idThuongHieu%>&page=<%=totalPageNumber%>'>Cuối</a></li>
	   							<% } %>
							</ul>
						</nav>
					</div>
				</div>
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
	<script>
		$(function() {
			$('[data-toggle="tooltip"]').tooltip();
		});
		$(document).ready(function() {
			$('#dsThuongHieu').on('change', function() {
				location.href = 'ShowProductListServlet?idThuongHieu=' + $(this).val() + '&page=1';
			});
		
			$('#dsThuongHieu').val('<%=idThuongHieu%>');

			if ($('#dsThuongHieu').val() == '') {
				$('input[name="searchText"]').removeAttr("disabled");
            	$("#btnSearch").removeAttr("disabled");
			} else {
				$('input[name="searchText"]').attr("disabled", true);
            	$("#btnSearch").attr("disabled", true);
			}
			
			$('.page-item').each(function() {
				if ($(this).text() == <%=currentPageNumer%>) {
					$(this).addClass('active');
				}
			});
		});
	</script>
	<script type="text/javascript">
		function confirmDeleteProduct(idProduct) {
			return confirm("Bạn muốn xóa sản phẩm có id là: " + idProduct + "?");
		}
	</script>
	<% } %>
</body>
</html>
