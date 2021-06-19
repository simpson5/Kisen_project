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
	private int agencyNo;
	private String idolName;
	private int fanCnt;
	private IdolImg idolImg; //���⼭ ��ü�� �����߱� ������ �����̵����� ����
	
}
