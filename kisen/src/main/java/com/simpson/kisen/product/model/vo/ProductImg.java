package com.simpson.kisen.product.model.vo;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class ProductImg { 
	private int pdImgNo;
	private String pdNo;
	private String pdCategory;
	private String originalFilename;
	private String renamedFilename;
	private Date uploadDate;
	
	//테이블 이름 pd_img
}
