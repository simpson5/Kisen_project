<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param value="demandFrmUpdate" name="title" />
</jsp:include>



		<form id="demandFrmUpdate" name="demandFrmUpdate"
			action="${pageContext.request.contextPath}/unofficial/demandformUpdate.do"
			method="post">
			
					
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
						id="idolName" value="${unofficialdemand.idolName}">
				</div>
			</div>

			<div class="mb-4 row">
				<label class="col-md-3 col-form-label" for="pdCategory">분류</label>
				<div class="col-md-9">
					<div class="row">
						<div class="col-auto">
							<select name="pdCategory" id="pdCategory"
								class="form-select">
								<option value="인형">인형</option>
								<option value="포토카드">포토카드</option>
								<option value="기타">기타</option>
							</select>
						</div>
					</div>
				</div>
			</div>
		
			
	   


			<div class="mb-4 row">
				<label class="col-md-3 col-form-label" for="price">가격</label>
				<div class="col-md-3">
					<div class="input-group">
						<input type="number" class="form-control" name="price" id="price"  value="${unofficialdemand.price}">
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
			<!-- <div class="mb-4 row">
					<label class="col-md-3 col-form-label" for="pdSales">판매량</label>
					<div class="col-md-9">
						<input type="number" class="form-control" name="pdSales"
							id="pdSales">
					</div>
				</div> -->

		

					<div class="mb-4 row">
        <label class="col-md-3 col-form-label" for="pdContent">상품 설명</label>
        <div class="col-md-9">
            <textarea name="pdContent" id="pdContent"  rows="5" class="form-control">${unofficialdemand.pdContent}</textarea>
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
		           	<c:forEach items="${unofficialdeposit.pdImgList}" var="pdImg">
		           		<c:if test="${pdImg.pdCategory eq 'D'}">
	  			        	<img src="<c:url value='/resources/upload/unofficial/${pdImg.renamedFilename}'/>" class="card-img detailFile" alt="tree" style="width:300px;  height: 100%">
		           		</c:if>
		           	</c:forEach>
		        </div>
	        </div>
	    </div>
				
				<div class="register-date-group">
                            <h4>수요조사기간</h4>
                            시작일:  <input type="date" class="input--text" name="demandstartDate" placeholder="시작일" id="startDate" value="${unofficialdemand.demandstartDate}">
                            마감일:  <input type="date" class="input--text" name="demandendDate" placeholder="마감일" id="endDate" value="${unofficialdemand.demandendDate}">
                        </div>
                        
                        <div class="form-group">
					<label for="question">(선택)추가질문</label> <input type="text"
						class="form-control" id="question" value="${unofficialdemand.question}">
						 <input type="text"
						class="form-control" id="question">
				</div>
				
				
				
				
				
											

				<div class="container text-center">
					<div class="mb-4 row">
						<div class="col-6 d-grid p-1">
							<button type="button" class="btn btn-lg btn-dark"
								style="width: 100%;">취소하기</button>
						</div>
						<div class="col-6 d-grid p-1">
							<button type="submit" class="btn btn-lg btn-main" id="enrollbtn"
								 style="width: 100%;">저장하기</button>
						</div>
					</div>
				</div>
		</form>

<script>

function depositDetailUpdate(event) {
    const target = event.target;
    const dno= target.dataset.no;
    location.href=`${pageContext.request.contextPath}/unofficial/depositDetailUpdate/\${dNo}`
}

</script>

<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>
