<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param value="demandFrmDetail" name="title" />
</jsp:include>
<script type="text/javascript">
</script>

<div class="container">
		<h2 class="text-center m-4" style="font-weight: bold;">${unofficialdemand.pdName} 수요조사 상세보기</h2>
		
		

			<div class="mb-4 row">
				<label class="col-md-3 col-form-label" for="pdName">상품명</label>
				<div class="col-md-9">
					<input type="text" class="form-control" name="pdName" id="pdName" value="${unofficialdemand.pdName}" readonly>
				</div>
			</div>
			<div class="mb-4 row">
				<label class="col-md-3 col-form-label" for="idolName">아이돌</label>
				<div class="col-md-9">
					<input type="text" class="form-control" name="idolName"
						id="idolName" value="${unofficialdemand.idolName}" readonly>
				</div>
			</div>

			<div class="mb-4 row">
				<label class="col-md-3 col-form-label" for="pdCategory">분류</label>
				<div class="col-md-3">
				<input type="text" class="form-control" name="pdCategory"
						id="pdCategory" value="${unofficialdemand.pdCategory}" readonly>
					
						</div>
					</div>
		
			
	   


			<div class="mb-4 row">
				<label class="col-md-3 col-form-label" for="price">가격</label>
				<div class="col-md-3">
					<div class="input-group">
						<input type="number" class="form-control" name="price" id="price"  value="${unofficialdemand.price}" readonly>
						<span class="input-group-text">원</span>
					</div>
				</div>
			</div>
			<div class="mb-4 row">
				<label class="col-md-3 col-form-label" for="deliveryPrice">배송비</label>
				<div class="col-md-3">
					<div class="input-group">
						<input type="number" class="form-control" name="deliveryPrice"
							id="deliveryPrice"  value="${unofficialdemand.deliveryPrice}" readonly> <span class="input-group-text">원</span>
					</div>
				</div>
			</div>
			<div class="mb-4 row">
				<label class="col-md-3 col-form-label" for="pdStock">재고량</label>
				<div class="col-md-3">
					<input type="number" class="form-control" name="pdStock"
						id="pdStock" value="${unofficialdemand.pdStock}" readonly>
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
            <div name="pdContent" id="pdContent"  rows="5" class="form-control" readonly>${unofficialdemand.pdContent}</div>
        </div>
    </div>
    
    <!-- 상품 설명 이미지  -->
    <div class="mb-4 row">
        <label class="col-md-3 col-form-label">상품 설명 이미지</label>
        <div class="col-md-9">
     
           	<c:forEach items="${unofficialdemand.demandpdImgList}" var="pdImg">
           		<c:if test="${pdImg.pdCategory eq 'D'}">
  			        	<img src="<c:url value='/resources/upload/unofficial/${pdImg.renamedFilename}'/>" class="card-img" alt="tree" style="width:300px; height: 100%">
           		</c:if>
           	</c:forEach>
        </div>
    </div>
				
				<div class="register-date-group">
                            <h4>수요조사기간</h4>
                            시작일:  <fmt:formatDate value="${unofficialdemand.demandstartDate}" pattern="yy/MM/dd"/>
                            마감일:  <fmt:formatDate value="${unofficialdemand.demandendDate}" pattern="yy/MM/dd"/>
                        </div>
                        
                        <div class="form-group">
					<label for="question">(선택)추가질문</label> <input type="text"
						class="form-control" id="question" value="${unofficialdemand.question}" readonly>
						 <input type="text"
						class="form-control" id="question">
				</div>
				
				
				
				
				
		<form id="demandFrm" 
		class="justify-content-center" 
		name="demandFrm"
			action="${pageContext.request.contextPath}/unofficial/demandDetail.do"
			method="post">
				
				<input type="hidden" name="demandNo" value="${unofficialdemand.demandNo}" >
				<div class="row" style="padding-top:5px;">
					<div class="col-md-12" style="font-size:15px;font-weight:700;text-align:left;padding:5px 15px;">
						알림 받을 곳 (E-mail) <span style="color:#ff0000;">＊</span>
					</div>
				</div>
				<div class="row">
				
					<div class="col-lg-12">
						<div class="form-group">
							<input class="form-control" type="text" id="email" name="email" value="" placeholder="이메일주소">
						</div>
					</div>
					
				</div>	
				
				<div class="row" style="padding-top:5px;">
					<div class="col-md-12" style="font-size:15px;font-weight:700;text-align:left;padding:5px 15px;">
						트위터 계정
						(선택)					</div>
				</div>
				<div class="row">
				
					<div class="col-lg-12">
						<div class="form-group">
							<input class="form-control" type="text" id="twitter" name="twitter" value="" placeholder="트위터계정 아이디 (ex: @witchform)">
						</div>
					</div>
					
				</div>
				<div class="row" style="padding-top:5px;">
					<div class="col-md-12" style="font-size:15px;font-weight:700;text-align:left;padding:5px 15px;">
						연락처(휴대폰)
						(필수) <span style="color:#ff0000;">＊</span>					</div>
				</div>
				<div class="row">
				
					<div class="col-lg-12">
						<div class="form-group">
							<input class="form-control" type="text" id="phone" name="phone" value="" placeholder="폰번호">
						</div>
					</div>
					
				</div>	

				<div class="container text-center">
					<div class="mb-4 row">
						<div class="col-6 d-grid p-1">
							<button type="reset" class="btn btn-lg btn-dark"
								style="width: 100%;">취소하기</button>
						</div>
						<div class="col-6 d-grid p-1">
							<button type="submit" class="btn btn-lg btn-main" id="enrollbtn"
								 style="width: 100%;" name="subBtn">제출하기</button>
						</div>
					</div>
				</div>
			</form>
		</div>

<script>

$("[name=subBtn]").click(e =>{

	console.log(e.target);
	alert("제출 완료!");
});


function depositDetailUpdate(event) {
    const target = event.target;
    const dno= target.dataset.no;
    location.href=`${pageContext.request.contextPath}/unofficial/depositDetailUpdate/\${dNo}`
}

</script>

<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>
