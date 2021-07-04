package com.simpson.kisen.fanBoard.model.service;

import java.util.Iterator;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.stereotype.Service;

import com.simpson.kisen.fan.model.vo.Authority;
import com.simpson.kisen.fan.model.vo.Fan;
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
		FanBoardExt fanBoard = null;
			fanBoard = fanBoardDao.selectOneFanBoardCollection(no);
			if(fanBoard == null) {
				fanBoard = fanBoardDao.selectOneFanBoard(no);
			}
		return fanBoard;
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

	@Override
	public int updateFanBoard(FanBoardExt fanBoard, String[] attachNoes) {
		
		// 게시글 내용 수정
		int result = fanBoardDao.updateFanBoard(fanBoard);
		
		// 첨부파일이 있을 때만 첨부파일 추가
		if(fanBoard.getAttachList().size() > 0) {
			for(FbAttachment fbAttach : fanBoard.getAttachList()) {
				fbAttach.setFbNo(fanBoard.getFbNo()); // fbNo fk 세팅
				// insertBoard안에서 insertAttachment를 호출
				result = insertFbAttachment(fbAttach);
			}
		}
		// 삭제할 첨부파일이 있을 때만 삭제
		if(attachNoes != null) {
			for(String attachNo : attachNoes) {
				result = deleteFbAttachment(attachNo);
			}
		}
		return result;
	}

	private int deleteFbAttachment(String attachNo) {
		return fanBoardDao.deleteFbAttachment(attachNo);
	}

	@Override
	public int selectOneIdolNo(int no) {
		return fanBoardDao.selectOneIdolNo(no);
	}

	public FanBoardExt selectOneFanBoard(int no) {
		return fanBoardDao.selectOneFanBoard(no);
	}

	@Override
	public int updateFbLikeAdd(Map<String, Object> param) {
		int result = 0;
		int likePoint = checkFbLike(param);
		if(likePoint == 0) {
			// 좋아요를 누른 적이 없는 경우
			result = updateFbLike(param);
			result = insertFbLikeAdd(param);
		}
		else if (likePoint < 0) {
			// 좋아요를 눌렀다가 취소한 적이 있는 경우
			result = updateFanBoardLikeAdd(param);
			result = updateFbLike(param);
		} else {
			// 해당 게시글에 이미 좋아요를 누른 경우
			result = -1;
		}
		return result;
	}

	private int insertFbLikeAdd(Map<String, Object> param) {
		return fanBoardDao.insertFbLikeAdd(param);
	}

	private int updateFanBoardLikeAdd(Map<String, Object> param) {
		return fanBoardDao.updateFanBoardLikeAdd(param);
	}

	private int checkFbLike(Map<String, Object> param) {
		return fanBoardDao.checkFbLike(param);
	}

	private int updateFbLike(Map<String, Object> param) {
		return fanBoardDao.updateFbLikePoint(param);
	}
}
