package com.simpson.kisen.agency.model.dao;

import java.util.List;

import com.simpson.kisen.idol.model.vo.Idol;
import com.simpson.kisen.idol.model.vo.IdolImg;
import com.simpson.kisen.idol.model.vo.IdolMv;

public interface AgencyDao {

	List<Idol> selectIdolList(int agencyNo);

	int insertIdol(Idol idol);

	int insertIdolImg(IdolImg idolImg);

	Idol selectOneIdol(String idolName);

	int insertIdolMv(IdolMv idolMv);

}
