package com.simpson.kisen.agency.model.service;

import java.util.Iterator;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.simpson.kisen.agency.model.dao.AgencyDao;
import com.simpson.kisen.idol.model.vo.Idol;
import com.simpson.kisen.idol.model.vo.IdolImg;
import com.simpson.kisen.idol.model.vo.IdolMv;


@Service
public class AgencyServiceImpl implements AgencyService {
	
	@Autowired
	private AgencyDao agencyDao;

	@Override
	public List<Idol> selectIdolList(int agencyNo) {
		// TODO Auto-generated method stub
		return agencyDao.selectIdolList(agencyNo);
	}
	
	
	@Transactional(rollbackFor = Exception.class)
	@Override
	public int insertIdol(Idol idol) {
		int result =0;
		
		//1. idol 등록
		result = agencyDao.insertIdol(idol);
		if(idol.getIdolImg() != null) {
			//2. 해당 idol의 이미지 등록
			IdolImg idolImg = idol.getIdolImg();
			idolImg.setIdolNo(idol.getIdolNo());
			result = insertIdolImg(idolImg);
		}
		
		if(idol.getIdolMv().size()>0) {
			//3. 해당 idol의 뮤비 등록
			for(IdolMv mv : idol.getIdolMv()) {
				mv.setIdolNo(idol.getIdolNo());
				result = insertIdolMv(mv);
			}
		}
		return result;
	}
	
	@Transactional(rollbackFor = Exception.class)
	public int insertIdolImg(IdolImg idolImg) {
		return agencyDao.insertIdolImg(idolImg);
	}

	/**
	 * mv table 추가
	 * @param idolImg
	 * @return
	 */
	@Transactional(rollbackFor = Exception.class)
	public int insertIdolMv(IdolMv idolMv) {
		return agencyDao.insertIdolMv(idolMv);
	}



	@Override
	public Idol selectOneIdol(String idolName) {
		return agencyDao.selectOneIdol(idolName);
	}

}
