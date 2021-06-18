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
		int result = memberDao.insertMember(member);
		result = insertMemberAuthority(member);
		return result;
	}

	private int insertMemberAuthority(Fan member) {
		return memberDao.insertMemberAuthority(member);
	}

	@Override
	public int insertMemberAgency(Fan member, Agency agency) {
		int result = 0;
		result = memberDao.insertAgencyMember(member);
		result = insertMemberAuthority(member);
		// result = insertAgencyAuthority(member);
		agency.setFanNo(member.getFanNo()); // agency fanNo 세팅
		result = insertAgency(agency);
		return result;
	}

//	private int insertAgencyAuthority(Fan member) {
//		return memberDao.insertAgencyAuthority(member);
//	}

	private int insertAgency(Agency agency) {
		return memberDao.insertAgency(agency);
	}
}
