package com.simpson.kisen.notice.model.vo;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class NoticeImg {
	private int noticeImgNo ;
	private int noticeNo ;
	private String originalFilename;
	private String renamedFilename;
	private Date uploadDate;
}
