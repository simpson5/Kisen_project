package com.simpson.kisen.product.model.dao;

import java.util.List;

import com.simpson.kisen.admin.model.vo.SlideImg;
import com.simpson.kisen.product.model.vo.Basket;
import com.simpson.kisen.product.model.vo.ProductImgExt;
import com.simpson.kisen.product.model.vo.ProductOption;

public interface ProductDao {

	List<ProductImgExt> selectNewGoodsProductList();

	ProductImgExt selectOneProduct(int no);

	List<ProductImgExt> selectRandomProductList();

	List<ProductImgExt> selectBestSellProductList();

	List<SlideImg> selectSlideList();

	List<ProductImgExt> selectIdolProductList(int no);

	List<ProductImgExt> selectIdolAlbumList(int no);

	int insertBasket(Basket basket);

	ProductOption selectOptionNo(int[] opNo);

	int insertBasketNoOption(Basket basket);

	ProductOption selectOptionNo(String opName);

	
	
}
