package com.simpson.kisen.fanBoard.model.dao;

import java.util.List;
import java.util.Map;

import com.simpson.kisen.fan.model.vo.Authority;
import com.simpson.kisen.fanBoard.model.vo.FanBoard;
import com.simpson.kisen.fanBoard.model.vo.FanBoardExt;
import com.simpson.kisen.fanBoard.model.vo.FbAttachment;
import com.simpson.kisen.fanBoard.model.vo.FbComment;

public interface FanBoardDao {

	int insertFanBoard(FanBoardExt fanBoard);

	int insertFbAttachment(FbAttachment fbAttach);

	List<FanBoard> selectFanBoardList(Map<String, Object> param);

	int selectFanBoardTotalContents(int idolNo);

	FanBoardExt selectOneFanBoardCollection(int no);

	FbAttachment selectOneFbAttachment(int no);

	String selectOneIdolName(int idolNo);

	int insertfbComment(FbComment fbComment);

	List<FbComment> selectFbCommentList(int no);

	int deleteFanBoard(int fbNo);

	int insertfbReply(FbComment fbReply);

	List<FanBoard> searchKeyword(String searchKeyword);

	int deleteFbComment(int commentNo);

	int updateFbReadCnt(int fbNo);

	int selectOneReadCnt(int fbNo);

	int updateFanBoard(FanBoardExt fanBoard);

	int deleteFbAttachment(String attachNo);

	int selectOneIdolNo(int no);

	FanBoardExt selectOneFanBoard(int no);

	int checkFbLike(Map<String, Object> param);

	int updateFanBoardLikeAdd(Map<String, Object> param);

	int insertFbLikeAdd(Map<String, Object> param);

	int updateFbLikePoint(Map<String, Object> param);

	int updateFbLikePointMinus(Map<String, Object> param);

	int updateFanBoardLikeCancel(Map<String, Object> param);

}
