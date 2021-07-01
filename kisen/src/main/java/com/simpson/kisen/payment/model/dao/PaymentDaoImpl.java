package com.simpson.kisen.payment.model.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.simpson.kisen.payment.model.vo.Payment;
import com.simpson.kisen.product.model.vo.Basket;
import com.simpson.kisen.unofficial.model.vo.UnofficialDemand;

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

	@Override
	public List<UnofficialDemand> selectUdList(String fanNo) {
		return session.selectList("payment.selectUdList",fanNo);
	}


	@Override
	public List<Basket> selectPaymentList(Map<String, Object> param) {
		return session.selectList("payment.selectPaymentList",param);
	}

	@Override
	public int deleteCart(Map<String, Object> param) {
		return session.delete("payment.deleteCart",param);
	}

	@Override
	public int insertPaymentHistory(Map<String, Object> param) {
		return session.insert("payment.insertPaymentHistory", param);
	}

	@Override
	public int insertPaymentProduct(Map<String, Object> param) {
		return session.insert("payment.insertPaymentProduct",param);
	}

}
