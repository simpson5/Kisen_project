package com.simpson.kisen.idol.model.dao;

import java.util.List;

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
	public List<DipIdol> selectOneCollection() {
		return session.selectList("idol.selectOneCollection");
	}


	@Override
	public List<Idol> selectAllIdole() {
		return session.selectList("idol.selectAllIdole");
	}

	


	
	
}
