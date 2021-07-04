<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<jsp:include page="/WEB-INF/views/common/header.jsp">
<jsp:param value="결제페이지" name="title"/>
</jsp:include>
<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script>
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>

<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
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
	height: 1200px;
	border: 4px solid #bc73d6!important;
	
}
#line{
	width: 3px;
	height: 1100px;
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
      <th scope="col">배송비</th>
      <th scope="col">수량</th>
      <th scope="col">할인</th>
      <th scope="col">총 상품금액</th>
    </tr>
  </thead>
  <tbody>
   <c:forEach items="${paymentOptionList}" var ="paymentOptionList" >
    <tr>
      <td colspan="2">
      	<div class="media">
		  <img class="" src="${pageContext.request.contextPath}/resources/upload/product/${paymentOptionList.productImg}" style="width: 100px; height:100px;">
		  <div class="media-body my-3 ">
		  	<input type="hidden" name="pdName" value="${paymentOptionList.pdName}">
		  	<input type="hidden" name="fanNo" value="${loginMember.fanNo}">
		  	
		    <h6 class="mt-0 ">${paymentOptionList.pdName}</h6> 
			  <div class="p-1" style="font-size: 12px;">${paymentOptionList.pdContent} / ${paymentOptionList.productOption.optionName}</div>
			</div>
		  </div>
		</div>
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
      <td><div class="p-1">${paymentOptionList.pdAmount}</div>
      <input type="hidden" name="pdAmount" value="${paymentOptionList.pdAmount}">
      	
      <input type="hidden" name="opNo" value="${paymentOptionList.pdNo}-${paymentOptionList.opNo}"> 
      
      <input type="hidden" name="pdNo" value="${paymentOptionList.pdNo}"> 
      </td>
      <td style="color:gray;">- 0원</td>
      <td><div class="p-1">${paymentOptionList.price}원</div>
      <input type="hidden" name="price" value="${paymentOptionList.price}">
      </td>	
    </tr>
</c:forEach>

    
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
 	 	<div class="p-2 userId">${loginMember.fanName}</div>
 	 	<div class="p-2">${loginMember.phone}</div>
 	 	<div class="p-2">
 	 	${loginMember.address}
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
 	 	<div class="p-2 zip-code">
 	 	<mark id="marks">
 	 	 <label for="sample6_postcode">배송지 주소</label></mark>
 	 	<input type="text" class="ml-3" style="width: 80px" id="sample6_postcode" name="address" />
 	 	<button class="btn btn-outline mb-1" id="postNum" onclick="sample6_execDaumPostcode()" value="우편번호 찾기">우편번호</button>
 	 	</div>
 	 	<div class="p-2">
 	 	<label for="sample6_address"></label>
 	 	<input type="text" name="addressExt1" id="sample6_address" readonly placeholder="주소" size="25px;"/>	 	 
 	 	</div>
 	 	<div class="p-2">
 	 	<label for="sample6_extraAddress"></label>
 	 	<input type="text" name="addressExt2" id="sample6_extraAddress" readonly placeholder="참고항목" size="25px;"/>
 	 	</div>
 	 	<div class="p-2">
 	 	<input type="text" name="addressExt2" name="addressExt3" id="sample6_detailAddress" placeholder="상세주소" size="25px;"/>
 	 	</div>
 	 	<div class="p-2">
 	 	<!-- 요청사항 만들긴 했는데 디비에 저정하나요? -->
 	 	<mark id="marks">배송 메모</mark>
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
	 	 	<div class="p-2 orderName">${loginMember.fanName}</div>
	 	 	<div class="p-2 orderPhone" >${loginMember.phone}</div>
	 	 	<div class="p-2 uemail">${loginMember.email}</div>
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
	 	 	 <span>주문 금액</span>&emsp;&emsp;  <span><fmt:formatNumber value="${total}" pattern="#,###"/>원</span>
	 	 	</div>
	 	 	<div class="p-1" >
	 	 	 <span style="font-size: 12px; color: gray;">└ 상품 금액 <fmt:formatNumber value="${total}" pattern="#,###"/>원</span>
	 	 	</div>
	 	 	<div class="p-1" >
	 	 	 <span style="font-size: 12px; color: gray;">└ 배송비</span>&emsp;&emsp;&emsp;&emsp;&emsp;   
	 	 	 <span style="font-size: 12px; color: gray;">0원</span>
	 	 	</div>
	 	 <hr />
	 	 	<div class="p-1 font-weight-bold">
	 	 	 <span></span>&emsp;&emsp;  <span>
	 	 	 	<input class="total-price" type="hidden" value="${total}"/>
	 	 	 	<fmt:formatNumber value="${total}" pattern="#,###"/>원</span>
	 	 	</div>
	 	 </div>
 	</div>
 </div>	 
 <form action="${pageContext.request.contextPath}/basket/insertPay.do" method="POST" name=insertPayFrm>
 </form>
<div class="border border-0 mx-auto p-3 rounded d-flex justify-content-center" >
	 <button type="button" class="btn btn-warning " id="payNow" onclick="payAll(this);">결제하기</button>	
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


