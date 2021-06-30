package com.simpson.kisen.payment.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.simpson.kisen.payment.model.dao.PaymentDao;
import com.simpson.kisen.payment.model.vo.Payment;
import com.simpson.kisen.product.model.vo.Basket;
import com.simpson.kisen.unofficial.model.vo.UnofficialDemand;

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
		// TODO Auto-generated method stub
		return paymentDao.selectBasketList(fanNo);
	}


	@Override
	public List<UnofficialDemand> selectUdList(String fanNo) {
		return paymentDao.selectUdList(fanNo);
	}



	@Override
	public List<Basket> selectPaymentList(int[] bNo) {
	
		return paymentDao.selectPaymentList(bNo);
	}
}
