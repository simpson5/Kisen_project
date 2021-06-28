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

<div class="container">
    <h5 class="mt-5" style="font-weight: bold;">| NOTICE</h5>
    <hr>
	<form:form 
		name="noticeUpdateFrm" 
		id="noticeUpdateFrm" 
		action="${pageContext.request.contextPath}/admin/adminNoticeUpdate"
		enctype="multipart/form-data" 
		method ="post"> 
    <table class="table">
    	<input type="hidden" value="${notice.noticeNo}" name="noticeNo"/>
        <thead>
            <tr>
                <th>SUBJECT</th>
                <th><input type="text" class="form-control" name="noticeTitle" value="${notice.noticeTitle }"> </th>
            </tr>
            <tr>
                <th>WRITER</th> 
                <th><input type="text" class="form-control" name="noticeWriter" value='${notice.noticeWriter }' readonly></th>
            </tr>
            <tr>
                <th>DATE</th>
                <th><input type="text" class="form-control" name="" value="${notice.uploadDate }" readonly></th>
            </tr>
        </thead>
        <tbody>
            <tr>
                <td colspan="2" class="text-center">
       				<textarea id="summernote" name="noticeContent" required >${notice.noticeContent}</textarea>
                </td>
            </tr>
            <tr>
                <td colspan="2">
               	    <div class="mb-4 row">
			            <label class="col-md-3 col-form-label">공지사항 이미지</label>
				        <div class="col-md-9">
                		<c:if test="${not empty notice.noticeImg.renamedFilename}">
				            <input  type="file" class="form-control" id="formFile" name="formFileUpdate" accept="image/png,image/jpeg,image/jpg" onchange="setThumbnail(event)" readonly>	
				        </c:if>
				        <c:if test="${empty notice.noticeImg.renamedFilename}">
				            <input  type="file" class="form-control" id="formFile" name="formFileInsert" accept="image/png,image/jpeg,image/jpg" onchange="setThumbnail(event)" readonly>	
				        </c:if>
				        </div>
				    </div>
                </td>
            </tr>
            <tr>
                <td colspan="2">
               	    <div class="mb-4 row">
                		<c:if test="${not empty notice.noticeImg.renamedFilename}">
		        		<img src="<c:url value='/resources/upload/notice/${notice.noticeImg.renamedFilename}'/>" class="card-img formFile" alt="tree" style="height: 100%">
       					</c:if>
       					<c:if test="${empty notice.noticeImg.renamedFilename}">
		        			<img class="formFile">
       					</c:if>
       				</div>
                </td>	            
            </tr>
            <tr>
                <td colspan="2">
                <div class=" text-center">
                    <div class="mt-1 row">
                        <div class="col-6 d-grid">
                            <button type="button" class="btn btn-sm btn-dark" style="width: 100%;">취소하기</button>
                        </div>
                        <div class="col-6 d-grid">
                            <button type="button" class="btn btn-sm btn-main" style="width: 100%;" onclick="noticeUpdate(event);" data-no="${notice.noticeNo}" >수정하기</button>
                        </div>
                    </div>
                </div>
                </td>
            </tr>
        </tbody>
    </table>
    </form:form>
    <hr>
    <button type="button" class="btn btn-light" onclick="list();"> 목록</button>
    <hr>
    <div>
        <table class="table">
            <thead>
                <tr>
                    <td>다음글</td>
                    <td> 엑소 이벤트 공지사항입니다.</td>
                </tr>
        </table>
    </div>
</div>

<script>
function list(){
	location.href=`${pageContext.request.contextPath}/admin/adminNotice`
}
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
function noticeUpdate(event){
	var target = event.target;
	//var noticeNo = event.dataset.no;
	$("#noticeUpdateFrm").submit();
}

</script>
<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>
