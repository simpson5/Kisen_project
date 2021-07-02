package com.simpson.kisen.unofficial.model.vo;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Deposit {
	private String pdName;
	private int purchaseAmount;
	private String buyerName;
	private int buyerPrice;
	private String buyerDate; //입금시작일
	
	private String buyerName2;
	private String email;
	private String buyerPhone;
	
	private String recipient;
	private String recipientPhone;
	
	private String address1;
	private String address2;
	private String address3;
	private String address4;
	
	private String memo;
	private String bank;
	private String account;
	private String depositor;
}
