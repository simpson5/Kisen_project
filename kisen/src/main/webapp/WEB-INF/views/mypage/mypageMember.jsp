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
	String arr = ((Fan)request.getAttribute("loginMember")).getAddress();
	String[] array = arr.split("-");
	for(int i=0;i<array.length;i++) {
		System.out.println(array[i]); 
				
		}
	pageContext.setAttribute("array", array);
%>
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

<form:form   
		  class="justify-content-center" 
		  name="MypageFrm"
		  method="post" 
		  action="${pageContext.request.contextPath}/mypage/updateMypage.do">
   <div class="form-group col-md-7 mx-auto">
      <label for="myId">아이디</label>
      <input type="text" class="form-control" id="fanId" name="fanId"value="${loginMember.fanId}" readonly required >
      <input type="hidden"  name="fanNo"value="${loginMember.fanNo}" >
		     
   </div>
  <div class="form-group col-md-7 mx-auto">
      <label for="myName">*이름</label>
      <input type="text" class="form-control" id="fanName" name="fanName" value="${loginMember.fanName}">
      <p id="chkNoticeName" class="chkNotice"></p>
    </div>
 <div class="form-group col-md-7 mx-auto">
      <label for="inputPassword4">*새 비밀번호</label>
      <input type="password" class="form-control" name="password" id="password" placeholder="Password">
      <p id="chkNoticePwd1" class="chkNotice"></p>
 </div>
 <div class="form-group col-md-7 mx-auto">
      <label for="inputPassword4">*비밀번호 확인</label>
      <input type="password" class="form-control" name="passwordCheck" id="passwordCheck" placeholder="Password">
      <p id="chkNoticePwd2" class="chkNotice"></p>
</div>

<div class="form-group col-md-7 mx-auto">
      <label for="inputEmail4">*이메일</label>
      <input type="email" class="form-control" name="email" id="email" value="${loginMember.email}">
       <p id="chkNoticeEmail" class="chkNotice"></p>
</div>
  <div class="form-group col-md-7 mx-auto">
      <label for="myPhone">*전화번호</label>
      <input type="tel" class="form-control" id="phone" name="phone" value="${loginMember.phone}">
    </div>
     <div class="form-group col-md-7 mx-auto">
        <label for="birthday">*생년월일</label>
        <input type="date" class="fill-in-area" name="birthday" id="birthday" value="${loginMember.birthday}">
    </div>
 <!-- 주소 -->
    <div class="form-group col-md-7 mx-auto">
        <label for="sample6_postcode">*주소</label>
        <!-- 우편번호 검색 -->
        <div id="zip-code form-control">
            <div class="p-2 ">
            <input type="text" class="fill-in-area add1 form-control" id="sample6_postcode" name="address" value="${array[0]}"
            	readonly placeholder="우편번호" style="width: 100%" >
        	</div>
            <div class="form-group col-md-7 mx-auto">
            	<input type="button" class="add-btn btn btn-secondary btn-sm" onclick="sample6_execDaumPostcode()" value="우편번호 찾기"><br>
        	</div>
        </div>
        <!-- 검색에 의한 주소 -->
        <div class="mx-auto">
            <label for="sample6_address"></label>
            <input type="text" class="fill-in-area add2  form-control" name="addressExt1" id="sample6_address" readonly placeholder="주소" value="${array[1]}"><br>
        </div>
        <!-- 참고항목 및 상세주소 -->
   
	        <div class="mx-auto p-1">
	            <label for="sample6_extraAddress"></label>
	            <input type="text" class="fill-in-area add3 form-control " name="addressExt2" id="sample6_extraAddress" readonly placeholder="참고항목" 
	            value="${array[2]}${array[3]}">
	        </div>
	        <div class="mx-auto p-1">
	            <input type="text" class="fill-in-area add4 form-control" name="addressExt3" id="sample6_detailAddress" placeholder="상세주소">
	        </div>
   
        <p id="chkNoticeAddress" class="chkNotice "></p>
    </div>
  <div class="d-flex justify-content-around">
    <div class="col-3 mt-2 p-0">
  	<button type="submit" class="btn btn-outline-success" >수정하기</button>
    </div>
    <div class="col-3 mt-2 p-0"></div>
  	 </form:form>
    <div class="col-3 col-lg-2 mt-2">
     <button class="btn btn-outline-danger" onclick="deleteFan(this);" data-string="${loginMember.fanId}">탈퇴하기</button>
    </div>
  	</div>
 </div>

    <form:form
	name="FanDelFrm" 
	action="${pageContext.request.contextPath}/mypage/deleteFan.do" 
	method="POST">
	<input type="hidden" name="fanId" value="" />
	</form:form>
    
	<br />
	<br />
	<br />
	<br />

