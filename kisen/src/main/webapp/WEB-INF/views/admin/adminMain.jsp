<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<jsp:include page="/WEB-INF/views/common/admin_header.jsp">
	<jsp:param value="Admin" name="title"/>
</jsp:include>

<div class="container">
    <div class="d-flex justify-content-end mt-3" >
        <button type="button" class="btn btn-secondary" onclick="productEnroll()"> 상품등록</button>
    </div>
    <!-- 상품 목록 -->
    <h5 style="font-weight: bold; margin-top: 3rem;"> 상품목록 <a href="${pageContext.request.contextPath }/admin/adminProduct" class="more">더보기</a></h5>
    <hr>
    <div class="adminMain">     
	    <!-- Swiper -->
	    <div class="swiper-container mySwiper">
	      <div class="swiper-wrapper">
	        <!-- card 1-1 -->
		    <c:forEach items="${p_productList}" var ="product" >
		        <div class="swiper-slide card col-xs-6" style="display: inline-block; width: 13rem;">
		            	<c:forEach items="${product.pdImgList}" var="pdImg">
	   			        	<img src="<c:url value='/resources/upload/product/${pdImg.renamedFilename}'/>" class="card-img mt-1" alt="tree" style="width:250px; height: 100%;">
		            	</c:forEach>
		            <div class="card-body ">
                    	<h5 class="card-title">${product.idolName}</h5>
                    	<p style="height: 50px;">${product.pdName}</p>
		                <p class="card-text"> 
	                        <span class="badge bg-dark">${product.pdCategory}</span>    
	                        <span class="badge bg-s bg-warning ">재고 : ${product.pdStock} </span>  
	                        <span class="badge bg-s bg-warning ">판매량  : ${product.pdSales}</span>
		                </p>
		                <div class="btn-group" role="group" aria-label="Basic example">
	                    <button type="button" class="btn btn-sm btn-outline-main"  data-no="${product.pdNo}" onclick="productDetail(event);" >상세보기</button>
	                    <button type="button" class="btn btn-sm btn-outline-main"  data-no="${product.pdNo}" onclick="productDelete(event);">삭제하기</button>
		                </div>
		            </div>
		        <!-- card End -->
		        </div>  
		    </c:forEach> 
	      </div>
	      <div class="swiper-button-next"></div>
	      <div class="swiper-button-prev"></div>
	      <div class="swiper-pagination"></div>
	    </div>
    </div>
	    
    <!-- 인기 상품 목록 -->
    <h5 style="font-weight: bold; margin-top: 3rem;">BEST 12</h5>
    <hr>
    <div class="adminMain">     
	    <!-- Swiper -->
	    <div class="swiper-container mySwiper">
	      <div class="swiper-wrapper">
	        <!-- card 1-1 -->
		    <c:forEach items="${best_productList}" var ="bestProduct" >
		        <div class="swiper-slide card col-xs-6" style="display: inline-block; width: 13rem;">
		            	<c:forEach items="${bestProduct.pdImgList}" var="pdImg">
	   			        	<img src="<c:url value='/resources/upload/product/${pdImg.renamedFilename}'/>" class="card-img mt-1" alt="tree" style="width:250px; height: 100%;">
		            	</c:forEach>
		            <div class="card-body ">
                    	<h5 class="card-title">${bestProduct.idolName}</h5>
                    	<p style="height: 50px;">${bestProduct.pdName}</p>
		                <p class="card-text"> 
	                        <span class="badge bg-dark">${bestProduct.pdCategory}</span>    
	                        <span class="badge bg-s bg-warning ">재고 : ${bestProduct.pdStock} </span>  
	                        <span class="badge bg-s bg-warning ">판매량  : ${bestProduct.pdSales}</span>
		                </p>
		                <div class="btn-group" role="group" aria-label="Basic example">
	                    <button type="button" class="btn btn-sm btn-outline-main"  data-no="${bestProduct.pdNo}" onclick="productDetail(event);" >상세보기</button>
	                    <button type="button" class="btn btn-sm btn-outline-main"  data-no="${bestProduct.pdNo}" onclick="productUpdate(event);" >수정하기</button>
		                </div>
		            </div>
		        <!-- card End -->
		        </div>  
		    </c:forEach> 
	      </div>
	      <div class="swiper-button-next"></div>
	      <div class="swiper-button-prev"></div>
	      <div class="swiper-pagination"></div>
	    </div>
    </div>
	    
		   
    <!-- 품절 상품 목록 -->
    <h5 style="font-weight: bold; margin-top: 3rem;"> 품절 상품 </h5>
    <hr>
    <div class="adminMain">     
	    <!-- Swiper -->
	    <div class="swiper-container mySwiper">
	      <div class="swiper-wrapper">
	        <!-- card 1-1 -->
	        <c:if test="${empty SoldOut_productList }"> 
	        	<h3 class='text-center'> <span>품절상품 없음</span></h3>
	        </c:if>
		    <c:forEach items="${SoldOut_productList}" var ="soldOutProduct" >
		        <div class="swiper-slide card col-xs-6" style="display: inline-block; width: 13rem;">
		            	<c:forEach items="${soldOutProduct.pdImgList}" var="pdImg">
	   			        	<img src="<c:url value='/resources/upload/product/${pdImg.renamedFilename}'/>" class="card-img mt-1" alt="tree" style="width:250px; height: 100%;">
		            	</c:forEach>
		            <div class="card-body ">
                    	<h5 class="card-title">${soldOutProduct.idolName}</h5>
                    	<p style="height: 50px;">${soldOutProduct.pdName}</p>
		                <p class="card-text"> 
	                        <span class="badge bg-dark">${soldOutProduct.pdCategory}</span>    
	                        <span class="badge bg-s bg-warning ">재고 : ${soldOutProduct.pdStock} </span>  
	                        <span class="badge bg-s">판매량  : ${soldOutProduct.pdSales}</span>
		                </p>
	                    <div class="input-group">
	                        <input type="number"
	                        class="form-control" placeholder="재고 추가"  id="stock${soldOutProduct.pdNo}"/>
	                        <button type="button" class="btn btn-sm btn-outline-main" onclick="productStockUpdate(event);" data-no="${soldOutProduct.pdNo}">수정</button>
	                    </div>
		            </div>
		        <!-- card End -->
		        </div>  
		    </c:forEach> 
	      </div>
	      <div class="swiper-button-next"></div>
	      <div class="swiper-button-prev"></div>
	      <div class="swiper-pagination"></div>
	    </div>
    </div>
<!--container end -->
</div>
<script> 
    var swiper = new Swiper(".mySwiper", {
      slidesPerView: 4,
      spaceBetween: 30,
      slidesPerGroup: 4,
      loop: true,
      loopFillGroupWithBlank: true,
      navigation: {
        nextEl: ".swiper-button-next",
        prevEl: ".swiper-button-prev",
      },
    });
    function productDetail(event) {
        const target = event.target;
        const pdNo= target.dataset.no;
        location.href=`${pageContext.request.contextPath}/admin/adminProductDetail/\${pdNo}`
    }

	function refreshMemList(){
		location.reload();
	}
</script>
<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>
