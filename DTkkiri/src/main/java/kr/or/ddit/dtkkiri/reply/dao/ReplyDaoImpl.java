package kr.or.ddit.dtkkiri.reply.dao;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import com.ibatis.sqlmap.client.SqlMapClient;

import kr.or.ddit.dtkkiri.vo.ReplyVO;
import kr.or.ddit.ibatis.config.SqlMapClientFactory;

public class ReplyDaoImpl implements ReplyDao {
	private SqlMapClient smc;
	private static ReplyDao dao;
	
	public ReplyDaoImpl() {
		smc=SqlMapClientFactory.getSmc();
	}
	public static ReplyDao getInstance() {
		if(dao==null) dao=new ReplyDaoImpl();
		return dao;
	}

	@Override
	public List<ReplyVO> getReply(int postNum) {
		List<ReplyVO> list=null;
		try {
			list=smc.queryForList("reply.getReply",postNum);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public List<ReplyVO> getMemberReply(Map<String, Object> map) {
		List<ReplyVO> list=null;
		try {
			list=smc.queryForList("reply.getMemberReply",map);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public void insertReply(ReplyVO rvo) {
		try {
			smc.insert("reply.insertReply",rvo);
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	@Override
	public void deleteReply(int replyNum) {
		try {
			smc.delete("reply.deleteReply",replyNum);
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	@Override
	public void updateReply(Map<String, Object> map) {
		try {
			smc.update("reply.updateReply",map);
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	@Override
	public void deleteReplyByPost(int postNum) {
		try {
			smc.delete("reply.deleteReplyByPost",postNum);
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	@Override
	public ReplyVO getReplyInfo(int replyNum) {
		ReplyVO rvo=null;
		try {
			rvo=(ReplyVO) smc.queryForObject("reply.getReplyInfo",replyNum);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return rvo;
	}

}
