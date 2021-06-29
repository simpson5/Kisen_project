package com.simpson.kisen.review.model.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.simpson.kisen.review.model.dao.ReviewDao;
import com.simpson.kisen.review.model.vo.Attachment;
import com.simpson.kisen.review.model.vo.Review;
import com.simpson.kisen.review.model.vo.ReviewExt;
import com.simpson.kisen.review.model.vo.UploadFile;

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
	public List<ReviewExt> selectReviewList(Map<String, Object> param) {
		return reviewDao.selectReviewList(param);
	}

	@Override
	public int selectReviewTotalContents(int no) {
		return reviewDao.selectReviewTotalContents(no);
	}

	
	/**
	 * rollbackFor - 트랜잭션 rollback처리하기위한 예외 등록. Exception -> 모든 예외.
	 * 		기본적으로 RuntimeException만 rollback한다. 
	 */
//	@Transactional(rollbackFor = Exception.class)
	@Override
	public int insertReview(ReviewExt review) {
		int result = 0;

		result = reviewDao.insertReview(review);
		log.debug("review = {}", review);
		
		
		return result; 
	}
	
	@Override
	public Review selectOneReview(int no) {
		return reviewDao.selectOneReview(no);
	}

	@Override
	public int updateReview(Review review) {
		int result = reviewDao.updateReview(review);
		return result;
	}

	@Override
	public int deleteReview(int no) {
		int result = reviewDao.deleteReview(no);
		return result;
	}


}
