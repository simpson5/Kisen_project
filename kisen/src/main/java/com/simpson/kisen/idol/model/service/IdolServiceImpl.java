package com.simpson.kisen.idol.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.simpson.kisen.fan.model.vo.Fan;
import com.simpson.kisen.idol.model.dao.IdolDao;
import com.simpson.kisen.idol.model.vo.DipIdol;
import com.simpson.kisen.idol.model.vo.Idol;


@Service
public class IdolServiceImpl implements IdolService {
	
	@Autowired
	private IdolDao idolDao;

	@Override
	public List<DipIdol> selectOneCollection() {
		return  idolDao.selectOneCollection();
	}

	@Override
	public List<Idol> selectAllIdole() {
		return  idolDao.selectAllIdole();
	}

	


	

}
