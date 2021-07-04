<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param value="Main" name="title"/>
</jsp:include>
<style>
.carousel-control-prev{
	left:-120px;
}
.carousel-control-next{
	right:-120px;	
}

.card{
	height:480px;
}
.btn-group{
	position:absolute;
	left:80px;
	bottom : 10px;
}
</style>
<div class="container">
  <!-- 슬라이드 이미지 -->
  <div id="carouselExampleControls" class="carousel slide slide-img" data-ride="carousel">
    <div class="carousel-inner">
      <c:forEach items="${slideList}" var="slideImg" varStatus="status">
      <c:if test="${status.index eq 0}">      
      <div class="carousel-item active idol" onclick="artistDetail();">
        <img src="${pageContext.request.contextPath}/resources/upload/slide/${slideImg.renamedFilename}" class="d-block w-100 idol-img" alt="...">
      </div>
      </c:if>
      <c:if test="${status.index ne 0}">      
      <div class="carousel-item idol" onclick="artistDetail();">
        <img src="${pageContext.request.contextPath}/resources/upload/slide/${slideImg.renamedFilename}" class="d-block w-100 idol-img" alt="...">
      </div>
      </c:if>
	  </c:forEach>
    </div>
    <a class="carousel-control-prev" href="#carouselExampleControls" role="button" data-slide="prev">
      <span class="carousel-control-prev-icon" aria-hidden="true"></span>
      <span class="sr-only">Previous</span>
    </a>
    <a class="carousel-control-next" href="#carouselExampleControls" role="button" data-slide="next">
      <span class="carousel-control-next-icon" aria-hidden="true"></span>
      <span class="sr-only">Next</span>
    </a>
  <!-- slide end -->
  </div>

  <!-- 추천상품 -->
  <c:if test="${!empty randomList}">
  <h5 style="font-weight: bold;">추천상품</h5>
  <hr>
  
  <div class="idol-item row d-none d-sm-block">
    <div class="row g-3">
    <!-- 반복시작 -->
    <div id="carouselExampleControlss" class="carousel slide slide-img" data-ride="carousel">
	    <div class="carousel-inner">
		    <div class="carousel-item active idol">
		      <c:forEach items="${randomList}" var="product" varStatus="status">
		      <c:if test="${status.index < 4}">
		      <div class="mx-auto" style="display:inline-block;">
		        <div class="card col-xs-4" style="width:250px; display:inline-block; float: left; margin:10px; 0px; 10px; 0px;">
		            	<c:forEach items="${product.pdImgList}" var="pdImg">
					        <c:if test="${pdImg.pdCategory eq 'R'}">
								<img src="<c:url value='/resources/upload/product/${pdImg.renamedFilename}'/>" class="card-img mt-1" alt="${product.pdContent}" style="width:100%; height:auto;">
						   	</c:if>
				    	</c:forEach>
		           
		            <div class="card-body">
		              <h5 class="card-title">${product.pdName}</h5>
		              <p class="card-text">  
		                <span class="badge bg-s">${product.idolName}</span><br />
		                <span class="badge bg-dark">공식굿즈</span>
		                <span class="badge bg-dark">${product.pdCategory}</span>
		              </p>
		              <div class="btn-group" role="group" aria-label="Basic example" data-no="${product.pdNo}">
		                <button type="button" class="btn btn-sm btn-outline-main" name="pdDetail">상세보기</button>
		              </div>
		            </div>
		        </div>
		      <!-- col-lg-3 col-md-6 End -->
		      </div>
		      		   
		      </c:if>
		      </c:forEach>
		      </div>
		      
		      <div class="carousel-item idol">
		      <c:forEach items="${randomList}" var="product" varStatus="status">
		      <c:if test="${status.index > 3}">
		      <div class="mx-auto" style="display:inline-block;">
		        <div class="card col-xs-4" style="width:250px; display:inline-block; float: left; margin:10px; 0px; 10px; 0px;">
		            	<c:forEach items="${product.pdImgList}" var="pdImg">
					        <c:if test="${pdImg.pdCategory eq 'R'}">
								<img src="<c:url value='/resources/upload/product/${pdImg.renamedFilename}'/>" class="card-img mt-1" alt="${product.pdContent}" style="width:100%; height:auto;">
						   	</c:if>
				    	</c:forEach>
		           
		            <div class="card-body">
		              <h5 class="card-title">${product.pdName}</h5>
		              <p class="card-text">  
		                <span class="badge bg-s">${product.idolName}</span><br />
		                <span class="badge bg-dark">공식굿즈</span>
		                <span class="badge bg-dark">${product.pdCategory}</span>
		              </p>
		              <div class="btn-group" role="group" aria-label="Basic example" data-no="${product.pdNo}">
		                <button type="button" class="btn btn-sm btn-outline-main" name="pdDetail">상세보기</button>
		              </div>
		            </div>
		        </div>
		      <!-- col-lg-3 col-md-6 End -->
		      </div>
		      </c:if>
		      </c:forEach>
		      </div>
	      </div>
		<a class="carousel-control-prev" href="#carouselExampleControlss" role="button" data-slide="prev">
	      <span class="carousel-control-prev-icon" aria-hidden="true"></span>
	      <span class="sr-only">Previous</span>
	    </a>
	    <a class="carousel-control-next" href="#carouselExampleControlss" role="button" data-slide="next">
	      <span class="carousel-control-next-icon" aria-hidden="true"></span>
	      <span class="sr-only">Next</span>
	    </a>
      </div>
     <!-- 반복 끝 -->
    <!-- row g-3 End -->
    </div>
  <!-- row end -->
  </div>
  </c:if>
  

  
  <!-- 신규 상품 -->
  <c:if test="${!empty newGoodsList}">
  <h5 style="font-weight: bold;">NEW GOODS</h5>
  <hr>
  
  <div class="idol-item row d-none d-sm-block">
    <div class="row g-3">
    <!-- 반복시작 -->
    <div id="carouselExampleControlsss" class="carousel slide slide-img" data-ride="carousel">
	    <div class="carousel-inner">
		    <div class="carousel-item active idol">
		      <c:forEach items="${newGoodsList}" var="product" varStatus="status">
		      <c:if test="${status.index < 4}">
		      <div class="mx-auto" style="display:inline-block;">
		        <div class="card col-xs-4" style="width:250px; display:inline-block; float: left; margin:10px; 0px; 10px; 0px;">
		            	<c:forEach items="${product.pdImgList}" var="pdImg">
					        <c:if test="${pdImg.pdCategory eq 'R'}">
								<img src="<c:url value='/resources/upload/product/${pdImg.renamedFilename}'/>" class="card-img mt-1" alt="${product.pdContent}" style="width:100%; height:auto;">
						   	</c:if>
				    	</c:forEach>
		           
		            <div class="card-body">
		              <h5 class="card-title">${product.pdName}</h5>
		              <p class="card-text">  
		                <span class="badge bg-s">${product.idolName}</span><br />
		                <span class="badge bg-dark">공식굿즈</span>
		                <span class="badge bg-dark">${product.pdCategory}</span>
		              </p>
		              <div class="btn-group" role="group" aria-label="Basic example" data-no="${product.pdNo}">
		                <button type="button" class="btn btn-sm btn-outline-main" name="pdDetail">상세보기</button>
		              </div>
		            </div>
		        </div>
		      <!-- col-lg-3 col-md-6 End -->
		      </div>
		      		   
		      </c:if>
		      </c:forEach>
		      </div>
		      
		      <div class="carousel-item idol">
		      <c:forEach items="${randomList}" var="product" varStatus="status">
		      <c:if test="${status.index > 3}">
		      <div class="mx-auto" style="display:inline-block;">
		        <div class="card col-xs-4" style="width:250px; display:inline-block; float: left; margin:10px; 0px; 10px; 0px;">
		            	<c:forEach items="${product.pdImgList}" var="pdImg">
					        <c:if test="${pdImg.pdCategory eq 'R'}">
								<img src="<c:url value='/resources/upload/product/${pdImg.renamedFilename}'/>" class="card-img mt-1" alt="${product.pdContent}" style="width:100%; height:auto;">
						   	</c:if>
				    	</c:forEach>
		           
		            <div class="card-body">
		              <h5 class="card-title">${product.pdName}</h5>
		              <p class="card-text">  
		                <span class="badge bg-s">${product.idolName}</span><br />
		                <span class="badge bg-dark">공식굿즈</span>
		                <span class="badge bg-dark">${product.pdCategory}</span>
		              </p>
		              <div class="btn-group" role="group" aria-label="Basic example" data-no="${product.pdNo}">
		                <button type="button" class="btn btn-sm btn-outline-main" name="pdDetail">상세보기</button>
		              </div>
		            </div>
		        </div>
		      <!-- col-lg-3 col-md-6 End -->
		      </div>
		      </c:if>
		      </c:forEach>
		      </div>
	      </div>
		<a class="carousel-control-prev" href="#carouselExampleControlsss" role="button" data-slide="prev">
	      <span class="carousel-control-prev-icon" aria-hidden="true"></span>
	      <span class="sr-only">Previous</span>
	    </a>
	    <a class="carousel-control-next" href="#carouselExampleControlsss" role="button" data-slide="next">
	      <span class="carousel-control-next-icon" aria-hidden="true"></span>
	      <span class="sr-only">Next</span>
	    </a>
      </div>
     <!-- 반복 끝 -->
    <!-- row g-3 End -->
    </div>
  <!-- row end -->
  </div>
  </c:if>

  

  <!-- 인기 상품 -->
  <c:if test="${!empty bestSellList}">
  <h5 style="font-weight: bold;">인기상품</h5>
  <hr>
  
  <div class="idol-item row d-none d-sm-block">
    <div class="row g-3">
    <!-- 반복시작 -->
    <div id="carouselExampleControlssss" class="carousel slide slide-img" data-ride="carousel">
	    <div class="carousel-inner">
		    <div class="carousel-item active idol">
		      <c:forEach items="${bestSellList}" var="product" varStatus="status">
		      <c:if test="${status.index < 4}">
		      <div class="mx-auto" style="display:inline-block;">
		        <div class="card col-xs-4" style="width:250px; display:inline-block; float: left; margin:10px; 0px; 10px; 0px;">
		            	<c:forEach items="${product.pdImgList}" var="pdImg">
					        <c:if test="${pdImg.pdCategory eq 'R'}">
								<img src="<c:url value='/resources/upload/product/${pdImg.renamedFilename}'/>" class="card-img mt-1" alt="${product.pdContent}" style="width:100%; height:auto;">
						   	</c:if>
				    	</c:forEach>
		           
		            <div class="card-body">
		              <h5 class="card-title">${product.pdName}</h5>
		              <p class="card-text">  
		                <span class="badge bg-s">${product.idolName}</span><br />
		                <span class="badge bg-dark">공식굿즈</span>
		                <span class="badge bg-dark">${product.pdCategory}</span>
		              </p>
		              <div class="btn-group" role="group" aria-label="Basic example" data-no="${product.pdNo}">
		                <button type="button" class="btn btn-sm btn-outline-main" name="pdDetail">상세보기</button>
		              </div>
		            </div>
		        </div>
		      <!-- col-lg-3 col-md-6 End -->
		      </div>
		      		   
		      </c:if>
		      </c:forEach>
		      </div>
		      
		      <div class="carousel-item idol">
		      <c:forEach items="${randomList}" var="product" varStatus="status">
		      <c:if test="${status.index > 3}">
		      <div class="mx-auto" style="display:inline-block;">
		        <div class="card col-xs-4" style="width:250px; display:inline-block; float: left; margin:10px; 0px; 10px; 0px;">
		            	<c:forEach items="${product.pdImgList}" var="pdImg">
					        <c:if test="${pdImg.pdCategory eq 'R'}">
								<img src="<c:url value='/resources/upload/product/${pdImg.renamedFilename}'/>" class="card-img mt-1" alt="${product.pdContent}" style="width:100%; height:auto;">
						   	</c:if>
				    	</c:forEach>
		           
		            <div class="card-body">
		              <h5 class="card-title">${product.pdName}</h5>
		              <p class="card-text">  
		                <span class="badge bg-s">${product.idolName}</span><br />
		                <span class="badge bg-dark">공식굿즈</span>
		                <span class="badge bg-dark">${product.pdCategory}</span>
		              </p>
		              <div class="btn-group" role="group" aria-label="Basic example" data-no="${product.pdNo}">
		                <button type="button" class="btn btn-sm btn-outline-main" name="pdDetail">상세보기</button>
		              </div>
		            </div>
		        </div>
		      <!-- col-lg-3 col-md-6 End -->
		      </div>
		      </c:if>
		      </c:forEach>
		      </div>
	      </div>
		<a class="carousel-control-prev" href="#carouselExampleControlssss" role="button" data-slide="prev">
	      <span class="carousel-control-prev-icon" aria-hidden="true"></span>
	      <span class="sr-only">Previous</span>
	    </a>
	    <a class="carousel-control-next" href="#carouselExampleControlssss" role="button" data-slide="next">
	      <span class="carousel-control-next-icon" aria-hidden="true"></span>
	      <span class="sr-only">Next</span>
	    </a>
      </div>
     <!-- 반복 끝 -->
    <!-- row g-3 End -->
    </div>
  <!-- row end -->
  </div>
  </c:if>


<!-- container end -->
</div>

<script>
$("#pdInfo-btn").click(function(){
	window.location.href="${pageContext.request.contextPath}/product/productInfo";
});

$(() => {
	$("button[name=pdDetail]").click(e => {
		//화살표함수안에서는 this는 e.target이 아니다.
		//console.log(e.target); // td태그클릭 -> 부모tr로 이벤트전파(bubbling)
		var $no = $(e.target).parent();
		var no = $no.data("no");
		console.log(no);
		
		location.href = "${pageContext.request.contextPath}/product/productInfo?no=" + no;
	});
});
</script>

<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>
