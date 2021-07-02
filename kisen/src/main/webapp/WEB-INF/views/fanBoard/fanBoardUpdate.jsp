<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param value="글등록" name="title" />
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
<h2 style="margin-top: 32px; margin-bottom: 13px; width: 62%;">팬게시글 수정</h2>
<div class="frm-container">
	<!-- 글쓰기 폼 -->
	<form 
		method="post" 
		id="enroll-frm" 
		action="${pageContext.request.contextPath}/fanBoard/fanBoardUpdate.do"
		enctype="multipart/form-data">
		<input type="hidden" class="fill-in-area" name="fbNo" value="${fanBoard.fbNo}" placeholder="작성자" readonly/><br>
		<input type="text" class="fill-in-area" name="fbWriter" value="${fanBoard.fbWriter}" placeholder="작성자" readonly/><br>
		<select name="idolNo" class="fill-in-area">
			<option value="${fanBoard.idolNo}">${idolName} </option>
			<c:forEach items="${idolList}" var="idol">
				<option value="${idol.idolNo}">${idol.idolName} </option>
		    </c:forEach>
		</select>
		<input type="text" class="fill-in-area" value="${fanBoard.fbTitle}" name="fbTitle" placeholder="제목을 입력하세요."/>
		
		<!-- 첨부파일 부분 -->
		<div class="mb-3" style="padding:0px;">
		  <div class="custom-file">
		  	<!-- multiple속성 추가 -->
		    <input type="file" class="custom-file-input" name="upFile" id="upFile" multiple>
		    <label class="custom-file-label" for="upFile1">파일을 선택하세요</label>
		  </div>
		  
		  <!-- 1) 기존파일 -->
		  <div class="file-preview-container">
		  <p class="file-section">기존파일</p>
		  <c:forEach items="${fanBoard.attachList}" var="attach" varStatus="vs">
		  <div class="d-inline-block preview-container">
		  	<div class="file-preview" id="pre-1"><img src="${pageContext.request.contextPath}/resources/upload/fanBoard/${attach.renamedFilename}"/>
		  	</div>
		  	<p class="origin-attach">${attach.originalFilename}</p>
		  	<div class="form-check form-switch d-inline-block">
  				<input style="margin-left: 4.5em;, margin-top: 3px;" class="form-check-input delFile" 
  					type="checkbox" name="delFile" id="delFile" value="${attach.fbAttachNo}">
  				<label style="margin-left: 96px;" class="form-check-label" for="delFile">삭제하기</label>
			</div>
		  	</div>
		  </c:forEach>
		</div>
	    <!-- 2) 업로드할 파일 -->
	    <div class="upload-file-container file-preview-container">
	    </div>
		
		<!-- 내용 부분 -->
		<div class="content-container">
		<textarea name="fbContent" id="summernote" rows="10" cols="100" style="width:100%; height:412px;">${fanBoard.fbContent}</textarea>
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
    
// input id 값 
	
	console.log($(this).val()); // 파일 선택 - 파일명, 선택 x - 빈문자열
	if($(this).val() != ""){
		// 파일 변경 -> 체크
		$('.delFile')
			.prop("checked", true)
			// 파일이 변경된다면, check박스를 누르지 못하도록
			// 클릭했을 때 함수로 return false를 걸어주면 클릭이 작동하지 않게 비활성화
			.on('click', function(){
				return false;
			});
	} else {
		// 파일을 변경하려다가 다시 파일 선택 취소 -> 체크 해제
		$('.delFile').prop("checked", false)
			// 취소하면 다시 정상적으로 작동할 수 있도록 click했을 때의 이벤트핸들러 제거
			// cf. on (이벤트 핸들러를 추가) <-> off (이벤트 핸들러 제거)
			.off('click');
	}
});
</script>
<jsp:include page="/WEB-INF/views/common/footer.jsp"/>