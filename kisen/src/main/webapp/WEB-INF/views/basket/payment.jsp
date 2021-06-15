<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<jsp:include page="/WEB-INF/views/common/header.jsp">

	<jsp:param value="결제페이지" name="title"/>
</jsp:include>
<style>
div#cartContainer{
	border: 2px solid #bc73d6!important;
	width:900px;
	height:180px;
}
div#orderHistory{
 width:1200px;
}
.border-secondary {
    border-color:  #9033b5!important;
}
#thead{
 background-color:#c8a9c8;
 font-size: 10px;
}
img#productImg{
	width: 100px;
	height: 80px;
}
img#plus{
	width:20px;
	height: 20px;
}
#marks{
	background-color: #c8a9c8;
}
#cartTitle{
 font-size: 30px;
}
#arrow img{
 	width: 20px;
 	height: 20px;
}
#cartinfo{
  font-size: 15px;
}
#cartImg img{
	width: 30px;
 	height: 30px;
}
td{
 	height: 120px;
}
.table td, .table th {
    vertical-align: middle;
	text-align: center;
}
#btnOrder{
   color:  #9033b5;
    background-color: transparent;
    background-image: none;
    border-color:  #9033b5;
    width: 60px;
    height: 30px;
    font-size: 10px;
    text-align: center;
}
#btnOrder:hover{
    color:  white;
    background-color: #c7a2e0;
    background-image: none;
    border-color:  #c7a2e0;
}
#delivery{
 	color: #9033b5;
    background-color: transparent;
    background-image: none;
    border-color:  #9033b5;
    width: 50px;
    height: 20px;
    font-size: 10px;
    text-align: center;
}
#delivery:hover {
	cursor: default;
}
#postNum{
	color: #9033b5;
    background-color: transparent;
    background-image: none;
    border-color:  #9033b5;
    width: 80px;
    height: 25px;
    font-size: 10px;
    text-align: center;
}
#selectProduct{
	color:  #9033b5;
    background-color: transparent;
    background-image: none;
    border-color:  #9033b5;
    text-align: center;
}
#cartOder{
	 color:  white;
    background-color: #c7a2e0;
    background-image: none;
    border-color:  #c7a2e0;
}
#deliveryInfo{
	width:1000px;

	border: 4px solid #bc73d6!important;
	
}
#line{
	width: 3px;
	height: 1500px;
	align-content: center;
}
#couponBox{
	width: 80px;
	height: 20px;
	text-align: right;
}
#coupon{
 font-size: 12px;
}
#pointBox{
 font-size: 12px;
}
#payNow{
	background-color: #bc73d6;
	color: white;
	border: 1px solid #bc73d6!important;
	width: 150px;
	height: 60px;
	font-size: 20px;
}
.hiddenPm{
	height: 0px;
	overflow: hidden;
}
.hiddenCardPay{
	height: 0px;
	overflow: hidden;
}
.hiddenCashPay{
	height: 0px;
	overflow: hidden;
}
.hiddenKakaoPay{
	height: 0px;
	overflow: hidden;
}

.kakaoBtn{
	border: none;
	background-color: white;
	cursor: pointer;
}

</style>


<br /><br />
<!-- 타이틀 -->
<div class="row">
	<div class="col-md-2" ></div>
	<div class="col-md-6 " id="cartTitle">
	<h2 class="font-weight-bold" id="cartImg">주문/결제</h2>

	</div>
	<div class="col-md-4 float-left">
	 <ul id="cartinfo">
	 	<li class="float-left mx-2 "style="color:gray;">장바구니</li>
	 	<li class="float-left mx-2" id="arrow"><img src="${pageContext.request.contextPath}/resources/images/moonju/next.png" /></li>
	 	<li class="float-left mx-2" ><span class="font-weight-bold" style="font-size: 18px;">주문/결제</span></li>
	 	<li class="float-left mx-2" id="arrow"><img src="${pageContext.request.contextPath}/resources/images/moonju/next.png" /></li>
	 	<li class="float-left mx-2" style="color:gray;">완료</li>
	 </ul>
	</div>
