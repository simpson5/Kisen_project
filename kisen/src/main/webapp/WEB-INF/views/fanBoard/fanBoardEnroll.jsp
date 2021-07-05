<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param value="게시글 등록" name="title" />
</jsp:include>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>

<!-- bootstrap js: jquery load 이후에 작성할것.-->
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy" crossorigin="anonymous"></script>

<!-- bootstrap css -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">

<!-- 사용자작성 css -->
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/fanBoard/fanBoardEnroll.css" />

<link href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css" rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.js"></script>

<script>
  $(document).ready(function() {
      $('#summernote').summernote({
          placeholder: '게시글을 작성해주세요.',
          tabsize: 2,
          height: 400,
		  toolbar: [
			    // [groupName, [list of button]]
			    ['fontname', ['fontname']],
			    ['fontsize', ['fontsize']],
			    ['style', ['bold', 'italic', 'underline','strikethrough', 'clear']],
			    ['color', ['forecolor','color']],
			    ['table', ['table']],
			    ['para', ['ul', 'ol', 'paragraph']],
			    ['height', ['height']],
			    ['view', ['fullscreen', 'help']]
			  ],
			fontNames: ['Arial', 'Arial Black', 'Comic Sans MS', 'Courier New','맑은 고딕','궁서','굴림체','굴림','돋움체','바탕체'],
			fontSizes: ['8','9','10','11','12','14','16','18','20','22','24','28','30','36','50','72']
        });
  });
</script>
<script>
//파일 첨부시 선택한 파일명이 반영되도록 설정
$(() => {
	// 파일 선택 또는 취소시
	$("[name=upFile]").change(e => {
		// 1. 파일명 가져오기
		// files속성의 0번지 : 이번에 선택한 파일
		var file = $(e.target).prop('files')[0];
		console.log(file);
		// 파일 선택시 : File {name: "졸업사진.jpg", .....} -> input:file안에 실제 file객체가 존재함
		// 파일 취소시 : undefined
		
		// 2.1. label 가져오기
		var $label = $(e.target).next(); // 형제요소
		
		// 2.2. label에 적용
		// 자동형변환 : 존재하면 true, undefined는 false
		// 파일이 존재하면 file의 name을 존재하지 않으면 "파일을 선택하세요"
		$label.html(file ? file.name : "파일을 선택하세요.");
	});
})
</script>
<h2 style="margin-top: 32px; margin-bottom: 13px; width: 62%;">팬게시글 등록</h2>
<div class="frm-container">
	<!-- 글쓰기 폼 -->
	<form 
		method="post" 
		id="enroll-frm"
		name="enroll-frm" 
		action="${pageContext.request.contextPath}/fanBoard/fanBoardEnroll.do"
		enctype="multipart/form-data">
		<input type="text" class="fill-in-area" name="fbWriter" value="${loginMember.fanId}" placeholder="작성자" readonly/><br>
		<select name="idolNo" class="fill-in-area">
			<option value="${param.idolNo}">${idolName} </option>
			<c:forEach items="${idolList}" var="idol">
				<option value="${idol.idolNo}">${idol.idolName} </option>
		    </c:forEach>
		</select>
		<input type="text" class="fill-in-area" name="fbTitle" placeholder="제목을 입력하세요."/>
		<div class="mb-3" style="padding:0px;">
		  <div class="custom-file">
		  	<!-- multiple속성 추가 -->
		    <input type="file" class="custom-file-input" name="upFile" id="upFile" multiple>
		    <label class="custom-file-label" for="upFile1">파일을 선택하세요</label>
		  </div>
		  
		<div class="upload-file-container file-preview-container">
	    </div>
		  
		<div class="content-container">
		<textarea name="fbContent" id="summernote" rows="10" cols="100" style="width:100%; height:412px;"></textarea>
		</div>
		<button type="submit" class="btn btn-block" id="enroll-btn">작성하기</button>
	</form>
</div>
<script>
$("[name=upFile]").change(function(e){
	
	var file = $(e.target).prop('files')[0];
	console.log(file);
	var $label = $(e.target).next();
	$label.html(file ? file.name : "파일을 선택하세요.");

	var files = e.target.files,
    filesLength = files.length;

	$(".upload-file-container").empty();
	if(filesLength > 0){
		$(".upload-file-container").append('<p class="file-section upload-file-section">업로드할 파일</p>');
	     //파일 선택이 여러개였을 시의 대응
	     for (var i = 0; i < filesLength; i++) {
	     	var f = files[i]
	     	var fileReader = new FileReader();
	     	fileReader.onload = (function(e) {
	     		var file = e.target;
	             //div id="preview" 내에 동적코드추가.
	             //이 부분을 수정해서 이미지 링크 외 파일명, 사이즈 등의 부가설명을 할 수 있을 것이다.
	                 var imgHtml = '<div class="d-inline-block preview-container">';
						imgHtml += '<div class="file-preview" id="pre-1"><img src="' + e.target.result + '"/>' + '</div>';
						imgHtml += '<p class="origin-attach">' + f.name + '</p>';
						imgHtml += '</div>';
	
	 	$(".upload-file-container").append(imgHtml);
	         });
	         fileReader.readAsDataURL(f);
	     }
	}
});
</script>

<script>
$("[name=enroll-frm]").submit(function(){

	var fbTitle = $("[name=fbTitle]");
	var fbContent = $("[name=fbContent]");

	var titleOffset = fbTitle.offset();
	var contentOffset = fbContent.offset();
	
	if(fbTitle.val() == '' && fbContent.val() == '') {
		alert("제목과 내용을 입력하세요.");
		fbTitle.focus();
		return false;
	}
	
	if(fbTitle.val() == '') {
		alert("제목을 입력하세요.");
		fbTitle.focus();
		return false;
	}

	if(fbContent.val() == '') {
		alert("내용을 입력하세요.");
		fbContent.focus();
		return false;
	}
});
</script>
<jsp:include page="/WEB-INF/views/common/footer.jsp"/>