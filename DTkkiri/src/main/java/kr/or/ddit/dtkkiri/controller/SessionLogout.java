package kr.or.ddit.dtkkiri.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


@WebServlet("/sessionLogout.do")
public class SessionLogout extends HttpServlet {
	private static final long serialVersionUID = 1L;


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		
		/*
		 * if(session.getAttribute("userId")!= null) {
		 * session.removeAttribute("userId"); } if(session.getAttribute("pass")!= null)
		 * { session.removeAttribute("pass"); }
		 */
		session.invalidate(); //모든 세션 종료
		//request.getRequestDispatcher("loginPage/loginPage.jsp").forward(request, response);
		response.sendRedirect("loginPage/loginPage.jsp");
	}

}
