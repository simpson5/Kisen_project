<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<jsp:include page="/WEB-INF/views/common/header.jsp">

	<jsp:param value="mypage" name="title"/>
</jsp:include>
<style>
div#demo-container{
	width:600px;
}
a#payNav{
	color :#a52bb3;
	 text-align: center;
}
a#payNav:hover{
	color : #c7a2e0;
	 text-align: center;
}
.nav-tabs .nav-item.show .nav-link, .nav-tabs .nav-link.active {
    color: #c7a2e0;
    background-color: #fff;
    border-color: #dee2e6 #dee2e6 #fff;
    text-align: center;
}
.btn-outline-success {
    color:  #9033b5;
    background-color: transparent;
    background-image: none;
    border-color:  #9033b5;
 
}
.btn-outline-success:hover{
    color:  white;
    background-color: #c7a2e0;
    background-image: none;
    border-color:  #c7a2e0;
}
div#mypage-container{
	background-color: #c7a2e0;
	width:800px;
	height: 300px;
}
.border-secondary {
    border-color:  #9033b5!important;
}
div#coupon{
	 text-align: center;
}
div#mypage1{
	width:600px;
	height: 150px;
	 text-align: center;	
}
</style>
		<%-- <img src="${pageContext.request.contextPath }/resources/images/logo-spring.png" id="center-image" alt="스프링로고" class="d-block mx-auto mt-5"/>
 --%>

	<!-- 회원상태 -->
	<br /><br /><br /><br />
	<div id="mypage-container" class="border border-0 mx-auto p-3 rounded ">
	<div class="media mx-auto" id="mypage1">
	  <img class="align-self-start mr-3 " src="..." alt="사진여부 결정해주세용">
	  <div class="media-body">
	    <h5 class="mt-0">{$id}님, 안녕하세요! </h5>
	    <span class="badge badge-warning mx-1">Lv.1</span>
	</div>
	</div>

	 <div class="row align-items-end p-5" id="coupon">
    <div class="col-4">
     보유쿠폰
    </div>
    <div class="col-4">

    </div>
    <div class="col-4">
      마일리지
    </div>

  </div>
  </div>

	<br /><br /><br />

	  <!-- 내부 네브바  -->
		     <ul class="nav nav-tabs justify-content-center">
		  <li class="nav-item col-md-2 p-0">
		    <a class="nav-link" href="${pageContext.request.contextPath}/mypage/mypage_pay.do" id="payNav">결제내역</a>
		  </li>
		  <li class="nav-item col-md-2 p-0">
		    <a class="nav-link" href="${pageContext.request.contextPath}/mypage/mypage_artist.do" id="payNav">찜 아티스트</a>
		  </li>
		  <li class="nav-item col-md-2 p-0">
		    <a class="nav-link active" href="${pageContext.request.contextPath}/mypage/mypage_member.do" id="payNav">회원정보수정</a>  <%--사용자가 클릭시 비밀번호 입력 나오게 하기 --%>
		  </li>
		  <!-- <li class="nav-item">
		    <a class="nav-link disabled" href="#">Disabled</a>
		  </li> -->
		</ul>
		
	<br /><br /><br /><br />

	<!--회원정보  -->
<div id="demo-container" 
	 class="border border-secondary mx-auto p-3 rounded ">	

<form class="justify-content-center">
   <div class="form-group col-md-7 mx-auto">
      <label for="inputEmail4">*아이디</label>
      <input type="text" class="form-control" id="inputEmail4" placeholder="아이디">
    </div>
  <div class="form-group col-md-7 mx-auto">
      <label for="inputEmail4">*이름</label>
      <input type="text" class="form-control" id="inputEmail4" placeholder="이름">
    </div>
 <div class="form-group col-md-7 mx-auto">
      <label for="inputPassword4">*새 비밀번호</label>
      <input type="password" class="form-control" id="inputPassword4" placeholder="Password">
 </div>
 <div class="form-group col-md-7 mx-auto">
      <label for="inputPassword4">*비밀번호 확인</label>
      <input type="password" class="form-control" id="inputPassword4" placeholder="Password">
</div>

<div class="form-group col-md-7 mx-auto">
      <label for="inputPassword4">*이메일</label>
      <input type="email" class="form-control" id="inputPassword4" placeholder="이메일">
</div>
  <div class="form-group col-md-7 mx-auto">
      <label for="inputPassword4">*전화번호</label>
      <input type="tel" class="form-control" id="inputPassword4" placeholder="">
    </div>

  <div class="form-group col-sm-7 mx-auto">
    <label for="inputAddress">*주소</label>
    <input type="text" class="form-control" id="inputAddress" placeholder="1234 Main St">
  </div>

  <div class="form-group col-sm-7 mx-auto">
    <label for="inputAddress">*우편번호</label>
    <input type="text" class="form-control" id="inputAddress" placeholder="1234 Main St">
  </div>
 <div class="form-group col-sm-7 mx-auto">  
     <button type="button" class="btn btn-secondary btn-sm ">*우편번호 찾기</button>
  </div>
  <div class="form-group col-sm-7 mx-auto">
    <label for="inputAddress2">*상세 주소</label>
    <input type="text" class="form-control" id="inputAddress2" placeholder="Apartment, studio, or floor">

  </div>
  <div class="container">
  <div class="row justify-content-md-center">
    <div class="col-2 col-lg-2"></div>
    <div class="col-4 mt-2 p-0">
  <button type="submit" class="btn btn-outline-success" >수정하기</button>
    </div>
    <div class="col-4 col-lg-2 mt-2">
     <button type="submit" class="btn btn-outline-danger " >탈퇴하기</button>
    </div>
    <div class="col-4 col-lg-2"></div>
  </div>
  </div>

</form>

</div>
	<br />
	<br />
	<br />
	<br />
<!-- 열 태스트 -->



<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>