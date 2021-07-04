package com.simpson.kisen.admin.model.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.simpson.kisen.admin.model.vo.Sales;
import com.simpson.kisen.admin.model.vo.SalesTotalPrice;
import com.simpson.kisen.admin.model.vo.SlideImg;
import com.simpson.kisen.agency.model.vo.Agency;
import com.simpson.kisen.agency.model.vo.AgencyExt;
import com.simpson.kisen.fan.model.vo.Fan;
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

import lombok.extern.slf4j.Slf4j;

@Repository
@Slf4j
public class AdminDaoImpl implements AdminDao {
	@Autowired
	private SqlSessionTemplate session;

	@Override
	public List<ProductImgExt> selectRandomProductList() {
		return session.selectList("admin-product.selectRandomProductList");
	}

	@Override
	public List<ProductImgExt> selectSoldOutProductList() {
		return session.selectList("admin-product.selectSoldOutProductList");
	}

	@Override
	public List<ProductImgExt> selectBestProductList() {
		return session.selectList("admin-product.selectBestProductList");
	}

	@Override
	public List<ProductImgExt> selectProductList() {
		return session.selectList("admin-product.selectProductList");
	}

	@Override
	public int selectProductTotalContents() {
		return session.selectOne("admin-product.selectProductTotalContents");
	}

	@Override
	public List<Idol> selectIdolNameList() {
		return session.selectList("admin-product.selectIdolNameList");
	}

	@Override
	public List<ProductImgExt> selectIdolProductList(Map<String, Object> param) {
		return session.selectList("admin-product.selectIdolProductList",param);
	}

	@Override
	public int insertSlideImg(SlideImg slideImg) {
		return session.insert("admin-product.insertSlideImg",slideImg);
	}

	@Override
	public List<SlideImg> selectSlideImgList() {
		return session.selectList("admin-product.selectSlideImgList");
	}

	@Override
	public int deleteSlideImg(int slideImgNo) {
		return session.delete("admin-product.deleteSlideImg",slideImgNo);
	}

	
//	공지
	@Override
	public int insertNotice(NoticeExt notice) {
		return session.insert("notice.insertNotice",notice);
	}

	@Override
	public int insertNoticeImg(NoticeImg noticeImg) {
		return session.insert("notice.insertNoticeImg",noticeImg);
	}

	@Override
	public NoticeExt selectNotice(int noticeNo) {
		return session.selectOne("notice.selectNotice",noticeNo);
	}

	@Override
	public List<Notice> selectNoticeList() {
		return session.selectList("notice.selectNoticeList");
	}

	@Override
	public int deleteNotice(int noticeNo) {
		return session.delete("notice.deleteNotice",noticeNo);
	}

	@Override
	public int deleteNoticeImg(int noticeNo) {
		return session.delete("notice.deleteNoticeImg",noticeNo);
	}

	@Override
	public int updateNotice(NoticeExt notice) {
		return session.update("notice.updateNotice",notice);
	}

	@Override
	public int updateNoticeImg(NoticeImg noticeImg) {
		return session.update("notice.updateNoticeImg",noticeImg);
	}

	
	
	
//	agency 관련
	@Override
	public List<Fan> selectAllFanList() {
		return session.selectList("admin-product.selectAllFanList");
	}

	@Override
	public List<AgencyExt> selectNCAgencyList() {
		return session.selectList("admin-product.selectNCAgencyList");
	}

	@Override
	public List<AgencyExt> selectCAgencyList() {
		return session.selectList("admin-product.selectCAgencyList");
	}

	
	
//	sales 관련
	@Override
	public List<PaymentExt> selectSalesList(Map<String, String> param) {
		return session.selectList("admin-product.selectSalesList",param);
	}

//	member 관련
	@Override
	public int deleteFan(String fanId) {
		return session.delete("admin-product.deleteFan",fanId);
	}

	@Override
	public int updateCertification(String fanNo) {
		return session.delete("admin-product.updateCertification",fanNo);
	}

	@Override
	public SalesTotalPrice selectTotalPrice(String strDate) {
		return session.selectOne("admin-product.selectTotalPrice",strDate);
	}

	@Override
	public List<Sales> selectDaySales(String strDate) {
		return session.selectList("admin-product.salesMonthPrice",strDate);
	}

	@Override
	public int insertAuthority(String fanNo) {
		return session.insert("admin-product.insertAuthority",fanNo);
	}

	
}
