package kr.or.ddit.dtkkiri.member.service;

import java.util.List;
import java.util.Map;

import kr.or.ddit.dtkkiri.member.dao.MemberDao;
import kr.or.ddit.dtkkiri.member.dao.MemberDaoImpl;
import kr.or.ddit.dtkkiri.vo.AuthorityVO;
import kr.or.ddit.dtkkiri.vo.MemberVO;

public class MemberServiceImpl implements MemberService {
	private MemberDao dao;
	private static MemberService service;
	
	public MemberServiceImpl() {
		dao=MemberDaoImpl.getInstance();
	}
	public static MemberService getInstance() {
		if(service==null) service=new MemberServiceImpl();
		return service;
	}
	@Override
	public List<MemberVO> searchAllMember() {
		return dao.searchAllMember();
	}

	@Override
	public MemberVO searchMemberById(String id) {
		return dao.searchMemberById(id);
	}
	
	@Override
	public List<MemberVO> searchMemberByName(String Name) {
		return dao.searchMemberByName(Name);
	}

	@Override
	public String findId(String mail) {
		return dao.findId(mail);
	}

	@Override
	public String findPassword(String id) {
		return dao.findPassword(id);
	}

	@Override
	public int checkById(String id) {
		return dao.checkById(id);
	}

	@Override
	public int checkByMail(String mail) {
		return dao.checkByMail(mail);
	}

	@Override
	public int signUp(MemberVO vo) {
		return dao.signUp(vo);
	}

	@Override
	public int deleteAccount(String id) {
		return dao.deleteAccount(id);
	}

	@Override
	public int updateMember(MemberVO vo) {
		return dao.updateMember(vo);
	}

	@Override
	public int updatePid(Map<String, String> map) {
		return dao.updatePid(map);
	}

	@Override
	public int plusWarning(String id) {
		return dao.plusWarning(id);
	}

	@Override
	public int minusWarning(String id) {
		return dao.minusWarning(id);
	}
	@Override
	public AuthorityVO getAuthority(Map<String, String> map) {
		return dao.getAuthority(map);
	}
	@Override
	public List<MemberVO> searchAdminById(Map<String, Object> map) {
		return dao.searchAdminById(map);
	}
	@Override
	public int updateDLTMember(String id) {
		return dao.updateDLTMember(id);
	}
	@Override
	public List<MemberVO> subAdminRoomList(int roomNum) {
		return dao.subAdminRoomList(roomNum);
	}
	@Override
	public List<MemberVO> subAdminRoomlistSearch(Map<String, Object> map) {
		return dao.subAdminRoomlistSearch(map);
	}

}
