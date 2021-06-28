<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param value="depositFrmDetail" name="title" />
</jsp:include>



		<form id="depositFrm" name="depositFrm"
			action="${pageContext.request.contextPath}/unofficial/depositDetail.do"
			method="post">
			
					
		<h2 class="text-center m-4" style="font-weight: bold;">입금폼 상세보기</h2>
		

			<div class="mb-4 row">
				<label class="col-md-3 col-form-label" for="pdName">상품명</label>
				<div class="col-md-9">
					<input type="text" class="form-control" name="pdName" id="pdName" value="${unofficialdeposit.pdName}" readonly>
				</div>
			</div>
			<div class="mb-4 row">
				<label class="col-md-3 col-form-label" for="idolName">아이돌</label>
				<div class="col-md-9">
					<input type="text" class="form-control" name="idolName"
						id="idolName" value="${unofficialdeposit.idolName}" readonly>
				</div>
			</div>

			<div class="mb-4 row">
				<label class="col-md-3 col-form-label" for="pdCategory">분류</label>
				<div class="col-md-3">
				<input type="text" class="form-control" name="pdCategory"
						id="pdCategory" value="${unofficialdeposit.pdCategory}" readonly>
					
						</div>
					</div>
			
			
	    
	   <div class="mb-4 row">
        <label class="col-md-3 col-form-label" for="pdContent">상품 설명</label>
        <div class="col-md-9">
            <div name="pdContent" id="pdContent"  rows="5" class="form-control" readonly>${unofficialdeposit.pdContent}</div>
        </div>
    </div>
    
     <!-- 상품 설명 이미지  -->
    <div class="mb-4 row">
        <label class="col-md-3 col-form-label">상품 설명 이미지</label>
        <div class="col-md-9">
           	<c:forEach items="${unofficialdeposit.depositpdImgList}" var="pdImg">
           		<c:if test="${pdImg.pdCategory eq 'D'}">
  			        	<img src="<c:url value='/resources/upload/unofficial/${pdImg.renamedFilename}'/>" class="card-img" alt="tree" style="width:300px; height: 100%">
           		</c:if>
           	</c:forEach>
        </div>
    </div>
	    
	    <div class="register-date-group" name="depositPeriod" id="depositPeriod">
                            <h4>입금기간</h4>
                            시작일:  <fmt:formatDate value="${unofficialdeposit.depositStartDate}" pattern="yy/MM/dd"/>
                            마감일:  <fmt:formatDate value="${unofficialdeposit.depositEndDate}" pattern="yy/MM/dd"/>
                        </div>
                        <br />
                        <br />
                        
                    
							<h4>은행정보</h4> 
							<div class="mb-4 row">
				<label class="col-md-3 col-form-label" for="bankName">은행명</label>
				<div class="col-md-6">
					<input type="text" class="form-control" name="bankName"
						id="bankName" value="${unofficialdeposit.bankName}" readonly>
				</div>
			</div>
			<div class="mb-4 row">
				<label class="col-md-3 col-form-label" for="accountNo">계좌번호</label>
				<div class="col-md-6">
					<input type="text" class="form-control" name="accountNo"
						id="accountNo" value="${unofficialdeposit.accountNo}" readonly>
				</div>
			</div>
			<div class="mb-4 row">
				<label class="col-md-3 col-form-label" for="accountHolder">예금주명</label>
				<div class="col-md-6">
					<input type="text" class="form-control" name="accountHolder"
						id="accountHolder" value="${unofficialdeposit.accountHolder}" readonly>
				</div>
			</div>
							
						
             <div class="mb-4 row">
				<label class="col-md-3 col-form-label" for="price">가격</label>
				<div class="col-md-3">
					<div class="input-group">
						<input type="number" class="form-control" name="price" id="price" value="${unofficialdeposit.price}" readonly>
						<span class="input-group-text" >원</span>
					</div>
				</div>
			</div>
			<div class="mb-4 row">
							<label class="col-md-3 col-form-label" for="deliveryOption">배송방법</label>
							<div class="col-md-9">
								<input type="text" class="form-control" name="deliveryOption"
									id="deliveryOption" value="${unofficialdeposit.deliveryOption}" readonly>
							</div>
						</div>
			<div class="mb-4 row">
				<label class="col-md-3 col-form-label" for="deliveryPrice">배송비</label>
				<div class="col-md-3">
					<div class="input-group">
						<input type="number" class="form-control" name="deliveryPrice"
							id="deliveryPrice" value="${unofficialdeposit.deliveryPrice}" readonly> 
							<span class="input-group-text">원</span>
					</div>
				</div>
			</div>
			<div class="mb-4 row">
				<label class="col-md-3 col-form-label" for="pdStock">재고량</label>
				<div class="col-md-3">
					<input type="number" class="form-control" name="pdStock"
						id="pdStock" value="${unofficialdeposit.pdStock}" readonly>
				</div>
			</div>
			<!-- <div class="mb-4 row">
					<label class="col-md-3 col-form-label" for="pdSales">판매량</label>
					<div class="col-md-9">
						<input type="number" class="form-control" name="pdSales"
							id="pdSales">
					</div>
				</div> -->

		 <div class="form-group">
							<label for="deliveryNotice">(선택)배송안내</label>
							<textarea class="form-control" rows="3" name="deliveryNotice" id="deliverynotice"
								value="${unofficialdeposit.deliveryNotice}" readonly></textarea>
						</div>
						
						<div class="row" style="padding-top: 5px;">
									<div class="col-md-5"
										style="font-size: 15px; font-weight: 700; text-align: left; padding: 5px 15px;">
										- 주문 상품 선택 <span style="color: #ff0000;">＊</span>
									</div>
								</div>
								<div id="goods_list" class="row" style="padding-top: 5px;">

									<div class="col-md-12" style="font-size: 15px;">

										<div
											style="width: 100%; text-align: left; font-weight: 400; font-size: 13px; padding: 10px; background-color: #f6f6f6; margin-bottom: 5px;">
											<div style="">${unofficialdeposit.pdName}</div>
											
										</div>
									</div>


								</div>
								<div class="row" style="padding-top: 5px;">
									<div class="col-md-5"
										style="font-size: 15px; font-weight: 700; text-align: left; padding: 5px 15px;">
										구매수량 <span style="color: #ff0000;">＊</span>
									</div>
								</div>
								<div class="row">

									<div class="col-lg-6">
										<div class="form-group">
											<input class="form-control" type="text" id="purchase_amount"
												name="purchase_amount" value="" placeholder="숫자만 입력하세요">
										</div>
									</div>
									</div>


								<div class="row" style="padding-top: 5px;">
									<div class="col-md-5"
										style="font-size: 15px; font-weight: 700; text-align: left; padding: 5px 15px;">
										입금 정보 <span style="color: #ff0000;">＊</span>
									</div>
								</div>
								<div class="row">

									<div class="col-lg-6">
										<div class="form-group">
											<input class="form-control" type="text" id="buyer_name"
												name="buyer_name" value="" placeholder="입금자명">
										</div>
									</div>
									<div class="col-lg-6">
										<div class="form-group">
											<input class="form-control" type="number" min="0"
												inputmode="numeric" pattern="[0-9]*" id="buyer_price"
												name="buyer_price" value="" placeholder="입금액(숫자만 입력하세요)">
										</div>
									</div>
								</div>
								<div class="row"></div>
								<div class="row">
									<div class="col-lg-8">
										<div class="form-group">
											 입금일:  <input type="date" class="input--text" name="buyer_Date" placeholder="입금일" id="buyer_Date" required>

										</div>
									</div>
									<div class="col-lg-2" style="display: none;">
										<div class="form-group">
											<input class="form-control" type="number" id="buyer_hour"
												name="buyer_hour" value="" placeholder="시">

										</div>
									</div>
									<div class="col-lg-2" style="display: none;">
										<div class="form-group">
											<input class="form-control" type="number" id="buyer_min"
												name="buyer_min" value="" placeholder="분">

										</div>
									</div>
								</div>

								<div class="row" style="padding-top: 5px;">
									<div class="col-md-5"
										style="font-size: 15px; font-weight: 700; text-align: left; padding: 5px 15px;">
										주문자 정보 <span style="color: #ff0000;">＊</span>
									</div>
								</div>
								<div class="row">

									<div class="col-lg-12">
										<div class="form-group">
											<input class="form-control" type="text" id="buyer_name2"
												name="buyer_name2" value="" placeholder="주문자명">
										</div>
									</div>

								</div>


								<div class="row">

									<div class="col-lg-12">
										<div class="form-group">
											<input class="form-control" type="text" id="email"
												name="email" value="" placeholder="주문자 이메일주소">
										</div>
									</div>

								</div>

								<div class="row">

									<div class="col-lg-12">
										<div class="form-group">
											<input class="form-control" type="text" id="buyer_phone"
												name="buyer_phone" value="" placeholder="주문자 핸드폰번호"
												maxlength="11">
										</div>
									</div>

								</div>
								<div class="row" style="padding-top: 5px;">
									<div class="col-md-5"
										style="font-size: 15px; font-weight: 700; text-align: left; padding: 5px 15px; display: inline-block; float: left; max-width: 100%;">
										<div style="float: left;">배송지 정보</div>
										<span style="float: left; color: #ff0000;">＊</span>
										<div
											style="display: inline-block; font-size: 12px; font-weight: 300; padding-top: 2px; padding-left: 10px; float: left;">
											<div style="display: inline-block; float: left;">주문자정보와
												동일</div>
											<div
												style="display: inline-block; float: left; padding-top: 3px; padding-left: 10px;">
												<input type="checkbox" id="same_buyer" name="" value=""
													style="text-align: left;" onclick="same_buyer_data();">
											</div>
										</div>
									</div>
								</div>
								<!-- 				<div class="row" style="padding-top:5px;"> -->
								<!-- 					<div class="col-md-5" style="font-size:15px;text-align:left;padding:5px 15px;"> -->
								<!-- 						- 수령자명 -->
								<!-- 					</div> -->
								<!-- 				</div>	 -->
								<div class="row">
									<div class="col-lg-12">
										<div class="form-group">
											<input class="form-control" type="text" id="recipient"
												name="recipient" value="" placeholder="수령자명">

										</div>
									</div>
								</div>
								<div class="row">
									<div class="col-lg-12">
										<div class="form-group">
											<input class="form-control" type="text" id="recipient_phone"
												name="recipient_phone" value="" placeholder="연락처"
												autocomplete="off" maxlength="11">

										</div>
									</div>
								</div>

								
								<input type="text" id="sample4_postcode" placeholder="우편번호">
