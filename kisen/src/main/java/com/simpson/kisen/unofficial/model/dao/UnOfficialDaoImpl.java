package com.simpson.kisen.unofficial.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class UnOfficialDaoImpl implements UnOfficialDao {
	
	@Autowired
	private SqlSessionTemplate session;

}
