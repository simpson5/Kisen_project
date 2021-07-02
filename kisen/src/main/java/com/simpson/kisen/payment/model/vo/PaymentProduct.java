package com.simpson.kisen.payment.model.vo;

import java.util.List;

import com.simpson.kisen.product.model.vo.Product;
import com.simpson.kisen.product.model.vo.ProductImg;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.ToString;

@Data
@NoArgsConstructor
@AllArgsConstructor
@ToString(callSuper = true)
public class PaymentProduct extends Payment{
	private String pdNo;//상품번호
	private String orderNo;//주문번호
	private int pdCnt;//구매수량
	private int opNo;//옵션 번호
	private int paymentNo;
	private  ProductImg productImg; //상품 이미지 
	private Product product;
}//그 혹시 여기가 paymentProduct table vo인가요?네네 히스토리는 그냐ㅐㅇ 페이먼트요 아 어제 글구 아니 올더 시퀀스 만들엇는데.. 넵
