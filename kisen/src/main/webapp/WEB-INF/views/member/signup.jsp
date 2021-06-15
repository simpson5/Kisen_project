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
<form 
	action="${pageContext.request.contextPath}/member/signup.do"
	name="signupFrm"
	method="post"
>
    <div>
        <label for="id">아이디<span class="required-mark"> *</span></label>
        <input type="text" class="fill-in-area" name="fanId" id="id" placeholder="5자~11자">
        <p id="chkNoticeIdDuplicate" class="chkNotice"></p>
        <input type="hidden" id="idValid" value="0"/> <!-- 이걸 보고 memberForm을 submit하는지 마는지의 여부를 결정 -->
    </div>
    <div>
        <label for="password">패스워드<span class="required-mark"> *</span></label>
        <input type="password" class="fill-in-area" name="password" id="password" placeholder="숫자,영문,특수문자 조합 최소6자">
        <p id="chkNoticePwd1" class="chkNotice"></p>
    </div>
    <div>
        <label for="password">패스워드 재확인<span class="required-mark"> *</span></label>
        <input type="password" class="fill-in-area" name="passwordCheck" id="passwordCheck">
        <p id="chkNoticePwd2" class="chkNotice"></p>
    </div>
    <div>
        <label for="name">이름<span class="required-mark"> *</span></label>
        <input type="text" class="fill-in-area" name="fanName" id="name">
        <p id="chkNoticeName" class="chkNotice"></p>
    </div>
    <div>
        <div>
        <label for="email">이메일<span class="required-mark"> *</span></label>
        <input type="text" class="fill-in-area add1" name="email" id="email">
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
        <input type="tel" class="fill-in-area" name="phone" id="phone" placeholder="-없이 번호만 입력">
        <div id="phone-authentication">
            <input type="text" class="fill-in-area add1" placeholder="인증번호">
            <input type="button" class="add-btn" onclick="requestEmail()" value="인증번호 요청"><br>
        </div>
        <p id="chkNoticePhone" class="chkNotice"></p>
    </div>
    <div>
        <label for="birthday">생년월일</label>
        <input type="date" class="fill-in-area" name="birthday" id="birthday">
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
    <input type="submit" class="submit-btn" data-toggle="modal" data-target="#exampleModal" value="회원가입" >
    </form>
      <!-- Modal -->
  <div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog" role="document">
      <div class="modal-content">
        <div class="modal-header">
          <h5 class="modal-title" id="exampleModalLabel">회원가입</h5>
          <button type="button" class="close" data-dismiss="modal" aria-label="Close">
            <span aria-hidden="true">&times;</span>
          </button>
        </div>
        <div class="modal-body">
          회원가입이 완료되었습니다.
        </div>
        <div class="modal-footer">
          <button type="button" data-dismiss="modal" class="btn btn-outline-secondary">확인</button>
        </div>
      </div>
    </div>
  </div>
</div>


<script>
$("#id").keyup(e => {
	const id = $(e.target).val();
	const $chkNoticeDupl = $("#chkNoticeIdDuplicate");
	const $idValid = $("#idValid"); // 0 -> 1 (중복검사 성공시)
    
	if(id.length < 5) {
		// 4글자 이상을 썼다가 지우는 경우를 대비해서
		$chkNoticeDupl.html('');
		$idValid.val(0); // 다시 작성하는 경우를 대비, idValid를 다시 0으로 만들기
		return; // 네글자 이상일 때만 검사할 수 있도록 return
	}
	// {id:id} -> {id}로 줄여쓸 수 있음 -> {id : "abcde"}
	$.ajax({
		url : "${pageContext.request.contextPath}/member/checkIdDuplicate.do",
		data : {id},
		success : data => {
		// success : ({available}) => {
			console.log(data); // {"available" : true} 이런식으로 json으로 넘어올 것
			const {available} = data;
		    
			// 사용가능한 경우
			// if(data.available){
			if(available) {
				$chkNoticeDupl.html('이 아이디는 사용가능합니다.').css("color","rgb(117, 59, 93)");
				$idValid.val(1);
			}
			// 사용불가한 경우
			else {
				$chkNoticeDupl.html('이 아이디는 사용하실 수 없습니다..').css("color","red");
				$idValid.val(0);
			}
		},
		error : (xhr, stautsText, err) => {
			console.log(xhr, statusText, err);
		}
	});
});


// 인증번호 요청 클릭 이벤트
function requestEmail(){
    $('#chkNoticeEmail').html('인증번호를 발송했습니다. 인증번호가 오지 않으면 입력하신 정보가 정확한지 확인하여 주세요. 이미 가입된 이메일이거나, 가상이메일은 인증번호를 받을 수 없습니다.').css("color","red");
}

$(function(){
    $('#password').blur(function(){
        if($('#password').val().length < 6){
            $('#chkNoticePwd1').html('비밀번호는 6자리 이상이어야 합니다.').css("color","red");
        } else {
            $('#chkNoticePwd1').html('');        
        }
    });

    $('#passwordCheck').keyup(function(){
        if($('#password').val() == ''){
            $('#chkNoticePwd1').html('패스워드부터 입력해주세요.').css("color","red");
            $('#password').select();
            $('#password').keyup(function(){
            	$('#chkNoticePwd1').html('');
            });
            $('#password').blur(function(){
                if($('#password').val().length < 6){
                    $('#chkNoticePwd1').html('비밀번호는 6자리 이상이어야 합니다.').css("color","red");
                } else {
                    $('#chkNoticePwd1').html('');        
                }
            });
        }
        
        if($('#passwordCheck').val().length > 3){
        if($('#password').val() != $('#passwordCheck').val()){
          $('#chkNoticePwd2').html('패스워드가 일치하지 않습니다.').css("color","red");
        } else{
          $('#chkNoticePwd2').html('패스워드가 일치합니다.').css("color","rgb(117, 59, 93)");
        }
    }
    });
});



$("[name=signupFrm]").submit(function(){
    // 패스워드 유효성검사
	var $password = $("#password"), $passwordCheck = $("#passwordCheck");
	if($password.val() != $passwordCheck.val()){
		$password.select();
        return false;
	}

    // 핸드폰 유효성검사
    var $phone = $("#phone");
    var patternPhone = new RegExp("01[016789][^0][0-9]{2,3}[0-9]{3,4}");  
    if(!patternPhone.test($phone.val())){
        $phone.select();
        $('#chkNoticePhone').html('휴대폰 번호를 제대로 입력해주세요.').css("color","red");
        $phone.keyup(function(){
            if($phone.val() != ''){
                $('#chkNoticePhone').html('').css("color","red");
            }
        });
        return false;
    }

    // 주소 유효성검사
    var $zipcode = $("[name='addressExt1']");
    var $detail = $("[name='addressExt3']");

    if($zipcode.val() == '' || $detail.val() == '') {
        $('#chkNoticeAddress').html('주소를 모두 입력해주세요.').css("color","red");
        $zipcode.select();
        return false;

        $zipcode.change(function(){
            if($zipcode.val() != '' && $detail.val() != ''){
                $('#chkNoticeAddress').html('');
            }
        })
        $detail.keyup(function(){
            if($zipcode.val() != '' && $detail.val() != ''){
                $('#chkNoticeAddress').html('');
            }
        })
    }
});
</script>

<!-- section end -->
<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>