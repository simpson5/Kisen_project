package com.simpson.kisen.review.model.dao;

import java.util.List;
import java.util.Map;

import com.simpson.kisen.review.model.vo.Review;

public interface ReviewDao {

	List<Review> selectReviewList();

    List<Review> selectReviewList(Map<String, Object> param);

	int selectReviewTotalContents();

}
