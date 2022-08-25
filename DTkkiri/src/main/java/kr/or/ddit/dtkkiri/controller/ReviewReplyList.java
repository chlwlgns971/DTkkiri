package kr.or.ddit.dtkkiri.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.ddit.dtkkiri.restaurant.service.RestaurantService;
import kr.or.ddit.dtkkiri.restaurant.service.RestaurantServiceImpl;
import kr.or.ddit.dtkkiri.review.service.ReviewService;
import kr.or.ddit.dtkkiri.review.service.ReviewServiceImpl;
import kr.or.ddit.dtkkiri.vo.RestaurantVO;
import kr.or.ddit.dtkkiri.vo.ReviewVO;


@WebServlet("/reviewReplyList.do")
public class ReviewReplyList extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		
		//--- 1. 리뷰(댓글) 리스트 띄우기
		int resNum = Integer.parseInt(request.getParameter("num"));

		ReviewService service = ReviewServiceImpl.getInstance();

		List<ReviewVO> list = service.selectReview(resNum);

		request.setAttribute("list", list);
		
		
		//--- 2. 평점 계산하기 -- 위의 resNum을 같이 이용한다
		double num = service.starReview(resNum); // 음식점의 평점
		

		// 음식점게시판에 넣어주기
		RestaurantService serviceRes = RestaurantServiceImpl.getInstance();
		
		RestaurantVO vo = new RestaurantVO();
		vo.setRst_rate(num);
		vo.setRst_num(resNum);
		
		int check = serviceRes.updateRate(vo);
		
		request.setAttribute("avgRate", check);
		
		request.getRequestDispatcher("review/reviewReplyList.jsp").forward(request, response);
	}



}
