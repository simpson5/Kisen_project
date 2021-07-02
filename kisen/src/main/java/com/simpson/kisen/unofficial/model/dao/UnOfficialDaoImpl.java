package com.simpson.kisen.unofficial.model.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.simpson.kisen.fan.model.vo.Fan;
import com.simpson.kisen.idol.model.vo.Idol;
import com.simpson.kisen.product.model.vo.ProductImg;
import com.simpson.kisen.product.model.vo.ProductImgExt;
import com.simpson.kisen.product.model.vo.ProductOption;
import com.simpson.kisen.unofficial.model.vo.DemandpdImg;
import com.simpson.kisen.unofficial.model.vo.DepositpdImg;
import com.simpson.kisen.unofficial.model.vo.UnofficialDemand;
import com.simpson.kisen.unofficial.model.vo.UnofficialDeposit;
import com.simpson.kisen.unofficial.model.vo.UnofficialPdImgExt;
import com.simpson.kisen.unofficial.model.vo.UnofficialPdImgExt2;

@Repository
public class UnOfficialDaoImpl implements UnOfficialDao {
	
	@Autowired
	private SqlSessionTemplate session;

	@Override
	public int insertdemandEnroll(UnofficialPdImgExt unofficialdemand) {
		return session.insert("unofficial.insertdemandEnroll", unofficialdemand);
	}

	@Override
	public int insertdepositEnroll(UnofficialDeposit unofficialdeposit) {
		return session.insert("unofficial.insertdepositEnroll", unofficialdeposit);
	}

	@Override
	public int insertDemandpdImg(DemandpdImg productImg) {
		return session.insert("unofficial.insertDemandpdImg", productImg);
	}

	@Override
	public List<UnofficialPdImgExt> selectunofficialdemandList() {
		return session.selectList("unofficial.selectunofficialdemandList");
	}

	@Override
	public UnofficialPdImgExt selectunofficialdemand(String demandNo) {
		return session.selectOne("unofficial.selectunofficialdemand", demandNo);
	}

	@Override
	public List<UnofficialPdImgExt2> selectunofficialdeposit() {
		return session.selectList("unofficial.selectunofficialdepositList");
	}

	@Override
	public UnofficialPdImgExt2 selectunofficialdeposit(String dno) {
		return session.selectOne("unofficial.selectunofficialdeposit", dno);
	}

	@Override
	public int insertDepositpdImg(DepositpdImg productImg) {
		return session.insert("unofficial.insertDepositpdImg", productImg);
	}

	@Override
	public UnofficialPdImgExt selectOneDemand(String pName) {
		return session.selectOne("unofficial.selectOneDemand", pName);
	}

	@Override
	public int deletedemand(String delNo) {
		return session.delete("unofficial.deleteDemand",delNo);
	}

	@Override
	public int updateDemand(UnofficialPdImgExt unofficialdemand) {
		return session.update("unofficial.updateDemand" , unofficialdemand);
	}

	@Override
	public int updateDemandImg(DemandpdImg pdImg) {
		return session.update("unofficial.updateDemandImg" , pdImg);
	}

	@Override
	public int updateStock(Map<String, Object> map) {
		return session.update("unofficial.updateStock", map);
	}

	@Override
	public Fan selectOneMemberByEmail(String email) {
		return null;
	}



}