<script>


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
 

 // 실시간 유효성검사
 // password 블러 시 유효성검사
 $('#password').blur(function(){

 	var pwdReg = /^(?=.*[A-Za-z])(?=.*\d)(?=.*[$@$!%*#?&])[A-Za-z\d$@$!%*#?&]{8,}$/;
 	var pwd1 = $("#password").val();
   	var pwd2 = $('#passwordCheck').val();
   	var pwdTest = pwdReg.test(pwd1);
   		
     if(!pwdTest){
 		$('#chkNoticePwd1').html('비밀번호는 숫자,영문,특수문자 조합 최소8자여야 합니다.').css("color","red");            
 	} else {
 		$('#chkNoticePwd1').html('');       
 	}
 });

 // passwordChk 유효성 검사
 $('#passwordCheck').keyup(function(){

   	var pwd1 = $("#password").val();
   	var pwd2 = $('#passwordCheck').val();
        
 	// 1. 패스워드 체크부터 진행할 경우
     if(pwd1 == ''){
 		$('#chkNoticePwd1').html('패스워드부터 입력해주세요.').css("color","red");
         $('#password').select();
     }
 	// 2. 패스워드 일치 여부 검사
 	if(pwd2.length > 3){
 		if(pwd1 != pwd2){
 			$('#chkNoticePwd2').html('패스워드가 일치하지 않습니다.').css("color","red");
 		} else{
 			$('#chkNoticePwd2').html('패스워드가 일치합니다.').css("color","rgb(117, 59, 93)");
        }
    }
 });

 // 제출시 유효성 검사
 $("[name=MypageFrm]").submit(function(){

     // 패스워드 유효성검사
     var pwd1 = $("#password");
   	var pwd2 = $('#passwordCheck');
 	var $pwdOffset = $("#password").offset();
   	// 1. 패스워드 입력하지 않은 경우
   	if(pwd1.val() == ''){
 		$("html body").animate({scrollTop:$pwdOffset.top},2000);
 		pwd1.focus();
 		$('#chkNoticePwd1').html('패스워드를 입력해주세요.').css("color","red");
 		return false;
   	}
   	// 2. 패스워드 체크를 하지 않은 경우
   	if(pwd1.val() != pwd2.val()){
 		$("html body").animate({scrollTop:$pwdOffset.top},2000);
 		pwd2.focus();
 		$('#chkNoticePwd2').html('패스워드가 일치하지 않습니다.').css("color","red");
         return false;
 	}

 	// 이름 유효성검사
 	var name = $("#fanName");
 	var $nameOffset = $("#fanName").offset();
 	if (name.val() == ''){
 		$("html body").animate({scrollTop:$nameOffset.top},2000);
 		name.focus();
 		$('#chkNoticeName').html('이름을 입력하세요.').css("color","red");
 		return false;
 	}

     // 이메일 유효성검사
     var emailReg1 = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
     var emailReg2 = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*$/i;
     var selectEmail = $("#selectEmail option:selected").val();
     var email = $("#email");
 	var $emailOffset = $("#email-offset").offset();
     // 1. @이후를 직접작성한 경우
 	if (selectEmail == 1){
 		if(!emailReg1.test(email.val())){
 			$("html body").animate({scrollTop:$emailOffset.top},2000);
 			email.focus();
 			$('#chkNoticeEmail').html('이메일을 바르게 입력하세요.').css("color","red");
 	        return false;
 		}
 	} else {
     // 2. @이후를 선택한 경우
 		if(!emailReg2.test(email.val())){
 			$("html body").animate({scrollTop:$emailOffset.top},2000);
 			email.focus();
 			$('#chkNoticeEmail').html('이메일을 바르게 입력하세요.').css("color","red");
 	        return false;
 		}
 	}
     
     // 핸드폰 유효성검사
     var $phone = $("#phone");
     var patternPhone = new RegExp("01[016789][^0][0-9]{2,3}[0-9]{3,4}");  
 	var $phoneOffset = $("#phone").offset();
     if(!patternPhone.test($phone.val())){
 		$("html body").animate({scrollTop:$phoneOffset.top},2000);
         $phone.focus();
         $('#chkNoticePhone').html('휴대폰 번호를 바르게 입력해주세요.').css("color","red");
         $phone.keyup(function(){
             if($phone.val() != ''){
                 $('#chkNoticePhone').html('').css("color","red");
             }
         });
         return false;
     }

     // 주소 유효성검사
     var $zipcode = $("[name='address']");
     var $detail = $("[name='addressExt3']");
     var $zipOffset = $zipcode.offset();
     var $detailOffset = $detail.offset();
     if($zipcode.val() == '' || $detail.val() == '') {
         if($zipcode.val() == '') {
     		$("html body").animate({scrollTop:$zipOffset.top},2000);
             $zipcode.focus();
             $('#chkNoticeAddress').html('우편번호를 검색하여 주소를 모두 입력해주세요.').css("color","red");
             return false;
         }
         if($detail.val() == '') {
     		$("html body").animate({scrollTop:$detailOffset.top},2000);
             $deatil.focus();
             $('#chkNoticeAddress').html('상세주소까지 모두 입력해주세요.').css("color","red");
             return false;
         }
     }
 });
 function deleteFan(obj){
	 	
		var no = $(document.MypageFrm);
		const $fanId = no.find("[name=fanId]").val();
		console.log($fanId);
		
		if(confirm("정말 탈퇴 하시겠습니까?")){
			var $frm = $(document.FanDelFrm);
			$frm.find("[name=fanId]").val($fanId);
			$frm.submit();
		}
	}




</script>


<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>