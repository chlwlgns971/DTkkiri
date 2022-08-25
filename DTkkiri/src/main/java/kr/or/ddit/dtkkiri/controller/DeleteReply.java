package kr.or.ddit.dtkkiri.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

import kr.or.ddit.dtkkiri.reply.service.ReplyService;
import kr.or.ddit.dtkkiri.reply.service.ReplyServiceImpl;
import kr.or.ddit.dtkkiri.vo.ReplyVO;

@WebServlet("/deleteReply.do")
public class DeleteReply extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//한글처리
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		
		//클라이언트 전송 시 전달 데이터 받기
		int rpy_num = Integer.parseInt(request.getParameter("replyNum"));
		int post_num = Integer.parseInt(request.getParameter("postNum"));
		
		//service객체 생성
		ReplyService service=ReplyServiceImpl.getInstance();
		
		//데이터 받아오기
		service.deleteReply(rpy_num);
		List<ReplyVO> list=service.getReply(post_num);

		response.setContentType("application/json");
		String gson=new Gson().toJson(list);
		response.getWriter().write(gson);
	}

}
