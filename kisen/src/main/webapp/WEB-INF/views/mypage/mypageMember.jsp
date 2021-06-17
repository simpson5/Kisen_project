<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<jsp:include page="/WEB-INF/views/common/header.jsp">
<jsp:param value="mypage" name="title"/>
</jsp:include>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
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
	height: 280px;
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


	<!-- 회원상태 -->
	<br /><br /><br /><br />
<div id="mypage-container" class="border border-0 mx-auto p-3 rounded ">
	<div class="row ">
		    <h5 class="col">{$fanId}님, 안녕하세요! </h5>
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
		    <a class="nav-link" href="${pageContext.request.contextPath}/mypage/mypagePay.do" id="payNav">결제내역</a>
		  </li>
		  <li class="nav-item col-md-2 p-0">
		    <a class="nav-link" href="${pageContext.request.contextPath}/mypage/mypageArtist.do" id="payNav">찜 아티스트</a>
		  </li>
		  <li class="nav-item col-md-2 p-0">
		    <a class="nav-link active" href="${pageContext.request.contextPath}/mypage/mypageMember.do" id="payNav">회원정보수정</a>  <%--사용자가 클릭시 비밀번호 입력 나오게 하기 --%>
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
      <label for="myId">*아이디</label>
      <input type="text" class="form-control" id="myId" placeholder="아이디">
    </div>
  <div class="form-group col-md-7 mx-auto">
      <label for="myName">*이름</label>
      <input type="text" class="form-control" id="myName" placeholder="이름">
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
      <label for="inputEmail4">*이메일</label>
      <input type="email" class="form-control" id="inputEmail4"" placeholder="이메일">
</div>
  <div class="form-group col-md-7 mx-auto">
      <label for="myPhone">*전화번호</label>
      <input type="tel" class="form-control" id="myPhone" placeholder="(-)없이 입력하십시오.">
    </div>
 <!-- 주소 -->
    <div class="form-group col-md-7 mx-auto">
        <label for="sample6_postcode">*주소</label>
        <!-- 우편번호 검색 -->
        <div id="zip-code form-control">
            <div class="p-2 ">
            <input type="text" class="fill-in-area add1 form-control" id="sample6_postcode" name="address" readonly placeholder="우편번호" style="width: 100%">
        	</div>
            <div class="form-group col-md-7 mx-auto">
            	<input type="button" class="add-btn btn btn-secondary btn-sm" onclick="sample6_execDaumPostcode()" value="우편번호 찾기"><br>
        	</div>
        </div>
        <!-- 검색에 의한 주소 -->
        <div class="mx-auto">
            <label for="sample6_address"></label>
            <input type="text" class="fill-in-area add2  form-control" name="addressExt1" id="sample6_address" readonly placeholder="주소"><br>
        </div>
        <!-- 참고항목 및 상세주소 -->
   
	        <div class="mx-auto p-1">
	            <label for="sample6_extraAddress"></label>
	            <input type="text" class="fill-in-area add3 form-control " name="addressExt2" id="sample6_extraAddress" readonly placeholder="참고항목">
	        </div>
	        <div class="mx-auto p-1">
	            <input type="text" class="fill-in-area add4 form-control" name="addressExt3" id="sample6_detailAddress" placeholder="상세주소">
	        </div>
   
        <p id="chkNoticeAddress" class="chkNotice "></p>
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
<script>
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
</script>


<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>