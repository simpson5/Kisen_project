package com.simpson.kisen.unofficial.model.service;



import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.simpson.kisen.unofficial.model.dao.UnOfficialDao;
import com.simpson.kisen.unofficial.model.vo.UnofficialDemand;
import com.simpson.kisen.unofficial.model.vo.UnofficialDeposit;

import lombok.extern.slf4j.Slf4j;

@Service
@Slf4j
public class UnOfficialServiceImpl implements UnOfficialService {
	
	@Autowired
	private UnOfficialDao unofficialDao;

	@Override
	public int insertdemandEnroll(UnofficialDemand unofficialdemand) {
		return unofficialDao.insertdemandEnroll(unofficialdemand);
	}

	@Override
	public int insertdepositEnroll(UnofficialDeposit unofficialdeposit) {
		return unofficialDao.insertdepositEnroll(unofficialdeposit);
	}



	

}
