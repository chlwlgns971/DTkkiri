package kr.or.ddit.dtkkiri.review.service;

import java.util.List;

import kr.or.ddit.dtkkiri.review.dao.ReviewDao;
import kr.or.ddit.dtkkiri.review.dao.ReviewDaoImpl;
import kr.or.ddit.dtkkiri.vo.ReviewVO;

public class ReviewServiceImpl implements ReviewService{
	private ReviewDao dao;
	private static ReviewService service;

	public ReviewServiceImpl() {
		dao = ReviewDaoImpl.getInstance();
	}

	public static ReviewService getInstance() {
		if (service == null)
			service = new ReviewServiceImpl();
		return service;
	}
	
	
	@Override
	public int insertReview(ReviewVO vo) {
		return dao.insertReview(vo);
	}

	@Override
	public int updateReview(ReviewVO vo) {
		return dao.updateReview(vo);
	}

	@Override
	public int deleteReview(int num) {
		return dao.deleteReview(num);
	}

	@Override
	public List<ReviewVO> selectReview(int resNum) {
		return dao.selectReview(resNum);
	}

	@Override
	public double starReview(int resNum) {
		return dao.starReview(resNum);
	}

}
