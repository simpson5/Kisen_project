package com.simpson.kisen.product.model.dao;

import java.util.List;

import com.simpson.kisen.product.model.vo.Product;
import com.simpson.kisen.product.model.vo.ProductImgExt;

public interface ProductDao {

	List<Product> selectProductList();

	ProductImgExt selectOneProduct(int no);

	
	
}
