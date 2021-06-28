<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!-- security관련 taglib -->
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>   
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<jsp:include page="/WEB-INF/views/common/admin_header.jsp">
	<jsp:param value="모든 상품" name="title"/>
</jsp:include>
<c:set var="now" value="<%=new java.util.Date()%>" />
<c:set var="sysYear"><fmt:formatDate value="${now}" pattern="yyyy-MM-dd HH:mm" /></c:set> 

<div class="container">
    <h5 class="mt-5" style="font-weight: bold;">| NOTICE WRITE</h5>
    <hr>
	<form:form 
		name="noticeFrm" 
		action="${pageContext.request.contextPath}/admin/adminNoticeEnroll"
		enctype="multipart/form-data" 
		method ="post"> 
	    <table class="table">
	        <thead>
	            <tr>
	                <th>SUBJECT</th>
	                <th> <input type="text" class="form-control" name="noticeTitle" required></th>
	            </tr>
	            <tr>
	                <th>WRITER</th>
	                <th> <input type="text" class="form-control" name="noticeWriter" value='<sec:authentication property="principal.username"/>' readonly>
                   </th>
	            </tr>
	            <tr>
	                <th>DATE</th>
	                <th> <input type="text" class="form-control" name="" value="${sysYear}" readonly></th>
	            </tr>
	        </thead>
	        <tbody>
	            <tr>
	                <td colspan="2">
        				<textarea id="summernote" name="noticeContent" required ></textarea>
	                </td>
	            </tr>
	            <tr>
	                <td colspan="2">
                	    <div class="mb-4 row">
				            <label class="col-md-3 col-form-label">공지사항 이미지</label>
					        <div class="col-md-9">
					            <input  type="file" class="form-control" id="formFile" name="formFile" accept="image/png,image/jpeg,image/jpg" onchange="setThumbnail(event)" readonly>
				            	
					        </div>
					    </div>
	                </td>
	            </tr>
	            <tr>
	                <td colspan="2">
                	    <div class="mb-4 row">
        					<img class="formFile"/>
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
    </form:form>
</div>


<script>
$(document).ready(function() {
    $('#summernote').summernote({
        height : 600,
        toolbar: [
            [ 'style', [ 'style' ] ],
            [ 'font', [ 'bold', 'italic', 'underline', 'strikethrough', 'clear'] ],
            [ 'fontname', [ 'fontname' ] ],
            [ 'fontsize', [ 'fontsize' ] ],
            [ 'color', [ 'color' ] ],
            [ 'para', [ 'ol', 'ul', 'paragraph', 'height' ] ],
            [ 'view', ['codeview', 'help' ] ]
        ]
    });
});

function setThumbnail(event){
	var file = event.target.files;
	var name = event.target.id;
	console.log(file);
	var fileArr = Array.prototype.slice.call(file);

	fileArr.forEach(function(f){
		if(!f.type.match("image.*")){
			alert("확장자는 이미지만 가능합니다.");
			return;
		}	

		var reader = new FileReader();
		reader.onload=function(e){
			$("."+name).attr("src",e.target.result);
		}
		reader.readAsDataURL(f);
	});
}
</script>
<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>
