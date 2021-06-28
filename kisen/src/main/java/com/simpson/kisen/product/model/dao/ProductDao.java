package com.simpson.kisen.product.model.dao;

import java.util.List;

import com.simpson.kisen.admin.model.vo.SlideImg;
import com.simpson.kisen.product.model.vo.ProductImgExt;

public interface ProductDao {

	List<ProductImgExt> selectNewGoodsProductList();

	ProductImgExt selectOneProduct(int no);

	List<ProductImgExt> selectRandomProductList();

	List<ProductImgExt> selectBestSellProductList();

	List<SlideImg> selectSlideList();

	
	
}
