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
div#mypage-container{
	background-color: #c7a2e0;
	width:800px;
	height: 280px;
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
.btn-outline-warning {
    color:  #9033b5;
    background-color: transparent;
    background-image: none;
    border-color: #9033b5;
 
}
.btn-outline-warning:hover{
    color:  white;
    background-color: #c7a2e0;
    background-image: none;
    border-color:  #c7a2e0;
}
div#mypageContainer{
	background-color: #c7a2e0;
	width:800px;
	height: 400px;
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
thead{
 background-color: #c7a2e0;
}
div#payContainer{
	width:800px;
	border: 2px solid #bc73d6!important;
	
}
#paymentHistory{
	width:1000px;
}
#payInfo{
	 text-align: center;	
}
.btn-outline-warning {
    color:  #9033b5;
    background-color: transparent;
    background-image: none;
    border-color:  #9033b5;
 
}
.btn-outline-warning:hover{
    color:  white;
    background-color: #c7a2e0;
    background-image: none;
    border-color:  #c7a2e0;
}
#innerContent{
	width: 140px;
	text-align: center;	
	font-size: 12px;
	
}
.border-dark{
 	border-color: #d8d8d8!important;
}
#searchBtn{
    color: #fff;
    background-color: #c8aad2;
    border-color: #c8aad2;
}
.btn-danger.focus, .btn-danger:focus {
    box-shadow: 0 0 0 0.2rem rgb(100 0 165 / 50%);
}
.btn-danger:not(:disabled):not(.disabled).active:focus, .btn-danger:not(:disabled):not(.disabled):active:focus, .show>.btn-danger.dropdown-toggle:focus {
    box-shadow: 0 0 0 0.2rem rgb(100 0 165 / 50%);
}
img#productImg{
	width: 100px;
	height: 80px;
}
</style>


	<!-- 회원상태 -->
	<br /><br /><br /><br />
<div id="mypage-container" class="border border-0 mx-auto p-3 rounded ">
	<div class="row ">
		    <h5 class="col">{$principal.fanId}님, 안녕하세요! </h5>
	    <div class="col-8">
		    <span class="badge badge-warning mx-1">Lv.1</span>
	    </div>
	</div>
<!-- 쿠폰 및 마일리지 박스 -->
	<div class="row align-items-end p-5 rounded" id="coupon" style="background-color: white;">
	    <div class="col-4 font-weight-bold" >
	     보유쿠폰
	     <hr/>
		     <div class="col mx-auto" style="text-align: center;color: #ff5c00; font-size: 20px">
		     <span >3장</span>
		    </div>
	    </div>
	    <div class="col-4">
	
	    </div>
	    <div class="col-4 font-weight-bold" style="color: ">
	      마일리지
	      <hr/>
		     <div class="col mx-auto" style="text-align: center; color: #efb300; font-size: 20px" >
		     <span >1000점</span>
		    </div>
	    </div>
    </div>
</div>

	<br /><br /><br />


	  <!-- 내부 네브바  -->
		   <ul class="nav nav-tabs justify-content-center">
		  <li class="nav-item col-md-2 p-0">
		    <a class="nav-link active" href="#" id="payNav">결제내역</a>
		  </li>
		  <li class="nav-item col-md-2 p-0">
		    <a class="nav-link" href="${pageContext.request.contextPath}/mypage/mypageArtist.do" id="payNav">찜 아티스트</a>
		  </li>
		  <li class="nav-item col-md-2 p-0">
		    <a class="nav-link" href="${pageContext.request.contextPath}/mypage/mypageMember.do" id="payNav">회원정보수정</a>  <%--사용자가 클릭시 비밀번호 입력 나오게 하기 --%>
		  </li>
		  <!-- <li class="nav-item">
		    <a class="nav-link disabled" href="#">Disabled</a>
		  </li> -->
		</ul>
	<br /><br />

	<!--주문 처리 현황 -->
<div id="payContainer" class="border border-3 mx-auto p-3 rounded">
	<div class="row my-2 mx-auto border border-left-0 border-top-0 border-right-0" id="innerTitle" >
	    <div class="col-10 mx-auto my-1">
	     나의 주문 처리 현황
	    </div>
	    <div class="col mx-auto my-1" >
	     내가 쓴 글
	    </div>
  	</div>

	<br />
  <div class="row mx-auto" >
    <div class="col border border-dark border-left-0 border-top-0 border-bottom-0" id="innerContent">
     입금전
     <br /><br />
     <span class="font-weight-bold" >0</span>
    </div>
    <div class="col border border-dark border-left-0 border-top-0 border-bottom-0" id="innerContent">
      배송준비중
       <br /><br />
     <span class="font-weight-bold" >0</span>
    </div>
    <div class="col border border-dark border-left-0 border-top-0 border-bottom-0" id="innerContent">
      배송중
       <br /><br />
     <span class="font-weight-bold" >0</span>
    </div>
    <div class="col border border-dark border-left-0 border-top-0 border-bottom-0" id="innerContent">
      배송완료
        <br /><br />
     <span class="font-weight-bold" >0</span>
    </div>
    <div class="col " id="innerContent">
      <ul>
      	<li>취소 : 0</li>
      	<li>교한 : 0</li>
      	<li>반품 : 0</li>
      </ul>
    </div>
  </div>
