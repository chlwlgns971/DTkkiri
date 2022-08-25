package kr.or.ddit.dtkkiri.blacklist.dao;

import java.sql.SQLException;
import java.util.List;

import com.ibatis.sqlmap.client.SqlMapClient;

import kr.or.ddit.dtkkiri.vo.BlacklistVO;
import kr.or.ddit.ibatis.config.SqlMapClientFactory;

public class BlacklistDaoImpl implements BlacklistDao{
	private SqlMapClient smc;
	private static BlacklistDao dao;
	
	public BlacklistDaoImpl() {
		smc=SqlMapClientFactory.getSmc();
	}
	public static BlacklistDao getInstance() {
		if(dao==null) dao=new BlacklistDaoImpl();
		return dao;
	}
	
	@Override
	public int insertBlacklist(BlacklistVO bklVo) {
		int count = 0;
		
		try {
			Object obj=smc.insert("blacklist.insertBlacklist",bklVo);
			if(obj==null) {
				count=1;
			}
		} catch (SQLException e) {
			count =0;
			e.printStackTrace();
		}
		return count;
	}

	@Override
	public int deleteBlacklist(String email) {
		int count = 0;
		
		try {
			count = smc.delete("blacklist.deleteBlacklist", email);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return count;
	}

	@Override
	public List<BlacklistVO> searchAllBlacklist() {
		List<BlacklistVO> list = null;
		
		try {
			list = smc.queryForList("blacklist.searchAllBlacklist");
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return list;
	}

	@Override
	public BlacklistVO searchBlacklist(String email) {
		BlacklistVO bklVo = null;
		
		try {
			bklVo = (BlacklistVO) smc.queryForObject("blacklist.searchBlacklist", email);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return bklVo;
	}
	@Override
	public int searchBlacklistNum(String email) {
		int count =0;
		
			try {
				count = (int) smc.queryForObject("blacklist.searchBlacklistNum", email);
			} catch (SQLException e) {
				e.printStackTrace();
			}
		return count;
	}
	@Override
	public List<BlacklistVO> subAdminsearchList(int roomNum) {
		List<BlacklistVO> list = null;
		
		try {
			list = smc.queryForList("blacklist.subAdminsearchList", roomNum);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return list;
	}


}
