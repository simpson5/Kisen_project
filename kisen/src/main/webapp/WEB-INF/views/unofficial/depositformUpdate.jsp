<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param value="depositFrmUpdate" name="title" />
</jsp:include>



		<form id="depositFrmUpdate" name="depositFrmUpdate"
			action="${pageContext.request.contextPath}/unofficial/depositformUpdate.do"
			method="post">
			
					
		<h2 class="text-center m-4" style="font-weight: bold;">입금폼 수정하기</h2>
		

			<div class="mb-4 row">
				<label class="col-md-3 col-form-label" for="pdName">상품명</label>
				<div class="col-md-9">
					<input type="text" class="form-control" name="pdName" id="pdName" value="${unofficialdeposit.pdName}">
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
        <label class="col-md-3 col-form-label" for="pdContent">상품 설명</label>
        <div class="col-md-9">
            <textarea name="pdContent" id="pdContent"  rows="5" class="form-control">${unofficialdeposit.pdContent}</textarea>
        </div>
    </div>
    
     <!-- 상품 설명 이미지  -->
    <div class="mb-4 row">
        <label class="col-md-3 col-form-label">상품 설명 이미지</label>
        <div class="col-md-9">
           	<c:forEach items="${unofficialdemand.pdImgList}" var="pdImg">
           		<c:if test="${pdImg.pdCategory eq 'D'}">
  			        	<img src="<c:url value='/resources/upload/unofficial/${pdImg.renamedFilename}'/>" class="card-img" alt="tree" style="width:300px; height: 100%">
           		</c:if>
           	</c:forEach>
        </div>
    </div>
	    
	    <div class="register-date-group" name="depositPeriod" id="depositPeriod">
                            <h4>입금기간</h4>
                            시작일:  <input type="date" class="input--text" name="depositStartDate" placeholder="시작일" id="depositStartDate" value="${unofficialdeposit.depositStartDate}">
                            마감일:  <input type="date" class="input--text" name="depositEndDate" placeholder="마감일" id="depositEndDate"  value="${unofficialdeposit.depositEndDate}">
                        </div>
                        
                        <div class="form-group" id="bankInfo" name="bankInfo">
							<label for="bankinfo">은행정보</label> <input type="text"
								class="form-control" placeholder="은행명" id="bankName" name="bankName" value="${unofficialdeposit.bankName}"> <input
								type="text" class="form-control" placeholder="계좌번호" id="accountNo" name="accountNo" value="${unofficialdeposit.accountNo}"> <input
								type="text" class="form-control" placeholder="예금주명" id="accountHolder" name="accountHolder" value="${unofficialdeposit.accountHolder}">


						</div>
						
             <div class="mb-4 row">
				<label class="col-md-3 col-form-label" for="price">가격</label>
				<div class="col-md-3">
					<div class="input-group">
						<input type="number" class="form-control" name="price" id="price" value="${unofficialdeposit.price}">
						<span class="input-group-text" >원</span>
					</div>
				</div>
			</div>
			<div class="mb-4 row">
							<label class="col-md-3 col-form-label" for="deliveryOption">배송방법</label>
							<div class="col-md-9">
								<input type="text" class="form-control" name="deliveryOption"
									id="deliveryOption" value="${unofficialdeposit.deliveryOption}">
							</div>
						</div>
			<div class="mb-4 row">
				<label class="col-md-3 col-form-label" for="deliveryPrice">배송비</label>
				<div class="col-md-3">
					<div class="input-group">
						<input type="number" class="form-control" name="deliveryPrice"
							id="deliveryPrice" value="${unofficialdeposit.deliveryPrice}"> 
							<span class="input-group-text">원</span>
					</div>
				</div>
			</div>
			<div class="mb-4 row">
				<label class="col-md-3 col-form-label" for="pdStock">재고량</label>
				<div class="col-md-3">
					<input type="number" class="form-control" name="pdStock"
						id="pdStock" value="${unofficialdeposit.pdStock}">
				</div>
			</div>
			<!-- <div class="mb-4 row">
					<label class="col-md-3 col-form-label" for="pdSales">판매량</label>
					<div class="col-md-9">
						<input type="number" class="form-control" name="pdSales"
							id="pdSales">
					</div>
				</div> -->

		 <div class="form-group">
							<label for="deliveryNotice">(선택)배송안내</label>
							<textarea class="form-control" rows="3" name="deliveryNotice" id="deliverynotice"
								value="${unofficialdeposit.deliveryNotice}"></textarea>
						</div>
						
						
						


				<div class="container text-center">
					<div class="mb-4 row">
						<div class="col-6 d-grid p-1">
							<button type="button" class="btn btn-lg btn-dark"
								style="width: 100%;">취소하기</button>
						</div>
						<div class="col-6 d-grid p-1">
							<button type="submit" class="btn btn-lg btn-main" id="enrollbtn"
								 style="width: 100%;">수정하기</button>
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
