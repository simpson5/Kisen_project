
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param value="demandFrmUpdate" name="title" />
</jsp:include>



		<form:form id="demandFrmUpdate" 
		 class="justify-content-center" 
			name="demandFrmUpdate"
			action="${pageContext.request.contextPath}/unofficial/demandformUpdate.do"
			enctype="multipart/form-data" 
			method="post">
	
			
			<div class="container">
			
					
		<h2 class="text-center m-4" style="font-weight: bold;">수요조사 수정하기</h2>
		
		

			
			<div class="mb-4 row">
				<label class="col-md-3 col-form-label" for="pdName">상품명</label>
				<div class="col-md-9">
					<input type="text" class="form-control" name="pdName" id="pdName" value="${unofficialdemand.pdName}">
				</div>
			</div>
			<div class="mb-4 row">
				<label class="col-md-3 col-form-label" for="idolName">아이돌</label>
				<div class="col-md-9">
					<input type="text" class="form-control" name="idolName"
						id="idolName" value="${unofficialdemand.idolName}" >
				</div>
			</div>

			<div class="mb-4 row">
				<label class="col-md-3 col-form-label" for="pdCategory">분류</label>
				<div class="col-md-3">
				<input type="text" class="form-control" name="pdCategory"
						id="pdCategory" value="${unofficialdemand.pdCategory}">
					
						</div>
					</div>
		
			
	   


			<div class="mb-4 row">
				<label class="col-md-3 col-form-label" for="price">가격</label>
				<div class="col-md-3">
					<div class="input-group">
						<input type="number" class="form-control" name="price" id="price"  value="${unofficialdemand.price}" >
						<span class="input-group-text">원</span>
					</div>
				</div>
			</div>
			<div class="mb-4 row">
				<label class="col-md-3 col-form-label" for="deliveryPrice">배송비</label>
				<div class="col-md-3">
					<div class="input-group">
						<input type="number" class="form-control" name="deliveryPrice"
							id="deliveryPrice"  value="${unofficialdemand.deliveryPrice}"> <span class="input-group-text">원</span>
					</div>
				</div>
			</div>
			<div class="mb-4 row">
				<label class="col-md-3 col-form-label" for="pdStock">재고량</label>
				<div class="col-md-3">
					<input type="number" class="form-control" name="pdStock"
						id="pdStock" value="${unofficialdemand.pdStock}">
				</div>
			</div>
		
			<div class="mb-4 row">
					<label class="col-md-3 col-form-label" for="pdSales">판매량</label>
					<div class="col-md-3">
						<input type="number" class="form-control" name="pdSales"
							id="pdSales" value="${unofficialdemand.pdSales}">
					</div>
				</div> 

		

					<div class="mb-4 row">
        <label class="col-md-3 col-form-label" for="pdContent">상품 설명</label>
        <div class="col-md-9">
            <textarea name="pdContent" id="pdContent"  rows="5" class="form-control" >${unofficialdemand.pdContent}</textarea>
        </div>
    </div>
    
    <!-- 상품 설명 이미지  -->

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
		     		<c:forEach items="${unofficialdemand.demandpdImgList}" var="pdImg">
		           		<c:if test="${pdImg.pdCategory eq 'R'}">
		  			        <img src="<c:url value='/resources/upload/unofficial/${pdImg.renamedFilename}'/>" class="card-img thumbnailFile" alt="tree" style="width:300px; height: 100%">
		           		</c:if>
		           	</c:forEach>
		        </div>
	        </div>
	    </div>
    
    
    
      <div class="mb-4 row">
	        <label class="col-md-3 col-form-label">상세 이미지</label>
	        <div class="col-md-9">
	            <input  type="file" class="form-control" id="detailFile" name="detailFile" accept="image/png,image/jpeg,image/jpg" onchange="setThumbnail(event)">
	            <div class="alert alert-secondary" role="alert">
	                <ul>
	                    <li>파일 사이즈 : 5M 이하</li>
	                    <li>파일 확장자 : png,jpeg,jpg만 가능</li>
	                </ul>
	            </div>
			    <div class="col-md-9">
		     		<c:forEach items="${unofficialdemand.demandpdImgList}" var="pdImg">
		           		<c:if test="${pdImg.pdCategory eq 'D'}">		
					        <img src="<c:url value='/resources/upload/unofficial/${pdImg.renamedFilename}'/>" class="card-img detailFile" alt="tree" style="width:300px; height: 100%">
		           		</c:if>
		           	</c:forEach>
		        </div>
	        </div>
	    </div>


		<h4>수요조사기간</h4>

		<div class="form-group col-md-12 mx-auto">

			시작일:
			<fmt:formatDate value="${unofficialdemand.demandstartDate}"
				pattern="yyyy/MM/dd" />
			<br /> 마감일:
			<fmt:formatDate value="${unofficialdemand.demandendDate}"
				pattern="yyyy/MM/dd" />
			<br /> <label for="demandstartDate">시작일</label> <input type="date"
				class="fill-in-area" name="demandstartDate" id="startDate"
				value="${unofficialdemand.demandstartDate}" required> <label
				for="demandendDate">마감일</label> <input type="date"
				class="fill-in-area" name="demandendDate" id="endDate"
				value="${unofficialdemand.demandendDate}" required>
		</div>

		<div class="form-group">
			<label for="question">(선택)추가질문</label> <input type="text"
				class="form-control" id="question"
				value="${unofficialdemand.question}">
		</div>





		<div class="container text-center">
					<div class="mb-4 row">
						<div class="col-6 d-grid p-1">
							<button type="reset" class="btn btn-lg btn-dark"
								style="width: 100%;" onclick="goMyDemandlist();">취소하기</button>
						</div>
						<div class="col-6 d-grid p-1">
							<button type="submit" class="btn btn-lg btn-main" id="enrollbtn"
								 style="width: 100%;">저장하기</button>
						</div>
					</div>
				</div>
				</div>
			
		</form:form>
		
		
<script>
function goMyDemandlist() {
	location.href = "${pageContext.request.contextPath}/mypage/mypageform.do";
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



</script>

<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>
