package com.simpson.kisen.member.model.service;

import com.simpson.kisen.fan.model.vo.Fan;

public interface MemberService {

	Fan selectOneMember(String id);

	int insertMember(Fan member);

}
