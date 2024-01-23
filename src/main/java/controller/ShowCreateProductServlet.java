package controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.bean.ThuongHieu;
import model.bo.ShowCategogyListBO;

/**
 * Servlet implementation class ShowCreateProductServlet
 */
public class ShowCreateProductServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ShowCreateProductServlet() {
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
			// lấy danh sách thương hiệu
			ShowCategogyListBO showCategogyListBO = new ShowCategogyListBO();
			ArrayList<ThuongHieu> dsThuongHieu = showCategogyListBO.getDsThuongHieu();
			request.setAttribute("dsThuongHieu", dsThuongHieu);
			RequestDispatcher requestDispatcher = request.getRequestDispatcher("createProduct.jsp");
			requestDispatcher.forward(request, response);
		}
	}

}
