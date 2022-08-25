package kr.or.ddit.dtkkiri.reminder.service;

import java.util.List;
import java.util.Map;

import kr.or.ddit.dtkkiri.reminder.dao.ReminderDao;
import kr.or.ddit.dtkkiri.reminder.dao.ReminderDaoImpl;
import kr.or.ddit.dtkkiri.vo.ReminderVO;

public class ReminderServiceImpl implements ReminderService {
	private ReminderDao dao;
	private static ReminderService service;

	public ReminderServiceImpl() {
		dao = ReminderDaoImpl.getInstance();
	}

	public static ReminderService getInstance() {
		if (service == null)
			service = new ReminderServiceImpl();
		return service;
	}
	
	@Override
	public int insertReminder(ReminderVO vo) {
		return dao.insertReminder(vo);
	}

	@Override
	public int deleteReminder(int num) {
		return dao.deleteReminder(num);
	}

	@Override
	public List<ReminderVO> selectReminder(String id) {
		return dao.selectReminder(id);
	}

	@Override
	public int deleteUserReminder(String id) {
		return dao.deleteUserReminder(id);
	}

}
