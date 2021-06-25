package com.simpson.kisen.unofficial.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.simpson.kisen.product.model.vo.ProductImg;
import com.simpson.kisen.product.model.vo.ProductImgExt;
import com.simpson.kisen.product.model.vo.ProductOption;
import com.simpson.kisen.unofficial.model.vo.UnofficialDemand;
import com.simpson.kisen.unofficial.model.vo.UnofficialDeposit;
import com.simpson.kisen.unofficial.model.vo.UnofficialPdImgExt;

@Repository
public class UnOfficialDaoImpl implements UnOfficialDao {
	
	@Autowired
	private SqlSessionTemplate session;

	@Override
	public int insertdemandEnroll(UnofficialDemand unofficialdemand) {
		return session.insert("unofficial.insertdemandEnroll", unofficialdemand);
	}

	@Override
	public int insertdepositEnroll(UnofficialDeposit unofficialdeposit) {
		return session.insert("unofficial.insertdepositEnroll", unofficialdeposit);
	}

	
	

}
