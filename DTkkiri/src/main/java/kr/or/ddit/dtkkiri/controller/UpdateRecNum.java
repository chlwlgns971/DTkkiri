package kr.or.ddit.dtkkiri.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.JsonObject;

import kr.or.ddit.dtkkiri.post.service.PostService;
import kr.or.ddit.dtkkiri.post.service.PostServiceImpl;
import kr.or.ddit.dtkkiri.vo.PostVO;

@WebServlet("/updateRecNum.do")
public class UpdateRecNum extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//한글처리
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		//클라이언트 전송 시 전달 데이터 받기
		int post_num = Integer.parseInt(request.getParameter("postNum"));
		//service객체 생성
		PostService service =PostServiceImpl.getInstance();
		//좋아요수 증가
		service.plusRecNum(post_num);

		// 현재 좋아요 수 받아오기
		PostVO vo = (PostVO) service.showPost(post_num);
		
		int recNum = vo.getPost_rec_num();
		
		// 받아온 좋아요 수를 json으로 감싸주기
		JsonObject data = new JsonObject();
		
		data.addProperty("recNum", recNum);
		
		//response.setHeader("content-type", "application/json");
		//response.setContentType("application/json; charset=utf-8");
		response.getWriter().print(data); // request 객체를 보낸 곳으로 데이터를 전달한다
		
	}

}
