package com.simpson.kisen;

import java.sql.Timestamp;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Review {

	private int Review_No; //리뷰번호
	private int Payment_No; //결제번호
	private int Product_No; //상품번호
	private String Fan_Id; //작성자
	private String Review_Content; //리뷰내용
	private Timestamp Review_Date; //리뷰 날짜
	private int Read_Cnt; //읽은 수
	private int Reco_Cnt; //추천 수	
	
	
	
	
	//전유진
	
	
}