</div>
<br /><br />

 <hr />

<!-- 주문할 내역-->
<form method="POST" id="payInfoFrm">
<div class="border border-0 mx-auto p-3 rounded " id="orderHistory">
 	<table class="table">
  <thead id="cartOder">
    <tr>
      <th scope="col" colspan="2">상품목록</th>
      <th scope="col">판매자</th>
      <th scope="col">배송비</th>
      <th scope="col">수량</th>
      <th scope="col">할인</th>
      <th scope="col">총 상품금액</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td colspan="2">
      	<div class="media">
		  <img class="" src="${pageContext.request.contextPath}/resources/images/moonju/blackpink.jpg" style="width: 100px; height:100px;">
		  <div class="media-body my-3 ">
		    <a href=""><h6 class="mt-0">BLACK PINK 5TH ALBUM</h6></a> <!--이름 누를시 상품 상세페이지 -->
		    <div class="d-flex flex-column">
			  <div class="p-1" style="font-size: 12px;">옵션: 멤버별 포카 4종 증정</div>
			</div>
		  </div>
		</div>
      </td>
      <td>
      	<div class="p-1">YG Ent</div>
      </td>
      <td>
      	<div class="d-flex flex-column ">
		  <div class="p-1" style="font-size:10px;">무료</div>
		  <div class="p-1" style="font-size: 10px;">
		  	<button class="btn btn-outline p-0 " id="delivery">오늘출발</button>
		  </div>
		   <div class="p-1" style="font-size:9px;">15:00까지 결제 시</div>
		   <div class="p-1 font-weight-bold" style="font-size:9px;color:#bc73d6">오늘 바로 발송</div>
		 </div>
      </td>
      <td><div class="p-1">1</div></td>
      <td style="color:gray;">- 0원</td>
      <td><div class="p-1">28,000원</div></td>
    </tr>
    <tr>
     <td colspan="2">
      	<div class="media">
		  <img class="" src="${pageContext.request.contextPath}/resources/images/moonju/gw.jpg" style="width: 100px; height:100px;">
		  <div class="media-body my-3">
		    <a href=""><h6 class="mt-0">공원소녀 5TH MINI ALBUM</h6></a> <!--이름 누를시 상품 상세페이지 -->
		    <div class="d-flex flex-column">
			  <div class="p-1" style="font-size: 12px;">옵션: 멤버별 포카 4종 증정 및 파우치 증정</div>
			</div>
		  </div>
		</div>
      </td>
      <td>
      	<div class="p-1">더웨이브뮤직</div>
      </td>
      <td>
      	<div class="d-flex flex-column ">
		  <div class="p-1" style="font-size:10px;">무료</div>
		  <div class="p-1" style="font-size: 10px;">
		  	<button class="btn btn-outline p-0 " id="delivery">오늘출발</button>
		  </div>
		   <div class="p-1" style="font-size:9px;">15:00까지 결제 시</div>
		   <div class="p-1 font-weight-bold" style="font-size:9px;color:#bc73d6">오늘 바로 발송</div>
		 </div>
      </td>
      <td><div class="p-1">1</div></td>
      <td style="color:gray;">- 0원</td>
      <td><div class="p-1">28,000원</div></td>
    </tr>
    <tr>
     <td colspan="2">
      	<div class="media">
		  <img class=""src="${pageContext.request.contextPath}/resources/images/moonju/everglow.jpg" style="width: 100px; height:100px;">
		  <div class="media-body my-3">
		    <a href=""><h6 class="mt-0">EVER GLOW 3TH ALBUM</h6></a> <!--이름 누를시 상품 상세페이지 -->
		    <div class="d-flex flex-column">
			  <div class="p-1" style="font-size: 12px;">옵션: 멤버별 포카 4종 증정 및 응원봉 증정</div>
			</div>
		  </div>
		</div>
      </td>
      <td>
      	<div class="p-1">위에화 Ent</div>
      </td>
      <td>
      	<div class="d-flex flex-column ">
		  <div class="p-1" style="font-size:10px;">무료</div>
		  <div class="p-1" style="font-size: 10px;">
		  	<button class="btn btn-outline p-0 " id="delivery">오늘출발</button>
		  </div>
		   <div class="p-1" style="font-size:9px;">15:00까지 결제 시</div>
		   <div class="p-1 font-weight-bold" style="font-size:9px;color:#bc73d6">오늘 바로 발송</div>
		 </div>
      </td>
      <td><div class="p-1">1</div></td>
      <td style="color:gray;">- 0원</td>
      <td><div class="p-1">28,000원</div></td>
    </tr>
  </tbody>
