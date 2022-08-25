package kr.or.ddit.dtkkiri.reply.service;

import java.util.List;
import java.util.Map;

import kr.or.ddit.dtkkiri.reply.dao.ReplyDao;
import kr.or.ddit.dtkkiri.reply.dao.ReplyDaoImpl;
import kr.or.ddit.dtkkiri.vo.ReplyVO;

public class ReplyServiceImpl implements ReplyService {
	private ReplyDao dao;
	private static ReplyService service;
	
	public ReplyServiceImpl() {
		dao=ReplyDaoImpl.getInstance();
	}
	public static ReplyService getInstance() {
		if(service==null) service=new ReplyServiceImpl();
		return service;
	}

	@Override
	public List<ReplyVO> getReply(int postNum) {
		return dao.getReply(postNum);
	}

	@Override
	public List<ReplyVO> getMemberReply(Map<String, Object> map) {
		return dao.getMemberReply(map);
	}

	@Override
	public void insertReply(ReplyVO rvo) {
		dao.insertReply(rvo);
	}

	@Override
	public void deleteReply(int replyNum) {
		dao.deleteReply(replyNum);
	}

	@Override
	public void updateReply(Map<String, Object> map) {
		dao.updateReply(map);
	}
	@Override
	public void deleteReplyByPost(int postNum) {
		dao.deleteReplyByPost(postNum);
	}
	@Override
	public ReplyVO getReplyInfo(int replyNum) {
		return dao.getReplyInfo(replyNum);
	}

}
