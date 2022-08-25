package kr.or.ddit.dtkkiri.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.ddit.dtkkiri.blacklist.service.BlacklistService;
import kr.or.ddit.dtkkiri.blacklist.service.BlaclistServiceImpl;
import kr.or.ddit.dtkkiri.vo.BlacklistVO;


/**
 * Servlet implementation class BlacklistView
 */
@WebServlet("/blacklistView.do")
public class BlacklistView extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");

		// mService 객체 생성
		BlacklistService bService = BlaclistServiceImpl.getInstance();

		// 얻어온 객체 memberList에 담기
		List<BlacklistVO> blackList = null;

		// 얻어온 객체 확인하기
		blackList = bService.searchAllBlacklist();

		//request메소드 호출 - 결과값 받기
		request.setAttribute("blacklist", blackList);

		//AdminView로 전송
		request.getRequestDispatcher("adminView/blacklistView.jsp").forward(request, response);
	}
	

}

