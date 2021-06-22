<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<jsp:include page="/WEB-INF/views/common/agency_header.jsp">
	<jsp:param value="ARTIST 수정" name="title"/>
</jsp:include>
<style>
#change2{
	 display:none ;
}
</style>
<div class="container ">
    <h2 class="text-center m-4" style="font-weight: bold;">ARTIST 수정하기</h2>
	<form:form 
		name="artistFrm" 
		action="${pageContext.request.contextPath}/agency/agencyArtistUpdate"
		enctype="multipart/form-data" 
		method ="Post"
		onsubmit="return formValidate();">
	    <div class="mb-4 row">
	    	<input type="hidden" name="idolNo" value="${idol.idolNo}"/>
	    	<input type="hidden" name="_method" value="put"/>
	        <label class="col-md-3 col-form-label" for="idolName">아이돌</label>
	        <div class="col-md-9">
	         	<div class="input-group " id="change1">
		            <input type="text" class="form-control" name="idolName" id="idolName"  check_result="fail"  value="${idol.idolName}" required readonly>
		            <button class="btn btn-outline-success" type="button" id="button-addon2" onclick="idolNameChange();">이름 변경 하기</button>	  
		        </div>
			    <p class="mt-2" id="idolcheck"></p>
	        </div>
	    </div>
	    
	    <div class="mb-4 row">
	        <label class="col-md-3 col-form-label" for="pdContent">MV 리스트</label>
	        <div class="col-md-9">
		        <c:forEach items="${idol.idolMv }" var="mv" begin="0"   end="4"  step="1"  varStatus="status">
		            <input type="text" class="form-control" name="idolMv" value="${mv.mvLink}" data-count="${status.count}">
		            <c:if test="${status.last}">
		            	<c:if test="${status.count<4}">
		            		<c:forEach  begin="1"   end="${4-status.count}"  step="1"  varStatus="status">
		           				<input type="text" class="form-control" name="idolMv" >
		            		</c:forEach>
		            	</c:if>
		            </c:if> 
		        </c:forEach>
	        </div>
	    </div>
	
	    
	    <div class="mb-4 row">
	        <label class="col-md-3 col-form-label">대표 이미지</label>
	        <div class="col-md-9">
	            <input  type="file" class="form-control" id="formFile" name="idolImg" accept="image/png,image/jpeg,image/jpg" onchange="setThumbnail(event)">
	            <div class="alert alert-secondary" role="alert">
	                <ul>
	                    <li>이미지 사이즈 : 600 * 800px </li>
	                    <li>파일 사이즈 : 1M 이하</li>
	                    <li>파일 확장자 : png,jpeg,jpg만 가능</li>
	                </ul>
	            </div>	            
	            <div id="image_container" >
	            	<img id="thumbNailImg"  src="<c:url value='/resources/upload/idol/${idol.idolImg.renamedFilename}'/>" class="card-img mt-5" alt="tree" style="width:300px">
	            </div>
	            
	        </div>
	    </div>
	    <div class="container text-center">
	        <div class="mb-4 row">
	            <div class="col-6 d-grid p-1">
	                <button type="button" class="btn btn-lg btn-dark" style="width: 100%;">취소하기</button>
	            </div>
	            <div class="col-6 d-grid p-1">
	                <button type="submit" class="btn btn-lg btn-main" style="width: 100%;">수정하기</button>
	            </div>
	        </div>
	    </div>
	</form:form >
</div>
<script>
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


function idolNameChange(){
	$("#idolName").attr('readonly',false);
	const button = $("#button-addon2");
	button.html("중복확인");
	button.removeClass("btn-outline-success"); 
	button.addClass("btn-outline-danger");  
	document.getElementById("button-addon2").setAttribute("onClick", "idolcheck()");
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
			}
		},
		error : (xhr, statusText, err)=>{
			console.log(xhr, statusText, err);
		}
		
	});
}
</script>
<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>
