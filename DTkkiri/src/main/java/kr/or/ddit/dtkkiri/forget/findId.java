package kr.or.ddit.dtkkiri.forget;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.ddit.dtkkiri.member.service.MemberService;
import kr.or.ddit.dtkkiri.member.service.MemberServiceImpl;
import kr.or.ddit.dtkkiri.vo.MemberVO;

@WebServlet("/findId.do")
public class findId extends HttpServlet {
	private static final long serialVersionUID = 1L;
       


	protected void doPost(HttpServletRequest request, 
							HttpServletResponse response) 
									throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");
		
		
		String userName = request.getParameter("name");
		String userEmail = request.getParameter("email");
		
		
		MemberService service = MemberServiceImpl.getInstance();

	
		String res = service.findId(userEmail);
		System.out.println(res);

		request.setAttribute("getid", res);

		request.getRequestDispatcher("findPage/findEnd.jsp").forward(request, response);
		
	}

}
