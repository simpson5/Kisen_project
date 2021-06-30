package com.simpson.kisen.unofficial.model.vo;

import java.util.List;

import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.ToString;

@Data
@ToString(callSuper = true)
@NoArgsConstructor
public class UnofficialPdImgExt2 extends UnofficialDeposit {

	private List<DepositpdImg> depositpdImgList;

}


