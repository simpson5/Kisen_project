package com.simpson.kisen.fanBoard.model.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.simpson.kisen.fan.model.vo.Authority;
import com.simpson.kisen.fanBoard.model.vo.FanBoard;
import com.simpson.kisen.fanBoard.model.vo.FanBoardExt;
import com.simpson.kisen.fanBoard.model.vo.FbAttachment;
import com.simpson.kisen.fanBoard.model.vo.FbComment;

import jline.internal.Log;

@Repository
public class FanBoardDaoImpl implements FanBoardDao {
	
	@Autowired
	private SqlSessionTemplate session;

	@Override
	public int insertFanBoard(FanBoardExt fanBoard) {
		return session.insert("fanboard.insertFanBoard", fanBoard);
	}

	@Override
	public int insertFbAttachment(FbAttachment fbAttach) {
		return session.insert("fanboard.insertFbAttachment", fbAttach);
	}

	@Override
	public List<FanBoard> selectFanBoardList(Map<String, Object> param) {
		// param에 담겨있는 offset, limit가져오기
		int offset = (int)param.get("offset");
		int limit = (int)param.get("limit");
		// int idolNo = (int)param.get("idolNo");
		// Log.info("idolNo in Dao = {}", idolNo);
		// RowBounds객체 생성, offset, limit을 인자로 전달
		RowBounds rowBounds = new RowBounds(offset, limit);
		
		// String statement, Object parameter, RowBounds rowBounds
		return session.selectList("fanboard.selectFanBoardList", param, rowBounds);
	}

	@Override
	public int selectFanBoardTotalContents(int idolNo) {
		return session.selectOne("fanboard.selectFanBoardTotalContents", idolNo);
	}

	@Override
	public FanBoardExt selectOneFanBoardCollection(int no) {
		return session.selectOne("fanboard.selectOneFanBoardCollection", no);
	}

	@Override
	public FbAttachment selectOneFbAttachment(int no) {
		return session.selectOne("fanboard.selectOneFbAttachment", no);
	}

	@Override
	public String selectOneIdolName(int idolNo) {
		return session.selectOne("fanboard.selectOneIdolName", idolNo);
	}

	@Override
	public int insertfbComment(FbComment fbComment) {
		return session.insert("fanboard.insertfbComment", fbComment);
	}

	@Override
	public List<FbComment> selectFbCommentList(int no) {
		return session.selectList("fanboard.selectFbCommentList", no);
	}

	@Override
	public int deleteFanBoard(int fbNo) {
		return session.delete("fanboard.deleteFanBoard", fbNo);
	}

	@Override
	public int chkLikeAvailable(String fbNo, String fanId) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int insertfbReply(FbComment fbReply) {
		return session.insert("fanboard.insertfbReply", fbReply);
	}

	@Override
	public List<FanBoard> searchKeyword(String searchKeyword) {
		return session.selectList("fanboard.searchKeyword", searchKeyword);
	}

	@Override
	public int deleteFbComment(int commentNo) {
		return session.delete("fanboard.deleteFbComment", commentNo);
	}

	@Override
	public int updateFbReadCnt(int fbNo) {
		return session.update("fanboard.updateFbReadCnt", fbNo);
	}

	@Override
	public int selectOneReadCnt(int fbNo) {
		return session.selectOne("fanboard.selectOneReadCnt", fbNo);
	}

	@Override
	public int updateFanBoard(FanBoardExt fanBoard) {
		return session.update("fanboard.updateFanBoard", fanBoard);
	}

	@Override
	public int deleteFbAttachment(String attachNo) {
		return session.update("fanboard.deleteFbAttachment", attachNo);
	}

	@Override
	public int selectOneIdolNo(int no) {
		return session.selectOne("fanboard.selectOneIdolNo", no);
	}

	@Override
	public FanBoardExt selectOneFanBoard(int no) {
		return session.selectOne("fanboard.selectOneFanBoard", no);
	}
}
