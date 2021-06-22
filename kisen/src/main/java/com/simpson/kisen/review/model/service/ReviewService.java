package com.simpson.kisen.review.model.service;

import java.util.List;

import java.util.Map;


import com.simpson.kisen.review.model.vo.Attachment;
import com.simpson.kisen.review.model.vo.Review;
import com.simpson.kisen.review.model.vo.ReviewExt;

public interface ReviewService {
	
	List<Review> selectReviewList();

	List<ReviewExt> selectReviewList(Map<String, Object> param);

	int selectReviewTotalContents(int no);

	int insertReview(ReviewExt review);
	
	int insertAttachment(Attachment attach);

	ReviewExt selectOneReview(int no);

	ReviewExt selectOneReviewCollection(int no);

	Attachment selectOneAttachment(int no);

	List<Review> searchTitle(String searchTitle);

}
