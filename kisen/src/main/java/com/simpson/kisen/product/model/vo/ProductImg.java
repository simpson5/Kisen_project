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
	private int pdNo;
	private String pdCategory;
	private String originalFilename;
	private String renamedFilename;
	private Date uploadDate;
}
