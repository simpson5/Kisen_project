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
	private int fanCnt;
	private IdolImg idolImg; //여기서 객체로 선언했기 때문에 딥아이돌에서 뺐다
	
}
