package com.simpson.kisen.payment.model.vo;


import java.util.Date;
import java.util.List;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Payment {
	private int paymentNo; //결제번호
	private String fanNo; //사용자 고유번호
	private String payType; //결제타입
	private String payContent; //결제내용
	private Date payDate; //결제날짜
	private int amount; //결제금액
	private int point; //사용포인트
	private String waybill; //운송장번호
	private int price; //운송장번호
	private List<PaymentProduct> ppList;
	// new git repository  test payment_history
	
}
