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
div#myArtist img{
	width: 150px;
	height: 165px;
}
#carouselExampleIndicators{
	background-color:  #c8aad2;
}
#carouselExampleIndicators2{
	background-color:  #c8aad2;
}
div#heart img{
	width:20px;
	height:20px;
}
div#heart img:hover{
	width:20px;
	height:20px;
	cursor: pointer;
}
</style>
		<%-- <img src="${pageContext.request.contextPath }/resources/images/logo-spring.png" id="center-image" alt="스프링로고" class="d-block mx-auto mt-5"/>
 --%>

	<!-- 회원상태 -->
	<br /><br /><br /><br />
<div id="mypageContainer" class="border border-0 mx-auto p-3 rounded ">
	<div class="media mx-auto" id="mypage1">
	  <img class="align-self-start mr-3 " src="..." alt="사진여부 결정해주세용">
	  <div class="media-body">
	    <h5 class="mt-0">{$id}님, 안녕하세요! </h5><span class="badge badge-warning mx-1">Lv.1</span>
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


	<br /><br />
	
	
	  <!-- 내부 네브바  -->
		    <ul class="nav nav-tabs justify-content-center">
		  <li class="nav-item col-md-2 p-0">
		    <a class="nav-link " href="${pageContext.request.contextPath}/mypage/mypage_pay.do" id="payNav">결제내역</a>
		  </li>
		  <li class="nav-item col-md-2 p-0">
		    <a class="nav-link active" href="${pageContext.request.contextPath}/mypage/mypage_artist.do" id="payNav">찜 아티스트</a>
		  </li>
		  <li class="nav-item col-md-2 p-0">
		    <a class="nav-link" href="${pageContext.request.contextPath}/mypage/mypage_member.do" id="payNav">회원정보수정</a>  <%--사용자가 클릭시 비밀번호 입력 나오게 하기 --%>
		  </li>
		  <!-- <li class="nav-item">
		    <a class="nav-link disabled" href="#">Disabled</a>
		  </li> -->
		</ul>
	
	<br /><br /><br />
	
<!--내가 찜한 아티스트 -->
<div class="border border-0 mx-auto p-3 ">
	<div class="row">
	  <div class="col-4"></div>
	  <div class="col-4 mb-3 text-center"><h5 class="mx-auto"> My Artist </h5></div>
	  <div class="col-4"></div>
	</div>
	
