package com.simpson.kisen.security.model.dao;

import org.springframework.security.core.userdetails.UserDetails;

public interface SecurityDao {

	UserDetails loadUserByUsername(String fanId);

}
