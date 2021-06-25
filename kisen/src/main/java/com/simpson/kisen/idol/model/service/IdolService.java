package com.simpson.kisen.idol.model.service;

import java.util.List;
import java.util.Map;

import com.simpson.kisen.idol.model.vo.DipIdol;
import com.simpson.kisen.idol.model.vo.Idol;

public interface IdolService {

	List<DipIdol> selectOneCollection(String fanNo);

	List<Idol> selectAllIdole();

	int insertIdol(DipIdol dip);

	int deleteidol(int idolNo);



}
