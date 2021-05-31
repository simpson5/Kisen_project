package com.simpson.kisen;

import java.sql.Date;
import java.sql.Timestamp;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Fan {
	private String fanNo;
	private String fanId;
	private String password;
	private String phone;
	private String adress;
	private String eamil;
	private Date birthday;
	private String gender;
	private String grade;
	private int point;
	private String status;
	private String certification;
	private Timestamp enrollDate;
	
	// git test
	
}