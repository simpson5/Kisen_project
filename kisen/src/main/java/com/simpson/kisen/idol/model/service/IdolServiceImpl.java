package com.simpson.kisen.idol.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.simpson.kisen.idol.model.dao.IdolDao;
import com.simpson.kisen.idol.model.vo.DipIdol;


@Service
public class IdolServiceImpl implements IdolService {
	
	@Autowired
	private IdolDao idolDao;

	@Override
	public DipIdol selectOneIdolCollection(int fanNo) {
		return idolDao.selectOneIdolCollection(fanNo);
	}

	

}
