package com.simpson.kisen.review.model.vo;

import java.sql.Date;
import java.sql.Timestamp;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Attachment {

	private int reviewNo; //리뷰번호
	private String reviewTitle; // 리뷰제목
	private String fanNo; // 회원 번호
	private String orderNo; // 회원 번호
	private int paymentNo; //결제번호
	private int pdNo; //상품번호
	private String fanId; //작성자
	private String reviewContent; //리뷰내용
	private Date reviewDate; //리뷰 날짜
	private int readCnt; //읽은 수
	private int recoCnt; //추천 수	
	public void setOriginalFilename(String originalFilename) {
		// TODO Auto-generated method stub
		
	}
	public void setRenamedFilename(String renamedFilename) {
		
		
	}

		
	
	
	
}
