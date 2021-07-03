package com.simpson.kisen.product.model.service;

import java.util.List;

import com.simpson.kisen.admin.model.vo.SlideImg;
import com.simpson.kisen.product.model.vo.Basket;
import com.simpson.kisen.product.model.vo.ProductImgExt;
import com.simpson.kisen.product.model.vo.ProductOption;


public interface ProductService {

	List<ProductImgExt> selectBestSellProductList();

	ProductImgExt selectOneProduct(int no);

	List<ProductImgExt> selectRandomProductList();

	List<ProductImgExt> selectNewGoodsProductList();

	List<SlideImg> selectSlideList();

	List<ProductImgExt> selectIdolProductList(int no);

	List<ProductImgExt> selectIdolAlbumList(int no);

	int insertBasket(Basket basket);

	ProductOption selectOptionNo(String opName);

}
