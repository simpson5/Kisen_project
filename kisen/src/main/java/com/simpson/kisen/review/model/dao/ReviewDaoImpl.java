package com.simpson.kisen.review.model.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.simpson.kisen.review.model.vo.Attachment;
import com.simpson.kisen.review.model.vo.Review;
import com.simpson.kisen.review.model.vo.ReviewExt;

@Repository
public class ReviewDaoImpl implements ReviewDao {
	
	@Autowired
	private SqlSessionTemplate session;
	
	@Override
	public List<Review> selectReviewList() {
		return session.selectList("review.selectReviewList");
	}

	@Override
	public List<ReviewExt> selectReviewList(Map<String, Object> param) {
		int offset = (int)param.get("offset");
		int limit = (int)param.get("limit");
		int no = (int)param.get("no");
		RowBounds rowBounds = new RowBounds(offset, limit);
		return session.selectList("review.selectReviewList", no, rowBounds);
	}

	@Override
	public int selectReviewTotalContents(int no) {
		return session.selectOne("review.selectReviewTotalContents", no);
	}

	@Override
	public int insertReview(ReviewExt review) {
		return session.insert("review.insertReview", review);
	}

	@Override
	public Review selectOneReview(int no) {
		return session.selectOne("review.selectOneReview", no);
	}

	@Override
	public int updateReview(Review review) {
		return session.update("review.updateReview", review);
	}




	

	


	
	

	
	
	
}
