package com.simpson.kisen.fan.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository

public class FanDaoImpl implements FanDao {
	
	@Autowired
	private SqlSessionTemplate session;
	
	
}
