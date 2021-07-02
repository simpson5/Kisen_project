package com.simpson.kisen.review.model.service;

import java.util.List;

import java.util.Map;

import org.springframework.web.multipart.MultipartFile;

import com.simpson.kisen.review.model.vo.Attachment;
import com.simpson.kisen.review.model.vo.Review;
import com.simpson.kisen.review.model.vo.ReviewExt;
import com.simpson.kisen.review.model.vo.UploadFile;

public interface ReviewService {
	
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
