package com.simpson.kisen.admin.model.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.simpson.kisen.admin.model.dao.AdminDao;
import com.simpson.kisen.admin.model.vo.SlideImg;
import com.simpson.kisen.agency.model.dao.AgencyDao;
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


@Service
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
	
	
}
