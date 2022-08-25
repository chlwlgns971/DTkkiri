package kr.or.ddit.dtkkiri.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.ddit.dtkkiri.post.service.PostService;
import kr.or.ddit.dtkkiri.post.service.PostServiceImpl;
import kr.or.ddit.dtkkiri.reply.service.ReplyService;
import kr.or.ddit.dtkkiri.reply.service.ReplyServiceImpl;

@WebServlet("/deletePost.do")
public class DeletePost extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//한글처리
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		//클라이언트 전송 시 전달 데이터 받기
		int post_num = Integer.parseInt(request.getParameter("postNum"));
		String bcode = request.getParameter("BoardCode");
		
		//service객체 얻기
		PostService postService = PostServiceImpl.getInstance();
		ReplyService replyService = ReplyServiceImpl.getInstance();
		
		replyService.deleteReplyByPost(post_num);
		postService.deleteFile(post_num);
		
		postService.deletePost(post_num);
		
		//DB에 추가작업이 완료된 후 파일 목록을 보여주는 페이지로 이동한다.
		response.sendRedirect(request.getContextPath()+"/main/board.jsp?post_bcode="+bcode);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
