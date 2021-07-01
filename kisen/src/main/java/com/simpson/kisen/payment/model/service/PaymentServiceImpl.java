package com.simpson.kisen.payment.model.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.simpson.kisen.payment.controller.PaymentController;
import com.simpson.kisen.payment.model.dao.PaymentDao;
import com.simpson.kisen.payment.model.vo.Payment;
import com.simpson.kisen.payment.model.vo.PaymentProduct;
import com.simpson.kisen.product.model.vo.Basket;
import com.simpson.kisen.unofficial.model.vo.UnofficialDemand;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
public class PaymentServiceImpl implements PaymentService {

	@Autowired
	private PaymentDao paymentDao;

	
	@Override
	public List<Payment> selectAllList(String fanNo) {
		return paymentDao.selectAllList(fanNo);
	}


	@Override
	public List<Basket> selectBasketList(String fanNo) {
		return paymentDao.selectBasketList(fanNo);
	}


	@Override
	public List<UnofficialDemand> selectUdList(String fanNo) {
		return paymentDao.selectUdList(fanNo);
	}



	@Override
	public List<Basket> selectPaymentList(Map<String, Object> param) {
		return paymentDao.selectPaymentList(param);
	}


	@Override
	public int deleteCart(Map<String, Object> param) {
		return paymentDao.deleteCart(param);
	}


	@Override
	public int insertPayment(Map<String, Object> param) {
		int result = 0;
		result = paymentDao.insertPaymentHistory(param);
	
		result = insertPaymentProduct(param);
		/*
		 * for(PaymentProduct pp : ){ param.values();
		 * log.info("param = {}",param.values());; }
		 */
		
		return result;
	}


	private int insertPaymentProduct(Map<String, Object> param) {
		
		return paymentDao.insertPaymentProduct(param);
		
	}
}
