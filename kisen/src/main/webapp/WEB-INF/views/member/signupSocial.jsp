<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param value="Main" name="title"/>
</jsp:include>
<!-- section start -->

<script src="http://code.jquery.com/jquery-latest.min.js"></script>

<!-- bootstrap js: jquery load 이후에 작성할것.-->
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy" crossorigin="anonymous"></script>

<!-- bootstrap css -->
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.0/css/bootstrap.min.css" integrity="sha384-9gVQ4dYFwwWSjIDZnLEWnxCjeSWFphJiwGPXr1jddIhOegiu1FwO5qRGvFXOdJZ4" crossorigin="anonymous">

<!-- 사용자작성 css -->
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/member/signup.css" />

<!-- 다음 주소 api 관련 스크립트 --> 
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
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

<div class="signup-container">
<!-- 로고 -->
<div class="term-container">
    <div id="kisen-logo">
        <img src="${pageContext.request.contextPath}/resources/images/kisen_logo.png" alt="kisen-logo">
    </div>
</div>
<!-- 회원가입 폼 -->
<form:form
	action="${pageContext.request.contextPath}/member/signup.do"
	name="signupFrm"
	method="post"
>
	<input type="hidden" name="password" value="${socialMember.password}"/>
	<input type="hidden" name="oauth" value="${socialMember.oauth}"/>
    <div>
        <label for="id">아이디<span class="required-mark"> *</span></label>
        <input type="text" class="fill-in-area" name="fanId" id="id" placeholder="5자~11자" value="${socialMember.fanId}" readonly>
    </div>
    <div>
        <label for="name">이름<span class="required-mark"> *</span></label>
        <input type="text" class="fill-in-area" name="fanName" id="fan-name" value="${socialMember.fanName}" readonly>
    </div>
    <div>
        <div>
        <label id="email-offset" for="email">이메일<span class="required-mark"> *</span></label>
        <input type="text" class="fill-in-area add1" name="email" id="email" value="${socialMember.email}"><span id="email-span">@</span>
        <select class="selectEmail" name="selectEmail" id="selectEmail">
            <option value="1" selected>직접입력</option>
            <option value="naver.com">naver.com</option> 
            <option value="hanmail.net">hanmail.net</option>
            <option value="hotmail.com">hotmail.com</option>
            <option value="nate.com">nate.com</option>
            <option value="yahoo.co.kr">yahoo.co.kr</option> 
            <option value="gmail.com">gmail.com</option>
            <option value="paran.com">paran.com</option>
        </select>
        </div>
        <p id="chkNoticeEmail" class="chkNotice"></p>
    </div>
    <div>
        <label for="phone">휴대폰<span class="required-mark"> *</span></label>
        <input type="tel" class="fill-in-area add1" name="phone" id="phone" placeholder="-없이 번호만 입력">
        <button type="button" class="add-btn reqBtn" name="req-btn">인증번호 요청</button>
        <p id="chkNoticePhoneNo" class="chkNotice"></p>
        <div id="phone-authentication">
            <input type="text" class="fill-in-area" id="chkPhone" placeholder="인증번호">
        </div>
        <p id="chkNoticePhone" class="chkNotice"></p>
        <input type="hidden" id="phoneValid" value="0"/> <!-- 이걸 보고 memberForm을 submit하는지 마는지의 여부를 결정 -->
    </div>
    <div>
        <label for="birthday">생년월일</label>
        <input type="date" class="fill-in-area" name="birthday" id="birthday" value="${socialMember.birthday}">
    </div>
    <!-- 주소 -->
    <div>
        <label for="sample6_postcode">주소<span class="required-mark"> *</span></label>
        <!-- 우편번호 검색 -->
        <div id="zip-code">
            <input type="text" class="fill-in-area add1" id="sample6_postcode" name="address" readonly placeholder="우편번호">
            <input type="button" class="add-btn" onclick="sample6_execDaumPostcode()" value="우편번호 찾기"><br>
        </div>
        <!-- 검색에 의한 주소 -->
        <div>
            <label for="sample6_address"></label>
            <input type="text" class="fill-in-area add2" name="addressExt1" id="sample6_address" readonly placeholder="주소"><br>
        </div>
        <!-- 참고항목 및 상세주소 -->
        <div>
            <label for="sample6_extraAddress"></label>
            <input type="text" class="fill-in-area add3" name="addressExt2" id="sample6_extraAddress" readonly placeholder="참고항목">
            <input type="text" class="fill-in-area add4" name="addressExt3" id="sample6_detailAddress" placeholder="상세주소">
        </div>
        <p id="chkNoticeAddress" class="chkNotice"></p>
    </div>
    <input type="hidden" name="oauth"/>
    <input type="submit" class="submit-btn" value="회원가입" >
</form:form>
</div>
<script>
$(function () {
	chkPhone = $("#chkPhone");
	chkNoticePhone = $("#chkNoticePhone");
	phoneValid = $("#phoneValid");
    rndStr = 0;
    chkNoticePhoneNo = $("#chkNoticePhoneNo");
	for(var i = 0; i < 4; i++){
	 	rndStr = rndStr + "" + Math.floor(Math.random() * 10);
	};
	
	$(document).on('click', '.reqBtn', function(e){
    	var patternPhone = new RegExp("01[016789][^0][0-9]{2,3}[0-9]{3,4}");  
		var phone = $("#phone").val();
		if(!patternPhone.test(phone)){
			chkNoticePhoneNo.html('휴대폰번호를 바르게 입력해주세요.').css("color","red");
	    } else {
			$("#chkNoticePhone").html('고객님의 휴대폰번호로 인증번호를 발송하였습니다. 인증문자를 받지 못하였다면 입력하신 휴대폰번호를 확인해주세요.').css("color","red");
		    $.ajax({
		        url : "${pageContext.request.contextPath}/member/sendSMS.do",
		        data : {
		           phone:phone,
		           rndStr:rndStr},
		        success : data => {
		           if(success) {
		           }
		        },
		        error : (xhr, stautsText, err) => {
		           console.log(xhr, statusText, err);
		        }
		     });
		}
	});

	$("#chkPhone").blur(e => {
		if(rndStr != chkPhone.val()){
			chkNoticePhone.html('인증번호가 일치하지 않습니다.').css("color","red");
			phoneValid.val(0);
		} else {
			chkNoticePhone.html('인증에 성공하였습니다.').css("color","red");
			phoneValid.val(1);
		}
	})
	
	$("#chkPhone").keyup(e => {
		chkNoticePhone.html('');		
	})
	
	$("#phone").keyup(e => {
		chkNoticePhoneNo.html('');		
	})
});
</script>
<script>
// 제출시 유효성 검사
$("[name=signupFrm]").submit(function(){

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
	var $phoneValid = $("#phoneValid");
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
    if($phoneValid.val() == 0){
		$("html body").animate({scrollTop:$phoneOffset.top},2000);
        $phone.focus();
        $('#chkNoticePhone').html('휴대폰 본인인증을 진행해주세요.').css("color","red");
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
</script>

<!-- section end -->
<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>