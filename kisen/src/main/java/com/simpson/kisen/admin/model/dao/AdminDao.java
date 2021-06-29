package com.simpson.kisen.admin.model.dao;

import java.util.List;
import java.util.Map;

import com.simpson.kisen.admin.model.vo.SlideImg;
import com.simpson.kisen.agency.model.vo.Agency;
import com.simpson.kisen.idol.model.vo.Idol;
import com.simpson.kisen.idol.model.vo.IdolImg;
import com.simpson.kisen.idol.model.vo.IdolMv;
import com.simpson.kisen.notice.model.vo.Notice;
import com.simpson.kisen.notice.model.vo.NoticeExt;
import com.simpson.kisen.notice.model.vo.NoticeImg;
import com.simpson.kisen.payment.model.vo.Payment;
import com.simpson.kisen.payment.model.vo.PaymentExt;
import com.simpson.kisen.product.model.vo.ProductImg;
import com.simpson.kisen.product.model.vo.ProductImgExt;
import com.simpson.kisen.product.model.vo.ProductOption;

public interface AdminDao {

	List<ProductImgExt> selectRandomProductList();

	List<ProductImgExt> selectSoldOutProductList();

	List<ProductImgExt> selectBestProductList();

	List<ProductImgExt> selectProductList();

	int selectProductTotalContents();

	List<Idol> selectIdolNameList();

	List<ProductImgExt> selectIdolProductList(Map<String, Object> param);

	int insertSlideImg(SlideImg slideImg);

	List<SlideImg> selectSlideImgList();

	int deleteSlideImg(int slideImgNo);

	int insertNotice(NoticeExt notice);

	int insertNoticeImg(NoticeImg noticeImg);

	NoticeExt selectNotice(int noticeNo);

	List<Notice> selectNoticeList();

	int deleteNotice(int noticeNo);

	int deleteNoticeImg(int noticeNo);

	int updateNotice(NoticeExt notice);

	int updateNoticeImg(NoticeImg noticeImg);

}
