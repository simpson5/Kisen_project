package com.simpson.kisen.agency.model.service;

import java.util.List;
import java.util.Map;

import com.simpson.kisen.admin.model.vo.Sales;
import com.simpson.kisen.admin.model.vo.SalesTotalPrice;
import com.simpson.kisen.agency.model.vo.Agency;
import com.simpson.kisen.idol.model.vo.Idol;
import com.simpson.kisen.idol.model.vo.IdolMv;
import com.simpson.kisen.payment.model.vo.Payment;
import com.simpson.kisen.payment.model.vo.PaymentExt;
import com.simpson.kisen.product.model.vo.ProductImgExt;

public interface AgencyService {
	public static String[] PRODUCT_CATEGORY = {"앨범","응원봉","기타"};
	public static String SEARCH_OPTION_ALL = "all";
	public static String SEARCH_OPTION_INCOMPLETE = "incomplete";
	public static String SEARCH_OPTION_COMPLETE = "complete";

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

	List<ProductImgExt> selectIdolProductList(Map<String, Object> param);

	List<ProductImgExt> selectBestProductList(String fanNo);

	List<ProductImgExt> selectSoldOutProductList(String fanNo);

	List<ProductImgExt> selectRandomProductList(String fanNo);

	int updateStock(Map<String, Integer> map);

	List<PaymentExt> selectSalesList(Map<String, String> param);

	int updateWaybill(Payment payment);

	List<Sales> selectDaySales(String yearMonth, String lastDay, String fanNo);

	List<SalesTotalPrice> selectTotalPrice(String fanNo);

	void insertMvLink(List<IdolMv> idolMvInsertList);

}
