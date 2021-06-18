<<<<<<< HEAD
package com.simpson.kisen.product.model.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.simpson.kisen.product.model.vo.Product;
import com.simpson.kisen.product.model.vo.ProductExt;

import lombok.extern.slf4j.Slf4j;

@Repository
@Slf4j
public class ProductDaoImpl implements ProductDao {
	@Autowired
	private SqlSessionTemplate session;

	@Override
	public List<Product> selectProductList() {
		return session.selectList("product.selectProductList");
	}

	@Override
	public ProductExt selectOneProduct(int no) {
		return session.selectOne("product.selectOneProduct",no);
	}
	
	
}
=======
package com.simpson.kisen.product.model.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.simpson.kisen.review.model.vo.Review;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Repository
public class ProductDaoImpl implements ProductDao {

	@Autowired
	private SqlSessionTemplate session;

	
}
>>>>>>> branch 'master' of https://github.com/simpson5/Kisen_project.git
