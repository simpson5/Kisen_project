<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<jsp:include page="/WEB-INF/views/common/agency_header.jsp">
	<jsp:param value="모든 상품" name="title"/>
</jsp:include>

<div class="container ">
    <h2 class="text-center m-4" style="font-weight: bold;">상품 상세보기</h2>
	
    <div class="mb-4 row">
        <label class="col-md-3 col-form-label" for="pdName">상품명</label>
        <div class="col-md-9">
            <input type="text" class="form-control" name="pdName" id="pdName" value="${product.pdName}" readonly>
        </div>
    </div>
    <div class="mb-4 row">
        <label class="col-md-3 col-form-label" for="pdIdol">아이돌</label>
        <div class="col-md-9">
            <input type="text" class="form-control" name="pdIdol" id="pdIdol" value="${product.idolName}" readonly>
        </div>
    </div>

    <div class="mb-4 row">
        <label class="col-md-3 col-form-label" for="pdCategory">분류</label>
        <div class="col-md-9">
            <select name="pdCategory" id="pdCategory" class="form-select">
            	<c:forEach items="${category }" var="category">
                	<option value="${category}" ${product.pdCategory eq category ? 'selected' : '' }>${category}</option>
            	</c:forEach>
            </select>
        </div>
    </div>
    <div class="mb-4 row">
        <label class="col-md-3 col-form-label" for="pdCategory">옵션</label>
        <div class="col-md-9 option">
          	<c:forEach items="${product.pdOptionList }" var="option">
	          	<c:if test="${!empty option.optionName}">
	            	<input type="text" class="form-control" name="pdOption" id="pdOption" value="${option.optionName}" readonly>
	          	</c:if>
          	</c:forEach>
        </div>
    </div>
    <div class="mb-4 row">
        <label class="col-md-3 col-form-label" for="pdContent">상품 설명</label>
        <div class="col-md-9">
            <textarea name="pdContent" id="pdContent"  rows="5" class="form-control" readonly>${product.pdContent}</textarea>
        </div>
    </div>
    <div class="mb-4 row">
        <label class="col-md-3 col-form-label" for="price">가격</label>
        <div class="col-md-9">
            <div class="input-group">
                <input type="number" class="form-control" name="price" id="price"  value="${product.price}" readonly>
                <span class="input-group-text">원</span>
            </div>
        </div>
    </div>
    <div class="mb-4 row">
        <label class="col-md-3 col-form-label" for="pdStock">재고량</label>
        <div class="col-md-9">
            <input type="number" class="form-control" name="pdStock" id="pdStock" value="${product.pdStock}" readonly>
        </div>
    </div>
    <div class="mb-4 row">
        <label class="col-md-3 col-form-label" for="pdSales">판매량</label>
        <div class="col-md-9">
            <input type="number" class="form-control" name="pdSales" id="pdSales" value="${product.pdSales}" readonly>
        </div>
    </div>

    <!-- 이미지 -->
    <!-- 썸네일&대표이미지 -->
    <div class="mb-4 row">
        <label class="col-md-3 col-form-label">대표 이미지</label>
        <div class="col-md-9">
           	<c:forEach items="${product.pdImgList}" var="pdImg">
           		<c:if test="${pdImg.pdCategory eq 'R'}">
  			        	<img src="<c:url value='/resources/upload/product/${pdImg.renamedFilename}'/>" class="card-img" alt="tree" style="width:300px;  height: 100%">
           		</c:if>
           	</c:forEach>
        </div>
    </div>

    <!-- 상품 설명 이미지  -->
    <div class="mb-4 row">
        <label class="col-md-3 col-form-label">상품 설명 이미지</label>
        <div class="col-md-9">
           	<c:forEach items="${product.pdImgList}" var="pdImg">
           		<c:if test="${pdImg.pdCategory eq 'D'}">
					<img src="<c:url value='/resources/upload/product/${pdImg.renamedFilename}'/>" class="card-img" alt="tree" style="width:300px; height: 100%">
           		</c:if>
           	</c:forEach>
        </div>
    </div>
    <div class="container text-center mt-4 ">
        <div class="mb-4 row">
            <div class="col-6 d-grid p-1">
                <button type="button" class="btn btn-lg btn-dark" style="width: 100%;">취소하기</button>
            </div>
            <div class="col-6 d-grid p-1">
                <button type="button" class="btn btn-lg btn-main" style="width: 100%;" onclick="agencyProductUpdate(event);" data-no ="${product.pdNo}">수정하기</button>
            </div>
        </div>
    </div>
</div>

<script>
function agencyProductUpdate(event) {
    const target = event.target;
    const pdNo= target.dataset.no;
    location.href=`${pageContext.request.contextPath}/agency/agencyProductUpdate/\${pdNo}`
}
</script>
<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>