</table>
</div>
</form>
<hr />
<br />

<!-- 배송지 입력 -->
 <div class="border mx-auto p-3 rounded row" id="deliveryInfo">
 	<div class="col-7 d-flex flex-column ">
 	 <div class="p-2">
 		 <h4 class="font-weight-bold"> 배송지 정보</h4> 
 	 </div>
 	 <hr />
 	 <div class="p-2 d-flex flex-row">
 	 	<h5 class="font-weight-bold"><mark id="marks">배송지 선택</mark> </h5>	
 	 	<div class="mx-3"> 
	 	 	<input type="radio" id ="address" onclick="chageAddress(this);" name="chageAd" checked>
	 	 	<label for="address">기본배송지</label>
	 	 	<input  type="radio" id ="newAddress" onclick="chageAddress(this);" name="chageAd">
	 	 	<label for="newAddress">신규배송지</label>
 	 	</div>
 	 </div>
 	 <hr />
 	 <!-- 기본 배송지 -->
 	 <div class="p-2 d-flex flex-column " id="nowAddress">
 	 	<div class="p-2">고길동</div>
 	 	<div class="p-2">010-3333-2222</div>
 	 	<div class="p-2">
 	 	(우편번호) 서울시 성북구 쌍문동 1길 33-20
 	 	</div>
 	 	<div class="p-2">
 	 	<!-- 요청사항 만들긴 했는데 디비에 저정하나요? -->
 	 		<input type="text" placeholder=" 요청사항을 입력해 주세요." size="40px;"/>
 	 	</div>
 	 </div>
 	 <!-- 신규 배송지 -->
 	 <div class="p-2 d-flex flex-column hiddenPm" id="newsAddress" >
 	 	<div class="p-2">
 	 	<mark id="marks">수령인</mark>
 	 	<input type="text" name="" id="memberName" class="ml-3"/>
 	 	</div>
 	 	<div class="p-2">
 	 	<mark id="marks">연락처1</mark>
 	 	<input type="tel" class="ml-3" placeholder="(-없이)01012345678" name="phone" id="phone" maxlength="11" />
 	 	</div>
 	 	<div class="p-2">
 	 	<mark id="marks">연락처2</mark>
 	 	<input type="tel" class="ml-3" placeholder="(-없이)01012345678" name="phone" id="phone" maxlength="11" />
 	 	</div>
 	 	<div class="p-2">
 	 	<mark id="marks">배송지 주소</mark>
 	 	<input type="text" class="ml-3" style="width: 80px"/>
 	 	<button class="btn btn-outline mb-1" id="postNum">우편번호</button>
 	 	</div>
 	 	<div class="p-2">
 	 	<input type="text" placeholder=" " size="25px;"/>
 	 	<input type="text" placeholder=" 상세주소" size="25px;"/>
 	 	</div>
 	 	<div class="p-2">
 	 	<!-- 요청사항 만들긴 했는데 디비에 저정하나요? -->
 	 	<mark id="marks">배송 메모</mark>
 	 	<span>블랙핑크 앨범 외 2</span>
 	 	<br />
 	 	<input type="text" placeholder=" 요청사항을 입력해 주세요." size="30px;" class="my-3"/>
 	 	</div>
 	 </div>
 	 <hr />

 	 <!-- 쿠폰 할인 -->
 	  <div class="p-2 " id="coupon">
 	 	<h5 class="font-weight-bold my-3"><mark id="marks">할인 및 쿠폰</mark> </h5>	
 	 	<div class="mx-1 row" > 
 	 		<div class="col-3 my-2" >
				<span>상품/주문쿠폰</span>
		   </div>
			<div class=" col-3 my-1 border border-right-0 border-top-0 border-left-0" id="couponBox">
				12,000원 
			</div>
			<div class=" col-2">
				<button class="btn btn-outline " id="postNum">쿠폰적용</button>
			</div>
			<div class=" col ml-1 my-1">
				<span>사용가능: 1장 | 보유: 0장</span>
			</div>
 	 	</div>
 	 </div>
 	 <hr />
 	 <!-- 포인트 결제 -->
 	  <div class="p-2 " id="pointBox">
 	 	<h5 class="font-weight-bold my-3"><mark id="marks">포인트 결제</mark> </h5>	
 	 	<div class="mx-1 row" > 
 	 		<div class="col-3 my-2" >
				<span>보유</span>
		   </div>
			<div class=" col-3 my-1 border border-right-0 border-top-0 border-left-0" id="couponBox">
				529원
			</div>
			<div class=" col-2">

			</div>
			<div class=" col ml-1 my-1">

			</div>
 	 	</div>
 	 	<div class="mx-1 row" > 
 	 		<div class="col-3 my-2" >
				<span>사용</span>
		   </div>
			<div class=" col-3 my-1 border border-right-0 border-top-0 border-left-0" id="couponBox">
				529원
			</div>
			<div class=" col-2">
				<button class="btn btn-outline " id="postNum">전부사용</button>
			</div>
			<div class=" col ml-1 my-1">

			</div>
 	 	</div>
 	 </div>
 	 <hr />

 	 <!-- 결제 수단 -->
 	  <div class="p-2 " id="pointBox">
 	 	<h5 class="font-weight-bold my-3"><mark id="marks">결제 수단</mark> </h5>	
	 	 	
		 	 	<input type="radio" id ="cardPay" name="selectPay" onclick="selectPay(this);">
		 	 	<label for="cardPay">카드 결제</label>
		 	 	<hr />
		 	 	
		 	 	<div class= "hiddenCardPay"  id="hiddenCard">
			 	 	<div class="p-2">
				 	 	<mark id="marks" style="font-size:12px; ">카드구분</mark>
				 	 	<input type="radio" class="ml-3 " name="chageCard" onclick="cardType(this);" id="card" checked/>
				 	 	<label for="card" >개인카드</label>
				 	 	<input type="radio" id="cardtype" class="ml-3 " name="chageCard" onclick="cardType(this);"/>
				 	 	<label for="cardtype">법인카드</label>
			 		 </div>
					 <div class="p-2 ">
					 	 	<label for="cardselect"><mark id="marks" style="font-size:12px; ">카드선택</mark></label>
					 	 	<select name="cardselect" id="cardselect" class="ml-3">
					 	 	<option value="선택해주세요." selected disabled hidden>
		            			선택해주세요.</option>
					 	 		<option value="">국민</option>	
					 	 		<option value="">신한</option>	
					 	 		<option value="">기업</option>	
					 	 		<option value="">비씨</option>	
					 	 		<option value="">삼성</option>	
					 	 		<option value="">롯데</option>	
					 	 		<option value="">하나</option>	
					 	 		<option value="">외환</option>	
					 	 		<option value="">우리</option>	
					 	 		<option value="">수협</option>	
					 	 		<option value="">씨티</option>	
					 	 	</select>
	 	 			</div>	
				 	<div class="p-2" id="selectNum" >
				 	 	<label for="selectNum"><mark id="marks" style="font-size:12px;" >할부기간</mark></label>
				 	 	<select name="selectMonth" id="selectMonth" class="ml-3 selectMonth">
				 	 		<option value="">일시불</option>	
				 	 		<option value="">1개월</option>	
				 	 		<option value="">2개월</option>	
				 	 		<option value="">3개월</option>	
				 	 		<option value="">4개월</option>	
				 	 		<option value="">5개월</option>	
				 	 		<option value="">6개월</option>	
				 	 		<option value="">7개월</option>	
				 	 		<option value="">8개월</option>	
				 	 		<option value="">9개월</option>	
				 	 		<option value="">10개월</option>	
				 	 		<option value="">11개월</option>	
				 	 		<option value="">12개월</option>			
				 	 	</select>
	 	 			</div>
	 	 			<hr/>	
 	 		</div>	
	 	
		 	 	<input type="radio" id ="kakaopay" name="selectPay" onclick="selectPay(this);">
		 	 	<label for="kakaopay">카카오페이 결제</label>
		 	 	<hr/>
		 	 	<div class="hiddenKakaoPay" id="hiddenKakao">
	 	 			<button class="kakaoBtn" id="kakaoBtn">
   						 <img src="${pageContext.request.contextPath}/resources/images/moonju/payment_medium.png" onclick="kakaoPayment(this);" id="kakaoBtn">   							 	 			
	 	 			</button>
					
	 	 			<hr/>
		 	 	</div>
		 	 
		 	 	<input type="radio" id ="cashPay" name="selectPay" onclick="selectPay(this);">
		 	 	<label for="cashPay">가상 계좌(계좌이체)</label>
		 	 	<hr />
		 	 	
		 	 	<div class="hiddenCashPay" id="hiddenCash"> 
			 	 	<div class="p-2 " >
					 	 	<label for="cardselect"><mark id="marks" style="font-size:12px; ">입금은행</mark></label>
					 	 	<select name="cardselect" id="cardselect" class="ml-3">
					 	 	<option value="선택해주세요." selected disabled hidden>
		            			선택해주세요.</option>
					 	 		<option value="">국민</option>	
					 	 		<option value="">신한</option>	
					 	 		<option value="">기업</option>	
					 	 		<option value="">비씨</option>	
					 	 		<option value="">삼성</option>	
					 	 		<option value="">롯데</option>	
					 	 		<option value="">하나</option>	
					 	 		<option value="">외환</option>	
					 	 		<option value="">우리</option>	
					 	 		<option value="">수협</option>	
					 	 		<option value="">씨티</option>	
					 	 	</select>
		 	 		</div>
				 	 	<div class="p-2 ">
					 	 	<mark id="marks" style="font-size:12px; ">환불계좌</mark>
					 	 	<input type="tel" class="ml-3" placeholder=" (-없이)" name="payback" id="payback"  />
			 	 		</div>
			 	 		<hr/>
	 	 		</div>	
	 	 				
 	 </div>
 	 <!-- 전체 동의 -->
	 	 	<div class="p-2">
		 	 	<input type="checkbox" id="agreedAll" name="agreed" style="width: 20px; height: 20px;">
		 	 	<label for="agreedAll">
		 	 	<h5 class="font-weight-bold my-3"><mark id="marks">전체 동의하기</mark></h5>
		 	 	</label>
		 	 	<div class="p-1">
		 	 	 	<span class="ml-3 ">└</span>
			 	 	<input type="checkbox" id="agreedInfo" name="agreed" >
			 	 	<label for="agreedInfo">
					 위 상품의 구매조건 확인 및 결제진행 동의
			 	 	</label>

				</div> 
			</div>
 </div>
 	<!-- 중간 절취선 -->
	<div class="col-1 "> 
		<div class="border mx-3 border-right-0 border-top-0 border-bottom-0"  id="line" >
		</div> 	 
 	</div>

 	<!-- 주문자 정보 및 결제 정보 -->
	<div class="col-4 " style="text-align: center;"> 
	 	<div class="p-2 mx-auto ">
	 	<br /><br />
	 	 	<mark id="marks">주문자 정보</mark>
	 	 	<div class="p-2">고길동</div>
	 	 	<div class="p-2">010-3333-2222</div>
	 	 	<div class="p-2">gogo@naver.com</div>
	 	 <hr />
	 	 </div>
		<div class="p-2 mx-auto ">
	 	<br /><br />
	 	 </div>
		<div class="p-2 mx-auto ">
	 	<br /><br />
	 	 </div>
		<div class="p-2 mx-auto ">
	 	<br /><br />
	 	 </div>
	 	 <div class="p-2 mx-auto ">
	 	<br /><br />
	 	 	<h5 class="font-weight-bold my-3"><mark id="marks">결제상세</mark> </h5>	
	 	 	<div class="p-1 font-weight-bold">
	 	 	 <span>주문 금액</span>&emsp;&emsp;  <span>72,000원</span>
	 	 	</div>
	 	 	<div class="p-1" >
	 	 	 <span style="font-size: 12px; color: gray;">└ 상품 금액</span>&emsp;&emsp;  
	 	 	 <span style="font-size: 12px; color: gray;">84,000원</span>
	 	 	</div>
	 	 	<div class="p-1" >
	 	 	 <span style="font-size: 12px; color: gray;">└ 배송비</span>&emsp;&emsp;&emsp;&emsp;&emsp;   
	 	 	 <span style="font-size: 12px; color: gray;">0원</span>
	 	 	</div>
	 	 	<div class="p-1" >
	 	 	 <span style="font-size: 12px; color: gray;">└ 쿠폰할인</span>&emsp;&emsp;  
	 	 	 <span style="font-size: 12px; color: gray;">12,000원</span>
	 	 	</div>
	 	 <hr />
	 	 	<div class="p-1 font-weight-bold">
	 	 	 <span>카드 결제</span>&emsp;&emsp;  <span>72,000원</span>
	 	 	</div>
	 	 </div>
 	</div>
 </div>	 
