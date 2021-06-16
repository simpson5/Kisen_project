package com.simpson.kisen.idol.model.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Idol {
	//git test
	private int idolNo;
	private String agencyNo;
	private String idolName;
	private IdolImg idolImg;
	private int fanCnt;
	
	private boolean hasImg;
}