<input type="button" onclick="sample4_execDaumPostcode()" value="우편번호 찾기"><br>
<input type="text" id="sample4_roadAddress" placeholder="도로명주소">
<input type="text" id="sample4_jibunAddress" placeholder="지번주소">
<span id="guide" style="color:#999;display:none"></span>
<input type="text" id="sample4_detailAddress" placeholder="상세주소">
<input type="text" id="sample4_extraAddress" placeholder="참고항목">

<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
    //본 예제에서는 도로명 주소 표기 방식에 대한 법령에 따라, 내려오는 데이터를 조합하여 올바른 주소를 구성하는 방법을 설명합니다.
    function sample4_execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.
                // 도로명 주소의 노출 규칙에 따라 주소를 표시한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var roadAddr = data.roadAddress; // 도로명 주소 변수
                var extraRoadAddr = ''; // 참고 항목 변수
                // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                    extraRoadAddr += data.bname;
                }
                // 건물명이 있고, 공동주택일 경우 추가한다.
                if(data.buildingName !== '' && data.apartment === 'Y'){
                   extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                }
                // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                if(extraRoadAddr !== ''){
                    extraRoadAddr = ' (' + extraRoadAddr + ')';
                }
                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('sample4_postcode').value = data.zonecode;
                document.getElementById("sample4_roadAddress").value = roadAddr;
                document.getElementById("sample4_jibunAddress").value = data.jibunAddress;
                
                // 참고항목 문자열이 있을 경우 해당 필드에 넣는다.
                if(roadAddr !== ''){
                    document.getElementById("sample4_extraAddress").value = extraRoadAddr;
                } else {
                    document.getElementById("sample4_extraAddress").value = '';
                }
                var guideTextBox = document.getElementById("guide");
                // 사용자가 '선택 안함'을 클릭한 경우, 예상 주소라는 표시를 해준다.
                if(data.autoRoadAddress) {
                    var expRoadAddr = data.autoRoadAddress + extraRoadAddr;
                    guideTextBox.innerHTML = '(예상 도로명 주소 : ' + expRoadAddr + ')';
                    guideTextBox.style.display = 'block';
                } else if(data.autoJibunAddress) {
                    var expJibunAddr = data.autoJibunAddress;
                    guideTextBox.innerHTML = '(예상 지번 주소 : ' + expJibunAddr + ')';
                    guideTextBox.style.display = 'block';
                } else {
                    guideTextBox.innerHTML = '';
                    guideTextBox.style.display = 'none';
                }
            }
        }).open();
    }
