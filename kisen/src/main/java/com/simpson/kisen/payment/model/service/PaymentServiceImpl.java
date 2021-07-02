package com.simpson.kisen.payment.model.service;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

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


	@Transactional(rollbackFor = Exception.class)
	@Override
	public int insertPayment(Map<String, Object> param) {
		List<PaymentProduct> pList = (List<PaymentProduct>) param.get("pList");
		Payment payHistory = (Payment) param.get("payHistory");
		log.info("pList@service = {}",pList.toString());
		log.info("payHistory@service ={}",payHistory);
		
		//1. paymentHistroy insert
		int result =0;
		result = paymentDao.insertPaymentHistory(payHistory);
		
		for(PaymentProduct pp :pList ) {
			pp.setPaymentNo(payHistory.getPaymentNo());
			result = insertPaymentProduct(pp);
		}
		//이런식으로 진행하면 됩니다. payHistory.getPaymentNo() 이거는 아까 selectKey로 지정한게 넘어올거에요
		//그리고 for문은 pp가 있는 갯수대로 돌아가니까 이렇게 진행하면 됩니다1 넵 ㅜㅜ이대로 디에오 진행 하면 되는거죠?ㅜ 감사하빈다ㅜ
		
		return result;
	}


	@Transactional(rollbackFor = Exception.class)
	private int insertPaymentProduct(PaymentProduct pp) {
		return paymentDao.insertPaymentProduct(pp);
		
	}


	@Override
	public int insertBasket(Basket bs) {
		return paymentDao.insertBasket(bs);
	}


}
