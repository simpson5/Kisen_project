package com.simpson.kisen.product.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.simpson.kisen.admin.model.vo.SlideImg;
import com.simpson.kisen.product.model.dao.ProductDao;
import com.simpson.kisen.product.model.vo.Basket;
import com.simpson.kisen.product.model.vo.ProductImgExt;
import com.simpson.kisen.product.model.vo.ProductOption;

import lombok.extern.slf4j.Slf4j;


@Service
@Slf4j
public class ProductServiceImpl implements ProductService {
	@Autowired
	private ProductDao productDao;

	@Override
	public ProductImgExt selectOneProduct(int no) {
		return productDao.selectOneProduct(no);
	}

	@Override
	public List<ProductImgExt> selectRandomProductList() {
		return productDao.selectRandomProductList();
	}

	@Override
	public List<ProductImgExt> selectBestSellProductList() {
		return productDao.selectBestSellProductList();
	}

	@Override
	public List<ProductImgExt> selectNewGoodsProductList() {
		return productDao.selectNewGoodsProductList();
	}

	@Override
	public List<SlideImg> selectSlideList() {
		return productDao.selectSlideList();
	}

	@Override
	public List<ProductImgExt> selectIdolProductList(int no) {
		return productDao.selectIdolProductList(no);
	}

	@Override
	public List<ProductImgExt> selectIdolAlbumList(int no) {
		return productDao.selectIdolAlbumList(no);
	}

	@Override
	public int insertBasket(Basket basket) {
		return productDao.insertBasket(basket);
	}

	@Override
	public ProductOption selectOptionNo(String opName) {
		return productDao.selectOptionNo(opName);
	}

	@Override
	public int insertBasketNoOption(Basket basket) {
		return productDao.insertBasketNoOption(basket);
	}
}