//주소 찾기//
function sample6_execDaumPostcode() {
    new daum.Postcode({
        oncomplete: function(data) {
            // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

            // 각 주소의 노출 규칙에 따라 주소를 조합한다.
            // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
            var addr = ''; // 주소 변수
            var extraAddr = ''; // 참고항목 변수

            //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
            if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                addr = data.roadAddress;
            } else { // 사용자가 지번 주소를 선택했을 경우(J)
                addr = data.jibunAddress;
            }

            // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
            if(data.userSelectedType === 'R'){
                // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                    extraAddr += data.bname;
                }
                // 건물명이 있고, 공동주택일 경우 추가한다.
                if(data.buildingName !== '' && data.apartment === 'Y'){
                    extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                }
                // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                if(extraAddr !== ''){
                    extraAddr = ' (' + extraAddr + ')';
                }
                // 조합된 참고항목을 해당 필드에 넣는다.
                document.getElementById("sample6_extraAddress").value = extraAddr;
            
            } else {
                document.getElementById("sample6_extraAddress").value = '';
            }

            // 우편번호와 주소 정보를 해당 필드에 넣는다.
            document.getElementById('sample6_postcode').value = data.zonecode;
            document.getElementById("sample6_address").value = addr;
            // 커서를 상세주소 필드로 이동한다.
            document.getElementById("sample6_detailAddress").focus();
        }
    }).open();
}
//전체선택 설정
$("#agreedAll").change(function(e){
	
	$("[name=agreed]").prop("checked", this.checked);	
	
});

	function payAll(obj) {

		/* 	var IMP = window.IMP; */
		IMP.init('imp92035130'); //가맹점 식별코드

		var orders = '';

		var userName = $(".userId").text();//이름
		var uemail = $(".uemail").text();//이메일
		var name = $("[name=pdName]"); //주문명

		console.log(name);
		$.each(name, function(index, value) {
			console.log(value);
			orders += $(value).val() + ",";

			console.log(orders);

		});

		const rslt1 = orders.replace(/,\s*$/, "");
		console.log(rslt1);

		var amount = $(".total-price").val(); //결제 금액  
		console.log(amount);


		////결제 api
		IMP.request_pay({
			pg : 'inicis', // version 1.1.0부터 지원.
			pay_method : 'card',
			merchant_uid : 'merchant_' + new Date().getTime(),
			name : rslt1,
			amount : 10,//amount,//테스트용 10원 설정,
			buyer_name : userName,
			buyer_email : uemail
		}, function(rsp) {
			if (rsp.success) {
				//[1] 서버단에서 결제정보 조회를 위해 jQuery ajax로 imp_uid 전달하기
				jQuery.ajax({
					//아임포트 서버에 접속할 url임. 건드리면 안됨
					url : "/payments/complete", //cross-domain error가 발생하지 않도록 동일한 도메인으로 전송
					type : 'POST',
					dataType : 'json',
					data : {
						imp_uid : rsp.imp_uid
					//기타 필요한 데이터가 있으면 추가 전달
					}
				}).done(function(data) {
					//[2] 서버에서 REST API로 결제정보확인 및 서비스루틴이 정상적인 경우
					if (everythings_fine) {
						var msg = '결제가 완료되었습니다.';
						msg += '\n고유ID : ' + rsp.imp_uid;
						msg += '\n상점 거래ID : ' + rsp.merchant_uid;
						msg += '\결제 금액 : ' + rsp.paid_amount;
						msg += '카드 승인번호 : ' + rsp.apply_num;

						alert(msg);
					} else {
						//[3] 아직 제대로 결제가 되지 않았습니다.
						//[4] 결제된 금액이 요청한 금액과 달라 결제를 자동취소처리하였습니다.
					}
				});
				//성공 시 이동할 페이지
				// 이따 불러올게요 여기로 와요!
		const totalHtml = '<input type="hidden" name ="total" value="'+ amount+'"/>';
		const fanNoo = '<input type="hidden" name ="fanNo" value="'
				+ $("[name=fanNo]").val() + '"/>';
		const payType = '<input type="hidden" name ="ptype" value="'+"신용카드"+'"/>';
		var on = $("[name=opNo]");
		const pdAmount = $("[name=pdAmount]");
		var pdNo = $("[name=pdNo]");
		var pdNoOne = $("[name=pdNo]").val();
		console.log("pdNo= " + pdNo);
		var $formId = $(document.insertPayFrm);
		console.log("formId= " + $formId);

		var pdNoHtml = '';

		$.each(pdNo, function(index, value) {
			console.log(value);

			pdNoHtml += '<input type="hidden" name ="pdNoo" value="'
					+ $(value).val() + '"/>';
			console.log(pdNoHtml);
		});
		console.log(pdNoHtml);

		var opNoHtml = '';
		$.each(on, function(index, value) {
			console.log(value);

			opNoHtml += '<input type="hidden" name ="opNoo" value="'
					+ $(value).val() + '"/>';
			//그럼 여기 value값에 해당 하는 pdNo를 같이 넣어줘야할거 같아요 pdNo-opNo[] 배열

			console.log(opNoHtml);
		});
		var sum = 0;
		$.each(pdAmount, function(index, value) {
			console.log(value);
			sum += Number($(value).val());

		});
		var sumHtml = '<input type="hidden" name ="sumA" value="'+sum+'"/>';
		console.log(sum);

		// 
		$formId.append(sumHtml);//상품수량 그그 옵셪 넘버는 뭐 그렇다 치고 .. 상품 넘버는 낫 널이라 필요 한데ㅣ..ㅜㅜ
		$formId.append(pdNoHtml);//
		$formId.append(opNoHtml);//옵션넘버 -> 이거는 고쳐야할것같아용 상품페이지에 옵션넘버 안쓰고 String 써요!
		$formId.append(totalHtml); //전체금액
		$formId.append(fanNoo); //사용자 번호
		$formId.append(payType); //카드사용 
		$formId.submit();

			} else {
				var msg = '결제에 실패하였습니다.';
				msg += '실패 사유 : ' + rsp.error_msg;
				//실패시 이동할 페이지
				location.href="${pageContext.request.contextPath}/mypage/payment.do";
				alert(msg);
			}
		});
		

	}
</script>


<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>