package kr.or.ddit.dtkkiri.restaurant.dao;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import com.ibatis.sqlmap.client.SqlMapClient;

import kr.or.ddit.dtkkiri.vo.RestaurantVO;
import kr.or.ddit.ibatis.config.SqlMapClientFactory;

public class RestaurantDaoImpl implements RestaurantDao {
	private SqlMapClient smc;
	private static RestaurantDao dao;
	
	public RestaurantDaoImpl() {
		smc=SqlMapClientFactory.getSmc();
	}
	public static RestaurantDao getInstance() {
		if(dao==null) dao=new RestaurantDaoImpl();
		return dao;
	}
	
	
	@Override
	public List<RestaurantVO> searchAllRes(Map<String, Object> map) {
		List<RestaurantVO> list = null;
		
		try {
			list = smc.queryForList("restaurant.searchAllRes", map);
			System.out.println("DAO LIST 값 >>" + list);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public List<RestaurantVO> searchRes(String name) {
		List<RestaurantVO> list = null;
		
		try {
			list = smc.queryForList("restaurant.searchRes", name);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public int insertRes(RestaurantVO resVo) {
		int count = 0;
		
		Object obj;
		try {
			obj = smc.insert("restaurant.insertRes",resVo);
			
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
	public int deleteRes(int num) {
		int count = 0;
		
		try {
			count = smc.delete("restaurant.deleteRes", num);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return count;
	}
	@Override
	public int updateRes(RestaurantVO vo) {
		int count = 0;
		
		try {
			count = smc.update("restaurant.updateRes", vo);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return count;
	}

	@Override
	public int postCount(String boardCode) {
		int count=0;
		try {
			count=(int) smc.queryForObject("restaurant.postCount",boardCode);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return count;
	}
	@Override
	public RestaurantVO searchNumRes(int num) {
		RestaurantVO vo = null;
		
		try {
			vo = (RestaurantVO) smc.queryForObject("restaurant.searchNumRes", num);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return vo;
	}
	@Override
	public int updateRate(RestaurantVO vo) {
		int count = 0;
		
		try {
			count = smc.update("restaurant.updateRate", vo);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return count;
	}


}
