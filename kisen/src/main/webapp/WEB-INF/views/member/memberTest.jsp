<%@page import="com.simpson.kisen.fan.model.vo.Fan"%>
<%@page import="org.springframework.security.core.context.SecurityContextHolder"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>	
<% 
/* List.contains메소드를 사용하기 위해 String[] => List로 형변환함.  */
Fan member = 
	(Fan) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
System.out.println(member);
%>
		<!-- 방법1. controller에서 loginMember로 넘긴 경우, loginMember.id로 꺼내쓸 수 있음 -->
		<input type="text" class="form-control" placeholder="아이디 (4글자이상)" name="id" id="id" value='${loginMember.fanId}' readonly required/>
		<input type="text" class="form-control" placeholder="아이디 (4글자이상)" name="id" id="id" value='${loginMember.fanName}' readonly required/>
		<br />
		<!-- 방법2. member객체를 가진 principal로부터 정보 가져오기 -->
		<input type="text" class="form-control" placeholder="아이디 (4글자이상)" name="id" id="id" value='<sec:authentication property="principal.fanId"/>' readonly required/>
		<input type="text" class="form-control" placeholder="아이디 (4글자이상)" name="id" id="id" value='<sec:authentication property="principal.fanName"/>' readonly required/>