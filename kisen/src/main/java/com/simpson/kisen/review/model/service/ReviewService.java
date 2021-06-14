package com.simpson.kisen.review.model.service;

import java.util.List;
import java.util.Map;

import com.simpson.kisen.review.model.vo.Review;

public interface ReviewService {
	
	List<Review> selectReviewList();

	List<Review> selectReviewList(Map<String, Object> param);

	int selectReviewTotalContents();

}
