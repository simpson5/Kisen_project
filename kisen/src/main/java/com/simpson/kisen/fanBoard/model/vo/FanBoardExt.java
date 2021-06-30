package com.simpson.kisen.fanBoard.model.vo;

import java.util.List;

import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.ToString;

@Data
@ToString(callSuper = true)
@NoArgsConstructor
public class FanBoardExt extends FanBoard {

	private boolean hasAttachment;
	private List<FbAttachment> attachList;
}
