package com.simpson.kisen.artist.model.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.simpson.kisen.idol.model.vo.Idol;

@Repository
public class ArtistDaoImpl implements ArtistDao {

	@Autowired
	private SqlSessionTemplate session;
	
	@Override
	public List<Idol> selectAllIdolName() {
		return session.selectList("agency-artist.selectAllIdolName");
	}

}
