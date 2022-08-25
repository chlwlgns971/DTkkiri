package kr.or.ddit.dtkkiri.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


import kr.or.ddit.dtkkiri.member.service.MemberService;
import kr.or.ddit.dtkkiri.member.service.MemberServiceImpl;
import kr.or.ddit.dtkkiri.vo.AuthorityVO;
import kr.or.ddit.dtkkiri.vo.MemberVO;


@WebServlet("/sessionLogin.do")
public class SessionLogin extends HttpServlet {
	private static final long serialVersionUID = 1L;


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");
		PrintWriter out = response.getWriter();
		
		String userId = request.getParameter("username");
		String pass = request.getParameter("password");
		
		
		// 회원이 입력한 값
		MemberVO paramVo = new MemberVO();   
		paramVo.setMem_id(userId);
		paramVo.setMem_pass(pass);
		
		List<String> list=new ArrayList<String>();
		list.add("bfb");
		list.add("info");
		list.add("304");
		list.add("305");
		list.add("306");
		list.add("401");
		list.add("402");
		list.add("403");
		list.add("404");
		list.add("405");
		list.add("406");
		list.add("bqb");
		list.add("bab");
		list.add("res");
		list.add("lib");
		list.add("bsg");
		list.add("brp");
		list.add("rev");
		
		// DB에서 확인한 값
		MemberService service = MemberServiceImpl.getInstance();
		MemberVO memVo = service.searchMemberById(userId); 
		
		
		if(memVo!= null && (paramVo.getMem_pass().equals(memVo.getMem_pass())) && memVo.getMem_dus().equals("N")) { //로그인 성공
			request.setAttribute("loginMember", memVo);
			String mem_pos=memVo.getMem_pid();
			//session 생성
			HttpSession session = request.getSession();
			session.setAttribute("member", memVo);
			for(int i=0; i<list.size(); i++) {
				AuthorityVO avo=new AuthorityVO();
				Map<String, String> map = new HashMap<String, String>();
				map.put("aur_bcode", list.get(i));
				map.put("aur_pid", mem_pos);
				avo=service.getAuthority(map);
				session.setAttribute(list.get(i), avo);
			}
			request.getRequestDispatcher("loginPage/loginPage.jsp" ).forward(request, response);
			
		}else if(memVo!= null && !(paramVo.getMem_pass().equals(memVo.getMem_pass()))) {
			
			out.println("<script>alert('아이디 또는 비밀번호를 잘못 입력하셨습니다.'); location.href='" + request.getContextPath() + "/loginPage/loginPage.jsp';</script>");
		
		}else if(memVo!= null && !(paramVo.getMem_id().equals(memVo.getMem_id()))) {
			
			out.println("<script>alert('아이디 또는 비밀번호를 잘못 입력하셨습니다.'); location.href='" + request.getContextPath() + "/loginPage/loginPage.jsp';</script>");
		
		}else {
		
			out.println("<script>alert('아이디 또는 비밀번호를 잘못 입력하셨습니다.'); location.href='" + request.getContextPath() + "/loginPage/loginPage.jsp';</script>");
		}
		
		
	}

}
