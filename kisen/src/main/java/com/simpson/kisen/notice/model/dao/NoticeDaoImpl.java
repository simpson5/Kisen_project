package com.simpson.kisen.notice.model.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.simpson.kisen.agency.model.dao.AgencyDaoImpl;
import com.simpson.kisen.notice.model.vo.Notice;
import com.simpson.kisen.notice.model.vo.NoticeExt;

import lombok.extern.slf4j.Slf4j;

@Repository
@Slf4j
public class NoticeDaoImpl implements NoticeDao {
	@Autowired
	private SqlSessionTemplate session;

	@Override
	public List<Notice> selectNoticeList() {
		// TODO Auto-generated method stub
		return session.selectList("notice.selectNoticeList");
	}

	@Override
	public NoticeExt selectNotice(int noticeNo) {
		return session.selectOne("notice.selectNotice",noticeNo);
	}

	@Override
	public int updateNoticeReadCnt(int noticeNo) {
		return session.update("notice.updateNoticeReadCnt",noticeNo);
	}

	@Override
	public List<Notice> selectSearchNoticeList(String search) {
		return session.selectList("notice.selectSearchNoticeList",search);
	}

}
