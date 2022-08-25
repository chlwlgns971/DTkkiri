package kr.or.ddit.dtkkiri.restaurant.service;

import java.util.List;
import java.util.Map;

import kr.or.ddit.dtkkiri.restaurant.dao.RestaurantDao;
import kr.or.ddit.dtkkiri.restaurant.dao.RestaurantDaoImpl;
import kr.or.ddit.dtkkiri.vo.PageVO;
import kr.or.ddit.dtkkiri.vo.ResPageVO;
import kr.or.ddit.dtkkiri.vo.RestaurantVO;

public class RestaurantServiceImpl implements RestaurantService {
	private RestaurantDao dao;
	private static RestaurantService service;

	public RestaurantServiceImpl() {
		dao = RestaurantDaoImpl.getInstance();
	}

	public static RestaurantService getInstance() {
		if (service == null)
			service = new RestaurantServiceImpl();
		return service;
	}
	
	
	@Override
	public List<RestaurantVO> searchAllRes(Map<String, Object> map) {
		return dao.searchAllRes(map);
	}

	@Override
	public List<RestaurantVO> searchRes(String name) {
		return dao.searchRes(name);
	}

	@Override
	public int insertRes(RestaurantVO resVo) {
		return dao.insertRes(resVo);
	}

	@Override
	public int deleteRes(int num) {
		return dao.deleteRes(num);
	}

	@Override
	public int updateRes(RestaurantVO vo) {
		return dao.updateRes(vo);
	}
	


	@Override
	public ResPageVO pageInfo(int page, String boardCode) {
		// 전체 페이지 수 구하기
		int totalPage = this.totalPage(boardCode);
		// 전체 게시글 수 구하기
		int postCount = this.postCount(boardCode);

		// start, end, startpage, endpage, totalpage
		// 1페이지 1,2,3 2페이지4,5,6 .../ 7.8.9
		int start = (page - 1) * ResPageVO.getPerList() + 1;
		int end = start + ResPageVO.getPerList() - 1;
		if (end > postCount)end = postCount;

		int startPage = ((page - 1) / ResPageVO.getPerPage() * ResPageVO.getPerPage()) + 1;
		int endPage = startPage + ResPageVO.getPerPage() - 1;
		if (endPage > totalPage)endPage = totalPage;

		ResPageVO vo = new ResPageVO();
		vo.setStart(start);
		vo.setEnd(end);

		vo.setStartPage(startPage);
		vo.setEndPage(endPage);
		vo.setTotalpage(totalPage);

		return vo;
	}

	@Override
	public int totalPage(String boardCode) {
		//전체 게시글 수 구하기
		int postCount = this.postCount(boardCode);
		//전체 페이지수 구하기
		int totalPage = (int) Math.ceil((double)postCount/ PageVO.getPerList());
		return totalPage;
	}

	@Override
	public int postCount(String boardCode) {
		return dao.postCount(boardCode);
	}

	@Override
	public RestaurantVO searchNumRes(int num) {
		return dao.searchNumRes(num);
	}

	@Override
	public int updateRate(RestaurantVO vo) {
		return dao.updateRate(vo);
	}

}
