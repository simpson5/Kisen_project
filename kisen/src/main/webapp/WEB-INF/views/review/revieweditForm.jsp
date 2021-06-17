
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<jsp:include page="/WEB-INF/views/common/header.jsp"></jsp:include>



<link
	href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css"
	rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<link
	href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.css"
	rel="stylesheet">
<script
	src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.js"></script>


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
</style>


<body>
	<section>
		<div class="form-group">
			<label for="title">title:</label> <input type="text"
				class="form-control" placeholder="title" id="title" name="title">
		</div>
		<div class="form-group">
			<label for="content">content:</label>
			<textarea class="form-control" rows="5" id="summernote"
				name="content"></textarea>
		</div>

		<script>
			$(document).ready(function() {
				//여기 아래 부분
				$('#summernote').summernote({
					height : 300, // 에디터 높이
					minHeight : null, // 최소 높이
					maxHeight : null, // 최대 높이
					focus : true, // 에디터 로딩후 포커스를 맞출지 여부
					lang : "ko-KR", // 한글 설정
					placeholder : '최대 2000자까지 쓸 수 있습니다' //placeholder 설정

				});
			});
		</script>
		<div class="col-2" id="edit">
			<div class="py-2">
				<button type="button" class="btn btn-outline-warning">수정하기</button>

			</div>

</section>
</body>
</html>

<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>
