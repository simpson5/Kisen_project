package com.simpson.kisen.admin.model.service;

import java.text.DecimalFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.simpson.kisen.admin.model.dao.AdminDao;
import com.simpson.kisen.admin.model.vo.Sales;
import com.simpson.kisen.admin.model.vo.SalesTotalPrice;
import com.simpson.kisen.admin.model.vo.SlideImg;
import com.simpson.kisen.agency.model.dao.AgencyDao;
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


@Service
@Slf4j
public class AdminServiceImpl implements AdminService {
	
	@Autowired
	private AdminDao adminDao;

	@Override
	public List<ProductImgExt> selectRandomProductList() {
		return adminDao.selectRandomProductList();
	}

	@Override
	public List<ProductImgExt> selectSoldOutProductList() {
		return adminDao.selectSoldOutProductList();
	}

	@Override
	public List<ProductImgExt> selectBestProductList() {
		return adminDao.selectBestProductList();
	}

	@Override
	public List<ProductImgExt> selectProductList() {
		return adminDao.selectProductList();
	}

	@Override
	public int selectProductTotalContents() {
		return adminDao.selectProductTotalContents();
	}

	@Override
	public List<Idol> selectIdolNameList() {
		return adminDao.selectIdolNameList();
	}

	@Override
	public List<ProductImgExt> selectIdolProductList(Map<String, Object> param) {
		return adminDao.selectIdolProductList(param);
	}

	@Override
	public int insertSlideImg(List<SlideImg> slideImgList) {
		int result=0;
		if(slideImgList.size()>0) {
			for(SlideImg slideImg : slideImgList) {
				result = adminDao.insertSlideImg(slideImg);
			}
		}		
		return result;
	}

	@Override
	public List<SlideImg> selectSlideImgList() {
		return adminDao.selectSlideImgList();
	}

	@Override
	public int deleteSlideImg(int slideImgNo) {
		return adminDao.deleteSlideImg(slideImgNo);
	}

	@Transactional(rollbackFor = Exception.class)
	@Override
	public int insertNotice(NoticeExt notice) {
		int result =0;
		result =  adminDao.insertNotice(notice);

		//1. idol 등록
		if(notice.getNoticeImg() != null) {
			//2. 해당 idol의 이미지 등록
			NoticeImg img = notice.getNoticeImg();
			img.setNoticeNo(notice.getNoticeNo());
			result = insertNoticeImg(img);
		}
		
		return notice.getNoticeNo();
	}

	@Transactional(rollbackFor = Exception.class)
	public int insertNoticeImg(NoticeImg noticeImg) {
		return adminDao.insertNoticeImg(noticeImg);
	}

	@Override
	public NoticeExt selectNotice(int noticeNo) {
		return adminDao.selectNotice(noticeNo);
	}

	@Override
	public List<Notice> selectNoticeList() {
		return adminDao.selectNoticeList();
	}


	@Transactional(rollbackFor = Exception.class)
	@Override
	public int deleteNotice(int noticeNo) {
		int result =0;
		result =adminDao.deleteNotice(noticeNo);
		result= deleteNoticeImg(noticeNo);
		return result;
	}
	@Transactional(rollbackFor = Exception.class)
	public int deleteNoticeImg(int noticeNo) {
		return adminDao.deleteNoticeImg(noticeNo);
	}

	
	
	@Transactional(rollbackFor = Exception.class)
	@Override
	public int updateNotice(NoticeExt notice, String file) {
		int result =0;
		result =  adminDao.updateNotice(notice);

		//1. idol 등록
		if(notice.getNoticeImg() != null) {
			//2. 해당 idol의 이미지 등록
			NoticeImg img = notice.getNoticeImg();
			img.setNoticeNo(notice.getNoticeNo());
			if (file.equals("I")) {
				result = insertNoticeImg(img);
			}
			else {
				result = updateNoticeImg(img);
			}
		}
		
		return result;
	}

	@Transactional(rollbackFor = Exception.class)
	public int updateNoticeImg(NoticeImg noticeImg) {
		return adminDao.updateNoticeImg(noticeImg);
	}

	@Override
	public List<Fan> selectAllFanList() {
		return adminDao.selectAllFanList();
	}

	@Override
	public List<AgencyExt> selectNCAgencyList() {
		return adminDao.selectNCAgencyList();
	}