</script>

								<div class="row">
									<div id="wrap"
										style="display: none; border: 1px solid; width: 90%; height: 300px !important; min-height: 300px; margin: 5px 0; position: relative; margin: 0 auto;">
										<img src="//t1.daumcdn.net/postcode/resource/images/close.png"
											id="btnFoldWrap"
											style="cursor: pointer; position: absolute; right: 0px; top: -1px; z-index: 1"
											onclick="foldDaumPostcode()" alt="접기 버튼">
									</div>

								</div>

								

								

								<div class="row">
									<div class="col-lg-12">
										<div class="form-group">
											<input class="form-control" type="text" id="memo" name="memo"
												value="" placeholder="배송메모(선택)">

										</div>
									</div>
								</div>



								<div class="row" style="padding-top: 5px;">
									<div class="col-md-12"
										style="font-size: 15px; font-weight: 700; text-align: left; padding: 5px 15px;">
										- 환불계좌 정보 (제작무산 등의 경우) <span style="color: #ff0000;">＊</span>
									</div>
								</div>

								<div class="row">

									<div class="col-lg-3">
										<div class="form-group">
											<input class="form-control" type="text" id="bank" name="bank"
												value="" placeholder="은행명">
										</div>
									</div>
									<div class="col-lg-6">
										<div class="form-group">
											<input class="form-control" type="text" id="account"
												name="account" value="" placeholder="계좌번호">
										</div>
									</div>
									<div class="col-lg-3">
										<div class="form-group">
											<input class="form-control" type="text" id="depositor"
												name="depositor" value="" placeholder="예금주명">
										</div>
									</div>
								</div>










								<div class="row" style="padding-top: 5px;">
									<div class="col-md-12"
										style="font-size: 15px; font-weight: 700; text-align: left; padding: 5px 15px;">
										- 개인정보 수집 및 동의 <span style="color: #ff0000;">＊</span>
									</div>
								</div>
								<div class="row">

									<div class="col-md-12" style="font-size: 15px;">
										<div
											style="padding: 3px; width: 100%; color: #495057; background-color: #fff; background-clip: padding-box; border: 1px solid #ced4da; border-radius: .25rem; transition: border-color .15s ease-in-out, box-shadow .15s ease-in-out; text-align: left;">
											상품 주문 및 배송을 위해 위에 입력된 개인정보를 수집합니다. 수집한 개인정보는<br> 주문과
											배송이외의 목적으로는 사용하지 않습니다.<br> 개인정보의 수집 및 이용에 대한 동의를 거부할수
											있으며, 이 경우 상품 주문이 어려울 수 있습니다.
										</div>
										<input type="checkbox" id="agree" name="agree" value="1"
											style="text-align: left;"> 동의합니다.
									</div>

								</div>

						


				<div class="container text-center">
					<div class="mb-4 row">
						<div class="col-6 d-grid p-1">
							<button type="reset" class="btn btn-lg btn-dark"
								style="width: 100%;">취소하기</button>
						</div>
						<div class="col-6 d-grid p-1">
							<button type="submit" class="btn btn-lg btn-main" id="enrollbtn"
								 style="width: 100%;">제출하기</button>
						</div>
					</div>
				</div>
		</form>

