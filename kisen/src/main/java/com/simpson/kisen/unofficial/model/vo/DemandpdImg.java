package com.simpson.kisen.unofficial.model.vo;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class DemandpdImg {
		private int No;
		private int demandNo;
		private String pdCategory;
		private String originalFilename;
		private String renamedFilename;
		
		
		//테이블 이름 demand_pd_img
	}


