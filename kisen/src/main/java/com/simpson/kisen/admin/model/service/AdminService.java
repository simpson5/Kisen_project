package com.simpson.kisen.admin.model.service;

import java.util.List;
import java.util.Map;

import com.simpson.kisen.admin.model.vo.Sales;
import com.simpson.kisen.admin.model.vo.SalesTotalPrice;
import com.simpson.kisen.admin.model.vo.SlideImg;
import com.simpson.kisen.agency.model.vo.Agency;
import com.simpson.kisen.agency.model.vo.AgencyExt;
import com.simpson.kisen.fan.model.vo.Fan;
import com.simpson.kisen.idol.model.vo.Idol;
import com.simpson.kisen.notice.model.vo.Notice;
import com.simpson.kisen.notice.model.vo.NoticeExt;
import com.simpson.kisen.payment.model.vo.Payment;
import com.simpson.kisen.payment.model.vo.PaymentExt;
import com.simpson.kisen.product.model.vo.ProductImgExt;

public interface AdminService {

	List<ProductImgExt> selectRandomProductList();

	List<ProductImgExt> selectSoldOutProductList();

	List<ProductImgExt> selectBestProductList();

	List<ProductImgExt> selectProductList();

	int selectProductTotalContents();

	List<Idol> selectIdolNameList();

	List<ProductImgExt> selectIdolProductList(Map<String, Object> param);

	int insertSlideImg(List<SlideImg> slideImgList);

	List<SlideImg> selectSlideImgList();

	int deleteSlideImg(int slideImgNo);

	int insertNotice(NoticeExt notice);

	NoticeExt selectNotice(int noticeNo);

	List<Notice> selectNoticeList();

	int deleteNotice(int noticeNo);

	int updateNotice(NoticeExt notice, String file);

	List<Fan> selectAllFanList();

	List<AgencyExt> selectNCAgencyList();

	List<AgencyExt> selectCAgencyList();

	List<PaymentExt> selectSalesList(Map<String, String> param);

	int deleteFan(String fanNo);

	int updateCertification(String fanNo);

	List<SalesTotalPrice> selectTotalPrice();

	List<Sales> salesMonthPrice();
}
