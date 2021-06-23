package com.simpson.kisen.unofficial.model.vo;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class UnofficialDeposit {
	
	private int no; //폼번호
	private int demandNo;//수요조사폼번호
	private String pdName;//상품이름
	private String idolName; //아이돌이름
	private String pdCategory; //상품카테고리
	private UnofficialPdImg pdImg; // 대표이미지
	private String pdContent; // 폼내용
	private Date depositPeriod; //입금기간
	private String bankInfo; //은행정보
	private int price; //상품 가격
	private String deliveryOption; //배송방법
	private int deliveryPrice; //배송비
	private int pdStock; //재고량
	private int pdSales; // 판매량
	private String deliveryNotice; //배송안내
	

}
