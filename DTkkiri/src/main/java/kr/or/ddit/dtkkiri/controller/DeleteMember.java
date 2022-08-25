package kr.or.ddit.dtkkiri.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.JsonObject;

import kr.or.ddit.dtkkiri.member.service.MemberService;
import kr.or.ddit.dtkkiri.member.service.MemberServiceImpl;
import kr.or.ddit.dtkkiri.reminder.service.ReminderService;
import kr.or.ddit.dtkkiri.reminder.service.ReminderServiceImpl;


@WebServlet("/deleteMember.do")
public class DeleteMember extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		
		String id = request.getParameter("id");
		
		// 계정 탈퇴
		MemberService service = MemberServiceImpl.getInstance();
		
		//int check = service.deleteAccount(id);
		
		// 리마인더 삭제
		ReminderService rmdService = ReminderServiceImpl.getInstance();
		
		rmdService.deleteUserReminder(id);
		
		// 계정 탈퇴 여부 업데이트
		int check = service.updateDLTMember(id);
		
		JsonObject data = new JsonObject();
		
		if(check >0) {
			data.addProperty("flag", "회원탈퇴가 완료되었습니다. 감사합니다.");
		}else {
			data.addProperty("flag", "회원탈퇴에 실패하였습니다.");
		}
		response.getWriter().print(data);
	}

}
