<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>	
<jsp:include page="/WEB-INF/views/common/header.jsp">

<jsp:param value="mypage" name="title"/>
</jsp:include>
<!-- 여기 링크들 다 추가 해주셔요!-->
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.14.0/css/all.css" integrity="sha384-HzLeBuhoNPvSl5KYnjx0BT+WB0QEEqLprO+NBkkk5gbc67FTaL7XIGa2w1L0Xbgc" crossorigin="anonymous">
<link rel="stylesheet" href="https://unpkg.com/swiper/swiper-bundle.css" />
<link rel="stylesheet" href="https://unpkg.com/swiper/swiper-bundle.min.css" />

<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/Swiper/4.5.1/css/swiper.min.css">
<script src="https://cdnjs.cloudflare.com/ajax/libs/Swiper/4.5.1/js/swiper.min.js"></script>

<script src="https://unpkg.com/swiper/swiper-bundle.js"></script>
<script src="https://unpkg.com/swiper/swiper-bundle.min.js"></script> <!-- 여기 링크들 다 추가 해주셔요!-->
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
div#mypage-container{
	background-color: #c7a2e0;
	width:800px;
	height: 280px;
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

#carouselExampleIndicators{
	background-color:  #c8aad2;
}
#carouselExampleIndicators2{
	background-color:  #c8aad2;
}

.heartBtn:hover{
	cursor: pointer;
}
.swiper-container {

  height: 300px; /* 여기서 컨테이너 크기 조절 및 색상 지정가능합니당*/
  background-color:  #c8aad2;
}

.swiper-slide {
	margin-top: 40px;
	text-align:center;
	align-items:center; /* 위아래 기준 중앙정렬 */
	justify-content:center; /* 좌우 기준 중앙정렬 */
}
</style>

	<!-- 회원상태 -->
	<br /><br /><br /><br />
<div id="mypage-container" class="border border-0 mx-auto p-3 rounded ">
	<div class="row ">
		    <h5 class="col">${loginMember.fanId}님, 안녕하세요! </h5>
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

	<br /><br />


	  <!-- 내부 네브바  -->
		    <ul class="nav nav-tabs justify-content-center">
		  <li class="nav-item col-md-2 p-0">
		    <a class="nav-link " href="${pageContext.request.contextPath}/mypage/mypagePay.do" id="payNav">결제내역</a>
		  </li>
		  <li class="nav-item col-md-2 p-0">
		    <a class="nav-link active" href="${pageContext.request.contextPath}/mypage/mypageArtist.do" id="payNav">찜 아티스트</a>
		  </li>
		  <li class="nav-item col-md-2 p-0">
		    <a class="nav-link" href="${pageContext.request.contextPath}/mypage/mypageMember.do" id="payNav">회원정보수정</a>  <%--사용자가 클릭시 비밀번호 입력 나오게 하기 --%>
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
<div class="swiper-container Like">
  <!-- Additional required wrapper -->
  <div class="swiper-wrapper"  id="myArtist">
    <!-- Slides -->
 
    <c:if test="${dipList eq null}">
    <div class="swiper-slide ">
    <div class=" mx-auto font-weight-bold text-center">찜한 아이돌이 없습니다!</div>
    </div>
    </c:if>
    <c:if test="${dipList ne null}">
    <c:forEach items="${dipList}" var ="dipList" >
    <div class="swiper-slide ">
	  	<img src="${pageContext.request.contextPath}/resources/upload/idol/${dipList.idolImg.renamedFilename}"
	  	style="width: 150px; height: 165px;"/>
	  	 <br /><br />
	  	 <div class=" mx-auto font-weight-bold text-center">${dipList.idolName}</div>
	  	 <div class=" mx-auto font-weight-bold text-center" id="hearts">
     		<i class="fas fa-heart heartBtn" style="font-size: 20px; color: red;" onclick="delidol(this);" data-no="${dipList.idolNo}" name="delidols"></i>
	  	 </div>
	    </div>	  
	   </c:forEach> 
	  </c:if>  
  </div>
  <!-- If we need navigation buttons -->
  <div class="swiper-button-prev"></div>
  <div class="swiper-button-next"></div>
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

