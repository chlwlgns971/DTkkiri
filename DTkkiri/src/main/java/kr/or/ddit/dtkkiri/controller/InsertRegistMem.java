package kr.or.ddit.dtkkiri.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.ddit.dtkkiri.member.service.MemberService;
import kr.or.ddit.dtkkiri.member.service.MemberServiceImpl;
import kr.or.ddit.dtkkiri.vo.MemberVO;

// 회원가입 submit
@WebServlet("/insertRegistMem.do")
public class InsertRegistMem extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		
		MemberVO vo = new MemberVO();
		
		vo.setMem_id(request.getParameter("id"));
		vo.setMem_pass(request.getParameter("pwd"));
		vo.setMem_name(request.getParameter("name"));
		vo.setMem_mail(request.getParameter("mail"));
		vo.setMem_bir(request.getParameter("bir"));
		vo.setMem_room(Integer.parseInt(request.getParameter("roomNum")));
		vo.setMem_tname(request.getParameter("teacher"));
		vo.setMem_gen(request.getParameter("gender"));
		
		MemberService service = MemberServiceImpl.getInstance();
		
		int check = service.signUp(vo);
		
		System.out.println(service.signUp(vo));
		
		System.out.println(vo.getMem_id() + vo.getMem_pass() + vo.getMem_name() + vo.getMem_mail() + vo.getMem_bir() + vo.getMem_room() + vo.getMem_tname()
		 + vo.getMem_war()+ vo.getMem_gen());
		
		request.setAttribute("RegistCheck", check);
		
		request.getRequestDispatcher("regist/registCheck.jsp").forward(request, response);
	}

}
