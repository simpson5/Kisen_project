package com.simpson.kisen.unofficial.model.vo;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class UnofficialDeposit {
	
	private int dno; //폼번호
	private String pdName; //상품이름
	private String idolName; //아이돌이름
	private String pdCategory; //상품카테고리
//	private String thumbnailFile; // 대표이미지
//	private String detailFile; //상세이미지
	private String pdContent; // 상세내용
	private Date depositStartDate; //입금시작일
	private Date depositEndDate; //마감일
	private String bankName; //은행명
	private String accountNo; //계좌번호
	private String accountHolder; //예금주
	private int price; //상품 가격
	private String deliveryOption; //배송방법
	private int deliveryPrice; //배송비
	private int pdStock; //재고량
	private int pdSales; // 판매량
	private String deliveryNotice; //배송안내
	

}
