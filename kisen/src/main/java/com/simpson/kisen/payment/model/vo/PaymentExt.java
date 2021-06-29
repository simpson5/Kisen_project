package com.simpson.kisen.payment.model.vo;

import java.util.List;

import com.simpson.kisen.product.model.vo.Product;
import com.simpson.kisen.product.model.vo.ProductImg;
import com.simpson.kisen.product.model.vo.ProductOption;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;


/**
 * agency sales에 필요함
 * @author 주소민
 */
@Data
@NoArgsConstructor
@AllArgsConstructor
public class PaymentExt  extends Payment{
	private String pdNo;//상품번호
	private String orderNo;//주문번호
	private int pdCnt;//구매수량
	private List<Product> product;
	private ProductOption pdOption;
	
	private String fanId;
	private String idolName;
}
