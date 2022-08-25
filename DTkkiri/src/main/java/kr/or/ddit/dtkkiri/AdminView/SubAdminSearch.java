package kr.or.ddit.dtkkiri.AdminView;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.ddit.dtkkiri.member.service.MemberService;
import kr.or.ddit.dtkkiri.member.service.MemberServiceImpl;
import kr.or.ddit.dtkkiri.vo.MemberVO;


@WebServlet("/subAdminSearch.do")
public class SubAdminSearch extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//한글처리
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		
		//클라이언트 전송데이터 받기
		
		// option
		String keyword = request.getParameter("keyword");
		String word = request.getParameter("word");
		int roomNum = Integer.parseInt(request.getParameter("roomNum"));
		
		// mService 객체 얻기
		MemberService mService = MemberServiceImpl.getInstance();

		// 얻어온 객체 List에 담기
		List<MemberVO> memberList = null;

		if((keyword != null && word != null) && (!"".equals(keyword) && !"".equals(word))){
			Map<String, Object> map = new HashMap<String, Object>();
			
			map.put("option", keyword);
			map.put("value", word);
			map.put("mem_room", roomNum);
			
			
			memberList = mService.subAdminRoomlistSearch(map);
			
			//request메소드 호출 - 결과값 받기
			request.setAttribute("mvoView3", memberList);
			
			//AdminView2로 전송
			request.getRequestDispatcher("adminView/adminView3.jsp").forward(request, response);
			
		} else {
			
			memberList = mService.subAdminRoomList(roomNum);
			
			
			//request메소드 호출 - 결과값 받기
			request.setAttribute("mvoView3", memberList);
			
			//AdminView2로 전송
			request.getRequestDispatcher("adminView/adminView3.jsp").forward(request, response);
			
			
		}

	}
	

}