</div>
 <br />
 <hr />
<!-- 구매내역 결과 -->
 <div class="row mx-auto my-3" >
	<div class="btn-group col" ></div>
	<div class="btn-group col " ></div>
	<div class="btn-group col " ></div>
	<div class="btn-group col mx-5" >
	  <button type="button" class="btn btn-danger dropdown-toggle " 
	  			data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"
	  			id="searchBtn" >
	    조회기간
	  </button>
	  <div class="dropdown-menu">
	    <a class="dropdown-item" href="#">1개월</a>
	    <a class="dropdown-item" href="#">3개월</a>
	    <a class="dropdown-item" href="#">6개월</a> 
	  </div>
	</div>
	<div class="btn-group col" ></div>
	<div class="btn-group col" ></div>
	<div class="btn-group col" ></div>
</div>


<!-- 결제내역 이것도 약간 수저어엉ㅇ

 -->
<div class="border border-0 mx-auto p-3 rounded " id="paymentHistory">
	<ul class="list-unstyled">
	  <li class="media border border-left-0 border-top-0 border-right-0">
	    <img class="mr-3" src="${pageContext.request.contextPath}/resources/images/moonju/rv.jpg" alt="상품 이미지" id="productImg" >
	    <div class="media-body col-6 mb-3 ">
	      <h5 class="mt-0 mb-1">Red Velvet 1st 앨범</h5>
		      <div class="py-3">
		      <span>Red Velvet 1st 앨범/포토카드증정</span>
		      </div>
		      <span>시즌그리팅(day)</span>
	    </div>
	    <div class="col-2" id="payInfo">
	    	<h5 class="mt-0 mb-1">가격</h5>
		      <div class="py-0">
		      <span>10000원</span>
		      </div>
	    </div>
	    <div class="col-2 " id="payInfo">
	    	<h5 class="mt-0 mb-1">수량</h5>
		      <div class="py-0">
		      <span>1</span>
		      </div>
	    </div>
	    <div class="col-2" id="payInfo">
		      <div class="py-2">
		      	<button type="submit" class="btn btn-outline-warning" >구매후기</button>
		      </div>
		      <div class="py-2">
		      	<button type="submit" class="btn btn-outline-warning" >배송조회</button>
		      </div>
	    </div>
	  </li>

	  <li class="media my-4 border border-left-0 border-top-0 border-right-0">
	     <img class="mr-3" src="${pageContext.request.contextPath}/resources/images/moonju/shinee.jpg" alt="상품 이미지" id="productImg" >
	     <div class="media-body col-6 mb-3">
	      <h5 class="mt-0 mb-1">SHINEE 정규 앨범</h5>
		      <div class="py-3">
		      <span>정규 앨범</span>
		      </div>
		      <span></span>
	    </div>
	    <div class="col-2" id="payInfo">
	    	<h5 class="mt-0 mb-1">가격</h5>
		      <div class="py-0">
		      <span>10000원</span>
		      </div>
	    </div>
	    <div class="col-2 " id="payInfo">
	    	<h5 class="mt-0 mb-1">수량</h5>
		      <div class="py-0">
		      <span>1</span>
		      </div>
	    </div>
	    <div class="col-2" id="payInfo">
		      <div class="py-2">
		      	<button type="submit" class="btn btn-outline-warning" >구매후기</button>
		      </div>
		      <div class="py-2">
		      	<button type="submit" class="btn btn-outline-warning" >배송조회</button>
		      </div>
	    </div>
	   </li>

	  <li class="media border border-left-0 border-top-0 border-right-0">
	     <img class="mr-3" src="${pageContext.request.contextPath}/resources/images/moonju/twice.jpg" alt="상품 이미지" id="productImg" >
	    <div class="media-body col-6 mb-3">
	      <h5 class="mt-0 mb-1">TWICE 브로마이드</h5>
		      <div class="py-3">
		      <span>공식응원봉</span>
		      </div>
		      <span>브로마이드 패키지(A타입)</span>
	    </div>
	    <div class="col-2" id="payInfo">
	    	<h5 class="mt-0 mb-1">가격</h5>
		      <div class="py-0">
		      <span>10000원</span>
		      </div>
	    </div>
	    <div class="col-2 " id="payInfo">
	    	<h5 class="mt-0 mb-1">수량</h5>
		      <div class="py-0">
		      <span>1</span>
		      </div>
	    </div>
	    <div class="col-2" id="payInfo">
		      <div class="py-2">
		      	<button type="submit" class="btn btn-outline-warning" >구매후기</button>
		      </div>
		      <div class="py-2">
		      	<button type="submit" class="btn btn-outline-warning" >배송조회</button>
		      </div>
	    </div>
	    </li>
	   </ul>	    
</div>


<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>