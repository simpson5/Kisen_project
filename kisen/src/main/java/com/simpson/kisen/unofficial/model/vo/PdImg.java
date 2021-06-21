package com.simpson.kisen.unofficial.model.vo;


import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class PdImg {
	private int no; //번호
	private int pdNo; //상품번호
	private String pdCategory; //상품카테고리
	private String originalFilename; //오리지날파일명
	private String renamedFilename; //리네임파일명
	

}
