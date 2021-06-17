package com.simpson.kisen.idol.model.vo;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class IdolImg {
	private int idolImgNo;
	private int idolNo;
	private String originalFilename;
	private String renamedFilename;
	private Date uploadDate;
	
	
	
	
}
