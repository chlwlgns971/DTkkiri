package kr.or.ddit.dtkkiri.post.dao;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import com.ibatis.sqlmap.client.SqlMapClient;

import kr.or.ddit.dtkkiri.vo.AtfileVO;
import kr.or.ddit.dtkkiri.vo.PostVO;
import kr.or.ddit.ibatis.config.SqlMapClientFactory;

public class PostDaoImpl implements PostDao {
	private SqlMapClient smc;
	private static PostDao dao;
	
	public PostDaoImpl() {
		smc=SqlMapClientFactory.getSmc();
	}
	public static PostDao getInstance() {
		if(dao==null) dao=new PostDaoImpl();
		return dao;
	}

	@Override
	public int postCount(String boardCode) {
		int count=0;
		try {
			count=(int) smc.queryForObject("post.postCount",boardCode);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return count;
	}

	@Override
	public List<PostVO> postList(Map<String, Object> map) {
		List<PostVO> list=null;
		try {
			list=smc.queryForList("post.postList",map);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return list;
	}
	@Override
	public PostVO showPost(int postNum) {
		PostVO pvo=null;
		try {
			pvo=(PostVO) smc.queryForObject("post.showPost",postNum);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return pvo;
	}
	@Override
	public void plusViewNum(int postNum) {
		try {
			smc.update("post.plusViewNum",postNum);
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	@Override
	public void plusRecNum(int postNum) {
		try {
			smc.update("post.plusRecNum",postNum);
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	@Override
	public int registPost(PostVO vo) {
		int cnt=0;
		try {
//			if(smc.insert("post.registPost",vo)==null) cnt=1;
			cnt = (int)smc.insert("post.registPost",vo);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return cnt;
	}
	@Override
	public void insertFile(AtfileVO vo) {
		try {
			smc.insert("file.insertFile",vo);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
	}
	@Override
	public List<AtfileVO> getImageFileInfo(int postNum) {
		List<AtfileVO> list=null;
		try {
			list=smc.queryForList("file.getImageFileinfo",postNum);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return list;
	}
	@Override
	public AtfileVO getFileInfo(String fileName) {
		AtfileVO fvo=null;
		try {
			fvo=(AtfileVO) smc.queryForObject("file.getFileinfo",fileName);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return fvo;
	}
	@Override
	public List<PostVO> searchPost(Map<String, Object> map) {
		List<PostVO> list=null;
		try {
			list=smc.queryForList("post.searchPost",map);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return list;
	}
	@Override
	public int searchCount(Map<String, String> map) {
		int count=0;
		try {
			count=(int) smc.queryForObject("post.searchCount",map);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return count;
	}
	@Override
	public void deleteFile(int postNum) {
		try {
			smc.delete("file.deleteFile",postNum);
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	@Override
	public void deletePost(int postNum) {
		try {
			smc.delete("post.deletePost",postNum);
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	@Override
	public void updatePost(Map<String, Object> map) {
		try {
			smc.update("post.updatePost",map);
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	@Override
	public List<AtfileVO> getPostFileInfo(int postNum) {
		List<AtfileVO> list=null;
		try {
			list=smc.queryForList("file.getPostFileInfo",postNum);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return list;
	}
}
