package com.simpson.kisen.product.model.vo;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Basket extends Product{
	
	private String fanNo;
	private int pdAmount;
	private ProductImg productImg;
	private ProductOption productOption;
	private int total;
}
