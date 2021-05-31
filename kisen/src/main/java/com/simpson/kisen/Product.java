package com.simpson.kisen;

import org.springframework.stereotype.Repository;


import lombok.Data;

@Repository
@Data
public class Product {
	private int pdNo; // 상품번호
	private int idolNo; // 아이돌 번호
 	private String pdCategory; // 상품분류
	private String pdName; // 상품이름
	private String pdImg; // 상품이미지
	private String pdContent; // 상품 설명
	private int price; // 상품 가격
	private int pdStock; // 재고량
	private int pdSale;  // 판매량
}
