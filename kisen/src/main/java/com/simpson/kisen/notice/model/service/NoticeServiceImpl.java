package com.simpson.kisen.notice.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.simpson.kisen.agency.model.dao.AgencyDao;
import com.simpson.kisen.notice.model.dao.NoticeDao;
import com.simpson.kisen.notice.model.vo.Notice;
import com.simpson.kisen.notice.model.vo.NoticeExt;

@Service
public class NoticeServiceImpl implements NoticeService {

	@Autowired
	private NoticeDao noticeDao;

	@Override
	public List<Notice> selectNoticeList() {
		// TODO Auto-generated method stub
		return noticeDao.selectNoticeList();
	}

	@Override
	public NoticeExt selectNotice(int noticeNo) {
		return noticeDao.selectNotice(noticeNo);
	}

	@Override
	public int updateNoticeReadCnt(int noticeNo) {
		return noticeDao.updateNoticeReadCnt(noticeNo);
	}

	@Override
	public List<Notice> selectSearchNoticeList(String search) {
		return noticeDao.selectSearchNoticeList(search);
	}
	
	
}
