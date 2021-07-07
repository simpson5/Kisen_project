package com.simpson.kisen.member.model.service;

import static org.springframework.test.web.servlet.result.MockMvcResultHandlers.log;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.simpson.kisen.agency.model.vo.Agency;
import com.simpson.kisen.fan.model.vo.Authority;
import com.simpson.kisen.fan.model.vo.Fan;
import com.simpson.kisen.member.model.dao.MemberDao;

import lombok.extern.slf4j.Slf4j;

@Slf4j
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
		int result = 0;
		if(member.getOauth() == null || "".equals(member.getOauth())) {
			result = memberDao.insertMember(member); // 일반 회원가입
		} else {
			result = insertOauthMember(member); // 소셜 회원가입
		}
		result = insertMemberAuthority(member);
		return result;
	}

	private int insertMemberAuthority(Fan member) {
		return memberDao.insertMemberAuthority(member);
	}

	@Override
	public int insertMemberAgency(Fan member, Agency agency) {
		int result = 0;
		if(member.getOauth() == null || "".equals(member.getOauth())) {
			result = memberDao.insertAgencyMember(member);
		} else {
			log.info("이게 실행됨!");
			result = memberDao.insertOauthAgencyMember(member);	
		}
		result = insertMemberAuthority(member);
		// result = insertAgencyAuthority(member);
		agency.setFanNo(member.getFanNo()); // agency fanNo
		result = insertAgency(agency);
		return result;
	}

	/*
	 * private int insertAgencyAuthority(Fan member) { return
	 * memberDao.insertAgencyAuthority(member); }
	 */

	private int insertAgency(Agency agency) {
		return memberDao.insertAgency(agency);
	}

	@Override
	public int insertOauthMember(Fan member) {
		return memberDao.insertOauthMember(member);
	}

	@Override
	public List<Authority> selectOneAuthoriy(String fanId) {
		return memberDao.selectOneAuthority(fanId);
	}

	@Override
	public Fan searchOneMember(Map<String, Object> param) {
		return memberDao.searchOneMember(param);
	}

	@Override
	public Fan selectOneMemberByEmail(String email) {
		return memberDao.selectOneMemberByEmail(email);
	}

	@Override
	public Fan selectOneMemberByPhone(Fan fan) {
		return memberDao.selectOneMemberByPhone(fan);
	}

	@Override
	public int updatePwdToTempPwd(Fan member) {
		return memberDao.updatePwdToTempPwd(member);
	}


}