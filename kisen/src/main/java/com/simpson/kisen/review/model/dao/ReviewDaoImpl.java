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
	public List<Review> selectReviewList(Map<String, Object> param) {
		int offset = (int)param.get("offset");
		int limit = (int)param.get("limit");
		RowBounds rowBounds = new RowBounds(offset, limit);
		return session.selectList("review.selectReviewList", null, rowBounds);
		
	}

	@Override
	public int selectReviewTotalContents() {
		return session.selectOne("review.selectReviewTotalContents");
		
	}
	
	@Override
	public int insertReview(ReviewExt review) {
		return session.insert("review.insertReview", review);
	}

	@Override
	public int insertAttachment(Attachment attach) {
		return session.insert("review.insertAttachment", attach);
	}

	@Override
	public ReviewExt selectOneReview(int no) {
		return session.selectOne("review.selectOneReview", no);
	}

	@Override
	public List<Attachment> selectAttachList(int review_No) {
		return session.selectList("review.selectAttachList", review_No);
	}

	@Override
	public ReviewExt selectOneReviewCollection(int no) {
		return session.selectOne("review.selectOneReviewCollection", no);
	}

	@Override
	public Attachment selectOneAttachment(int no) {
		return session.selectOne("review.selectOneAttachment", no);
	}

	@Override
	public List<Review> searchTitle(String searchTitle) {
		return session.selectList("review.searchTitle", searchTitle);
	}


	
	

	
	
	
}