<script>

function depositDetailUpdate(event) {
    const target = event.target;
    const dno= target.dataset.no;
    location.href=`${pageContext.request.contextPath}/unofficial/depositDetailUpdate/\${dNo}`
}

function delivery_change(n){
	document.getElementById("delivery_price").value = n;
	price_change();
}
function goods_change(n,price,qunt,goods_idx_cnt,jaego,goods_idx,limit_check,goods_limit){
	var remain = Number(jaego)-Number(goods_idx_cnt);
	if(first==0) {
				first = 1;
		
	}
	else {
	}
	
	if( limit_check==1 && Number(qunt) >  Number(goods_limit)){
		
		alert("선택하신 상품은 "+goods_limit +"개까지 구매 가능합니다.");
//		document.getElementById(goods_idx+"_number").value = document.getElementById(goods_idx+"_number").value-1;
		document.getElementById(goods_idx+"_number").value = Number(goods_limit);
		document.getElementById("goods_price"+n).value = Number(price)*Number(document.getElementById(goods_idx+"_number").value);
		price_change();
		
	}
	else if( Number(qunt) >  Number(jaego)){
		
		alert("선택하신 상품의 재고가 "+jaego +"개 남았습니다.");
		document.getElementById(goods_idx+"_number").value = document.getElementById(goods_idx+"_number").value-1;
		document.getElementById(goods_idx+"_number").value = 0;
		document.getElementById("goods_price"+n).value = Number(price)*Number(document.getElementById(goods_idx+"_number").value);
		price_change();
		
	}
	else if(Number(qunt)<0){
		alert("마이너스는 올바른 값이 아닙니다.");
		document.getElementById(goods_idx+"_number").value = 0;
	}
	else{
		document.getElementById("goods_price"+n).value = Number(price)*qunt;
		price_change();
	}
	
	
	
}
function price_change(){
	var goods_price = 0;
goods_price += Number(document.getElementById('goods_price1').value);//	alert(goods_price);
	var delivery_price = Number(document.getElementById("delivery_price").value);
	var all_price = goods_price+delivery_price;
	//상품가격업데이트
	document.getElementById("all_goods_price").innerHTML = comma(goods_price)+'원';
	//배송비업데이트
	document.getElementById("all_delivery_price").innerHTML = comma(delivery_price)+'원';
	//총금액업데이트
	document.getElementById("all_price").innerHTML = comma(all_price)+"원";
	document.getElementById("final_price").value = all_price;
	//입금액 업데이트
	document.getElementById("buyer_price").value = all_price;
//	alert(delivery_price);
}
function comma(num){
    var len, point, str; 
       
    num = num + ""; 
    point = num.length % 3 ;
    len = num.length; 
   
    str = num.substring(0, point); 
    while (point < len) { 
        if (str != "") str += ","; 
        str += num.substring(point, point + 3); 
        point += 3; 
    } 
     
    return str;
 
}
// 우편번호 찾기 찾기 화면을 넣을 element
 var element_wrap = document.getElementById('wrap');
 function foldDaumPostcode() {
        // iframe을 넣은 element를 안보이게 한다.
        element_wrap.style.display = 'none';
    }
