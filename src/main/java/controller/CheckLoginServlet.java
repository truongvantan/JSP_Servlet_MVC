package controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.bo.CheckLoginBO;

/**
 * Servlet implementation class CheckLoginServlet
 */
public class CheckLoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CheckLoginServlet() {
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
		
		String tenDangNhap = request.getParameter("tenDangNhap");
		String matKhau = request.getParameter("matKhau");
		
		CheckLoginBO checkLoginBO = new CheckLoginBO();
		
		final int ADMIN_ACCOUNT = 1;
		final int USER_ACCOUNT = 2;
		
		RequestDispatcher requestDispatcher = null;
		String accountInfo = null;
		HttpSession session = request.getSession();
		
		if (checkLoginBO.getAccountRole(tenDangNhap, matKhau) == ADMIN_ACCOUNT) {
			accountInfo = tenDangNhap + "(admin)";
			session.setAttribute("accountInfo", accountInfo);
			requestDispatcher = request.getRequestDispatcher("welcomeAdmin.jsp");
		} else if (checkLoginBO.getAccountRole(tenDangNhap, matKhau) == USER_ACCOUNT) {
			accountInfo = tenDangNhap + "(user)";
			session.setAttribute("accountInfo", accountInfo);
			requestDispatcher = request.getRequestDispatcher("welcomeUser.jsp");
		} else { // invalid account
			requestDispatcher = request.getRequestDispatcher("login.jsp?error=1");
		}
		
		requestDispatcher.forward(request, response);
	}

}
