package com.simpson.kisen.review.model.vo;

import java.util.List;

import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.ToString;

@Data
@ToString(callSuper = true)
@NoArgsConstructor
public class ReviewExt extends Review {
	
	private boolean hasAttachment;
	private List<Attachment> attachList;
	
}
