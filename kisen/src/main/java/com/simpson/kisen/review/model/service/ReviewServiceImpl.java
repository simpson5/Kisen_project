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
		//1.board 등록
		result = reviewDao.insertReview(review);
		log.debug("review = {}", review);
		//2.attachment 등록
//		if(review.getAttachList().size() > 0) {
//			for(Attachment attach : review.getAttachList()) {
//				attach.setReviewNo(review.getReviewNo()); // board no fk 세팅
//				result = insertAttachment(attach);
//			}
//		}
		
		return result; 
	}
	
//	@Transactional(rollbackFor = Exception.class)
	@Override
	public int insertAttachment(Attachment attach) {
		return reviewDao.insertAttachment(attach);
	}

	@Override
	public Review selectOneReview(int no) {
		Review review = reviewDao.selectOneReview(no);
		List<Attachment> attachList = reviewDao.selectAttachList(no); // boardNo로 조회
//		review.setAttachList(attachList);
		return review;
	}

	@Override
	public ReviewExt selectOneReviewCollection(int no) {
		return reviewDao.selectOneReviewCollection(no);
	}

	@Override
	public Attachment selectOneAttachment(int no) {
		return reviewDao.selectOneAttachment(no);
	}

	@Override
	public List<Review> searchTitle(String searchTitle) {
		return reviewDao.searchTitle(searchTitle);
	}

	@Override
	public UploadFile imgUpload(MultipartFile file) {
		// TODO Auto-generated method stub
		return null;
	}


	


	



	
	
	
	
	
	
	

}
