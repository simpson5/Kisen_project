package com.simpson.kisen.unofficial.model.dao;

import java.util.List;
import java.util.Map;

import com.simpson.kisen.fan.model.vo.Fan;
import com.simpson.kisen.idol.model.vo.Idol;
import com.simpson.kisen.unofficial.model.vo.DemandpdImg;
import com.simpson.kisen.unofficial.model.vo.DepositpdImg;
import com.simpson.kisen.unofficial.model.vo.UnofficialDemand;
import com.simpson.kisen.unofficial.model.vo.UnofficialDeposit;
import com.simpson.kisen.unofficial.model.vo.UnofficialPdImgExt;
import com.simpson.kisen.unofficial.model.vo.UnofficialPdImgExt2;

public interface UnOfficialDao {

	int insertdemandEnroll(UnofficialPdImgExt unofficialdemand);

	int insertdepositEnroll(UnofficialDeposit unofficialdeposit);

	int insertDemandpdImg(DemandpdImg productImg);
	
	int insertDepositpdImg(DepositpdImg productImg);

	List<UnofficialPdImgExt> selectunofficialdemandList();

	UnofficialPdImgExt selectunofficialdemand(String demandNo);

	List<UnofficialPdImgExt2> selectunofficialdeposit();

	UnofficialPdImgExt2 selectunofficialdeposit(String dno);

	UnofficialPdImgExt selectOneDemand(String pName);

	int deletedemand(String delNo);

	int updateDemand(UnofficialPdImgExt unofficialdemand);

	int updateDemandImg(DemandpdImg pdImg);

	int updateStock(Map<String, Object> map);

	Fan selectOneMemberByEmail(String email);


	
	

	
	

	
	

}
