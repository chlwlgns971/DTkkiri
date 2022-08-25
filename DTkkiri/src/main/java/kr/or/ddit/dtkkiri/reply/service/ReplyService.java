package kr.or.ddit.dtkkiri.reply.service;

import java.util.List;
import java.util.Map;

import kr.or.ddit.dtkkiri.vo.ReplyVO;

public interface ReplyService {
	/**
	 * 게시글 댓글 리스트 가져오기
	 * @param postNum: 게시글번호
	 * @return 게시글에 달린 댓글리스트
	 */
	public List<ReplyVO> getReply(int postNum);
	
	/**
	 * 회원 댓글 불러오기 메서드
	 * @param map: 작성자명과 페이징처리를 위한 페이지 정보가 담긴 map
	 * @return 게시글에 달린 댓글리스트
	 */
	public List<ReplyVO> getMemberReply(Map<String, Object> map);
	
	/**
	 * 댓글등록 메서드
	 * @param rvo: 등록을 위한 정보가 담긴 객체
	 */
	public void insertReply(ReplyVO rvo);
	
	/**
	 * 댓글 삭제 메서드
	 * @param replyNum: 삭제를 원하는 댓글번호
	 */
	public void deleteReply(int replyNum);
	
	/**
	 * 댓글 수정 메서드
	 * @param map: 댓글 번호와 수정내용이 들어가는 map
	 */
	public void updateReply(Map<String, Object> map);
	
	/**
	 * 게시글에 달린댓글 삭제
	 * @param postNum: 게시글 번호
	 */
	public void deleteReplyByPost(int postNum);
	
	/**
	 * 현재 댓글 정보 가져오기
	 * @param replyNum: 댓글번호
	 * @return 댓글 정보가 담긴 VO객체
	 */
	public ReplyVO getReplyInfo(int replyNum);

}
