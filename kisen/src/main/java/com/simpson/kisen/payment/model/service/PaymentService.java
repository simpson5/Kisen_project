package com.simpson.kisen.payment.model.service;

import java.util.List;
import java.util.Map;

import com.simpson.kisen.payment.model.vo.Payment;
import com.simpson.kisen.payment.model.vo.PaymentProduct;
import com.simpson.kisen.product.model.vo.Basket;
import com.simpson.kisen.unofficial.model.vo.UnofficialDemand;

public interface PaymentService {

	List<Payment> selectAllList(String fanNo);

	List<Basket> selectBasketList(String fanNo);

	List<UnofficialDemand> selectUdList(String fanNo);

	List<Basket> selectPaymentList(Map<String, Object> param);

	int deleteCart(Map<String, Object> param);

	int insertPayment(Map<String, Object> param);

	List<PaymentProduct> selectHistory(String fanNo);

	int insertBasket(List<Basket> basketList);

	List<Basket> selectoptionProduct(Map<String, Object> param);



}
