package com.simpson.kisen.agency.model.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.simpson.kisen.agency.model.vo.Agency;
import com.simpson.kisen.idol.model.vo.Idol;
import com.simpson.kisen.idol.model.vo.IdolImg;
import com.simpson.kisen.idol.model.vo.IdolMv;

import lombok.extern.slf4j.Slf4j;

@Repository
@Slf4j
public class AgencyDaoImpl implements AgencyDao {
	@Autowired
	private SqlSessionTemplate session;


	@Override
	public List<Idol> selectIdolList(int agencyNo,Map<String, Object> param) {
		log.info("param={}",param);
		int offset = (int)param.get("offset");
		int limit = (int)param.get("limit");
		RowBounds rowBounds = new RowBounds(offset, limit);		
		List<Idol> idolList = session.selectList("agency.selectIdolList",agencyNo,rowBounds);
		log.info("IdolList@dao={}",idolList);
		return idolList;
	}
	
	@Override
	public int insertIdol(Idol idol) {
		return session.insert("agency.insertIdol", idol);
	}

	@Override
	public int insertIdolImg(IdolImg idolImg) {
		return session.insert("agency.insertIdolImg",idolImg);
	}

	@Override
	public Idol selectOneIdol(String idolName) {
		return session.selectOne("agency.selectOneIdol",idolName);
	}

	@Override
	public int insertIdolMv(IdolMv idolMv) {
		return session.insert("agency.insertIdolMv",idolMv);
	}

	@Override
	public Agency selectAgency(String fanNo) {
		return session.selectOne("agency.selectAgency",fanNo);
	}

	@Override
	public int selectIdolTotalContents(int agencyNo) {
		return session.selectOne("agency.selectIdolTotalContents",agencyNo);
	}

	@Override
	public Idol selectIdol(int idolNo) {
		return session.selectOne("agency.selectIdol",idolNo);
	}

	@Override
	public int selectPdCnt(int idolNo) {
		return session.selectOne("agency.selectPdCnt",idolNo);
	}

	@Override
	public int updateIdol(Idol idol) {
		return session.update("agency.updateIdol",idol);
	}

	@Override
	public int updateIdolImg(IdolImg idolImg) {
		return session.update("agency.updateIdolImg",idolImg);
	}

	@Override
	public int updateIdolMv(IdolMv idolMv) {
		return session.update("agency.updateIdolMv",idolMv);
	}

}
