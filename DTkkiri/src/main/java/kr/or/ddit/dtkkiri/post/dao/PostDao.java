package kr.or.ddit.dtkkiri.post.dao;

import java.util.List;
import java.util.Map;

import kr.or.ddit.dtkkiri.vo.AtfileVO;
import kr.or.ddit.dtkkiri.vo.PostVO;

public interface PostDao {
	/**
	 * 해당 게시판의 게시글 갯수 구하는 메서드
	 * @param boardCode: 게시판 코드
	 * @return 개시글 갯수
	 */
	public int postCount(String boardCode);
	
	/**
	 * 해당 게시판의 게시글 리스트 출력하는 메서드
	 * @param Map<String, Object> map: 해당 게시글 페이지에 대한 정보가 담긴 map
	 * @return 해당 게시판의 게시글 정보가 담긴 List
	 */
	public List<PostVO> postList(Map<String, Object> map);
	
	/**
	 * 게시글 상세보기 메서드
	 * @param postNum: 게시글의 번호(기본키)
	 * @return 게시글의 정보가 담긴 PostVO객체
	 */
	public PostVO showPost(int postNum);
	
	/**
	 * 조회수 증가 메서드
	 * @param postNum: 게시글의 번호(기본키)
	 */
	public void plusViewNum(int postNum);
	
	/**
	 * 추천수 증가 메서드
	 * @param postNum: 게시글의 번호(기본키)
	 */
	public void plusRecNum(int postNum);
	
	/**
	 * 게시글 등록 메서드
	 * @param vo: 게시글 등록을 위한 정보가 담긴 객체
	 * @return 등록한 게시글 번호
	 */
	public int registPost(PostVO vo);
	
	/**
	 * 게시글 첨부파일 등록 메서드
	 * @param vo: 첨부파일 정보가 담긴 객체
	 */
	public void insertFile(AtfileVO vo);
	
	/**
	 * 해당 게시글에 첨부된 이미지파일 정보 가져오기 메서드
	 * @param postNum: 게시글번호
	 * @return 이미지파일 객체리스트
	 */
	public List<AtfileVO> getImageFileInfo(int postNum);
	
	/**
	 * 파일 객체정보 가져오는 메서드
	 * @param fileName: 파일저장명
	 * @return 파일정보가 담긴 객체
	 */
	public AtfileVO getFileInfo(String fileName);
	
	/**
	 * 파일 객체정보 가져오는 메서드
	 * @param fileName: 파일저장명
	 * @return 파일정보가 담긴 객체
	 */
	public List<AtfileVO> getPostFileInfo(int postNum);
	
	
	/**
	 * 해당 게시판의 검색 결과 리스트 출력하는 메서드
	 * @param Map<String, Object> map: 해당 게시글 페이지에 대한 정보가 담긴 map
	 * @return 해당 게시판의 게시글 정보가 담긴 List
	 */
	public List<PostVO> searchPost(Map<String, Object> map);
	
	/**
	 * 검색결과 숫자 리턴 메서드
	 * @param map
	 * @return 검색결과 게시글 갯수
	 */
	public int searchCount(Map<String,String> map);
	
	/**
	 * 게시글에 첨부된 파일 삭제
	 * @param postNum: 게시글 번호
	 */
	public void deleteFile(int postNum);
	
	/**
	 * 게시글 삭제 메서드
	 * @param postNum: 게시글 번호
	 */
	public void deletePost(int postNum);
	
	/**
	 * 게시글 업데이트 메서드
	 * @param vo: 게시글 수정정보가 담긴 객체
	 */
	public void updatePost(Map<String, Object> map);
}
