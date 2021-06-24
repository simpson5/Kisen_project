package com.simpson.kisen.agency.model.service;

import java.util.List;
import java.util.Map;

import com.simpson.kisen.agency.model.vo.Agency;
import com.simpson.kisen.idol.model.vo.Idol;
import com.simpson.kisen.product.model.vo.ProductImgExt;

public interface AgencyService {
	public static String[] PRODUCT_CATEGORY = {"앨범","응원봉","기타"};

	public static String PRODUCT_IMG_CATEGORY_THUMBNAIL = "R";

	public static String PRODUCT_IMG_CATEGORY_DETAIL = "D";
	
	List<Idol> selectIdolList(String fanNo, Map<String, Object> param);

	int insertIdol(Idol idol);

	Idol selectOneIdol(String idolName);

	Agency selectAgency(String fanNo);

	int selectIdolTotalContents(String fanNo);

	Idol selectIdol(int no);

	int selectPdCnt(int no);

	int updateIdol(Idol idol);

	int insertProduct(ProductImgExt product);

	List<ProductImgExt> selectProductList(String fanNo, Map<String, Object> param);

	int selectProductTotalContents(String fanNo);

	ProductImgExt selectOneProduct(String pdNo);

	List<Idol> selectIdolNameList(String fanNo);

	int updateProduct(ProductImgExt product);

	int deleteProduct(String pdNo);

	int deleteOption(int optionNum);

}
