package kr.or.ddit.dtkkiri.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.JsonObject;

import kr.or.ddit.dtkkiri.blacklist.service.BlacklistService;
import kr.or.ddit.dtkkiri.blacklist.service.BlaclistServiceImpl;
import kr.or.ddit.dtkkiri.member.service.MemberService;
import kr.or.ddit.dtkkiri.member.service.MemberServiceImpl;
import kr.or.ddit.dtkkiri.vo.MemberVO;


@WebServlet("/minusWarning.do")
public class MinusWarning extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
 
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		
		// id 값 가져오기
		String id = request.getParameter("id"); // ajax의 data 변수명을 가져온다
		
		MemberService service = MemberServiceImpl.getInstance();
		
		service.minusWarning(id);
	
		MemberVO vo = service.searchMemberById(id);
		
		int war = vo.getMem_war();
		
		
		if(war <= 3) {
			String email = request.getParameter("email"); 
			BlacklistService blkService = BlaclistServiceImpl.getInstance();
			
			blkService.deleteBlacklist(email);
		}
		
		// 경고수를 json으로 감싸주기
		JsonObject data = new JsonObject();
				
		data.addProperty("warNum", war);
				
		response.getWriter().print(data); // request 객체를 보낸 곳으로 데이터를 전달한다
	}


}
