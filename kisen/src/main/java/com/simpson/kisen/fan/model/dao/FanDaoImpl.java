package com.simpson.kisen.fan.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Repository;

import com.simpson.kisen.fan.model.vo.Fan;

@Repository
public class FanDaoImpl implements FanDao {
	
	@Autowired
	private SqlSessionTemplate session;

	@Override
	public int updateFan(Fan updateFan) {
		return session.update("member.updateFan",updateFan);
	}

	@Override
	public int deleteFan(String fanId) {
		return session.delete("member.deleteFan",fanId);
	}



	
	
}
