package com.simpson.kisen.product.model.service;

import java.util.List;

import com.simpson.kisen.product.model.vo.ProductImgExt;


public interface ProductService {

	List<ProductImgExt> selectBestSellProductList();

	ProductImgExt selectOneProduct(int no);

	List<ProductImgExt> selectRandomProductList();

	List<ProductImgExt> selectNewGoodsProductList();

}
