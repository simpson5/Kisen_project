package com.simpson.kisen.payment.model.vo;

import java.util.List;

import com.simpson.kisen.product.model.vo.Product;
import com.simpson.kisen.product.model.vo.ProductImg;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class PaymentProduct extends Payment{
	private String pdNo;//상품번호
	private String orderNo;//주문번호
	private int pdCnt;//구매수량
	private  ProductImg productImg; //상품 이미지 
	private List<Product> product;
}
