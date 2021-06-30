package com.simpson.kisen.review.model.vo;

import java.sql.Date;
import java.sql.Timestamp;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Attachment {
	private int pdNo;
	private int reviewNo;
	private String originalFilename;
	private String renamedFilename;
	private Date uploadDate;
	private boolean status;
	private String url;
}
