<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<jsp:include page="/WEB-INF/views/common/agency_header.jsp">
	<jsp:param value="모든 상품" name="title"/>
</jsp:include>
<div class="container ">
    <div class="d-flex justify-content-end mt-3 mb-3" >
        <button type="button" class="btn btn-secondary" onclick="productEnroll()"> 상품등록</button>
    </div>
    
    <c:forEach items="${productList}" var="product">
    <div class="card mb-3 item">
        <div class="row g-0 idol-img">
            <div class="col-4 idol-img">
	            <div class="idol-img ">
	            	<c:forEach items="${product.pdImgList}" var="pdImg">
	            		<c:if test="${pdImg.pdCategory eq 'R'}">
    			        	<img src="<c:url value='/resources/upload/product/${pdImg.renamedFilename}'/>" class="card-img mt-5" alt="tree" style="width:300px">
	            		</c:if>
	            	</c:forEach>
	            </div>
            </div>

            <div class="col-8">
	            <div class="card-body">
	                <h6 class="card-title">
	                	<span class=" fw-bold">${product.pdName}</span> 
	                	<span class="badge bg-secondary" style="color:white;">${product.idolName}</span>
	                </h6>
	                <p class="card-text badge bg-s">${product.pdContent}</p>
	                <p class="card-text"> 
	                    <span class="badge bg-dark">공식굿즈</span>       <!-- 분류 -->
	                    <span class="badge bg-dark">${product.pdCategory}</span>           <!-- 분류 -->
	                    <span class="badge bg-s">재고 : ${product.pdStock} </span>       
	                    <span class="badge bg-s">판매량  : ${product.pdSales}</span>
	                </p>
	                <p class="card-text badge bg-s"> 가격  : ${product.price} 원</p> <br />
	                <div class="btn-group" role="group" aria-label="Basic example">
	                    <button type="button" class="btn btn-sm btn-outline-main"  data-no="${product.pdNo}" onclick="productDetail(event);" >상세보기</button>
	                    <button type="button" class="btn btn-sm btn-outline-main"  data-no="${product.pdNo}" onclick="productUpdate(event);" >수정</button>
	                    <button type="button" class="btn btn-sm btn-outline-main"  data-no="${product.pdNo}" onclick="productDelete(event);">삭제</button>
	                </div>
	            </div>
            </div>
        </div>
    </div>
    </c:forEach>
    
    <!-- paging -->
	${pageBar }
</div>
<script>
	function productEnroll(){
        location.href=`${pageContext.request.contextPath}/agency/agencyProductEnroll`
	}
    function productDetail(event) {
        const target = event.target;
        const pdNo= target.dataset.no;
        location.href=`${pageContext.request.contextPath}/agency/agencyProductDetail/\${pdNo}`
    }
    function productUpdate(event) {
        const target = event.target;
        const pdNo= target.dataset.no;
        location.href=`${pageContext.request.contextPath}/agency/agencyProductUpdate/\${pdNo}`
    }
    function productDelete(event) {
        const target = event.target;
        const pdNo= target.dataset.no;
        if(!confirm("정말 삭제하시겠습니까?")){
			return false;
        }
		$.ajax({
			url: `${pageContext.request.contextPath}/agency/agencyProductDelete/\${pdNo}`,
			method : 'delete',
			success: function (data){
				console.log("삭제 성공");
				const {msg} = data;
				alert(msg);
				refreshMemList();
			},
			error(xhr, statusText, err){
				console.log(err);
			}
		});
    }
	function refreshMemList(){
		location.reload();
	}
</script>
<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>
