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
import kr.or.ddit.dtkkiri.vo.PageVO;
import kr.or.ddit.dtkkiri.vo.PostVO;

@WebServlet("/postList.do")
public class PostList extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//한글처리
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		//클라이언트 전송 시 전달 데이터 받기
		int cpage = Integer.parseInt(request.getParameter("page"));
		String boardCode = request.getParameter("boardCode");
		String option = request.getParameter("option");
		String keyword = request.getParameter("keyword");
		
		//service객체 얻기
		PostService service = PostServiceImpl.getInstance();
		
		//service메소드 호출 - 
		//param :page, stype, sword
		//결과값 : pageVO - start, end, startPage, endPage, totalPage
		
		List<PostVO> list = null;
		//option과 keyword가 null이 아니면 if문 실행 else면 전체 출력
		if((option != null && keyword != null) && (!"".equals(option) && !"".equals(keyword))) {
			Map<String, String> pageMap=new HashMap<String, String>();
			pageMap.put("option",option);
			pageMap.put("keyword",keyword);
			pageMap.put("post_bcode",boardCode);
			PageVO vo = service.pageInfo(cpage, boardCode, pageMap);
			
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("post_code", boardCode);
			map.put("start", vo.getStart());
			map.put("end", vo.getEnd());
			map.put("keyword", keyword);
			map.put("option", option);
			
			list = service.searchPost(map);	
			request.setAttribute("list", list);
			request.setAttribute("pvo", vo);
				
		}else {
			Map<String, String> pageMap=null;
			PageVO vo = service.pageInfo(cpage, boardCode, pageMap);
			//map객체 설정 - stype, sword, start, end 
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("post_code", boardCode);
			map.put("start", vo.getStart());
			map.put("end", vo.getEnd());
			
			//service메소드 호출 map파라미터 - 결과값 받기
			list = service.postList(map); 
			
			//request에 결과값 저장
			request.setAttribute("list", list);   
			request.setAttribute("pvo", vo);
		}
		//view페이지로 이동	
		request.getRequestDispatcher("post/list.jsp").forward(request, response);
		
		
		/*
		 * Gson gson = new Gson(); String slist = gson.toJson(list);
		 */
	}

}
