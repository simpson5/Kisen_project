package com.simpson.kisen.payment.model.service;

import java.util.List;

import com.simpson.kisen.payment.model.vo.Payment;

public interface PaymentService {

	List<Payment> selectAllList(String fanNo);

}
