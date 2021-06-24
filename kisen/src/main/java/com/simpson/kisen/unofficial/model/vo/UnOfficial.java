package com.simpson.kisen.unofficial.model.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class UnOfficial {
	
	private int pdNo; // 상품번호
	private int idolNo; // 아이돌 번호
 	private String pdCategory; // 상품분류
	private String pdName; // 상품이름
	private UnofficialPdImg pdImg; // 상품이미지
	private String pdContent; // 상품 설명
	private int price; // 상품 가격
	private int pdStock; // 재고량
	private int pdSale;  // 판매량
		
		
	}


