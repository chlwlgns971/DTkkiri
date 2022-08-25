package kr.or.ddit.dtkkiri.blacklist.dao;

import java.util.List;

import kr.or.ddit.dtkkiri.vo.BlacklistVO;

public interface BlacklistDao {

	/**
	 * 블랙리스트 추가 메소드
	 * @param bklVo= 블랙리스트 정보가 담긴 객체
	 * @return 1:성공 0:실패
	 */
	public int insertBlacklist(BlacklistVO bklVo);
	
	/**
	 * 블랙리스트 삭제 메소드
	 * @param email= 블랙리스트에서 제거할 회원의 이메일
	 * @return 1:성공 0:실패
	 */
	public int deleteBlacklist(String email);
	
	/**
	 * 블랙리스트 전체 조회 메소드
	 * @return 블랙리스트 정보가 담긴 BlacklistVO 객체리스트
	 */
	public List<BlacklistVO> searchAllBlacklist();
	
	/**
	 * 메일을 이용한 블랙리스트 조회 메소드
	 * @param email= 조회하고자 하는 블랙리스트 이메일
	 * @return 블랙리스트 정보가 담긴 BlacklistVO 객체
	 */
	public BlacklistVO searchBlacklist(String email);
	
	/**
	 * 회원가입 재가입을 방지하기 위한 블랙리스트 조회 메소드
	 * @param email= 검색하고자 하는 블랙리스트 메일
	 * @return 1:회원가입 불가 0:회원가입 가능
	 */
	public int searchBlacklistNum(String email);
	
	/**
	 * 서브 관리자 페이지에서의 블랙리스트 조회
	 * @param roomNum= 검색하고자 하는 호실번호의 블랙리스트
	 * @return 해당 방번호에 맞는 블랙리스트 
	 */
	public List<BlacklistVO> subAdminsearchList(int roomNum);
}
