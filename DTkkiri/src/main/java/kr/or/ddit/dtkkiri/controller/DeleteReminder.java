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


@WebServlet("/deleteReminder.do")
public class DeleteReminder extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			request.setCharacterEncoding("utf-8");
			
			int num = Integer.parseInt(request.getParameter("remNum"));
			String id = request.getParameter("id");
			
			ReminderService service = ReminderServiceImpl.getInstance();
			
			service.deleteReminder(num);
			
			// DB에 등록된 리마인더를 끌어와 VO에 담기
			List<ReminderVO> list = (List<ReminderVO>) service.selectReminder(id);
			
			request.setAttribute("list", list);
			
			request.getRequestDispatcher("reminder/insertReminder.jsp").forward(request, response);
	}

}
