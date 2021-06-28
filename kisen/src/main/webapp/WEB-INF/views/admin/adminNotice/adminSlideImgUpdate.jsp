<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<jsp:include page="/WEB-INF/views/common/admin_header.jsp">
	<jsp:param value="슬라이드 이미지 수정" name="title"/>
</jsp:include>

<style>
    .slideUpdate-img{
        width: 600px;
    }
    .btn-main {
        color: #fff;
        background-color: #C8A9C8;
        border-color: #C8A9C8;
    }
    .img-container{
    	position: relative;
    }
    .img-container button{
    	position: absolute;
    	float: right;
    	z-index: 4;
    }
    .img-container img{
    	position: relative;
    }
    .xBtn{ }
</style>
<div class="container ">
    <h2 class="text-center m-4" style="font-weight: bold;">Slide Image 수정하기</h2>
    <!-- 슬라이드 이미지 -->
    <h5 style="font-weight: bold;"> 현재 슬라이드 이미지 리스트</h5>
    <hr>
    <div class="text-center mb-5 imgContainer">
		<c:forEach items="${slideImgList}" var="slideImg">
			<div class="img-container mb-3">
    		<button type="button" class="btn btn-sm btn-danger rounded-circle" onclick="slideDelete(event)" data-no="${slideImg.slideImgNo}">X</button>
				<img
					src="<c:url value='/resources/upload/slide/${slideImg.renamedFilename}'/>"
					class="card-img idol-img" alt="tree"  class="slideUpdate-img" >
			</div>
		</c:forEach>
    </div>

    <h5 style="font-weight: bold;">이미지 추가</h5>
    <hr>
    
    <div class="text-center">
    	<button type="button" class="btn btn-sm btn-dark mb-3" style="width: 100%;" onclick="imgPlus();">추가</button>
    </div>

	<div class="alert alert-secondary mb-3" role="alert">
		<ul>
			<li>이미지 사이즈 : 1100 * 400px</li>
			<li>파일 사이즈 : 1M 이하</li>
			<li>파일 확장자 : png,jpeg,jpg만 가능</li>
		</ul>
	</div>

	<form:form 
		name="slideImgFrm" 
		id="slideImgFrm"
		action="${pageContext.request.contextPath}/admin/adminSlideImg"
		enctype="multipart/form-data" 
		method ="post"> 

	    <div class="container text-center">
	        <div class="mb-4 row">
	            <div class="col-6 d-grid p-1">
	                <button type="button" class="btn btn-lg btn-dark" style="width: 100%;">취소하기</button>
	            </div>
	            <div class="col-6 d-grid p-1">
	                <button type="button" class="btn btn-lg btn-main" style="width: 100%;" onclick="slideUpdate();" >추가하기</button>
	            </div>
	        </div>
	    </div>
	</form:form>
</div>

<script>
    function slideUpdate() {
        var file= $("input[type=file]");
        if(!file.hasClass("formFile")){
			alert("이미지를 선택해주세요")
			return false;
        } 
		$("#slideImgFrm").submit();
    }

    function setThumbnail(event){
		var file = event.target.files;
		var name = event.target.id;
		console.log(name);
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
    var count =0;
    function  imgPlus(){
		const slideImgFrm = $("#slideImgFrm");
		var text = '<div class="mb-4 row">';
		text += '<label class="col-md-3 col-form-label">슬라이드 이미지</label>';
		text += '<div class="col-md-9 input-group"><input  type="file" class="form-control formFile" id="formFile'+(count+1)
		text += '" name="formFile" accept="image/png,image/jpeg,image/jpg" onchange="setThumbnail(event)">';
		text+= '<button class="btn btn-outline-danger" id="minus" type="button" onclick="imgMinus(event);">-</button>	';
		text += '<img class="formFile'+(count+1)
		text += '" style="width:600px"/></div></div>'	;	
		slideImgFrm.prepend(text);
		count = count+1;
    }

    function imgMinus(event){
        const target = event.target;
		const parent = $("#"+target.id).parent().parent();
		parent.remove();
    }
    function slideDelete(event){
        const target = event.target;
        const imgNo = target.dataset.no;
        if(!confirm("정말 삭제하시겠습니까?")){
			return false;
        }
        var text;
		$.ajax({
			url:`${pageContext.request.contextPath}/admin/slideImgUpdate/`+imgNo,
			method : 'delete',
			contentType:'application/json',  // <---add this
			dataType: 'text',
			success: function (data){
				refreshMemList();
			},
			error(xhr, statusText, err){
				console.log(statusText);
			}
			
		});
    }
	function refreshMemList(){
		location.reload();
	}
</script>
<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>
