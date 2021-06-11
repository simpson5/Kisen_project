<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>

<script src="http://code.jquery.com/jquery-latest.min.js"></script>

<!-- bootstrap js: jquery load 이후에 작성할것.-->
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy" crossorigin="anonymous"></script>

<!-- bootstrap css -->
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.0/css/bootstrap.min.css" integrity="sha384-9gVQ4dYFwwWSjIDZnLEWnxCjeSWFphJiwGPXr1jddIhOegiu1FwO5qRGvFXOdJZ4" crossorigin="anonymous">

<!-- 사용자작성 css -->
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/member/login.css" />

<script>
// modal : bootstrap이 제공하는 디자인된 팝업창
$(() => {
	$("#loginModal")
		.modal() // modal이 튀어나오는 함수
		.on('hide.bs.modal', e => {
			// hide.bs.modal - modal을 비활성화할 때 일어나는 이벤트
			// console.log(e);
			// location.href = '${header.referer}';
			/* header.referer - 현재 페이지에 오기 이전 페이지로 돌아감
			   dev 목록에서 로그인 - 취소 -> dev 목록으로 돌아감, index페이지에서 로그인 - 취소 -> index페이지로 돌아감 */
			// 해결법 : header.referer가 비어있거나 referer가 로그인 페이지라면 index로 이동, 값이 있을 경우에만 referer로 이동
			location.href =
				'${empty header.referer || fn:contains(header.referer, '/member/login.do') ? pageContext.request.contextPath : header.referer}';
		}) 
})
</script>
</head>
<body>
	<!-- Modal시작 -->
	<!-- https://getbootstrap.com/docs/4.1/components/modal/#live-demo -->
	<div class="modal fade" id="loginModal" tabindex="-1" role="dialog"
		aria-labelledby="loginModalLabel" aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<!-- modal 헤더부 -->
				<div class="modal-header">
					<h5 class="modal-title" id="loginModalLabel">로그인</h5>
					<button type="button" class="close" data-dismiss="modal" aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<!--로그인 폼 / modal 바디부 -->
				<!-- https://getbootstrap.com/docs/4.1/components/forms/#overview -->
				<form
					action="${pageContext.request.contextPath}/member/memberLogin.do"
					method="post"
					name="loginFrm">
				<div class="modal-body">
					<div id="logo">
							<img src="${pageContext.request.contextPath}/resources/images/member/kisen_logo.png" alt="kisen-logo">
					</div>
						<input type="tel" class="fill-in-area" name="fan_id" id="fan_id" placeholder="아이디">
						<p id="chkNoticeId" class="chkNotice"></p>
						<input type="tel" class="fill-in-area" name="password" id="password" placeholder="비밀번호">
						<p id="chkNoticePwd" class="chkNotice"></p>
					</div>
					<div>
						<button type="submit" class="btn btn-block">로그인</button>
					</div>
					<div name="saveId">
						<input type="checkbox" id="saveId" class="checkbox-style" />
						<label for="saveId">로그인 상태 유지</label>
					</div>
					<div class="login-ext" style="text-align: center;">
					<a href="${pageContext.request.contextPath}/member/searchId.do">아이디 찾기</a>
					 <span>|</span>
					<a href="#">비밀번호 찾기</a>
					<span>|</span>
					<a href="${pageContext.request.contextPath}/member/signupTerm.do">회원가입</a>
					</div>
						<div class="login-social">
							<img src="${pageContext.request.contextPath}/resources/images/member/kakao_login_large_wide.png" id="kakao-log" alt="login with kakao">
							<img src="${pageContext.request.contextPath}/resources/images/member/kakao_login_large_wide.png" id="kakao-log" alt="login with kakao">
						</div>
				</form>
			</div>
		</div>
	</div>
	<!-- Modal 끝-->
</body>
</html>

<script>
$("[name=loginFrm]").submit(function(){

	var $id = $("#fan_id");
	var $pwd = $("#password");

	if($id.val() == ''){
		$('#chkNoticeId').html('아이디를 입력해주세요.');
			$id.select();
        $id.keyup(function(){
            if($id.val() != ''){
                $('#chkNoticeId').html('');
            }
        });
		return false;
	}

	if($pwd.val() == ''){
		$('#chkNoticePwd').html('패스워드를 입력해주세요.');
			$pwd.select();
        $pwd.keyup(function(){
            if($pwd.val() != ''){
                $('#chkNoticePwd').html('');
            }
        });
		return false;
	}
});
</script>
