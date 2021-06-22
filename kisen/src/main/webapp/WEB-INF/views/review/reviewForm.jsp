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
  <script src="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
  <link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.css" rel="stylesheet">
  <script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.js"></script>
  <!-- include summernote-ko-KR -->
   <script src="lang/summernote-ko-KR.js"></script>
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
	<form id="reviewForm" role="form" action="/review/reviewInsert" method="post">
		<div class="pd-info">
			<p>상품 정보 : <span style="color: #0066ff; font-size: 15px;">${product.pdName}</span></p><br />
		</div>
		<div class="form-group">
			<label for="title">title:</label> <input type="text"
				class="form-control" placeholder="제목을 입력해주세요" id="title" name="title" required="required">
		</div>
		<div class="form-group">
			<label for="content">content:</label>
			<textarea class="form-control" rows="5" id="summernote"
				name="content" style="width: 100%"></textarea>
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
		console.log($.summernote.options); 
		// 실행시 언어 설정을 한글로 설정 
		$.summernote.options.lang = 'ko-KR'; 
		$.summernote.options.airMode = false;

		//여기 아래 부분
		$('#summernote').summernote({
			  height: 300,                 // 에디터 높이
			  minHeight: null,             // 최소 높이
			  maxHeight: null,             // 최대 높이
			  focus: true,                  // 에디터 로딩후 포커스를 맞출지 여부
			  lang: "ko-KR",					// 한글 설정
			  placeholder: '최대 2000자까지 쓸 수 있습니다'	,//placeholder 설정
			  callbacks: {
			  	onImageUpload: function(files, editor, welEditable){
			  		for( var i = files.length - 1; i >= 0; i--){
			  			sendFile(files[i], this);
			  		}
			  	}
			  }			  
		});
	});
	 function sendFile(file, el) {
      var form_data = new FormData();
      form_data.append('file', file);
      $.ajax({
        data: form_data,
        type: "POST",
        url: '/image',
        cache: false,
        contentType: false,
        enctype: 'multipart/form-data',
        processData: false,
        success: function(url) {
          $(el).summernote('editor.insertImage', url);
          $('#imageBoard > ul').append('<li><img src="'+url+'" width="480" height="auto"/></li>');
        }
      });
    }
</script>

<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>

