package kr.or.ddit.dtkkiri.member.dao;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import com.ibatis.sqlmap.client.SqlMapClient;

import kr.or.ddit.dtkkiri.vo.AuthorityVO;
import kr.or.ddit.dtkkiri.vo.MemberVO;
import kr.or.ddit.ibatis.config.SqlMapClientFactory;

public class MemberDaoImpl implements MemberDao {
	private SqlMapClient smc;
	private static MemberDao dao;
	
	public MemberDaoImpl() {
		smc=SqlMapClientFactory.getSmc();
	}
	public static MemberDao getInstance() {
		if(dao==null) dao=new MemberDaoImpl();
		return dao;
	}

	@Override
	public List<MemberVO> searchAllMember() {
		List<MemberVO> list=null;
		try {
			list=smc.queryForList("member.searchAllMember");
		} catch (SQLException e) {
			list=null;
		}
		return list;
	}

	@Override
	public MemberVO searchMemberById(String id) {
		MemberVO memVo=null;
		try {
			memVo=(MemberVO)smc.queryForObject("member.searchMemberById",id);
		} catch (SQLException e) {
			memVo=null;
			e.printStackTrace();
		}
		return memVo;
	}
	
	@Override
	public List<MemberVO> searchMemberByName(String name) {
		List<MemberVO> list=null;
		try {
			list=(List<MemberVO>)smc.queryForList("member.searchMemberByName",name);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public String findId(String mail) {
		String id="";
		try {
			id=(String)smc.queryForObject("member.findId",mail);
		} catch (SQLException e) {
			id="";
		}
		return id;
	}

	@Override
	public String findPassword(String id) {
		String pass="";
		try {
			pass=(String)smc.queryForObject("member.findPassword",id);
		} catch (SQLException e) {
			pass="";
		}
		return pass;
	}

	@Override
	public int checkById(String id) {
		int count=1;
		try {
			count=(int)smc.queryForObject("member.checkById",id);
		} catch (SQLException e) {
			count=1;
		}
		return count;
	}

	@Override
	public int checkByMail(String mail) {
		int count=1;
		try {
			count=(int)smc.queryForObject("member.checkByMail",mail);
		} catch (SQLException e) {
			count=1;
		}
		return count;
	}

	@Override
	public int signUp(MemberVO vo) {
		int cnt=0;
		try {
			Object obj=smc.insert("member.signUp",vo);
			if(obj==null) {
				cnt=1;
			}
		} catch (SQLException e) {
			cnt=0;
		}
		return cnt;
	}

	@Override
	public int deleteAccount(String id) {
		int cnt=0;
		try {
			int successNum=smc.delete("member.deleteAccount",id);//successNum: ������ ���ڵ� ��
			if(successNum>0) {
				cnt=1;
			}
		} catch (SQLException e) {
			cnt=0;
		}
		return cnt;
	}

	@Override
	public int updateMember(MemberVO vo) {
		int cnt=0;
		try {
			int successNum=smc.update("member.updateMember",vo);//successNum: 처리 완료된 레코드 수
			if(successNum>0) {
				cnt=1;
			}
		} catch (SQLException e) {
			cnt=0;
		}
		return cnt;
	}

	@Override
	public int updatePid(Map<String, String> map) {
		int cnt=0;
		try {
			int successNum=smc.update("member.updatePid",map);//successNum: 처리 완료된 레코드 수
			if(successNum>0) {
				cnt=1;
			}
		} catch (SQLException e) {
			cnt=0;
		}
		return cnt;
	}

	@Override
	public int plusWarning(String id) {
		int cnt=0;
		try {
			int successNum=smc.update("member.plusWarning",id);//successNum: 처리 완료된 레코드 수
			if(successNum>0) {
				cnt=1;
			}
		} catch (SQLException e) {
			cnt=0;
		}
		return cnt;
	}

	@Override
	public int minusWarning(String id) {
		int cnt=0;
		try {
			int successNum=smc.update("member.minusWarning",id);//successNum: 처리 완료된 레코드 수
			if(successNum>0) {
				cnt=1;
			}
		} catch (SQLException e) {
			cnt=0;
		}
		return cnt;
	}
	@Override
	public AuthorityVO getAuthority(Map<String, String> map) {
		AuthorityVO avo=null;
		try {
			avo=(AuthorityVO) smc.queryForObject("aur.getAuthority",map);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return avo;
	}
	@Override
	public List<MemberVO> searchAdminById(Map<String, Object> map) {
		List<MemberVO> list = null;
		
		try {
			list = smc.queryForList("member.searchAdminById", map);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return list;
	}
	@Override
	public int updateDLTMember(String id) {
		int count = 0;
		
		try {
			count = smc.delete("member.updateDLTMember", id);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return count;
	}
	@Override
	public List<MemberVO> subAdminRoomList(int roomNum) {
		List<MemberVO> list = null;
		
		try {
			list = smc.queryForList("member.subAdminRoomList", roomNum);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return list;
	}
	@Override
	public List<MemberVO> subAdminRoomlistSearch(Map<String, Object> map) {
		List<MemberVO> list=  null;
		
		try {
			list = smc.queryForList("member.subAdminRoomlistSearch", map);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return list;
	}

}
