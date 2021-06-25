package com.simpson.kisen.unofficial.model.vo;

import java.util.List;

import com.simpson.kisen.product.model.vo.ProductImg;
import com.simpson.kisen.product.model.vo.ProductImgExt;
import com.simpson.kisen.product.model.vo.ProductOption;

import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.ToString;

@Data
@ToString(callSuper = true)
@NoArgsConstructor
public class UnofficialPdImgExt {
	private List<DemandpdImg> demandpdImgList;
	private List<DepositpdImg> depositpdImgList;
	private List<ProductOption> pdOptionList;
	private String idolName;
	public int getdNo() {
		// TODO Auto-generated method stub
		return 0;
	}
		
	public int demandNo() {
		return 0;
	}
	
}


