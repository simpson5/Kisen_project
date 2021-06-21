<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<jsp:include page="/WEB-INF/views/common/agency_header.jsp">
	<jsp:param value="아티스트 등록" name="title"/>
</jsp:include>

<div class="container ">
    <h2 class="text-center m-4" style="font-weight: bold;">아티스트 등록</h2>
	<form:form 
		name="artistFrm" 
		action="${pageContext.request.contextPath}/agency/agencyArtistEnroll"
		enctype="multipart/form-data" 
		method ="post"
		onsubmit="return formValidate();">
		<div class="mb-4 row">
	        <label class="col-md-3 col-form-label" for="idolName">아티스트 명</label>
	        <div class="col-md-9">
		        <div class="input-group ">
		            <input type="text" class="form-control" name="idolName" id="idolName"  check_result="fail"  required>
		            <button class="btn btn-outline-danger" type="button" id="button-addon2" onclick="idolcheck();">중복 확인</button>	  
		        </div>
		        <p class="mt-2" id="idolcheck"></p>
	        </div>
	        
	    </div>
	
 	    <div class="mb-4 row">
	        <label class="col-md-3 col-form-label" for="pdIdol">MV LINK</label>
	        <div class="col-md-9">
	            <input type="text" class="form-control" name="idolMv" >	            
	            <input type="text" class="form-control" name="idolMv" >	            
	            <input type="text" class="form-control" name="idolMv" >	            
	            <input type="text" class="form-control" name="idolMv">	      
	            <input type="hidden" name="idolList" />        
	            <div class="alert alert-secondary" role="alert">
	            	최대 4개 등록가능
	            </div>
	        </div>
	    </div>
		
	
	    <div class="mb-4 row">
	        <label class="col-md-3 col-form-label">대표 이미지</label>
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
	</form:form >
    
</div>
<script>
    function adminProductUpdate() {
        location.href="${pageContext.request.contextPath}/agency/agencyArtist"
    }

    //폼 검사
    function formValidate(){
        const idolName = $("#idolName");
		if(idolName.attr("check_result") == "fail"){
			alert("아이돌명을 확인해주세요")
			idolName.focus();
			return false;
		}
		return true;
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


    function idolcheck(){
        const idolName = $("#idolName").val();
        const idolcheck = $("#idolcheck");
        
		if(idolName == ''){
			alert("아이돌명을 입력해주세요");
			return;
		}
        
		$.ajax({
			url : `${pageContext.request.contextPath}/agency/agencyArtistEnroll/checkIdolName`,
			data: {idolName},
			method : "GET",
			success: function(data){
				console.log(data);
				const {exist} = data;
				console.log(exist);
				if(exist){
					//존재하는 경우
					console.log("존재함");
					idolcheck.html("<span style='color :red;'> 이미 존재하는 아이돌입니다. </span>")
					$("#idolName").attr("check_result","fail");
				}
				else{
					idolcheck.html("<span style='color :green;'> 등록 가능한 아이돌입니다. </span>");
					$("#idolName").attr("check_result","success");
					$("#idolName").attr("readonly","readonly");
					$("#button-addon2").removeClass("btn-outline-danger");
					$("#button-addon2").addClass("btn-outline-success");
				}
			},
			error : (xhr, statusText, err)=>{
				console.log(xhr, statusText, err);
			}
			
		});
    }
</script>
<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>
