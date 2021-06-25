package com.simpson.kisen.product.model.dao;

import java.util.List;

import com.simpson.kisen.product.model.vo.ProductImgExt;

public interface ProductDao {

	List<ProductImgExt> selectProductList();

	ProductImgExt selectOneProduct(int no);

	
	
}
