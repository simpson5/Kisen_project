package com.simpson.kisen.unofficial.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.simpson.kisen.review.model.dao.ReviewDao;
import com.simpson.kisen.review.model.service.ReviewServiceImpl;
import com.simpson.kisen.unofficial.model.dao.UnOfficialDao;

import lombok.extern.slf4j.Slf4j;

@Service
@Slf4j
public class UnOfficialServiceImpl implements UnOfficialService {
	
	@Autowired
	private UnOfficialDao unofficialDao;

}
