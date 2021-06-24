package com.simpson.kisen.idol.model.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.ui.Model;

import com.simpson.kisen.fan.model.vo.Fan;
import com.simpson.kisen.idol.model.vo.DipIdol;
import com.simpson.kisen.idol.model.vo.Idol;


@Repository
public class IdolDaoImpl implements IdolDao {
	
	@Autowired
	private SqlSessionTemplate session;


	@Override
	public List<DipIdol> selectOneCollection(Map<String, Object> param) {
		int offset = (int)param.get("offset");
		int limit = (int)param.get("limit");
		RowBounds rowBounds = new RowBounds(offset, limit);
		return session.selectList("idol.selectOneCollection",null, rowBounds);
	}


	@Override
	public List<Idol> selectAllIdole(Map<String, Object> param) {
		int offset = (int)param.get("offset");
		int limit = (int)param.get("limit");
		RowBounds rowBounds = new RowBounds(offset, limit);
		return session.selectList("idol.selectAllIdole",null, rowBounds);
	}


	@Override
	public int insertIdol(DipIdol dip) {
		return session.insert("idol.insertIdol",dip);
	}


	@Override
	public int deleteidol(int idolNo) {
		return session.delete("idol.deleteidol",idolNo);
	}

	


	
	
}
