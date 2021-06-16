package com.simpson.kisen.agency.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.simpson.kisen.agency.model.dao.AgencyDao;
import com.simpson.kisen.idol.model.vo.Idol;
import com.simpson.kisen.idol.model.vo.IdolImg;


@Service
public class AgencyServiceImpl implements AgencyService {
	
	@Autowired
	private AgencyDao agencyDao;

	@Override
	public List<Idol> selectIdolList() {
		// TODO Auto-generated method stub
		return agencyDao.selectIdolList();
	}
	
//	@Override
//	public int insertIdol(Idol idol) {
//		int result =0;
//		result = agencyDao.insertIdol(idol);
//		if(idol.getIdolImg() != null) {
//			IdolImg idolImg = new IdolImg();
//			idolImg.setIdolNo(idol.getIdolNo());
//			result = insertIdolImg(idolImg);
//		}
//		return result;
//	}
//	
//	@Transactional(rollbackFor = Exception.class)
//	public int insertIdolImg(IdolImg idolImg) {
////		return agencyDao.insertIdolImg(idolImg);
//		return 0;
//	}

}
