package com.simpson.kisen.agency.model.vo;

import java.sql.Date;
import java.sql.Timestamp;

import com.simpson.kisen.fan.model.vo.Fan;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Agency {

	private String fanNo;
	private String agencyName;
	private int agencyNo;
}
