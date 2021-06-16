package com.simpson.kisen.idol.model.vo;


import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class DipIdol extends Idol {

	private String fanNo;
	private int idolNo;
	private IdolImg idolImg;
}
