<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>	
<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param value="비밀번호 찾기" name="title"/>
</jsp:include>
<!-- section start -->

<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<!--  <script src="https://www.google.com/recaptcha/api.js" async defer></script> -->

<!-- bootstrap js: jquery load 이후에 작성할것.-->
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy" crossorigin="anonymous"></script>

<!-- bootstrap css -->
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.0/css/bootstrap.min.css" integrity="sha384-9gVQ4dYFwwWSjIDZnLEWnxCjeSWFphJiwGPXr1jddIhOegiu1FwO5qRGvFXOdJZ4" crossorigin="anonymous">

<!-- 사용자작성 css -->
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/member/signup.css" />

<script src="http://code.jquery.com/jquery-latest.min.js"></script>

<!-- bootstrap js: jquery load 이후에 작성할것.-->
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy" crossorigin="anonymous"></script>

<!-- bootstrap css -->
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.0/css/bootstrap.min.css" integrity="sha384-9gVQ4dYFwwWSjIDZnLEWnxCjeSWFphJiwGPXr1jddIhOegiu1FwO5qRGvFXOdJZ4" crossorigin="anonymous">

<!-- 사용자작성 css -->
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/member/searchIdAndPwd.css" />

<div class="frm-container col-12">
    <!-- 비밀번호 찾기, 아이디 찾기 nav -->
    <ul class="nav nav-tabs">
        <li class="nav-item">
        <a class="nav-link inactive" href="${pageContext.request.contextPath}/member/searchId.do">아이디 찾기</a>
        </li>
        <li class="nav-item">
        <a class="nav-link active" href="${pageContext.request.contextPath}/member/searchPwd.do">비밀번호 찾기</a>
        </li>
    </ul>
    <!-- 이메일로 찾기, 휴대폰으로 찾기 선택 radio -->
    <div class="search-radio-container">
        <div class="radio-container">
            <input type="radio" name="search-id" id="searchWithEmail" checked>
            <label for="search-id">이메일로 찾기</label>
        </div>
        <div class="radio-container">
            <input type="radio" name="search-id" id="searchWithPhone">
            <label for="search-id">휴대폰으로 찾기</label>
        </div>
    </div>
    <div class="search-area-container">
        <!-- 이메일로 찾기 진행 입력 폼 -->
        <form name="searchEmailFrm"
        	  action="${pageContext.request.contextPath}/member/searchPwdSendMail.do">
            <p class="fill-in-type">이름</p>
            <input type="text" class="search-area searchEmail" name="name" id="emailName">
            <p id="chkNoticeName" class="chkNotice"></p>
            <p class="fill-in-type">이메일</p>
            <input type="text" class="search-area searchEmail" name="email" id="emailEmail"><span id="email-span">@</span>
            <select class="searchEmail" name="selectEmail" id="selectEmail">
                <option value="1" selected>직접입력</option>
                <option value="naver.com">naver.com</option> 
                <option value="hanmail.net">hanmail.net</option>
                <option value="hotmail.com">hotmail.com</option>
                <option value="nate.com">nate.com</option>
                <option value="yahoo.co.kr">yahoo.co.kr</option> 
                <option value="gmail.com">gmail.com</option>
                <option value="paran.com">paran.com</option>
            </select>
            <p id="chkNoticeEmail" class="chkNotice"></p>
            <button type="submit" class="btn btn-block search-btn">비밀번호 찾기</button>
        </form>
        <!-- 휴대폰으로 찾기 진행 입력 폼 -->
        <form  
        	  name="searchPhoneFrm"
        	  method="post"
        	  action="${pageContext.request.contextPath}/member/checkInfoPhoneForPwd.do"
        	  style="display: none;">
            <p class="fill-in-type">이름</p>
            <input type="text" class="search-area" name="fanName" id="phoneName">
            <p id="chkNoticeNamePhone" class="chkNotice"></p>
            <p class="fill-in-type">휴대전화</p>
            <input type="text" class="search-area" name="phone" id="phone" maxlength="11" placeholder="-없이 입력">
            <p id="chkNoticePhone" class="chkNotice"></p>
            <button type="submit" class="btn btn-block search-btn">비밀번호 찾기</button>
        </form>
        <div class="text-right login-a">
        <a href="${pageContext.request.contextPath}/member/login.do">로그인하러 가기</a>
        </div>
    </div>
