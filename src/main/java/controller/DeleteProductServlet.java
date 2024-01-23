package controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.bo.DeleteProductBO;

/**
 * Servlet implementation class DeleteProductServlet
 */
public class DeleteProductServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DeleteProductServlet() {
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
			String idProduct = request.getParameter("idProduct");
			DeleteProductBO deleteProductBO = new DeleteProductBO();
			
			String errorMessage = deleteProductBO.deleteProduct(idProduct);
			
			RequestDispatcher requestDispatcher = null;
			if ("No error".equals(errorMessage)) {
				requestDispatcher = request.getRequestDispatcher("ShowProductListServlet?successMessage=1"); // xóa thành công
			} else if ("Invalid idProduct".equals(errorMessage)) {
				requestDispatcher = request.getRequestDispatcher("ShowProductListServlet?errorMessage=1"); // id sản phẩm ko hợp lệ
			} else {
				requestDispatcher = request.getRequestDispatcher("ShowProductListServlet?errorMessage=0"); // lỗi không xác định
			}
			requestDispatcher.forward(request, response);
		}
		
	}

}
