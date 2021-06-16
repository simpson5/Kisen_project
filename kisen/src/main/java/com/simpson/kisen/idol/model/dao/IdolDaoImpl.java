package com.simpson.kisen.idol.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.simpson.kisen.idol.model.vo.IdolImg;

@Repository
public class IdolDaoImpl implements IdolDao {
	
	@Autowired
	private SqlSessionTemplate session;

	@Override
	public IdolImg selectOneIdolCollection(int fanNo) {
		return session.selectOne("idol.selectOneIdolCollection", fanNo);
	}
	
	
}
