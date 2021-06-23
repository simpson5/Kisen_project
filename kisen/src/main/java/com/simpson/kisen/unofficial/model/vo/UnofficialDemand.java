package com.simpson.kisen.unofficial.model.vo;

import java.util.Date;

import org.springframework.web.multipart.MultipartFile;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class UnofficialDemand {
	
	private int demandNo;//수요조사폼번호
	private String pdName;//상품이름
	private String idolName; //아이돌이름
	private String pdCategory; //상품카테고리
	private int price; //상품 가격
	private int deliveryPrice; //배송비
	private int pdStock; //재고량
	private int pdSales; // 판매량
	private UnofficialPdImg pdImg; // 대표이미지
	private String pdContent; // 폼내용
	private Date demandstartDate; //수요조사시작날짜
	private Date demandendDate; //수요조사끝날짜
	private String question; //추가질문
	
	
	

}