</div>

<script>
$(() => {
    $("#searchWithPhone").click(function(){
        if($("#searchWithPhone").is(":checked")) {
        $("[name=searchEmailFrm]").hide();
        $("[name=searchPhoneFrm]").show();
    } 
    });
});
$(() => {
    $("#searchWithEmail").click(function(){
        if($("#searchWithEmail").is(":checked")) {
        $("[name=searchEmailFrm]").show();
        $("[name=searchPhoneFrm]").hide();
    } 
    });
});
</script>

<!-- 이메일로 찾기 script -->
<script>
$('#emailName').keyup(function(){
	$('#chkNoticeName').html('');
});

$('#emailEmail').keyup(function(){
	$('#chkNoticeEmail').html('');
});

// 제출 전 검사
$("[name=searchEmailFrm]").submit(function(){
	console.log("여기 지나감!");
	var name = $("#emailName").val();
	var email = $("#emailEmail").val();
    var selectEmail = $("#selectEmail option:selected").val();
	var searchEmailFrm = $("[name=searchEmailFrm]");
    var emailReg1 = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;

    if(selectEmail != 1) {
        var email = email + "@" + selectEmail;
    } 

    console.log(name);
    console.log(email);
    console.log(selectEmail);
   
  	// 1. 이름을 입력하지 않은 경우
  	if(name == ''){
		$("#emailName").focus();
		$('#chkNoticeName').html('이름을 입력해주세요.');
		return false;
  	}
  	// 1. 이메일을 입력하지 않은 경우
  	if(email == ''){
  		$("#emailEmail").focus();
		$('#chkNoticeEmail').html('이메일을 입력해주세요.');
		return false;
  	}
    // 1. @이후를 직접작성한 경우
	if(!emailReg1.test(email)){
		$("#emailEmail").focus();
		$('#chkNoticeEmail').html('이메일을 바르게 입력하세요.');
        return false;
	}
	// {id:id} -> {id}로 줄여쓸 수 있음 -> {id : "abcde"}
	$.ajax({
		url : "${pageContext.request.contextPath}/member/checkInfoEmail.do",
		data : {
				name:name,
				email:email},
		success : data => {
			console.log(data); 
			const {available} = data;
		    
			// 사용가능한 경우
			// if(data.available){
			if(available) {
				alert("고객님의 비밀번호를 임의의 비밀번호로 변경하였습니다. 이메일을 확인하여 주세요.");
			}
			// 사용불가한 경우
			else {
				alert("입력된 정보로 정확한 회원정보가 조회되지 않습니다. 정보를 다시 입력하거나 휴대전화로 찾기를 이용하세요.");
				return false;
			}
		},
		error : (xhr, stautsText, err) => {
			console.log(xhr, statusText, err);
		}
	});
});
</script>

<!-- 휴대폰으로 찾기 script -->
<script>
$("[name=searchPhoneFrm]").submit(function(){
	console.log("여기 지나감!");
	var fanName = $("#phoneName").val();
	var phone = $("#phone").val();
	var searchPhoneFrm = $("[name=searchPhoneFrm]");
  	// 1. 이름을 입력하지 않은 경우
  	if(fanName == ''){
		$("#phoneName").focus();
		$('#chkNoticeNamePhone').html('이름을 입력해주세요.');
		return false;
  	}
  	// 2. 핸드폰번호 유효성검사	
  	if(!patternPhone.test(phone)){
  		$("#phone1").focus();
		$('#chkNoticePhone').html('핸드폰 번호를 바르게 입력해주세요.');
		return false;
  	}
});
</script>
<!-- section end -->
<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>