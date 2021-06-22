package com.simpson.kisen.idol.model.dao;

import java.util.List;

import com.simpson.kisen.idol.model.vo.DipIdol;
import com.simpson.kisen.idol.model.vo.Idol;

public interface IdolDao {

	List<DipIdol> selectOneCollection();

	List<Idol> selectAllIdole();



	



}
