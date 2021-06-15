package com.simpson.kisen.member.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.simpson.kisen.fan.model.vo.Fan;
import com.simpson.kisen.member.model.dao.MemberDao;

@Service
public class MemberServiceImpl implements MemberService {

	@Autowired
	private MemberDao memberDao;

	@Override
	public Fan selectOneMember(String id) {
		return memberDao.selectOneMember(id);
	}

	@Override
	public int insertMember(Fan member) {
		return memberDao.insertMember(member);
	}
}
