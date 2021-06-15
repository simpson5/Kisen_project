package com.simpson.kisen.member.model.dao;

import com.simpson.kisen.fan.model.vo.Fan;

public interface MemberDao {

	Fan selectOneMember(String id);

	int insertMember(Fan member);

}
