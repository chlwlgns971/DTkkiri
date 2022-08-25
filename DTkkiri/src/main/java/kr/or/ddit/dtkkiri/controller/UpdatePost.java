package kr.or.ddit.dtkkiri.controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

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

@WebServlet("/updatePost.do")
public class UpdatePost extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 인코딩
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");

		// 데이터받기
		String title = request.getParameter("title");
		String cont = request.getParameter("content");
		String bcode = request.getParameter("boardCode");
		String id=request.getParameter("id");
		int post_num=Integer.parseInt(request.getParameter("postNum"));
		
		// service객체 생성
		PostService p_service = PostServiceImpl.getInstance();
		ReplyService r_service=ReplyServiceImpl.getInstance();
		
		//게시글 수정하기	
		Map<String, Object> map=new HashMap<String, Object>();
		map.put("post_tit", title);
		map.put("post_cont", cont);
		map.put("post_num", post_num);
		p_service.updatePost(map);
		
		PostVO vo=p_service.showPost(post_num);
		List<AtfileVO> list=p_service.getImageFileInfo(post_num);
		List<ReplyVO> rlist=r_service.getReply(post_num);

		//request에 결과값 저장
		request.setAttribute("postVo", vo);
		request.setAttribute("fileList", list);
		request.setAttribute("post_num", post_num);
		request.setAttribute("reply", rlist);
		
		//view페이지로 이동
		request.getRequestDispatcher("post/showPost.jsp").forward(request, response);
	}
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

}
