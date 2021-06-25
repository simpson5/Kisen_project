package com.simpson.kisen.idol.model.dao;

import java.util.List;
import java.util.Map;

import com.simpson.kisen.idol.model.vo.DipIdol;
import com.simpson.kisen.idol.model.vo.Idol;

public interface IdolDao {

	List<DipIdol> selectOneCollection(String fanNo);

	List<Idol> selectAllIdole();

	int insertIdol(DipIdol dip);

	int deleteidol(int idolNo);



	



}
