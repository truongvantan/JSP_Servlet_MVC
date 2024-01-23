package controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.bean.SanPham;
import model.bean.ThuongHieu;
import model.bo.EditProductBO;
import model.bo.ShowCategogyListBO;

/**
 * Servlet implementation class ShowEditProductServlet
 */
public class ShowEditProductServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public ShowEditProductServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doPost(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");

		// kiểm tra người dùng đã đăng nhập hay chưa?
		HttpSession session = request.getSession();
		if (session.getAttribute("accountInfo") == null) {
			response.sendRedirect("login.jsp?error=2");
		} else {
			String idProduct = request.getParameter("idProduct") == null ? (String)request.getAttribute("idProduct") : request.getParameter("idProduct");
			System.out.println("edit idProduct: " + idProduct);
			EditProductBO editProductBO = new EditProductBO();
			
			SanPham sanPhamInfo = editProductBO.getProductInfo(idProduct);
			
			RequestDispatcher requestDispatcher = null;
			if (sanPhamInfo == null) {
				requestDispatcher = request.getRequestDispatcher("ShowProductListServlet?errorMessage=3");
			} else {
				ShowCategogyListBO showCategogyListBO = new ShowCategogyListBO();
				ArrayList<ThuongHieu> dsThuongHieu = showCategogyListBO.getDsThuongHieu();
				request.setAttribute("dsThuongHieu", dsThuongHieu);
				request.setAttribute("sanPhamInfo", sanPhamInfo);
				
				requestDispatcher = request.getRequestDispatcher("editProduct.jsp");
			}
			
			requestDispatcher.forward(request, response);
		}
	}

}
