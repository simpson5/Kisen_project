<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<jsp:include page="/WEB-INF/views/common/admin_header.jsp">
	<jsp:param value="모든 상품" name="title"/>
</jsp:include>

<!-- include summernote css/js-->
<link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.js"></script>

<div class="container">
    <h5 class="mt-5" style="font-weight: bold;">| NOTICE WRITE</h5>
    <hr>
    <form method="post">
	    <table class="table">
	        <thead>
	            <tr>
	                <th>SUBJECT</th>
	                <th> <input type="text" class="form-control" name=""></th>
	            </tr>
	            <tr>
	                <th>WRITER</th>
	                <th> <input type="text" class="form-control" name="write"></th>
	            </tr>
	            <tr>
	                <th>DATE</th>
	                <th>2021-05-21</th>
	            </tr>
	        </thead>
	        <tbody>
	            <tr>
	                <td colspan="2">
        				<textarea id="summernote" name="editordata" ></textarea>
	                </td>
	            </tr>
	            <tr>
	                <td colspan="2">
				        <!-- 상품 설명 이미지 - 여러개 -->
				        <div class="mb-4 mt-4 row">
				            <label class="col-md-3 col-form-label">공지사항 이미지</label>
				            <div class="col-md-9">
				                <input  type="file" class="form-control" id="formFile" accept="image/png,image/jpeg,image/jpg">
				                <!-- <img src="/images/kisen_logo.png" alt="" style="width: 300px;"> -->
				            </div>
				        </div>
	                </td>
	            </tr>
	            <tr>
	                <td colspan="2">
	                    <div class="container text-center mt-4">
					        <div class="mb-4 row">
					            <div class="col-6 d-grid p-1">
					                <input type="button" class="btn btn-lg btn-dark" style="width: 100%;" value ="취소하기"/>
					            </div>
					            <div class="col-6 d-grid p-1">
					                <input type="submit" class="btn btn-lg btn-main" style="width: 100%;" onclick="enrollNotice();" value="등록하기"/>
					            </div>
					        </div>
					    </div>
	                </td>
	            </tr>
	        </tbody>
	    </table>
    </form>
</div>


<script>
$(document).ready(function() {
    $('#summernote').summernote({
        height : 600
    });
});
</script>
<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>
