package com.simpson.kisen.idol.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.simpson.kisen.idol.model.dao.IdolDao;
import com.simpson.kisen.idol.model.vo.IdolImg;

@Service
public class IdolServiceImpl implements IdolService {
	
	@Autowired
	private IdolDao idolDao;

	@Override
	public IdolImg selectOneIdolCollection(int idolNo) {
		return idolDao.selectOneIdolCollection(idolNo);
	}

	

}
