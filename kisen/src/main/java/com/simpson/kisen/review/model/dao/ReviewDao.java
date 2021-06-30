package com.simpson.kisen.review.model.dao;

import java.util.List;
import java.util.Map;


import com.simpson.kisen.review.model.vo.Attachment;
import com.simpson.kisen.review.model.vo.Review;
import com.simpson.kisen.review.model.vo.ReviewExt;

public interface ReviewDao {
	List<Review> selectReviewList();

	List<ReviewExt> selectReviewList(Map<String, Object> param);

	int selectReviewTotalContents(int no);

	int insertReview(ReviewExt review);
	
	Review selectOneReview(int no);

	int updateReview(Review review);

	int deleteReview(int no);

	void readCntUp(Review review);

	void recomUpCnt(Map<String, Object> map);



}
