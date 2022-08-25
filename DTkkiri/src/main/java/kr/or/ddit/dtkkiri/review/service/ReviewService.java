package kr.or.ddit.dtkkiri.review.service;

import java.util.List;

import kr.or.ddit.dtkkiri.vo.ReviewVO;

public interface ReviewService {

	/**
	 * 리뷰 작성 메소드
	 * @param vo= 리뷰 정보가 담긴 ReviewVO 객체리스트
	 * @return 1:성공 0:실패
	 */
	public int insertReview(ReviewVO vo);
	
	/**
	 * 리뷰 수정 메소드
	 * @param vo= 수정할 리뷰의 정보
	 * @return 1:성공 0:실패
	 */
	public int updateReview(ReviewVO vo);
	
	/**
	 * 리뷰 삭제 메소드
	 * @param num= 삭제할 리뷰의 번호
	 * @return 1:성공 0:실패
	 */
	public int deleteReview(int num);
	
	/**
	 * 음식점별 리뷰 조회 메소드
	 * @param resNum= 리뷰를 하고자 하는 음식점 번호
	 * @return 해당 음식점 번호에 맞는 ReviewVO 리스트
	 */
	public List<ReviewVO> selectReview(int resNum);
	
	/**
	 * 음식점별 평균평점 확인 메소드
	 * @param resNum= 평점을 확인하고자 하는 음식점 번호
	 * @return 해당 음식점의 평균 평점
	 */
	public double starReview(int resNum);
}
