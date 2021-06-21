package com.simpson.kisen.fan.model.vo;

import java.sql.Date;
import java.sql.Timestamp;
import java.util.Collection;
import java.util.List;

import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
// security userDetails 구현
public class Fan implements UserDetails {
	private String fanNo;
	private String fanId; // security - username
	private String password; // security - password
	private String phone;
	private String address;
	private String email;
	private Date birthday;
	private String gender;
	private int point;
	private boolean certification;
	private Timestamp enrollDate;
	private String fanName;
	private String oauth; // kakao, google
	
	// 하기내용 - security 관련
	
	// SimpleGrantedAuthority : 문자열 data를 처리할 수 있는 GrantedAuthority의 하위 클래스
	// -> 문자열로 주면 SimpleGrantedAuthority가 알아서 권한 관리해줌
	private List<SimpleGrantedAuthority> authorities;
	
	// enabled (활성화 여부)
	private boolean enabled;
	
	@Override
	public boolean isEnabled() {
		return true;
	}
	
	// authority에 대한 getter
	@Override
	public Collection<? extends GrantedAuthority> getAuthorities() {
		return authorities;
	}
	
	// username에 대한 getter
	@Override
	public String getUsername() {
		return fanId;
	}
	// 유효기간이 만료되었는지의 여부
	@Override
	public boolean isAccountNonExpired() {
		return true; // 사용 가능
	}
	
	// 계정이 잠겼는지
	@Override
	public boolean isAccountNonLocked() {
		return true; // 잠기지 않음
	}
	
	// 비밀번호 유효기간이 만료되었는지
	@Override
	public boolean isCredentialsNonExpired() {
		return true; // 만료 안됨
	}
	
}