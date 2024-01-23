package controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.bo.EditProductBO;

/**
 * Servlet implementation class EditProductServlet
 */
public class EditProductServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public EditProductServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");

		// kiểm tra người dùng đã đăng nhập hay chưa?
		HttpSession session = request.getSession();
		if (session.getAttribute("accountInfo") == null) {
			response.sendRedirect("login.jsp?error=2");
		} else {
			String maSanPham = request.getParameter("maSanPham");
			String tenSanPham = request.getParameter("tenSanPham");
			String idThuongHieu = request.getParameter("idThuongHieu");
			String donGiaNhap = request.getParameter("donGiaNhap");
			String donGiaBan = request.getParameter("donGiaBan");
			String linkHinhAnh = request.getParameter("linkHinhAnh");
			String moTa = request.getParameter("moTa");
			
			System.out.println("Edit Sản phẩm: [" + maSanPham + "," + idThuongHieu + "," + 
					donGiaNhap + "," + donGiaBan + "," + linkHinhAnh + "," + moTa + "]");
			EditProductBO editProductBO = new EditProductBO();
			
			String errorMessage = editProductBO.editProduct(maSanPham, tenSanPham, idThuongHieu, donGiaNhap, donGiaBan, linkHinhAnh, moTa);
			
			RequestDispatcher requestDispatcher = null;
			if ("No error".equals(errorMessage)) { 
				requestDispatcher = request.getRequestDispatcher("ShowProductListServlet?successMessage=3"); // chỉnh sửa thành công
			} else {
				request.setAttribute("idProduct", maSanPham);
				if ("Conflict foreign key".equals(errorMessage)) {
					requestDispatcher = request.getRequestDispatcher("ShowEditProductServlet?errorMessage=1"); // Thông báo lỗi xung đột khóa ngoại
				} else if ("Required fields error".equals(errorMessage)) {
					requestDispatcher = request.getRequestDispatcher("ShowEditProductServlet?errorMessage=2"); // Thông báo lỗi validate dữ liệu
				} else if ("Invalid idThuongHieu error".equals(errorMessage)) {
					requestDispatcher = request.getRequestDispatcher("ShowEditProductServlet?errorMessage=3"); // Thông báo lỗi không đúng định dạng idThuongHieu 
				} else if ("Invalid donGiaNhap error".equals(errorMessage)) {
					requestDispatcher = request.getRequestDispatcher("ShowEditProductServlet?errorMessage=4"); // Thông báo lỗi không đúng định dạng donGiaNhap
				} else if ("Invalid donGiaBan error".equals(errorMessage)) {
					requestDispatcher = request.getRequestDispatcher("ShowEditProductServlet?errorMessage=5"); // Thông báo lỗi không đúng định dạng donGiaBan
				} else {
					requestDispatcher = request.getRequestDispatcher("ShowEditProductServlet?errorMessage=6"); // Lỗi không xác định
				}
			}
			
			requestDispatcher.forward(request, response);
		}
	}

}