<!-- 아티스트 사진 부분 -->
<!-- 여기 서 부터 반복인데 class 안에 swiper-container 는 지우지 말고 변경하지 마시고 두개 이상 사용하실거면 클래스이 이름을 따로 추가해주세용-->
<div class="swiper-container other">
  <!-- Additional required wrapper -->
  <div class="swiper-wrapper other"  id="myArtist">
    <!-- Slides -->
    <c:forEach items="${idolList}" var ="idolList" >
    <div class="swiper-slide other">
	  	<img src="${pageContext.request.contextPath}/resources/upload/idol/${idolList.idolImg.renamedFilename}"
	  	style="width: 150px; height: 165px;"/>
	  	 <br /><br />
	  	 <div class=" mx-auto font-weight-bold text-center">${idolList.idolName}</div>
	  	 <div class=" mx-auto font-weight-bold text-center" id="hearts">
     		<i class="far fa-heart heartBtn" style="font-size: 20px; color: red;" onclick="inidol(this);" data-string="${loginMember.fanNo}" data-no="${idolList.idolNo}"></i>
	  	 </div>
	    </div>	  
	   </c:forEach> 
  </div>
  <!-- If we need navigation buttons -->
  <div class="swiper-button-prev other"></div>
  <div class="swiper-button-next other"></div>
</div>


</div>
<script>
$(".heartBtn").click (e => {
	const $me = $(e.target);
	//직전요소 가져옴  const $like = $(e.target).parent().prev(); -> 아티스트 이름 값을 가져옴 like.text()
	
	$me.toggleClass("far");
	$me.toggleClass("fas");


});

 function inidol(obj){
	const fanNo = $(obj).data("string");
	console.log(fanNo);
	
	const idolNo = $(obj).data("no");
	console.log(idolNo);
//중복처리 못함 해야함
	const dipIdol = $("[name=delidols]").data("no");
	console.log(dipIdol);
	const dip = {
			fanNo,
			idolNo		
			};
	console.log(dip);

	$.ajax({
			url: "${pageContext.request.contextPath}/mypage/dip",
			data: JSON.stringify(dip),
			contentType: "application/json; charset=utf-8",
			method: "POST",
	success(data) {
			console.log(data);
			const {msg} = data;
			alert(msg);
		},
		error: console.log
		});
} 

 function delidol(obj){
		const idolNo = $(obj).data("no");
		console.log(idolNo);

		$.ajax({
				url: `${pageContext.request.contextPath}/mypage/delIdol/\${idolNo}`,
				method: "DELETE",
				success(data){
					console.log(data);
					const {msg} = data;
					alert(msg);
				},
				error: console.log
			});
				
	} 
//여기가 js부분인데 따로 선언한 클래스 이름 가지고 오시면 됩니당
 var mySwiper = new Swiper(
		 '.other',{ 
			loopFillGroupWithBlank : true, //한 슬라이드 안에 3개의 슬라이라고 지정했을시 모자르면 그냥 임으로 채울건지
			 loop: true, //루프 할건지 말건지
			 autoplay: 
			 { 
			 delay: 5000, //초수
			 },
		pagination: { 
				el: '.swiper-pagination', //페이지 처리 할건지 근데 저는 사용하지 않았습니당 해당 부분지워벌임...
			type: 'fraction' 
			}, 
			breakpoints: {  
			640: { 
				slidesPerView: 5, //한 슬라이드 안에 보여지는 컨탠츠 갯수 설정
				spaceBetween: 40  //컨탠츠 간의 간격 설정
				} 
			} ,
			navigation : { // 네비게이션
				nextEl : '.swiper-button-next', // 다음 버튼 클래스명
				prevEl : '.swiper-button-prev', // 이번 버튼 클래스명
			},
		});

 var mySwiper = new Swiper(
		 '.Like',{ 
			loopFillGroupWithBlank : true,
			 loop: true,
			 autoplay: 
			 { 
			 delay: 5000, 
			 },
		pagination: { 
				el: '.swiper-pagination', 
			type: 'fraction' 
			}, 
			breakpoints: {  
			640: { 
				slidesPerView: 5, 
				spaceBetween: 40 
				} 
			} ,
			navigation : { // 네비게이션
				nextEl : '.swiper-button-next', // 다음 버튼 클래스명
				prevEl : '.swiper-button-prev', // 이번 버튼 클래스명
			},
		});
	

</script>

<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>