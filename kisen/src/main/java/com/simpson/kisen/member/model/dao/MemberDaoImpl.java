package com.simpson.kisen.member.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.simpson.kisen.agency.model.vo.Agency;
import com.simpson.kisen.fan.model.vo.Fan;

@Repository
public class MemberDaoImpl implements MemberDao {
	
	@Autowired
	private SqlSessionTemplate session;

	@Override
	public Fan selectOneMember(String id) {
		return session.selectOne("member.selectOneMember", id);
	}

	@Override
	public int insertMember(Fan member) {
		return session.insert("member.insertMember", member);
	}

	@Override
	public int insertAgencyMember(Fan member) {
		return session.insert("member.insertAgencyMember", member);
	}

	@Override
	public int insertAgency(Agency agency) {
		return session.insert("member.insertAgency", agency);
	}

	@Override
	public int insertMemberAuthority(Fan member) {
		return session.insert("member.insertMemberAuthority", member);
	}

	@Override
	public int insertOauthMember(Fan member) {
		return session.insert("member.insertKakaoMember", member);
	}

//	@Override
//	public int insertAgencyAuthority(Fan member) {
//		return session.insert("member.insertAgencyAuthority", member);
//	}
}