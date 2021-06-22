package com.simpson.kisen.idol.model.service;

import java.util.List;

import com.simpson.kisen.idol.model.vo.DipIdol;
import com.simpson.kisen.idol.model.vo.Idol;

public interface IdolService {

	List<DipIdol> selectOneCollection();

	List<Idol> selectAllIdole();



}
