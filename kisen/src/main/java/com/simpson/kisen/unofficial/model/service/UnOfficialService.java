package com.simpson.kisen.unofficial.model.service;

import java.util.List;
import java.util.Map;

import com.simpson.kisen.idol.model.vo.Idol;
import com.simpson.kisen.product.model.vo.ProductImgExt;
import com.simpson.kisen.unofficial.model.vo.UnofficialDemand;
import com.simpson.kisen.unofficial.model.vo.UnofficialDeposit;
import com.simpson.kisen.unofficial.model.vo.UnofficialPdImgExt;
import com.simpson.kisen.unofficial.model.vo.UnofficialPdImgExt2;

public interface UnOfficialService {


	int insertdemandEnroll(UnofficialPdImgExt unofficialdemand);

	int insertdepositEnroll(UnofficialPdImgExt2 unofficialdeposit);

	List<UnofficialPdImgExt> selectunofficialdemandList();

	UnofficialPdImgExt selectunofficialdemand(String demandNo);

	List<UnofficialPdImgExt2> selectunofficialdepositList();

	UnofficialPdImgExt2 selectunofficialdeposit(String dno);

	UnofficialPdImgExt selectOneDemand(String pName);

	int deletedemand(String delNo);

	int updateDemand(UnofficialPdImgExt unofficialdemand);

	int updateStock(Map<String, Object> map);
	

	

	
	

	
	



}
