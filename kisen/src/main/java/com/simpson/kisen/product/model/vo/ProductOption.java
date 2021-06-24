package com.simpson.kisen.product.model.vo;

import java.util.List;

import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.ToString;

@Data
@ToString(callSuper = true)
@NoArgsConstructor
public class ProductOption {
	private int optionNo;
	private int pdNo;
	private String optionName;
}