<!-- 아티스트 사진 부분 -->
<div id="carouselExampleIndicators" class="carousel slide" data-ride="carousel">
  <div class="carousel-inner">
    <div class="carousel-item active">
      	<div class="d-flex flex-row justify-content-center" id="myArtist">
	<br />
	  <div class="p-2 my-3">
	  	<img src="${pageContext.request.contextPath}/resources/images/moonju/blackpink.jpg" alt="" />
	  	 <br /><br />
	  	 <div class=" mx-auto font-weight-bold text-center">BLACK PINK</div>
	  	 <div class=" mx-auto font-weight-bold text-center" id="heart">
     		<img src="${pageContext.request.contextPath}/resources/images/moonju/heart.png" />
	  	 </div>
	  </div>
	  <div class="p-2 my-3">
	  	<img src="${pageContext.request.contextPath}/resources/images/moonju/rv.jpg" alt="" />
	  	 <br /><br />
     	<div class=" mx-auto font-weight-bold text-center">Red Velvet</div>
     	<div class=" mx-auto font-weight-bold text-center" id="heart">
     		<img src="${pageContext.request.contextPath}/resources/images/moonju/heart.png" />
	  	 </div>
	  </div>
	  <div class="p-2 my-3">
	  	<img src="${pageContext.request.contextPath}/resources/images/moonju/twice.jpg" alt="" />
	  	 <br /><br />
     	<div class=" mx-auto font-weight-bold text-center">TWICE</div>
     	<div class=" mx-auto font-weight-bold text-center" id="heart">
     		<img src="${pageContext.request.contextPath}/resources/images/moonju/heart.png" />
	  	 </div>
	  </div>
	  <div class="p-2 my-3">
	  	<img src="${pageContext.request.contextPath}/resources/images/moonju/IU.jpg" alt="" />
	  	 <br /><br />
     	<div class=" mx-auto font-weight-bold text-center">IU</div>
     	<div class=" mx-auto font-weight-bold text-center" id="heart">
     		<img src="${pageContext.request.contextPath}/resources/images/moonju/heart.png" />
	  	 </div>
	  </div>
	  <div class="p-2 my-3">
	  	<img src="${pageContext.request.contextPath}/resources/images/moonju/gw.jpg" alt="" />
	  	 <br /><br />
     	<div class=" mx-auto font-weight-bold text-center">공원소녀</div>
     	<div class=" mx-auto font-weight-bold text-center" id="heart">
     		<img src="${pageContext.request.contextPath}/resources/images/moonju/heart.png" />
	  	 </div>
	  </div>
	</div>
    </div>
    <div class="carousel-item">
      	<div class="d-flex flex-row justify-content-center" id="myArtist">
	<br />
	  <div class="p-2 my-3">
	  	<img src="${pageContext.request.contextPath}/resources/images/moonju/seventeen.jpg" alt="" />
	  	 <br /><br />
	  	 <div class=" mx-auto font-weight-bold text-center">SEVENTEEN</div>
	  	 <div class=" mx-auto font-weight-bold text-center" id="heart">
     		<img src="${pageContext.request.contextPath}/resources/images/moonju/heart.png" />
	  	 </div>
	  </div>
	  <div class="p-2 my-3">
	  	<img src="${pageContext.request.contextPath}/resources/images/moonju/sf9.jpg" alt="" />
	  	 <br /><br />
     	<div class=" mx-auto font-weight-bold text-center">SF9</div>
     	<div class=" mx-auto font-weight-bold text-center" id="heart">
     		<img src="${pageContext.request.contextPath}/resources/images/moonju/heart.png" />
	  	 </div>
	  </div>
	  <div class="p-2 my-3">
	  	<img src="${pageContext.request.contextPath}/resources/images/moonju/theboys.jpg" alt="" />
	  	 <br /><br />
     	<div class=" mx-auto font-weight-bold text-center">더보이즈</div>
     	<div class=" mx-auto font-weight-bold text-center" id="heart">
     		<img src="${pageContext.request.contextPath}/resources/images/moonju/heart.png" />
	  	 </div>
	  </div>
	  <div class="p-2 my-3">
	  	<img src="${pageContext.request.contextPath}/resources/images/moonju/monstaX.jpg" alt="" />
	  	 <br /><br />
     	<div class=" mx-auto font-weight-bold text-center">MONSTA-X</div>
     	<div class=" mx-auto font-weight-bold text-center" id="heart">
     		<img src="${pageContext.request.contextPath}/resources/images/moonju/heart.png" />
	  	 </div>
	  </div>
	  <div class="p-2 my-3">
	  	<img src="${pageContext.request.contextPath}/resources/images/moonju/bts.png" alt="" />
	  	 <br /><br />
     	<div class=" mx-auto font-weight-bold text-center">BTS</div>
     	<div class=" mx-auto font-weight-bold text-center" id="heart">
     		<img src="${pageContext.request.contextPath}/resources/images/moonju/heart.png" />
	  	 </div>
	  </div>
	</div>
    </div>
    <div class="carousel-item">
      	<div class="d-flex flex-row justify-content-center" id="myArtist">
	<br />
	  <div class="p-2 my-3">
	  	<img src="${pageContext.request.contextPath}/resources/images/moonju/shinee.jpg" alt="" />
	  	 <br /><br />
	  	 <div class=" mx-auto font-weight-bold text-center">SHINEE</div>
	  	 <div class=" mx-auto font-weight-bold text-center" id="heart">
     		<img src="${pageContext.request.contextPath}/resources/images/moonju/heart.png" />
	  	 </div>
	  </div>
	  <div class="p-2 my-3">
	  	<img src="${pageContext.request.contextPath}/resources/images/moonju/everglow.jpg" alt="" />
	  	 <br /><br />
     	<div class=" mx-auto font-weight-bold text-center">EVERGLOW</div>
     	<div class=" mx-auto font-weight-bold text-center" id="heart">
     		<img src="${pageContext.request.contextPath}/resources/images/moonju/heart.png" />
	  	 </div>
	  </div>
	  <div class="p-2 my-3">
	  	<img src="${pageContext.request.contextPath}/resources/images/moonju/bg.jpg" alt="" />
	  	 <br /><br />
     	<div class=" mx-auto font-weight-bold text-center">BRAVE GIRLS</div>
     	<div class=" mx-auto font-weight-bold text-center" id="heart">
     		<img src="${pageContext.request.contextPath}/resources/images/moonju/heart.png" />
	  	 </div>
	  </div>
	  <div class="p-2 my-3">
	  	<img src="${pageContext.request.contextPath}/resources/images/moonju/gf.jpg" alt="" />
	  	 <br /><br />
     	<div class=" mx-auto font-weight-bold text-center">여자친구</div>
     	<div class=" mx-auto font-weight-bold text-center" id="heart">
     		<img src="${pageContext.request.contextPath}/resources/images/moonju/heart.png" />
	  	 </div>
	  </div>
	  <div class="p-2 my-3">
	  	<img src="${pageContext.request.contextPath}/resources/images/moonju/omyg.jpg" alt="" />
	  	 <br /><br />
     	<div class=" mx-auto font-weight-bold text-center">오마이걸</div>
     	<div class=" mx-auto font-weight-bold text-center" id="heart">
     		<img src="${pageContext.request.contextPath}/resources/images/moonju/heart.png" />
	  	 </div>
	  </div>
	</div>
    </div>
  </div>
  <a class="carousel-control-prev" href="#carouselExampleIndicators" role="button" data-slide="prev" id="btnNext">
    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
    <span class="sr-only">Previous</span>
  </a>
  <a class="carousel-control-next" href="#carouselExampleIndicators" role="button" data-slide="next" id="btnNext">
    <span class="carousel-control-next-icon" aria-hidden="true"></span>
    <span class="sr-only">Next</span>
  </a>
