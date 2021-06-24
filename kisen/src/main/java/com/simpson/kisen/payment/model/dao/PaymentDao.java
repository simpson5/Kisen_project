package com.simpson.kisen.payment.model.dao;

import java.util.List;

import com.simpson.kisen.payment.model.vo.Payment;

public interface PaymentDao {

	List<Payment> selectAllList();

}
