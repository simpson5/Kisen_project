package com.simpson.kisen.review.model.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.simpson.kisen.review.model.vo.Review;

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

	
}
