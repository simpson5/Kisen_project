package com.simpson.kisen.product.model.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.simpson.kisen.admin.model.vo.SlideImg;
import com.simpson.kisen.product.model.vo.Basket;
import com.simpson.kisen.product.model.vo.ProductImgExt;
import com.simpson.kisen.product.model.vo.ProductOption;

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

	@Override
	public List<ProductImgExt> selectIdolProductList(int no) {
		return session.selectList("product.selectIdolProductList",no);
	}

	@Override
	public List<ProductImgExt> selectIdolAlbumList(int no) {
		return session.selectList("product.selectIdolAlbumList",no);
	}

	@Override
	public int insertBasket(Basket basket) {
		return session.insert("product.insertBasket",basket);
	}

	@Override
	public ProductOption selectOptionNo(String opName) {
		return session.selectOne("product.selectOption", opName);
	}

	@Override
	public int insertBasketNoOption(Basket basket) {
		return session.insert("product.insertBasketNoOption", basket);
	}
	
	
}
