package com.simpson.kisen.product.model.vo;

import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.ToString;

@Data
@ToString(callSuper = true)
@NoArgsConstructor
public class ProductExt extends Product {
	private String idolName;
}
