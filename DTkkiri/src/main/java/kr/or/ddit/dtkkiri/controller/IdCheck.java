package kr.or.ddit.dtkkiri.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.ddit.dtkkiri.member.service.MemberService;
import kr.or.ddit.dtkkiri.member.service.MemberServiceImpl;

// 아이디 중복 검사
@WebServlet("/idCheck.do")
public class IdCheck extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		
		String userId = request.getParameter("id");
		
		MemberService service = MemberServiceImpl.getInstance();
		
		int check = service.checkById(userId);
		
		request.setAttribute("userId", check);
		
		request.getRequestDispatcher("regist/idCheck.jsp").forward(request, response);
		
	
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
