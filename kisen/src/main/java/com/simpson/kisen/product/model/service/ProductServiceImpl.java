package com.simpson.kisen.product.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.simpson.kisen.product.model.dao.ProductDao;
import com.simpson.kisen.product.model.vo.Product;
import com.simpson.kisen.product.model.vo.ProductExt;

import lombok.extern.slf4j.Slf4j;


@Service
@Slf4j
public class ProductServiceImpl implements ProductService {
	@Autowired
	private ProductDao productDao;

	@Override
	public List<Product> selectProductList() {
		return productDao.selectProductList();
	}

	@Override
	public ProductExt selectOneProduct(int no) {
		return productDao.selectOneProduct(no);
	}
}
