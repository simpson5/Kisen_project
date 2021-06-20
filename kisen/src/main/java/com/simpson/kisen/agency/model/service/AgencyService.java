package com.simpson.kisen.agency.model.service;

import java.util.List;

import com.simpson.kisen.idol.model.vo.Idol;

public interface AgencyService {

	List<Idol> selectIdolList(int agencyNo);

	int insertIdol(Idol idol);

	Idol selectOneIdol(String idolName);

}
