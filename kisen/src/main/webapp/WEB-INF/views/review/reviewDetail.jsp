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
    .btn-main{
        background-color: #C8A9C8;
        color: white;
        font-weight: bold;
    }
    .notice{
        height: 600px;
        width: 100%;
    }
</style>
<div id="wrap">
	<div class="container">
	    <h5 class="mt-5" style="font-weight: bold;">| 상품명 : ${product.pdName}</h5>
	    <hr>
	    <table class="table">
	        <thead>
	            <tr>
	                <th>제목</th>
	                <th>${review.reviewTitle}</th>
	            </tr>
	            <tr>
	                <th>작성자</th>
	                <th>${review.fanId}</th>
	            </tr>
	            <tr>
	                <th>작성일</th>
	                <th>${review.reviewDate}</th>
	            </tr>
	            <tr>
	                <th>조회수</th>
	                <th>${review.readCnt}</th>
	            </tr>
	            <tr>
	                <th>추천수</th>
	                <th>${review.recoCnt}</th>
	            </tr>
	        </thead>
	        <tbody>
	            <tr>
	                <td colspan="2">
	                    <textarea class="form-control" id="summernote" rows="5" name="reviewContent" style="width: 100%; background-color: #fff">
	                    ${review.reviewContent }
	                    </textarea>
	                </td>
	            </tr>
	            <tr>
	                <td colspan="2">
	                <div class=" text-center">
	                    <div class="mt-1 row">
	                        <div class="col-6 d-grid">
	                        <c:if test="${loginMember.fanId eq review.fanId}">
	                            <button type="button" class="btn btn-sm btn-dark" style="width: 100%;" onclick="location.href='${pageContext.request.contextPath}/review/reviewUpdate?no=${review.pdNo}&reviewNo=${review.reviewNo}'">수정하기</button>	                        	
	                        </c:if>
	                        <c:if test="${loginMember.fanId ne review.fanId}">
	                            <button type="button" class="btn btn-sm btn-dark" style="width: 100%;">추천하기</button>
	                        </c:if>
	                        </div>
	                        <div class="col-6 d-grid">
	                            <button type="button" class="btn btn-sm btn-main" style="width: 100%;" onclick="location.href='${pageContext.request.contextPath}/product/productInfo?no=${review.pdNo}'">목록으로</button>
	                        </div>
	                    </div>
	                </div>
	                </td>
	            </tr>
	        </tbody>
	    </table>
	</div>
</div>    
<%@ include file="/WEB-INF/views/common/footer.jsp"%>

<script>
$(document).ready(function () {
 	$('#summernote').summernote({
 	 disableResizeEditor: true,
 	 disableGrammar: false,
 		toolbar : []
 	});
	$('#summernote').summernote('disable');
	$('#summernote').summernote('backColor','white');
	

});
  
$(".reply_delete_btn").click(function(){
	
	var reply_no = $(this).next().val();
	
	console.log(reply_no);
	
	var comment_no = $("[name=reply_no]").val();
	$.ajax({
		url: "${pageContext.request.contextPath}/review/",
		data : {
			no : reply_no
		},
		seccess : function(data){
			console.log(1);
			if(data > 0){
				swal("삭제 성공");
			} else {
				swal("삭제 실패");
			}
			
		},
		error : function(xhr, status, err){
			console.log(xhr,status, err);
		}
	})
	
})
</script>


<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>
