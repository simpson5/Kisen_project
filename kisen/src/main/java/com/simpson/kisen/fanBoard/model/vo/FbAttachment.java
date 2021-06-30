package com.simpson.kisen.fanBoard.model.vo;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class FbAttachment {

	private int fbAttachNo;
	private int fbNo;
	private String originalFilename;
	private String renamedFilename;
	private Date uploadDate;
	private int downloadCnt;
	private boolean status; // status --- 'Y', 'N'
}
