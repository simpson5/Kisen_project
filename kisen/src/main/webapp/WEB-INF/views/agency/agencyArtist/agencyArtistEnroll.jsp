<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<jsp:include page="/WEB-INF/views/common/agency_header.jsp">
	<jsp:param value="아티스트 등록" name="title"/>
</jsp:include>

<div class="container ">
    <h2 class="text-center m-4" style="font-weight: bold;">아티스트 등록</h2>
	<form
		name="artistFrm" 
		action="${pageContext.request.contextPath}/agency/agencyArtistEnroll"
		enctype="multipart/form-data" 
		method ="post"
		onsubmit="return formValidate();">
		<div class="mb-4 row">
	        <label class="col-md-3 col-form-label" for="idolName">아티스트 명</label>
	        <div class="col-md-9">
	            <input type="text" class="form-control" name="idolName" id="idolName" required>
	        </div>
	    </div>
	
<!-- 	    <div class="mb-4 row">
	        <label class="col-md-3 col-form-label" for="pdIdol">mv</label>
	        <div class="col-md-9">
	            <input type="text" class="form-control" name="idolMv1" >	            
	            <input type="text" class="form-control" name="idolMv2" >	            
	            <input type="text" class="form-control" name="idolMv3" >	            
	            <input type="text" class="form-control" name="idolMv4">	      
	            <input type="hidden" name="idolList" />        
	            <div class="alert alert-secondary" role="alert">
	            	최대 4개 등록가능
	            </div>
	        </div>
	    </div> -->
		
	    <div class="mb-4 row">
	        <label class="col-md-3 col-form-label" for="pdIdol">아이돌</label>
	        <div class="col-md-9">
	            <input type="text" class="form-control" name="pdIdol" id="pdIdol" readonly>
	        </div>
	    </div>
	
	    <!-- 상품 설명 이미지 -->
	    <div class="mb-4 row">
	        <label class="col-md-3 col-form-label">이미지</label>
	        <div class="col-md-9">
	            <input  type="file" class="form-control" id="idolImg" name="idolImg" accept="image/png,image/jpeg,image/jpg" onchange="setThumbnail(event)">
	            <div class="alert alert-secondary" role="alert">
	                <ul>
	                    <li>파일 사이즈 : 5M 이하</li>
	                    <li>파일 확장자 : png,jpeg,jpg만 가능</li>
	                </ul>
	            </div>
	            <div id="image_container" >
	            	<img id="thumbNailImg" style="width:600px"/>
	            </div>
	        </div>
	    </div>
	    
	    <div class="container text-center">
	        <div class="mb-4 row">
	            <div class="col-6 d-grid p-1">
	                <button type="button" class="btn btn-lg btn-dark" style="width: 100%;">취소하기</button>
	            </div>
	            <div class="col-6 d-grid p-1">
	                <button type="submit" class="btn btn-lg btn-main" style="width: 100%;" >등록하기</button>
	            </div>
	        </div>
	    </div>
	
	</form>
    
</div>
<script>
    function adminProductUpdate() {
        location.href="${pageContext.request.contextPath}/agency/agencyArtist"
    }

    //폼 검사
    function formValidate(){

        //MV 처리 

    }
	var sel_file;
    function setThumbnail(event){
		var file = event.target.files;
		console.log(file);
		var fileArr = Array.prototype.slice.call(file);

		fileArr.forEach(function(f){
			if(!f.type.match("image.*")){
				alert("확장자는 이미지만 가능합니다.");
				return;
			}	
			sel_file=f;

			var reader = new FileReader();
			reader.onload=function(e){
				$("#thumbNailImg").attr("src",e.target.result);
			}
			reader.readAsDataURL(f);
		});
    }
</script>
<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>
