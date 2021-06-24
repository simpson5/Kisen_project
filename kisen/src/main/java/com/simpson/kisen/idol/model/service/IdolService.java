package com.simpson.kisen.idol.model.service;

import java.util.List;
import java.util.Map;

import com.simpson.kisen.idol.model.vo.DipIdol;
import com.simpson.kisen.idol.model.vo.Idol;

public interface IdolService {

	List<DipIdol> selectOneCollection(Map<String, Object> param);

	List<Idol> selectAllIdole(Map<String, Object> param);

	int insertIdol(DipIdol dip);

	int deleteidol(int idolNo);



}
