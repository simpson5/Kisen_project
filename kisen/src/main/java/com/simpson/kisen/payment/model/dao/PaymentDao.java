package com.simpson.kisen.payment.model.dao;

import java.util.List;

import com.simpson.kisen.payment.model.vo.Payment;
import com.simpson.kisen.product.model.vo.Basket;
import com.simpson.kisen.unofficial.model.vo.UnofficialDemand;

public interface PaymentDao {

	List<Payment> selectAllList(String fanNo);

	List<Basket> selectBasketList(String fanNo);

	List<UnofficialDemand> selectUdList(String fanNo);

	
}
