package com.simpson.kisen.agency.model.dao;

import java.util.List;
import java.util.Map;

import com.simpson.kisen.agency.model.vo.Agency;
import com.simpson.kisen.idol.model.vo.Idol;
import com.simpson.kisen.idol.model.vo.IdolImg;
import com.simpson.kisen.idol.model.vo.IdolMv;

public interface AgencyDao {

	List<Idol> selectIdolList(String fanNo, Map<String, Object> param);

	int insertIdol(Idol idol);

	int insertIdolImg(IdolImg idolImg);

	Idol selectOneIdol(String idolName);

	int insertIdolMv(IdolMv idolMv);

	Agency selectAgency(String fanNo);


	int selectIdolTotalContents(String fanNo);

	Idol selectIdol(int no);

	int selectPdCnt(int no);

	int updateIdol(Idol idol);

	int updateIdolImg(IdolImg idolImg);

	int updateIdolMv(IdolMv idolMv);

}