</div>
	
	
</div>
 <br />
 <hr />
<!-- 다른 아티스트 -->
 
<div class="border border-0 mx-auto p-3 ">
	<div class="row">
	  <div class="col-4"></div>
	  <div class="col-4 mb-3 text-center"><h5 class="mx-auto"> Other Artist </h5></div>
	  <div class="col-4"></div>
	</div>
	<!-- 검색창 부분 -->
	<div class="row">
	  <div class="col-4"></div>
	  <div class="col-4 mb-3 text-center " >
	  	<form class="form-inline d-flex justify-content-center">
		    <input class="form-control " type="search" placeholder="Search" aria-label="Search">
		    <button class="btn btn-outline-success mx-2" type="submit">Search</button>
		 </form>
	   </div>
	  <div class="col-4"></div>
	</div>
	
<!-- 아티스트 사진 부분 -->
<div id="carouselExampleIndicators2" class="carousel slide" data-ride="carousel">
  <div class="carousel-inner">
    <div class="carousel-item active">
      	<div class="d-flex flex-row justify-content-center" id="myArtist">
	<br />
	  <div class="p-2 my-3">
	  	<img src="${pageContext.request.contextPath}/resources/images/moonju/blackpink.jpg" alt="" />
	  	 <br /><br />
	  	 <div class=" mx-auto font-weight-bold text-center">BLACK PINK</div>
	  	 <div class=" mx-auto font-weight-bold text-center" id="heart">
     		<img src="${pageContext.request.contextPath}/resources/images/moonju/like.png" />
	  	 </div>
	  </div>
	  <div class="p-2 my-3">
	  	<img src="${pageContext.request.contextPath}/resources/images/moonju/rv.jpg" alt="" />
	  	 <br /><br />
     	<div class=" mx-auto font-weight-bold text-center">Red Velvet</div>
     	<div class=" mx-auto font-weight-bold text-center" id="heart">
     		<img src="${pageContext.request.contextPath}/resources/images/moonju/like.png" />
	  	 </div>
	  </div>
	  <div class="p-2 my-3">
	  	<img src="${pageContext.request.contextPath}/resources/images/moonju/twice.jpg" alt="" />
	  	 <br /><br />
     	<div class=" mx-auto font-weight-bold text-center">TWICE</div>
     	<div class=" mx-auto font-weight-bold text-center" id="heart">
     		<img src="${pageContext.request.contextPath}/resources/images/moonju/like.png" />
	  	 </div>
	  </div>
	  <div class="p-2 my-3">
	  	<img src="${pageContext.request.contextPath}/resources/images/moonju/IU.jpg" alt="" />
	  	 <br /><br />
     	<div class=" mx-auto font-weight-bold text-center">IU</div>
     	<div class=" mx-auto font-weight-bold text-center" id="heart">
     		<img src="${pageContext.request.contextPath}/resources/images/moonju/like.png" />
	  	 </div>
	  </div>
	  <div class="p-2 my-3">
	  	<img src="${pageContext.request.contextPath}/resources/images/moonju/gw.jpg" alt="" />
	  	 <br /><br />
     	<div class=" mx-auto font-weight-bold text-center">공원소녀</div>
     	<div class=" mx-auto font-weight-bold text-center" id="heart">
     		<img src="${pageContext.request.contextPath}/resources/images/moonju/like.png" />
	  	 </div>
	  </div>
	</div>
    </div>
    <div class="carousel-item">
      	<div class="d-flex flex-row justify-content-center" id="myArtist">
	<br />
	  <div class="p-2 my-3">
	  	<img src="${pageContext.request.contextPath}/resources/images/moonju/seventeen.jpg" alt="" />
	  	 <br /><br />
	  	 <div class=" mx-auto font-weight-bold text-center">SEVENTEEN</div>
	  	 <div class=" mx-auto font-weight-bold text-center" id="heart">
     		<img src="${pageContext.request.contextPath}/resources/images/moonju/like.png" />
	  	 </div>
	  </div>
	  <div class="p-2 my-3">
	  	<img src="${pageContext.request.contextPath}/resources/images/moonju/sf9.jpg" alt="" />
	  	 <br /><br />
     	<div class=" mx-auto font-weight-bold text-center">SF9</div>
     	<div class=" mx-auto font-weight-bold text-center" id="heart">
     		<img src="${pageContext.request.contextPath}/resources/images/moonju/like.png" />
	  	 </div>
	  </div>
	  <div class="p-2 my-3">
	  	<img src="${pageContext.request.contextPath}/resources/images/moonju/theboys.jpg" alt="" />
	  	 <br /><br />
     	<div class=" mx-auto font-weight-bold text-center">더보이즈</div>
     	<div class=" mx-auto font-weight-bold text-center" id="heart">
     		<img src="${pageContext.request.contextPath}/resources/images/moonju/like.png" />
	  	 </div>
	  </div>
	  <div class="p-2 my-3">
	  	<img src="${pageContext.request.contextPath}/resources/images/moonju/monstaX.jpg" alt="" />
	  	 <br /><br />
     	<div class=" mx-auto font-weight-bold text-center">MONSTA-X</div>
     	<div class=" mx-auto font-weight-bold text-center" id="heart">
     		<img src="${pageContext.request.contextPath}/resources/images/moonju/like.png" />
	  	 </div>
	  </div>
	  <div class="p-2 my-3">
	  	<img src="${pageContext.request.contextPath}/resources/images/moonju/bts.png" alt="" />
	  	 <br /><br />
     	<div class=" mx-auto font-weight-bold text-center">BTS</div>
     	<div class=" mx-auto font-weight-bold text-center" id="heart">
     		<img src="${pageContext.request.contextPath}/resources/images/moonju/like.png" />
	  	 </div>
	  </div>
	</div>
    </div>
    <div class="carousel-item">
      	<div class="d-flex flex-row justify-content-center" id="myArtist">
	<br />
	  <div class="p-2 my-3">
	  	<img src="${pageContext.request.contextPath}/resources/images/moonju/shinee.jpg" alt="" />
	  	 <br /><br />
	  	 <div class=" mx-auto font-weight-bold text-center">SHINEE</div>
	  	 <div class=" mx-auto font-weight-bold text-center" id="heart">
     		<img src="${pageContext.request.contextPath}/resources/images/moonju/like.png" />
	  	 </div>
	  </div>
	  <div class="p-2 my-3">
	  	<img src="${pageContext.request.contextPath}/resources/images/moonju/everglow.jpg" alt="" />
	  	 <br /><br />
     	<div class=" mx-auto font-weight-bold text-center">EVER GLOW</div>
     	<div class=" mx-auto font-weight-bold text-center" id="heart">
     		<img src="${pageContext.request.contextPath}/resources/images/moonju/like.png" />
	  	 </div>
	  </div>
	  <div class="p-2 my-3">
	  	<img src="${pageContext.request.contextPath}/resources/images/moonju/bg.jpg" alt="" />
	  	 <br /><br />
     	<div class=" mx-auto font-weight-bold text-center">BRAVE GIRLS</div>
     	<div class=" mx-auto font-weight-bold text-center" id="heart">
     		<img src="${pageContext.request.contextPath}/resources/images/moonju/like.png" />
	  	 </div>
	  </div>
	  <div class="p-2 my-3">
	  	<img src="${pageContext.request.contextPath}/resources/images/moonju/gf.jpg" alt="" />
	  	 <br /><br />
     	<div class=" mx-auto font-weight-bold text-center">여자친구</div>
     	<div class=" mx-auto font-weight-bold text-center" id="heart">
     		<img src="${pageContext.request.contextPath}/resources/images/moonju/like.png" />
	  	 </div>
	  </div>
	  <div class="p-2 my-3">
	  	<img src="${pageContext.request.contextPath}/resources/images/moonju/omyg.jpg" alt="" />
	  	 <br /><br />
     	<div class=" mx-auto font-weight-bold text-center">오마이걸</div>
     	<div class=" mx-auto font-weight-bold text-center" id="heart">
     		<img src="${pageContext.request.contextPath}/resources/images/moonju/like.png" />
	  	 </div>
	  </div>
	</div>
    </div>
  </div>
  <a class="carousel-control-prev" href="#carouselExampleIndicators2" role="button" data-slide="prev" id="btnNext">
    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
    <span class="sr-only">Previous</span>
  </a>
  <a class="carousel-control-next" href="#carouselExampleIndicators2" role="button" data-slide="next" id="btnNext">
    <span class="carousel-control-next-icon" aria-hidden="true"></span>
    <span class="sr-only">Next</span>
  </a>
</div>
	
</div>

 
<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>
