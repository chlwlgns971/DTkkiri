package kr.or.ddit.dtkkiri.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.ddit.dtkkiri.review.service.ReviewService;
import kr.or.ddit.dtkkiri.review.service.ReviewServiceImpl;
import kr.or.ddit.dtkkiri.vo.ReviewVO;


@WebServlet("/reviewDelete.do")
public class ReviewDelete extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
 

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		
		int num = Integer.parseInt(request.getParameter("num"));  //게시글 번호
		int id = Integer.parseInt(request.getParameter("id")); // 댓글번호
		
		ReviewService service = ReviewServiceImpl.getInstance();
		
		int check = service.deleteReview(id);
		
		request.setAttribute("checkDel", check);
		request.setAttribute("rnum", num);
		
		request.getRequestDispatcher("review/reviewDelete.jsp").forward(request, response);
	}

}
