package com.simpson.kisen.product.model.vo;

import java.util.List;

import com.simpson.kisen.idol.model.vo.IdolImg;

import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.ToString;

@Data
@ToString(callSuper = true)
@NoArgsConstructor
public class ProductImgExt extends Product{
	private List<ProductImg> pdImgList;
	private List<ProductOption> pdOptionList;
	private String idolName;
}
