package kr.or.ddit.dtkkiri.restaurant.service;

import java.util.List;
import java.util.Map;

import kr.or.ddit.dtkkiri.vo.ResPageVO;
import kr.or.ddit.dtkkiri.vo.RestaurantVO;

public interface RestaurantService {

	/**
	 * 음식점 전체 조회 메소드
	 * @param Map<String, Object> map: 해당 게시글 페이지에 대한 정보가 담긴 map
	 * @return 음식점 정보가 담겨있는 RestaurantVO 객체 리스트
	 */
	public List<RestaurantVO> searchAllRes(Map<String, Object> map);
	
	/**
	 * 상호명 검색을 통한 음식점 조회 메소드
	 * @param name= 검색하고자 하는 상호명
	 * @return 음식점 정보가 담겨있는 RestaurantVO 객체 리스트
	 */
	public List<RestaurantVO> searchRes(String name);
	
	/**
	 * 음식점 번호를 통한 음식점 조회 메소드 (리뷰용)
	 * @param num= 검색하고자 하는 음식점 번호
	 * @return 음식점 정보가 담겨있는 RestaurantVO
	 */
	public RestaurantVO searchNumRes(int num);
	
	
	/**
	 * 음식점 추가 메소드
	 * @param resVo= 음식점 정보가 담겨있는 객체
	 * @return 1:성공 0:실패
	 */
	public int insertRes(RestaurantVO resVo);
	
	/**
	 * 음식점 삭제 메소드
	 * @param num= 삭제하고자 하는 음식점 번호
	 * @return 1:성공 0:실패
	 */
	public int deleteRes(int num);
	
	/**
	 * 음식점 수정 메소드
	 * @param vo= 수정하고자 하는 음식점 정보
	 * @return 1:성공 0:실패
	 */
	public int updateRes(RestaurantVO vo);
	
	//페이지정보를 얻기 위한 메소드
	public ResPageVO pageInfo(int page, String boardCode);
	
	//전체 페이지 수 구하기
	public int totalPage(String boardCode);
	
	/**
	 * 해당 게시판의 게시글 갯수 구하는 메서드
	 * @param boardCode: 게시판 코드
	 * @return 개시글 갯수
	 */
	public int postCount(String boardCode);
	
	// 평점 업데이트 추가 필요!
	/**
	 * 평점을 업데이트 하는 메소드
	 * @param vo= 업데이트를 하기 위한 정보
	 * @return 1:성공 0:실패
	 */
	public int updateRate(RestaurantVO vo);
}
