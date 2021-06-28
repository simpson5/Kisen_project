package com.simpson.kisen.notice.model.vo;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class NoticeExt extends Notice{
	private NoticeImg noticeImg;
	
	private int preNo;
	private String preTitle;

	private int nextNo;
	private String nextTitle;
}
