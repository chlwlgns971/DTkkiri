package kr.or.ddit.dtkkiri.reminder.dao;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import com.ibatis.sqlmap.client.SqlMapClient;

import kr.or.ddit.dtkkiri.vo.ReminderVO;
import kr.or.ddit.ibatis.config.SqlMapClientFactory;

public class ReminderDaoImpl implements ReminderDao {
	private SqlMapClient smc;
	private static ReminderDao dao;
	
	public ReminderDaoImpl() {
		smc=SqlMapClientFactory.getSmc();
	}
	public static ReminderDao getInstance() {
		if(dao==null) dao=new ReminderDaoImpl();
		return dao;
	}
	
	@Override
	public int insertReminder(ReminderVO vo) {
		int count=0;
		
		try {
			Object obj=smc.insert("reminder.insertReminder", vo);
			if(obj==null) {
				count=1;
			}
		} catch (SQLException e) {
			count=0;
			e.printStackTrace();
		}
		
		return count;
	}

	@Override
	public int deleteReminder(int num) {
		int count=0;
		
		try {
			count = (int) smc.delete("reminder.deleteReminder", num);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return count;
	}

	@Override
	public List<ReminderVO> selectReminder(String id) {
		List<ReminderVO> list = null;
		
		try {
			list = smc.queryForList("reminder.selectReminder", id);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return list;
	}
	@Override
	public int deleteUserReminder(String id) {
		int count = 0;
		
		try {
			count = smc.delete("reminder.deleteUserReminder", id);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return count;
	}

}
