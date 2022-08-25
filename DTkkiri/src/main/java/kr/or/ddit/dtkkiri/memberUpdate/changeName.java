package kr.or.ddit.dtkkiri.memberUpdate;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


import kr.or.ddit.dtkkiri.member.service.MemberService;
import kr.or.ddit.dtkkiri.member.service.MemberServiceImpl;
import kr.or.ddit.dtkkiri.vo.MemberVO;

@WebServlet("/changeName.do")
public class changeName extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

	protected void doPost(HttpServletRequest request, 
							HttpServletResponse response) 
									throws ServletException, IOException {
		
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		
		MemberVO vo = new MemberVO();
		MemberVO mem = new MemberVO();
		HttpSession session = request.getSession();
		
		
		mem = (MemberVO)session.getAttribute("member");
		
		String usrId = mem.getMem_id();
		
		vo.setMem_id(usrId);
		
		vo.setMem_name(request.getParameter("name"));
		vo.setMem_bir(request.getParameter("bir"));
		
		
		if(request.getParameter("pwd") == null) {
			vo.setMem_pass(request.getParameter("pass"));
		} else {
			vo.setMem_pass(request.getParameter("pwd"));
			
		}
		
		String mail2 = request.getParameter("mail2");
		if(mail2 == null ||  mail2.equals("")) {
			vo.setMem_mail(request.getParameter("mail"));
		} else {
			vo.setMem_mail(request.getParameter("mail2"));
			
		}
		
		
		MemberService service = MemberServiceImpl.getInstance();
		System.out.println("id :" +vo.getMem_id() +" pass :"+ vo.getMem_pass() +" name :"+ vo.getMem_name() +" mail : "+ vo.getMem_mail() +" bir : "+ vo.getMem_bir() );
		
		
		int check = service.updateMember(vo);
		
		System.out.println("check========================" + check);
		
		
		request.setAttribute("updateCheck", check);
		
		request.getRequestDispatcher("/memberUpdate/updateCheck.jsp").forward(request, response);
		
	}

}