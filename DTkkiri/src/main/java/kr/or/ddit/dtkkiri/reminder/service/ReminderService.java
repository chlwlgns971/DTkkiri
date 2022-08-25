package kr.or.ddit.dtkkiri.reminder.service;

import java.util.List;
import java.util.Map;

import kr.or.ddit.dtkkiri.vo.ReminderVO;

public interface ReminderService {

	/**
	 * 리마인더 내용 추가 메소드
	 * @param vo= vo에는 String 형의 아이디와 리마인더 내용이 들어간다.
	 * @return 1:성공 0:실패
	 */
	public int insertReminder(ReminderVO vo);
	
	/**
	 * 리마인더 내용 삭제 메소드
	 * @param num= 삭제할 리마인더 번호
	 * @return 1:성공 0:실패
	 */
	public int deleteReminder(int num);
	
	/**
	 * 리마인더 내용 불러오기 메소드
	 * @param id= 리마인더 내용을 불러올 해당 회원ID
	 * @return 회원의 리마인더 정보가 담긴 ReminderVO객체
	 */
	public List<ReminderVO> selectReminder(String id);
	
	
	/**
	 * 탈퇴한 회원의 리마인더를 삭제하는 메소드
	 * @param id= 탈퇴한 회원의 아이디
	 * @return 1:성공 0:실패
	 */
	public int deleteUserReminder(String id);
}
