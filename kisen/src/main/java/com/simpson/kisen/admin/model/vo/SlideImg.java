package com.simpson.kisen.admin.model.vo;

import java.sql.Date;

import com.simpson.kisen.product.model.vo.ProductImg;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class SlideImg {
	private int slideImgNo ;
	private String originalFilename;
	private String renamedFilename;
	private Date uploadDate;
}
