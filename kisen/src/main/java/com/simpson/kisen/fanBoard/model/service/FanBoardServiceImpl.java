package com.simpson.kisen.fanBoard.model.service;

import java.util.Iterator;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.stereotype.Service;

import com.simpson.kisen.fan.model.vo.Authority;
import com.simpson.kisen.fanBoard.model.dao.FanBoardDao;
import com.simpson.kisen.fanBoard.model.vo.FanBoard;
import com.simpson.kisen.fanBoard.model.vo.FanBoardExt;
import com.simpson.kisen.fanBoard.model.vo.FbAttachment;
import com.simpson.kisen.fanBoard.model.vo.FbComment;

import lombok.extern.slf4j.Slf4j;


@Service
@Slf4j
public class FanBoardServiceImpl implements FanBoardService {

	@Autowired
	private FanBoardDao fanBoardDao;

	@Override
	public int insertFanBoard(FanBoardExt fanBoard) {
		int result = 0;
		// 1. fanBoard 등록
		result = fanBoardDao.insertFanBoard(fanBoard);
		
		// 2. fbAttachment 등록
		if(fanBoard.getAttachList().size() > 0) {
			for(FbAttachment fbAttach : fanBoard.getAttachList()) {
				fbAttach.setFbNo(fanBoard.getFbNo()); // fbNo fk 세팅
				// insertBoard안에서 insertAttachment를 호출
				result = insertFbAttachment(fbAttach);
			}
		}
		return result;
	}

	@Override
	public int insertFbAttachment(FbAttachment fbAttach) {
		return fanBoardDao.insertFbAttachment(fbAttach);
	}

	@Override
	public List<FanBoard> selectFanBoardList(Map<String, Object> param) {
		return fanBoardDao.selectFanBoardList(param);
	}

	@Override
	public int selectFanBoardTotalContents(int idolNo) {
		return fanBoardDao.selectFanBoardTotalContents(idolNo);
	}

	@Override
	public FanBoardExt selectOneFanBoardCollection(int no) {
		return fanBoardDao.selectOneFanBoardCollection(no);
	}

	@Override
	public FbAttachment selectOneFbAttachment(int no) {
		return fanBoardDao.selectOneFbAttachment(no);
	}

	@Override
	public String selectOneIdolName(int idolNo) {
		return fanBoardDao.selectOneIdolName(idolNo);
	}

	@Override
	public int insertfbComment(FbComment fbComment) {
		return fanBoardDao.insertfbComment(fbComment);
	}

	@Override
	public List<FbComment> selectFbCommentList(int no) {
		return fanBoardDao.selectFbCommentList(no);
	}

	@Override
	public int deleteFanBoard(int fbNo) {
		return fanBoardDao.deleteFanBoard(fbNo);
	}

	@Override
	public int chkLikeAvailable(String fbNo, String fanId) {
		return fanBoardDao.chkLikeAvailable(fbNo, fanId);
	}

	@Override
	public int insertfbReply(FbComment fbReply) {
		return fanBoardDao.insertfbReply(fbReply);
	}

	@Override
	public List<FanBoard> searchKeyword(String searchKeyword) {
		return fanBoardDao.searchKeyword(searchKeyword);
	}

	@Override
	public int deleteFbComment(int commentNo) {
		return fanBoardDao.deleteFbComment(commentNo);
	}

	@Override
	public int updateFbReadCnt(int fbNo) {
		return fanBoardDao.updateFbReadCnt(fbNo);
	}

	@Override
	public int selectOneReadCnt(int fbNo) {
		return fanBoardDao.selectOneReadCnt(fbNo);
	}
}
