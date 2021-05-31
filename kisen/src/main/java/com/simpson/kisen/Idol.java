package com.simpson.kisen;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Idol {

	private int idolNo;
	private int fanNo;
	private String idolName;
	private String idolImg;
	private int fanCnt;
}
