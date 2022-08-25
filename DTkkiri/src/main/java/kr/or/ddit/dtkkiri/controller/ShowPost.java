package kr.or.ddit.dtkkiri.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.ddit.dtkkiri.post.service.PostService;
import kr.or.ddit.dtkkiri.post.service.PostServiceImpl;
import kr.or.ddit.dtkkiri.reply.service.ReplyService;
import kr.or.ddit.dtkkiri.reply.service.ReplyServiceImpl;
import kr.or.ddit.dtkkiri.vo.AtfileVO;
import kr.or.ddit.dtkkiri.vo.PostVO;
import kr.or.ddit.dtkkiri.vo.ReplyVO;

@WebServlet("/showPost.do")
public class ShowPost extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//한글처리
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		//클라이언트 전송 시 전달 데이터 받기
		int post_num = Integer.parseInt(request.getParameter("postNum"));
		
		//service객체 생성
		PostService p_service=PostServiceImpl.getInstance();
		ReplyService r_service=ReplyServiceImpl.getInstance();
		
		//조회수 증가
		p_service.plusViewNum(post_num);
		
		//데이터 받아오기
		PostVO pvo=p_service.showPost(post_num);
		List<AtfileVO> imageList=p_service.getImageFileInfo(post_num);
		List<AtfileVO> fileList=p_service.getPostFileInfo(post_num);
		List<ReplyVO> replyList=r_service.getReply(post_num);

		//request에 결과값 저장
		request.setAttribute("postVo", pvo);
		request.setAttribute("fileList", fileList);
		request.setAttribute("post_num", post_num);
		request.setAttribute("reply", replyList);
		
		if(imageList!=null) request.setAttribute("imageList", imageList);
		
		//view페이지로 이동
		request.getRequestDispatcher("post/showPost.jsp").forward(request, response);
	}

}