function sample3_execDaumPostcode() {
        // 현재 scroll 위치를 저장해놓는다.
        var currentScroll = Math.max(document.body.scrollTop, document.documentElement.scrollTop);
        new daum.Postcode({
            oncomplete: function(data) {
                // 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.
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
                    document.getElementById("address1").value = extraAddr;
                
                } else {
                    document.getElementById("address1").value = '';
                }
                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('postcode').value = data.zonecode;
                document.getElementById("address1").value = addr;
                // 커서를 상세주소 필드로 이동한다.
                document.getElementById("address2").focus();
                // iframe을 넣은 element를 안보이게 한다.
                // (autoClose:false 기능을 이용한다면, 아래 코드를 제거해야 화면에서 사라지지 않는다.)
                element_wrap.style.display = 'none';
                // 우편번호 찾기 화면이 보이기 이전으로 scroll 위치를 되돌린다.
                document.body.scrollTop = currentScroll;
            },
            // 우편번호 찾기 화면 크기가 조정되었을때 실행할 코드를 작성하는 부분. iframe을 넣은 element의 높이값을 조정한다.
            onresize : function(size) {
//                element_wrap.style.height = size.height+'px';
				element_wrap.style.height = '300px';
            },
            width : '100%',
            height : '100%'
        }).embed(element_wrap);
        // iframe을 넣은 element를 보이게 한다.
        element_wrap.style.display = 'block';
    }
