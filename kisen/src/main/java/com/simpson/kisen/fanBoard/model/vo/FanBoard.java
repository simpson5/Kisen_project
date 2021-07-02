package com.simpson.kisen.fanBoard.model.vo;

import java.sql.Timestamp;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class FanBoard {

	private int fbNo;
	private int idolNo;
	private String fbContent;
	private int fbReadCnt;
	private Timestamp fbDate;
	private String fbTitle;
	private int fbLike;
	private String fbWriter;
}
