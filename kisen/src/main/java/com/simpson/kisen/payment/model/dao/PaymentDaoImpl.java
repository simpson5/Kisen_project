package com.simpson.kisen.payment.model.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.simpson.kisen.payment.model.vo.Payment;
import com.simpson.kisen.product.model.vo.Basket;

@Repository
public class PaymentDaoImpl implements PaymentDao{
	
	@Autowired
	private SqlSessionTemplate session;

	@Override
	public List<Payment> selectAllList(String fanNo) {
		return session.selectList("payment.selectAllList",fanNo);
	}

	@Override
	public List<Basket> selectBasketList(String fanNo) {
		return session.selectList("payment.selectBasketList",fanNo);
	
	}

}
