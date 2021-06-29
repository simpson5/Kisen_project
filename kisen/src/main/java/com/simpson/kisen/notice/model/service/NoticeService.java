package com.simpson.kisen.notice.model.service;

import java.util.List;

import com.simpson.kisen.notice.model.vo.Notice;
import com.simpson.kisen.notice.model.vo.NoticeExt;

public interface NoticeService {

	List<Notice> selectNoticeList();

	NoticeExt selectNotice(int noticeNo);

	int updateNoticeReadCnt(int noticeNo);

	List<Notice> selectSearchNoticeList(String search);

}
