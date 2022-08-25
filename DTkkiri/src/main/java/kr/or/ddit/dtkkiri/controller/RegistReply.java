package kr.or.ddit.dtkkiri.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.google.gson.JsonElement;
import com.google.gson.JsonObject;

import kr.or.ddit.dtkkiri.reply.service.ReplyService;
import kr.or.ddit.dtkkiri.reply.service.ReplyServiceImpl;
import kr.or.ddit.dtkkiri.vo.ReplyVO;

@WebServlet("/registReply.do")
public class RegistReply extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//한글처리
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		
		//클라이언트 전송 시 전달 데이터 받기
		int post_num = Integer.parseInt(request.getParameter("postNum"));
		String content=request.getParameter("postCont");
		String id=request.getParameter("id");
		
		//service객체 생성
		ReplyService service=ReplyServiceImpl.getInstance();
		
		//댓글 저장을 위해 객체에 정보 담기
		ReplyVO rvo=new ReplyVO();
		rvo.setRpy_pnum(post_num);
		rvo.setRpy_cont(content);
		rvo.setRpy_id(id);

		//데이터 받아오기
		service.insertReply(rvo);
		List<ReplyVO> list=service.getReply(post_num);

		response.setContentType("application/json");
		String gson=new Gson().toJson(list);
		response.getWriter().write(gson);
	  	
	}

}
