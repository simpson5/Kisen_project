package com.simpson.kisen.agency.model.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.simpson.kisen.idol.model.vo.Idol;
import com.simpson.kisen.idol.model.vo.IdolImg;

import lombok.extern.slf4j.Slf4j;

@Repository
@Slf4j
public class AgencyDaoImpl implements AgencyDao {
	@Autowired
	private SqlSessionTemplate session;

	@Override
	public List<Idol> selectIdolList() {
		return session.selectList("agency.selectIdolList");
	}
	
//	@Override
//	public int insertIdol(Idol idol) {
//		return session.insert("agency.insertIdol", idol);
//	}
//
//	@Override
//	public int insertIdolImg(IdolImg idolImg) {
//		log.info("idolImg ={}",idolImg);
//		return session.insert("agency.insertIdolImg",idolImg);
//	}

}
