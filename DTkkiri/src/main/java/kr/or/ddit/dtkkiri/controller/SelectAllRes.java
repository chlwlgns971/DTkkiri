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

import kr.or.ddit.dtkkiri.restaurant.service.RestaurantService;
import kr.or.ddit.dtkkiri.restaurant.service.RestaurantServiceImpl;
import kr.or.ddit.dtkkiri.vo.ResPageVO;
import kr.or.ddit.dtkkiri.vo.RestaurantVO;


@WebServlet("/selectAllRes.do")
public class SelectAllRes extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		
		int cpage = Integer.parseInt(request.getParameter("page"));
		//처음 실행시 값이 존재하지 않는다.
		String boardCode = request.getParameter("boardCode");
		
		RestaurantService service = RestaurantServiceImpl.getInstance();

		ResPageVO vo = service.pageInfo(cpage, boardCode);
		
		//map객체 설정 - stype, sword, start, end 
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("rst_bcode", boardCode);
		map.put("start", vo.getStart());
		map.put("end", vo.getEnd());
		
		List<RestaurantVO> list = service.searchAllRes(map);
		System.out.println("서블릿 list값 >> " +list);
		
		request.setAttribute("list", list);
		request.setAttribute("pvo", vo);
		
		request.getRequestDispatcher("restaurant/restaurantAll.jsp").forward(request, response);
	
	}




}
