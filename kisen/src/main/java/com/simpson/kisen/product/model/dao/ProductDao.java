package com.simpson.kisen.product.model.dao;

import java.util.List;

import com.simpson.kisen.product.model.vo.Product;
import com.simpson.kisen.product.model.vo.ProductExt;

public interface ProductDao {

	List<Product> selectProductList();

	ProductExt selectOneProduct(int no);

	
	
}
