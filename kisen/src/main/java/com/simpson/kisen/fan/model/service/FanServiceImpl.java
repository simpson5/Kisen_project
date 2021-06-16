package com.simpson.kisen.fan.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.simpson.kisen.fan.model.dao.FanDao;

@Service
public class FanServiceImpl implements FanService {
	
	@Autowired
	private FanDao fandao;
	
}
