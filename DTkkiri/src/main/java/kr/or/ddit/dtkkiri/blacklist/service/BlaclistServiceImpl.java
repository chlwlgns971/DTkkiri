package kr.or.ddit.dtkkiri.blacklist.service;

import java.util.List;

import kr.or.ddit.dtkkiri.blacklist.dao.BlacklistDao;
import kr.or.ddit.dtkkiri.blacklist.dao.BlacklistDaoImpl;
import kr.or.ddit.dtkkiri.vo.BlacklistVO;

public class BlaclistServiceImpl implements BlacklistService {

	private BlacklistDao dao;
	private static BlacklistService service;
	
	public BlaclistServiceImpl() {
		dao=BlacklistDaoImpl.getInstance();
	}
	public static BlacklistService getInstance() {
		if(service==null) service=new BlaclistServiceImpl();
		return service;
	}
	
	@Override
	public int insertBlacklist(BlacklistVO bklVo) {
		return dao.insertBlacklist(bklVo);
	}

	@Override
	public int deleteBlacklist(String email) {
		return dao.deleteBlacklist(email);
	}

	@Override
	public List<BlacklistVO> searchAllBlacklist() {
		return dao.searchAllBlacklist();
	}

	@Override
	public BlacklistVO searchBlacklist(String email) {
		return dao.searchBlacklist(email);
	}
	@Override
	public int searchBlacklistNum(String email) {
		return dao.searchBlacklistNum(email);
	}
	@Override
	public List<BlacklistVO> subAdminsearchList(int roomNum) {
		return dao.subAdminsearchList(roomNum);
	}

}
