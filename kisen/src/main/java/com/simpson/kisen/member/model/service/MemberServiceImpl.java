package com.simpson.kisen.member.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.simpson.kisen.agency.model.vo.Agency;
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

	@Override
	public int insertMemberAgency(Fan member, Agency agency) {
		int result = 0;
		result = memberDao.insertAgencyMember(member);
		agency.setFanNo(member.getFanNo()); // agency fanNo 세팅
		result = insertAgency(agency);
		return result;
	}

	private int insertAgency(Agency agency) {
		return memberDao.insertAgency(agency);
	}
}
