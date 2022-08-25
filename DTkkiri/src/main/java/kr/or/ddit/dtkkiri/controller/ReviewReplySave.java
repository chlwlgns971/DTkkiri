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


@WebServlet("/reviewReplySave.do")
public class ReviewReplySave extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
 

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		
		int resNum = Integer.parseInt(request.getParameter("num"));
		String id = request.getParameter("id");
		String cont = request.getParameter("cont");
		int rate = Integer.parseInt(request.getParameter("rate"));
		
		ReviewVO vo = new ReviewVO();
		
		vo.setRv_rnum(resNum);
		vo.setRv_mem_id(id);
		vo.setRv_rate(rate);
		vo.setRv_cont(cont);
		
		ReviewService service= ReviewServiceImpl.getInstance();
		
		int check = (int) service.insertReview(vo);
		
		request.setAttribute("result", check);
		request.setAttribute("Rvo", vo);
		
		request.getRequestDispatcher("review/reviewSave.jsp").forward(request, response);
		
	}

}