function open_postcode() {
//	alert("팝업차단이되어있다면. 팝업차단을 허용해주셔야 우편번호찾기가 가능합니다.");
        var a = new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.
                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var fullAddr = ''; // 최종 주소 변수
                var extraAddr = ''; // 조합형 주소 변수
                // 사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                    fullAddr = data.roadAddress;
                } else { // 사용자가 지번 주소를 선택했을 경우(J)
                    fullAddr = data.jibunAddress;
                }
                // 사용자가 선택한 주소가 도로명 타입일때 조합한다.
                if(data.userSelectedType === 'R'){
                    //법정동명이 있을 경우 추가한다.
                    if(data.bname !== ''){
                        extraAddr += data.bname;
                    }
                    // 건물명이 있을 경우 추가한다.
                    if(data.buildingName !== ''){
                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
                    // 조합형주소의 유무에 따라 양쪽에 괄호를 추가하여 최종 주소를 만든다.
                    fullAddr += (extraAddr !== '' ? ' ('+ extraAddr +')' : '');
                }
                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('postcode').value = data.zonecode; //5자리 새우편번호 사용
                document.getElementById('address1').value = fullAddr;
                // 커서를 상세주소 필드로 이동한다.
                document.getElementById('address2').focus();
            }
        }).open();
//		if (a == null) { 
//		    alert("차단된 팝업창을 허용해 주십시오."); 
//		} 
//		else { 
//			
//		} 
}
function plus(goods_cnt, goods_idx,price,goods_idx_cnt,goods_quantity,limit_check,goods_limit){
	document.getElementById(goods_idx+"_number").value=parseInt(document.getElementById(goods_idx+"_number").value) + 1;
	goods_change(goods_cnt,price,document.getElementById(goods_idx+"_number").value,goods_idx_cnt,goods_quantity,goods_idx,limit_check,goods_limit);
	
}
function minus(goods_cnt, goods_idx,price,goods_idx_cnt,goods_quantity,limit_check,goods_limit){
	if(parseInt(document.getElementById(goods_idx+"_number").value)<=0){
	}
	else{
		document.getElementById(goods_idx+"_number").value=parseInt(document.getElementById(goods_idx+"_number").value) - 1;
		goods_change(goods_cnt,price,document.getElementById(goods_idx+"_number").value,goods_idx_cnt,goods_quantity,goods_idx,limit_check,goods_limit);
	}
	
	
}

</script>

<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>
