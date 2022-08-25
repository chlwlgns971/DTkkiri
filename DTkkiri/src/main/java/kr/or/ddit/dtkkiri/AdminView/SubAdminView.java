package kr.or.ddit.dtkkiri.AdminView;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.ddit.dtkkiri.member.service.MemberService;
import kr.or.ddit.dtkkiri.member.service.MemberServiceImpl;
import kr.or.ddit.dtkkiri.vo.MemberVO;


@WebServlet("/subAdminView.do")
public class SubAdminView extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");

		// 파라미터 값 가져오기
		int roomNum = Integer.parseInt(request.getParameter("roomNum"));
		
		// mService 객체 생성
		MemberService mService = MemberServiceImpl.getInstance();

		// 얻어온 객체 memberList에 담기
		List<MemberVO> memberList = null;

		// 얻어온 객체 확인하기
		memberList = mService.subAdminRoomList(roomNum);

		//request메소드 호출 - 결과값 받기
		request.setAttribute("mvoView", memberList);

		//AdminView로 전송
		request.getRequestDispatcher("adminView/adminView2.jsp").forward(request, response);
	}
	

}
