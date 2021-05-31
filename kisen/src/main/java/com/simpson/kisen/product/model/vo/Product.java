package com.simpson.kisen.product.model.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
//
@Data
@AllArgsConstructor
@NoArgsConstructor
public class Product {
	private int pdNo;
	private int idolNo;
	private String pdCategory;
	private String pdName;
	private String pdImg;
	private String pdContent;
	private int price;
	private int pdStock;
	private int pdSales;
}
