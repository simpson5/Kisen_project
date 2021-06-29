package com.simpson.kisen.product.model.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.simpson.kisen.admin.model.vo.SlideImg;
import com.simpson.kisen.product.model.vo.ProductImgExt;

import lombok.extern.slf4j.Slf4j;


@Repository
@Slf4j
public class ProductDaoImpl implements ProductDao {
	@Autowired
	private SqlSessionTemplate session;

	@Override
	public ProductImgExt selectOneProduct(int no) {
		return session.selectOne("product.selectOneProduct",no);
	}

	@Override
	public List<ProductImgExt> selectRandomProductList() {
		return session.selectList("product.selectRandomProductList");
	}

	@Override
	public List<ProductImgExt> selectNewGoodsProductList() {
		return session.selectList("product.selectNewGoodsProductList");
	}

	@Override
	public List<ProductImgExt> selectBestSellProductList() {
		return session.selectList("product.selectBestSellProductList");
	}

	@Override
	public List<SlideImg> selectSlideList() {
		return session.selectList("product.selectSlideList");
	}
	
	
}
