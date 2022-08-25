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

// 음식점 이름을 리뷰게시판에 띄우기
@WebServlet("/reviewList.do")
public class ReviewList extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
 
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		
		String name = request.getParameter("name");
		
		RestaurantService serviceRes = RestaurantServiceImpl.getInstance();
		List<RestaurantVO> vo = serviceRes.searchRes(name);
		
		request.setAttribute("ResList", vo);
		
		request.getRequestDispatcher("/review/reviewMain.jsp").forward(request, response);
	}



}
