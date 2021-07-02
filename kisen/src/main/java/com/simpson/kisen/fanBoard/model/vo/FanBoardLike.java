package com.simpson.kisen.fanBoard.model.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class FanBoardLike {
	
	int likeNo;// 좋아요 식별자
	int fbNo; // 좋아요 할 유저의 아이디
	String fanId; // 좋아요 대상 게시물
	
}
