package com.simpson.kisen.fanBoard.model.service;

import java.util.List;
import java.util.Map;

import com.simpson.kisen.fan.model.vo.Authority;
import com.simpson.kisen.fan.model.vo.Fan;
import com.simpson.kisen.fanBoard.model.vo.FanBoard;
import com.simpson.kisen.fanBoard.model.vo.FanBoardExt;
import com.simpson.kisen.fanBoard.model.vo.FbAttachment;
import com.simpson.kisen.fanBoard.model.vo.FbComment;

public interface FanBoardService {

	int insertFanBoard(FanBoardExt fanBoard);
	
	int insertFbAttachment(FbAttachment fbAttachment);

	List<FanBoard> selectFanBoardList(Map<String, Object> param);

	int selectFanBoardTotalContents(int idolNo);

	FanBoardExt selectOneFanBoardCollection(int no);

	FbAttachment selectOneFbAttachment(int no);

	String selectOneIdolName(int idolNo);

	int insertfbComment(FbComment fbComment);

	List<FbComment> selectFbCommentList(int no);

	int deleteFanBoard(int fbNo);

	int chkLikeAvailable(String fbNo, String fanId);

	int insertfbReply(FbComment fbReply);

	List<FanBoard> searchKeyword(String searchKeyword);

	int deleteFbComment(int commentNo);

	int updateFbReadCnt(int fbNo);

	int selectOneReadCnt(int fbNo);

	int updateFanBoard(FanBoardExt fanBoard, String[] attachNoes);

	int selectOneIdolNo(int no);

	FanBoard selectOneFanBoard(int no);

}
