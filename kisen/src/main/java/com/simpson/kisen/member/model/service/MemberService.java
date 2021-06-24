package com.simpson.kisen.member.model.service;

import java.util.List;

import com.simpson.kisen.agency.model.vo.Agency;
import com.simpson.kisen.fan.model.vo.Authority;
import com.simpson.kisen.fan.model.vo.Fan;

public interface MemberService {

	Fan selectOneMember(String id);

	int insertMember(Fan member);

	int insertMemberAgency(Fan member, Agency agency);

	int insertOauthMember(Fan member);

	List<Authority> selectOneAuthoriy(String fanId);

}