<div class="border border-0 mx-auto p-3 rounded d-flex justify-content-center" >
	 <a href="${pageContext.request.contextPath}/basket/payComplet.do">	
	 <button type="button" class="btn btn-warning " id="payNow">결제하기</button></a>	
</div>

<script>


function chageAddress(obj){
 	const $obj = $(obj);
	console.log($obj.attr('id'));
	if($obj.attr('id') == "address"){
		$("#nowAddress").removeClass("hiddenPm");
		$("#newsAddress").addClass("hiddenPm");
	}
	else {
		$("#nowAddress").addClass("hiddenPm");
		$("#newsAddress").removeClass("hiddenPm");
	}
	
};

function cardType(obj){
	const $obj = $(obj);
	console.log($obj.attr('id'));
	
	 if($obj.attr('id') == "cardtype"){
			$("#selectMonth").attr('disabled',true);
		}

}
//라이오 체크시 목록 볼 수 있게 하는 설정
function selectPay(obj){
	console.log(obj);
	const $obj = $(obj);
	console.log($obj.attr('id'));

	if($obj.attr('id') == "cardPay"){
		$("#hiddenCash").addClass("hiddenCashPay");
		$("#hiddenKakao").addClass("hiddenKakaoPay");
		$("#hiddenCard").removeClass("hiddenCardPay");
			
	}
	else if($obj.attr('id') == "kakaopay") {
		$("#hiddenCash").addClass("hiddenCashPay");
		$("#hiddenCard").addClass("hiddenCardPay");
		$("#hiddenKakao").removeClass("hiddenKakaoPay");
	}
	else if($obj.attr('id') == "cashPay") {
		$("#hiddenCard").addClass("hiddenCardPay");
		$("#hiddenKakao").addClass("hiddenKakaoPay");
		$("#hiddenCash").removeClass("hiddenCashPay");
	}

}
//전체선택 설정
$("#agreedAll").change(function(e){
	
	$("[name=agreed]").prop("checked", this.checked);
	
	
});

//카카오페이 api
$("#kakaoBtn").click(() => {
	
	$("#payInfoFrm").submit(e =>{
		$.ajax({
					url:"https://kapi.kakao.com/v1/payment/approve",
					method: "POST",
					success(data){
						console.log(data);
						
					},
					error: console.log
				})
			});
	});
});

</script>


<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>