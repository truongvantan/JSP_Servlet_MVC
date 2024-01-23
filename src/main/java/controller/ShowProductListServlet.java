package controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import common.ValidateCommon;
import model.bean.SanPham;
import model.bean.ThuongHieu;
import model.bo.ShowCategogyListBO;
import model.bo.ShowProductListBO;

/**
 * Servlet implementation class ShowProductListServlet
 */
public class ShowProductListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ShowProductListServlet() {
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
		session.removeAttribute("searchProductText");
		
		if (session.getAttribute("accountInfo") == null) {
			response.sendRedirect("login.jsp?error=2");
		} else {
			ShowCategogyListBO showCategogyListBO = new ShowCategogyListBO();
			ShowProductListBO showProductListBO = new ShowProductListBO();
			ArrayList<ThuongHieu> dsThuongHieu = showCategogyListBO.getDsThuongHieu();

			
			int pageNumber = 1; // Mặc định là trang 1
			int totalPageNumber = 1;
			String page = request.getParameter("page");
			String idThuongHieu = request.getParameter("idThuongHieu");
			if (page != null && !"".equals(page) && ValidateCommon.isValidStringNumber(page)) {
				pageNumber = Integer.valueOf(page);
			}
			
			ArrayList<SanPham> dsSanPham = null;
			if (idThuongHieu == null || "".equals(idThuongHieu)) {
				dsSanPham = showProductListBO.getDsSanPham(pageNumber);
				totalPageNumber = showProductListBO.getTotalPageNumber();
			} else {
				dsSanPham = showProductListBO.getDsSanPhamByThuongHieu(idThuongHieu, pageNumber);
				totalPageNumber = showProductListBO.getTotalPageNumberByThuongHieu(idThuongHieu);
			}
			
			request.setAttribute("dsThuongHieu", dsThuongHieu);
			request.setAttribute("dsSanPham", dsSanPham);
			request.setAttribute("currentPageNumer", pageNumber);
			request.setAttribute("totalPageNumber", totalPageNumber);
			
			RequestDispatcher requestDispatcher = request.getRequestDispatcher("productList.jsp");
			requestDispatcher.forward(request, response);
		}
		
	}

}
