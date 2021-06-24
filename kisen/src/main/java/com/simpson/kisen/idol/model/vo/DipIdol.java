package com.simpson.kisen.idol.model.vo;


import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.ToString;

@Data
@ToString(callSuper = true)
@NoArgsConstructor
public class DipIdol extends Idol {

	private String fanNo;
	private int idolNo;
	
	
	
	
}
