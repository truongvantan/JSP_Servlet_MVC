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
import model.bo.SearchProductBO;
import model.bo.ShowCategogyListBO;

/**
 * Servlet implementation class SearchProductServlet
 */
public class SearchProductServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public SearchProductServlet() {
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
		// kiểm tra người dùng đã đăng nhập hay chưa?
		HttpSession session = request.getSession();
		if (session.getAttribute("accountInfo") == null) {
			response.sendRedirect("login.jsp?error=2");
		} else {
			String searchText = request.getParameter("searchText");
			if (searchText == null) {
				searchText = (String)session.getAttribute("searchProductText");
			}
			System.out.println("searchText=" + searchText);
			
			ShowCategogyListBO showCategogyListBO = new ShowCategogyListBO();
			ArrayList<ThuongHieu> dsThuongHieu = showCategogyListBO.getDsThuongHieu();
			
			SearchProductBO searchProductBO = new SearchProductBO();
//			ArrayList<SanPham> dsSanPham = searchProductBO.getDsSanPham(searchText);
			
			// phân trang
			int pageNumber = 1; // Mặc định là trang 1
			String page = request.getParameter("page");
			if (page != null && !"".equals(page) && ValidateCommon.isValidStringNumber(page)) {
				pageNumber = Integer.valueOf(page);
			}
			
			ArrayList<SanPham> dsSanPham = searchProductBO.getDsSanPham(searchText, pageNumber);
			int totalPageNumber = searchProductBO.getTotalPageNumber(searchText);
			
			RequestDispatcher requestDispatcher = null;
			
			request.setAttribute("dsThuongHieu", dsThuongHieu);
			request.setAttribute("dsSanPham", dsSanPham);
			request.setAttribute("currentPageNumer", pageNumber);
			request.setAttribute("totalPageNumber", totalPageNumber);
			
			session.setAttribute("searchProductText", searchText);
			
			requestDispatcher = request.getRequestDispatcher("productList.jsp");
			requestDispatcher.forward(request, response);
		}
	}

}
