package com.simpson.kisen.unofficial.model.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class DepositpdImg {
			private int No;
			private int dNo;
			private String pdCategory;
			private String originalFilename;
			private String renamedFilename;

}
