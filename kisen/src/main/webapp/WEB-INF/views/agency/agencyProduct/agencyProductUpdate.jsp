<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<jsp:include page="/WEB-INF/views/common/agency_header.jsp">
	<jsp:param value="모든 상품" name="title"/>
</jsp:include>

<div class="container ">
    <h2 class="text-center m-4" style="font-weight: bold;">상품 수정하기</h2>
	<form:form 
		name="productFrm" 
		action="${pageContext.request.contextPath}/agency/agencyProductUpdate"
		enctype="multipart/form-data" 
		method ="Post"
		onsubmit="return formValidate();">
		<input type="hidden" value="${product.pdNo }" name="pdNo"/>
	    <div class="mb-4 row">
	        <label class="col-md-3 col-form-label" for="pdName">상품명</label>
	        <div class="col-md-9">
	            <input type="text" class="form-control" name="pdName" id="pdName" value="${product.pdName}">
	        </div>
	    </div>
	    <div class="mb-4 row">
	        <label class="col-md-3 col-form-label" for="pdIdol">아이돌</label>
	        <div class="col-md-9">
    		     <select name="idolNo" id="idolNo" class="form-select">
                   	<c:forEach items="${idolList}" var="idol">
                       	<option value="${idol.idolNo}"> ${idol.idolName}</option>
                   	</c:forEach>
                 </select>
	        </div>
	    </div>
	
	    <div class="mb-4 row">
	        <label class="col-md-3 col-form-label" for="pdCategory">분류</label>
	        <div class="col-md-9">
	            <div class="row">
		            <select name="pdCategory" id="pdCategory" class="form-select">
		            	<c:forEach items="${category }" var="category">
		                	<option value="${category}" ${product.pdCategory eq category ? 'selected' : '' }>${category}</option>
		            	</c:forEach>
		            </select>
	            </div>
	        </div>
	    </div>
	
	    <div class="mb-4 row">
	        <label class="col-md-3 col-form-label" for="pdContent">상품 설명</label>
	        <div class="col-md-9">
	            <textarea name="pdContent" id="pdContent"  rows="5" class="form-control">${product.pdContent}</textarea>
	        </div>
	    </div>
	    <div class="mb-4 row">
	        <label class="col-md-3 col-form-label" for="price">가격</label>
	        <div class="col-md-9">
	            <div class="input-group">
	                <input type="number" class="form-control" name="price" id="price" value="${product.price}">
	                <span class="input-group-text">원</span>
	            </div>
	        </div>
	    </div>
	    
	    <div class="mb-4 row">
	        <label class="col-md-3 col-form-label" for="pdStock">재고량</label>
	        <div class="col-md-9">
	            <input type="number" class="form-control" name="pdStock" id="pdStock"  value="${product.pdStock}">
	        </div>
	    </div>
	    <div class="mb-4 row">
	        <label class="col-md-3 col-form-label" for="pdSales">판매량</label>
	        <div class="col-md-9">
	            <input type="number" class="form-control" name="pdSales" id="pdSales"  value="${product.pdSales}">
	        </div>
	    </div>
	    
	    <!-- 이미지 -->
	    <!-- 썸네일&대표 -->
	    <div class="mb-4 row">
	        <label class="col-md-3 col-form-label">대표 이미지</label>
	        <div class="col-md-9">
	            <input  type="file" class="form-control" id="thumbnailFile" name="thumbnailFile"  accept="image/png,image/jpeg,image/jpg" onchange="setThumbnail(event)">
	            <div class="alert alert-secondary" role="alert">
	                <ul>
	                    <li>이미지 사이즈 : 600 * 800px  </li>
	                    <li>파일 사이즈 : 1M 이하</li>
	                    <li>파일 확장자 : png,jpeg,jpg만 가능</li>
	                </ul>
	            </div>
		        <div class="col-md-9">
		           	<c:forEach items="${product.pdImgList}" var="pdImg">
		           		<c:if test="${pdImg.pdCategory eq 'R'}">
	  			        	<img src="<c:url value='/resources/upload/product/${pdImg.renamedFilename}'/>" class="card-img thumbnailFile" alt="tree" style="width:300px;  height: 100%">
		           		</c:if>
		           	</c:forEach>
		        </div>
	        </div>
	    </div>
	
	    <!-- 상품 설명 이미지 -->
	    <div class="mb-4 row">
	        <label class="col-md-3 col-form-label">상품 설명 이미지</label>
	        <div class="col-md-9">
	            <input  type="file" class="form-control" id="detailFile" name="detailFile" accept="image/png,image/jpeg,image/jpg" onchange="setThumbnail(event)">
	            <div class="alert alert-secondary" role="alert">
	                <ul>
	                    <li>파일 사이즈 : 5M 이하</li>
	                    <li>파일 확장자 : png,jpeg,jpg만 가능</li>
	                </ul>
	            </div>
		        <div class="col-md-9">
		           	<c:forEach items="${product.pdImgList}" var="pdImg">
		           		<c:if test="${pdImg.pdCategory eq 'D'}">
	  			        	<img src="<c:url value='/resources/upload/product/${pdImg.renamedFilename}'/>" class="card-img detailFile" alt="tree" style="width:300px;  height: 100%">
		           		</c:if>
		           	</c:forEach>
		        </div>
	        </div>
	    </div>
	    <div class="container text-center">
	        <div class="mb-4 row">
	            <div class="col-6 d-grid p-1">
	                <button type="button" class="btn btn-lg btn-dark" style="width: 100%;">취소하기</button>
	            </div>
	            <div class="col-6 d-grid p-1">
	                <button type="submit" class="btn btn-lg btn-main" style="width: 100%;">저장하기</button>
	            </div>
	        </div>
	    </div>
    </form:form>
</div>
<script>

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
</script>
<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>