	@Override
	public List<AgencyExt> selectCAgencyList() {
		return adminDao.selectCAgencyList();
	}

	@Override
	public List<PaymentExt> selectSalesList(Map<String, String> param) {
		return adminDao.selectSalesList(param);
	}

	@Override
	public int deleteFan(String fanNo) {
		return adminDao.deleteFan(fanNo);
	}

	@Override
	public int updateCertification(String fanNo) {
		return adminDao.updateCertification(fanNo);
	}

	@Override
	public List<SalesTotalPrice> selectTotalPrice() {
		List<SalesTotalPrice> totalList = new ArrayList<SalesTotalPrice>();

		DecimalFormat df = new DecimalFormat("00");
		Calendar currentCalendar = Calendar.getInstance();
		String preYear = Integer.toString(currentCalendar.get(Calendar.YEAR)-1);
		String nowDay = df.format(currentCalendar.get(Calendar.DATE));
		if(nowDay.equals("31")) {
			nowDay= df.format(currentCalendar.get(Calendar.DATE)-5);
		}
		else if(nowDay.equals("30")){
			nowDay= df.format(currentCalendar.get(Calendar.DATE)-5);
		}
		else if(nowDay.equals("29")){
			nowDay= df.format(currentCalendar.get(Calendar.DATE)-5);
		}
		for(int i=0 ; i<12;i++) {
			String strMonth = df.format(currentCalendar.get(Calendar.MONTH) -i+1);	//현재 달 : +1
			String strYear = Integer.toString(currentCalendar.get(Calendar.YEAR));
			if(strMonth.equals("00")) {
				strMonth="12";
				strYear=preYear;
			}
			else if(strMonth.equals("-01")) {
				strMonth="11";
				strYear=preYear;
			}
			else if(strMonth.equals("-02")) {
				strMonth="10";
				strYear=preYear;
			}
			else if(strMonth.equals("-03")) {
				strMonth="09";
				strYear=preYear;
			}
			else if(strMonth.equals("-04")) {
				strMonth="08";
				strYear=preYear;
			}
			else if(strMonth.equals("-05")) {
				strMonth="07";
				strYear=preYear;
			}
			else if(strMonth.equals("-04")) {
				strMonth="06";
				strYear=preYear;
			}
			else if(strMonth.equals("-03")) {
				strMonth="05";
				strYear=preYear;
			}
			else if(strMonth.equals("-02")) {
				strMonth="04";
				strYear=preYear;
			}
			else if(strMonth.equals("-01")) {
				strMonth="03";
				strYear=preYear;
			}
			else if(strMonth.equals("-06")) {
				strMonth="02";
				strYear=preYear;
			}
			else if(strMonth.equals("-06")) {
				strMonth="01";
				strYear=preYear;
			}
			
			
			String strDate = strYear+"-" + strMonth+"-" + nowDay;
			String strMonthly= strYear+"-" + strMonth;
			
			log.info("strDate={}",strDate);
			SalesTotalPrice sales = adminDao.selectTotalPrice(strDate);
			if (sales==null) {
				sales = new SalesTotalPrice();
				sales.setMonth(strMonthly);
			}
			totalList.add(sales);
		}
		return totalList;
	}
	@Override
	public List<Sales> selectDaySales(String yearMonth, String lastDay) {

		DecimalFormat df = new DecimalFormat("00");
		Calendar currentCalendar = Calendar.getInstance();
		String nowDay = df.format(currentCalendar.get(Calendar.DATE));
		String strDate = yearMonth+"-" + nowDay;
		
		log.info("lastDay={}",lastDay);
		int end = Integer.parseInt(lastDay);
		List<Sales> salesList = adminDao.selectDaySales(strDate);
		
		List<Sales> newSalesList = new ArrayList<Sales>();;
		
		for(int i=1 ; i<=end ; i++) {
			String day = i<10 ? "0"+i  : ""+i;
			Sales sales = new Sales();
			sales.setPayDate(day);;
			sales.setTotal(0);
			newSalesList.add(sales);				
		}
		
		for(Sales s : newSalesList) {
			for(Sales s2 : salesList) {
				if (s.getPayDate().equals(s2.getPayDate())) {
					s.setTotal(s2.getTotal());
				}
			}
		}
		log.info("newSalesList={}",newSalesList);
		
		// TODO Auto-generated method stub
		return newSalesList;
	}
	
	
	
	
}
