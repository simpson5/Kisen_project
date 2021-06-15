package com.simpson.kisen.review.model.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.simpson.kisen.review.model.dao.ReviewDao;
import com.simpson.kisen.review.model.vo.Review;

import lombok.extern.slf4j.Slf4j;

@Service
@Slf4j
public class ReviewServiceImpl implements ReviewService {
	
	@Autowired
	private ReviewDao reviewDao;

	@Override
	public List<Review> selectReviewList() {
		return reviewDao.selectReviewList();
	}

	@Override
	public List<Review> selectReviewList(Map<String, Object> param) {
		return reviewDao.selectReviewList(param);
	}

	@Override
	public int selectReviewTotalContents() {
		return reviewDao.selectReviewTotalContents();
	}
	
	

}
