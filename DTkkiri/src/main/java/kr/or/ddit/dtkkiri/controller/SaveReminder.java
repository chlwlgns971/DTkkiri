package kr.or.ddit.dtkkiri.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.ddit.dtkkiri.reminder.service.ReminderService;
import kr.or.ddit.dtkkiri.reminder.service.ReminderServiceImpl;
import kr.or.ddit.dtkkiri.vo.ReminderVO;


@WebServlet("/saveReminder.do")
public class SaveReminder extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		
		// 아이디랑 리마인더내용 받아오기
		String id = request.getParameter("id");
		String cont = request.getParameter("cont");
		
		ReminderService service = ReminderServiceImpl.getInstance();
		
		// VO에 아이디랑 리마인더 내용 담아서 DB에 넣어주기
		ReminderVO vo = new ReminderVO();
		
		vo.setRmd_id(id);
		vo.setRmd_cont(cont);
		
		service.insertReminder(vo);
		
		
		// DB에 등록된 리마인더를 끌어와 VO에 담기
		List<ReminderVO> list = (List<ReminderVO>) service.selectReminder(id);
		
		request.setAttribute("list", list);
		
		request.getRequestDispatcher("reminder/insertReminder.jsp").forward(request, response);
	}




}
