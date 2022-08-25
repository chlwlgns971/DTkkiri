package kr.or.ddit.dtkkiri.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.ddit.dtkkiri.blacklist.service.BlacklistService;
import kr.or.ddit.dtkkiri.blacklist.service.BlaclistServiceImpl;
import kr.or.ddit.dtkkiri.member.service.MemberService;
import kr.or.ddit.dtkkiri.member.service.MemberServiceImpl;
import kr.or.ddit.dtkkiri.vo.MemberVO;


@WebServlet("/selectBlacklist.do")
public class SelectBlacklist extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		
		String email = request.getParameter("email");
	
		BlacklistService service = BlaclistServiceImpl.getInstance();
		
		int cnt = service.searchBlacklistNum(email);
		
		request.setAttribute("check", cnt);
		
		request.getRequestDispatcher("regist/blacklistCheck.jsp").forward(request, response);
	}

}
