<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param value="Main" name="title"/>
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
    <!-- 찾기 진행 입력 폼 -->
    <div class="search-area-container">
        <form action="" id="searchFrm">
            <p class="fill-in-type">이름</p>
            <input type="text" class="search-area searchEmail" name="name" id="name">
            <p class="fill-in-type">아이디</p>
            <input type="text" class="search-area searchEmail" name="id" id="id">
            <p class="fill-in-type">이메일</p>
            <input type="email" class="search-area searchEmail" name="email" id="email">
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
            <button type="submit" class="btn btn-block searchEmail">비밀번호 찾기</button>
        </form>
    </div>
</div>

<script>
$(() => {
    $("#searchWithPhone").click(function(){
        if($("#searchWithPhone").is(":checked")) {
        $(".searchEmail").hide();
        $("#searchFrm").append('<input type="text" class="search-area searchPhone" name="name" id="name" placeholder="이름">');
        $("#searchFrm").append('<input type="tel" class="search-area searchPhone" name="phone" id="phone" placeholder="휴대전화">');
        $("#searchFrm").append('<input type="button" class="add-btn searchPhone" value="인증요청">');
        $("#searchFrm").append('<button type="submit" class="btn btn-block searchPhone">비밀번호 찾기</button>');
    } 
    });
});
$(() => {
    $("#searchWithEmail").click(function(){
        if($("#searchWithEmail").is(":checked")) {
        $(".searchEmail").show();
        $(".searchPhone").hide();
    } 
    });
});
</script>

<script type="text/javascript"> //이메일 입력방식 선택 
$('#selectEmail').change(function(){ 
        $("#selectEmail option:selected").each(function () { 
        if($(this).val() == '1'){ //직접입력일 경우 
            $("#str_email02").val(''); //값 초기화 
            $("#str_email02").attr("disabled",false); //활성화
        }else{ //직접입력이 아닐경우 
            $("#str_email02").val($(this).text()); //선택값 입력 
            $("#str_email02").attr("disabled",true); //비활성화
        } 
    }); 
});
</script>


<!-- section end -->
<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>