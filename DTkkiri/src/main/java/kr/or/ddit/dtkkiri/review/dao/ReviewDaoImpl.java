package kr.or.ddit.dtkkiri.review.dao;

import java.sql.SQLException;
import java.util.List;

import com.ibatis.sqlmap.client.SqlMapClient;

import kr.or.ddit.dtkkiri.vo.ReviewVO;
import kr.or.ddit.ibatis.config.SqlMapClientFactory;

public class ReviewDaoImpl implements ReviewDao {
	private SqlMapClient smc;
	private static ReviewDao dao;
	
	public ReviewDaoImpl() {
		smc=SqlMapClientFactory.getSmc();
	}
	public static ReviewDao getInstance() {
		if(dao==null) dao=new ReviewDaoImpl();
		return dao;
	}
	
	
	
	@Override
	public int insertReview(ReviewVO vo) {
		int count = 0;
		
		try {
			Object obj = smc.insert("review.insertReview", vo);
			
			if (obj == null) {
				count = 1;
			}
		} catch (SQLException e) {
			count = 0;
			e.printStackTrace();
		}
		return count;
	}

	@Override
	public int updateReview(ReviewVO vo) {
		int count = 0;
		
		try {
			count = smc.update("review.updateReview",vo);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return count;
	}

	@Override
	public int deleteReview(int num) {
		int count = 0;
		
		try {
			count = smc.delete("review.deleteReview",num);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return count;
	}

	@Override
	public List<ReviewVO> selectReview(int resNum) {
		List<ReviewVO> list = null;
		
		try {
			list = smc.queryForList("review.selectReview", resNum);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return list;
	}
	@Override
	public double starReview(int resNum) {
		double num = 0.0;
		try {
			num = (double) smc.queryForObject("review.starReview", resNum);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return num;
	}

}
