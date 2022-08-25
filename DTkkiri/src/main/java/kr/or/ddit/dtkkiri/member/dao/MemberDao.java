package kr.or.ddit.dtkkiri.member.dao;

import java.util.List;
import java.util.Map;

import kr.or.ddit.dtkkiri.vo.AuthorityVO;
import kr.or.ddit.dtkkiri.vo.MemberVO;

public interface MemberDao {
	/**
	 * 관리자용 회원전체조회 메서드
	 * @return 회원정보가 담긴 MemberVO객체리스트
	 */
	public List<MemberVO> searchAllMember();
	
	/**
	 * 관리자용 회원조회 메서드	
	 * @param id=검색하고자 하는 회원id
	 * @return 회원정보가 담긴 MemverVO객체
	 */
	public MemberVO searchMemberById(String id);
	
	/**
	 * 관리자용 회원조회 메서드	
	 * @param name=검색하고자 하는 회원이름
	 * @return 회원정보가 담긴 MemverVO객체
	 */
	public List<MemberVO> searchMemberByName(String name);
	
	/**
	 * 아이디 찾기 기능 메서드
	 * @param mail= 회원가입 당시 인증한 이메일
	 * @return 해당 이메일로 가입한 id반환
	 */
	public String findId(String mail);
	
	/**
	 * 비밀번호 찾기 기능 메서드
	 * @param id=이메일 인증 후 해당이메일로 인증받은 아이디
	 * @return 해당 이메일로 가입한 비밀번호 반환
	 */
	public String findPassword(String id);
	
	/**
	 * 아이디 중복체크 메서드
	 * @param id=회원가입란에 기입한 아이디
	 * @return 1=중복 0=가입가능
	 */
	public int checkById(String id);
	
	/**
	 * 이메일 중복체크 메서드
	 * @param mail=회원가입란에 기입한 이메일
	 * @return 1=중복 0=가입가능
	 */
	public int checkByMail(String mail);
	
	/**
	 * 회원가입메서드
	 * @param vo=회원가입 정보가 담긴 객체
	 * @return 1:성공 0: 실패
	 */
	public int signUp(MemberVO vo);
	
	/**
	 * 회원탈퇴메서드
	 * @param id=회원 탈퇴할 아이디
	 * @return 1:성공 0:실패
	 */
	public int deleteAccount(String id);
	
	/**
	 * 회원정보수정 메서드
	 * @param vo=변경내용이 담긴 Member객체
	 * @return 1:성공 0:실패
	 */
	public int updateMember(MemberVO vo);
	
	/**
	 * 관리자용 회원직급수정 메서드
	 * @param map= map에는 String타입 회원 직급명과 회원아이디가 들어간다.
	 * @return 1:성공 0:실패
	 */
	public int updatePid(Map<String, String> map);
	
	/**
	 * 회원경고횟수 증가 메서드
	 * @param id=경고횟수를 증가시키고자 하는 아이디
	 * @return 1:성공 0:실패
	 */
	public int plusWarning(String id);
	
	/**
	 * 회원경고횟수 감소 메서드
	 * @param id=경고횟수를 감소하고자 하는 아이디
	 * @return 1:성공 0:실패
	 */
	public int minusWarning(String id);
	
	/**
	 * 회원 권한 가져오는 메서드
	 * @param map=게시판코드와 회원직급아이디가 담긴 Map
	 * @return 권한정보가 담긴 VO객체
	 */
	public AuthorityVO getAuthority(Map<String, String> map);
	
	/**
	 * 회원 검색 메소드
	 * @param map= 검색조건과 검색내용이 담긴 Map
	 * @return 검색결과가 담긴 MemberVO 리스트
	 */
	public List<MemberVO> searchAdminById(Map<String, Object> map);
	
	
	/**
	 * 회원 탈퇴 시 탈퇴여부 수정 메소드
	 * @param id= 탈퇴한 회원의 아이디
	 * @return 1:성공 0:실패
	 */
	public int updateDLTMember(String id);
	
	/**
	 * 서브관리자가 관리해야하는 회원 목록 출력 메소드
	 * @param roomNum= 서브관리자가 관리하는 호실번호
	 * @return 호실번호에 맞는 MemberVO 리스트
	 */
	public List<MemberVO> subAdminRoomList(int roomNum);
	
	/**
	 * 서브 관리자의 관리자페이지 검색옵션 메소드
	 * @param map= 검색조건과 검색내용이 담긴 Map
	 * @return 검색결과가 담긴 MemberVO 리스트
	 */
	public List<MemberVO> subAdminRoomlistSearch(Map<String, Object> map);
	
}
