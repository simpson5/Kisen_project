  <%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param value="구매 후기 - ${product.pdName}" name="title" />
</jsp:include>

  
   <link href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css" rel="stylesheet">
  <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
  <script src="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>.
  
  <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/lib/summernote-lite.css">
  <script src="${pageContext.request.contextPath}/resources/lib/summernote-lite.js"></script>
  <script src="${pageContext.request.contextPath}/resources/lib/summernote-ko-KR.js"></script>
<style>
.btn-outline-warning {
	color: #9033b5;
	background-color: transparent;
	background-image: none;
	border-color: #9033b5;
}

.btn-outline-warning:hover {
	color: white;
	background-color: #c7a2e0;
	background-image: none;
	border-color: #c7a2e0;
}
div#container{
	margin-top: 50px;
}
</style>
<div id="wrap">
	<div class="container" id="container">
	<form id="reviewForm" 
		role="form"
		action="${pageContext.request.contextPath}/review/reviewInsert" 
		method="post" 
		enctype="multipart/form-data" >
		<div class="pd-info">
			<p>상품 정보 : <span style="color: #0066ff; font-size: 15px;">${product.pdName}</span></p><br />
		</div>
		<div class="form-group">
			<label for="title">title:</label> <input type="text"
				class="form-control" placeholder="제목을 입력해주세요" id="title" name="title" required="required">
		</div>
		<div class="form-group">
			<label for="content">content:</label>
			<textarea class="form-control summernote" rows="5" name="content" style="width: 100%"></textarea>
		</div>
		<div id="edit" style="margin:0 auto;">
			<div class="py-2" style="text-align:center;">
				<button type="submit" id="saveBtn" class="btn btn-outline-warning mx-auto">글쓰기등록</button>
				<button type="button" id="backBtn" class="btn btn-outline-warning mx-auto">취소</button>	
			</div>
			
		</div>
	</form>
	</div>
</div>
<script>
$(document).ready(function() {

	var toolbar = [
		    // 글꼴 설정
		    ['fontname', ['fontname']],
		    // 글자 크기 설정
		    ['fontsize', ['fontsize']],
		    // 굵기, 기울임꼴, 밑줄,취소 선, 서식지우기
		    ['style', ['bold', 'italic', 'underline','strikethrough', 'clear']],
		    // 글자색
		    ['color', ['forecolor','color']],
		    // 표만들기
		    ['table', ['table']],
		    // 글머리 기호, 번호매기기, 문단정렬
		    ['para', ['ul', 'ol', 'paragraph']],
		    // 줄간격
		    ['height', ['height']],
		    // 그림첨부, 링크만들기, 동영상첨부
		    ['insert',['picture','link','video']],
		    // 코드보기, 확대해서보기, 도움말
		    ['view', ['codeview','fullscreen', 'help']]
		  ];

	var setting = {
            height : 300,
            minHeight : null,
            maxHeight : null,
            focus : true,
            lang : 'ko-KR',
            toolbar : toolbar,
            callbacks : { //여기 부분이 이미지를 첨부하는 부분
            onImageUpload : function(files, editor,
            welEditable) {
            for (var i = files.length - 1; i >= 0; i--) {
            uploadSummernoteImageFile(files[i],
            this);
            		}
            	}
            }
         };

        $('.summernote').summernote(setting);
        
        });
        
</script>

<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>

