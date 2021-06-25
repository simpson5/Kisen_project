package com.simpson.kisen.payment.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.simpson.kisen.payment.model.dao.PaymentDao;
import com.simpson.kisen.payment.model.vo.Payment;

@Service
public class PaymentServiceImpl implements PaymentService {

	@Autowired
	private PaymentDao paymentDao;

	
	@Override
	public List<Payment> selectAllList(String fanNo) {
		return paymentDao.selectAllList(fanNo);
	}
}
