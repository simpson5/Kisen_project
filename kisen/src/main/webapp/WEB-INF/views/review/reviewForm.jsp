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
  <script src="${pageContext.request.contextPath}/resources/js/summernote/summernote-lite.js"></script>
  <script src="${pageContext.request.contextPath}/resources/js/summernote/lang/summernote-ko-KR.js"></script>
  <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/summernote/summernote-lite.css">
  
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
	<form 
		role="form"
		action="${pageContext.request.contextPath}/review/reviewInsert" 
		method="post" 
		enctype="multipart/form-data" >
		<div class="pd-info">
			<p>상품 정보 : <span style="color: #0066ff; font-size: 15px;">${product.pdName}</span></p><br />
		</div>
		<div class="form-group">
			<label for="title">title:</label> <input type="text"
				class="form-control" placeholder="제목을 입력해주세요" id="title" name="reviewTitle" required="required" />
		</div>
		<div class="form-group">
			<label for="content">content:</label>
			<textarea class="form-control" id="summernote" rows="5" name="reviewContent" style="width: 100%"></textarea>
		</div>
		<div id="edit" style="margin:0 auto;">
			<div class="py-2" style="text-align:center;">
				<input type="hidden" name="pdNo" value="${product.pdNo}"/>
				<button type="submit" id="saveBtn" class="btn btn-outline-warning mx-auto">글쓰기등록</button>
				<button type="button" id="backBtn" class="btn btn-outline-warning mx-auto">취소</button>	
			</div>
			
		</div>
	</form>
	</div>
</div>
<script>
$(document).ready(function () {
    $('#summernote').summernote({
      height: 500,                 
      minHeight: 500,            
      maxHeight: 500,            
      focus: true,                  
      lang: "ko-KR",					
      placeholder: '내용을 입력해주세요.',	
      toolbar: [
        ['fontname', ['fontname']],
        ['fontsize', ['fontsize']],
        ['style', ['bold', 'italic', 'underline', 'strikethrough', 'clear']],
        ['color', ['forecolor', 'color']],
        ['table', ['table']],
        ['para', ['ul', 'ol', 'paragraph']],
        ['height', ['height']],
        ['insert', ['picture', 'link', 'video']],
        ['view', ['fullscreen', 'help']]
      ],
      fontNames: ['Arial', 'Arial Black', 'Comic Sans MS', 'Courier New', '맑은 고딕', '궁서', '굴림체',
        '굴림', '돋음체', '바탕체'],
      fontSizes: ['8', '9', '10', '11', '12', '14', '16', '18', '20', '22', '24', '28', '30', '36',
        '50', '72']
    });
  });
</script>

<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>

