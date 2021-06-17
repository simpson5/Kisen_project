package com.simpson.kisen.agency.model.dao;

import java.util.List;

import com.simpson.kisen.idol.model.vo.Idol;
import com.simpson.kisen.idol.model.vo.IdolImg;

public interface AgencyDao {

	List<Idol> selectIdolList(int agencyNo);

	int insertIdol(Idol idol);

	int insertIdolImg(IdolImg idolImg);

}
