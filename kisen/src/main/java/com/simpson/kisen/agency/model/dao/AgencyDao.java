package com.simpson.kisen.agency.model.dao;

import java.util.List;
import java.util.Map;

import com.simpson.kisen.agency.model.vo.Agency;
import com.simpson.kisen.idol.model.vo.Idol;
import com.simpson.kisen.idol.model.vo.IdolImg;
import com.simpson.kisen.idol.model.vo.IdolMv;
import com.simpson.kisen.payment.model.vo.Payment;
import com.simpson.kisen.payment.model.vo.PaymentExt;
import com.simpson.kisen.product.model.vo.ProductImg;
import com.simpson.kisen.product.model.vo.ProductImgExt;
import com.simpson.kisen.product.model.vo.ProductOption;

public interface AgencyDao {

	List<Idol> selectIdolList(String fanNo, Map<String, Object> param);

	int insertIdol(Idol idol);

	int insertIdolImg(IdolImg idolImg);

	Idol selectOneIdol(String idolName);

	int insertIdolMv(IdolMv idolMv);

	Agency selectAgency(String fanNo);


	int selectIdolTotalContents(String fanNo);

	Idol selectIdol(int no);

	int selectPdCnt(int no);

	int updateIdol(Idol idol);

	int updateIdolImg(IdolImg idolImg);

	int updateIdolMv(IdolMv idolMv);

	int insertProduct(ProductImgExt product);

	int insertProductImg(ProductImg productImg);

	List<ProductImgExt> selectProductList(String fanNo, Map<String, Object> param);

	int selectProductTotalContents(String fanNo);

	ProductImgExt selectOneProduct(String pdNo);

	List<Idol> selectIdolNameList(String fanNo);

	int updateProduct(ProductImgExt product);

	int updateProductImg(ProductImg productImg);

	int deleteProduct(String pdNo);

	int insertProductOption(ProductOption productOption);

	int updateProductOption(ProductOption productOption);

	int deleteOption(int optionNum);

	List<ProductImgExt> selectIdolProductList(Map<String, Object> param);

	List<ProductImgExt> selectBestProductList(String fanNo);

	List<ProductImgExt> selectSoldOutProductList(String fanNo);

	List<ProductImgExt> selectRandomProductList(String fanNo);

	int updateStock(Map<String, Integer> map);

	List<PaymentExt> selectSalesList(Map<String, String> param);

	int updateWaybill(Payment payment);

}
