package com.simpson.kisen.product.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.simpson.kisen.admin.model.vo.SlideImg;
import com.simpson.kisen.product.model.dao.ProductDao;
import com.simpson.kisen.product.model.vo.ProductImgExt;

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
}
