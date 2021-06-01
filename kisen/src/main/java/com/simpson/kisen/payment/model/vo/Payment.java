package com.simpson.kisen.payment.model.vo;


import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Payment {
	private int paymentNo;
	private int fanNo;
	private String payContent;
	private Date payDate;
	private int amount;
	private int point;
	private String waybill;
	
	// new git repository  test
	
}
