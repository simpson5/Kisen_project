<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param value="Main" name="title"/>
</jsp:include>

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
  <c:if test="${!empty list}">
  <h5 style="font-weight: bold;">추천상품</h5>
  <hr>
  <div class="idol-item row d-none d-sm-block">
    <div class="row g-3 ">
      <c:forEach items="${list}" var="product">
      <div class="col-lg-3 col-md-4 col-sm-6 ">
        <div class="card" style="width: 13rem;">
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
                <button type="button" class="btn btn-sm btn-outline-main">장바구니 담기</button>
              </div>
            </div>
        </div>
      <!-- col-lg-3 col-md-6 End -->
      </div>
      </c:forEach>
    <!-- row g-3 End -->
    </div>
  <!-- row end -->
  </div>
  </c:if>
  <!-- 화면 최소화시만 보이는 div -->
  <div class="slide-card d-block d-sm-none">
    <div id="carouselExampleControls-card" class="carousel slide slide-img" data-ride="carousel">
      <div class="carousel-inner">
        <div class="carousel-item active idol">
            <!-- card 1-1 -->
            <div class="card card-slide col-xs-6" style="display: inline-block;">
              <div class="embed-responsive embed-responsive-4by3 ">
                <img src="${pageContext.request.contextPath}/resources/images/idol/bts.jpg" class="card-img-top embed-responsive-item  card-img" alt="tree">
              </div>
              <div class="card-body ">
                <p class="card-title-slide">방탄소년단</p>
                <button type="button" class="btn btn-sm btn-outline-main">상세보기</button>
              </div>
            <!-- card End -->
            </div>                  
            <!-- card 1-2 -->
            <div class="card card-slide col-xs-6" style="display: inline-block;">
              <div class="embed-responsive embed-responsive-4by3 ">
                <img src="${pageContext.request.contextPath}/resources/images/idol/nct.png" class="card-img-top embed-responsive-item  card-img" alt="tree">
              </div>
              <div class="card-body">
                <p class="card-title-slide">NCT</p>
                <button type="button" class="btn btn-sm btn-outline-main">상세보기</button>
              </div>
            <!-- card End -->
            </div>
        </div>
        <div class="carousel-item idol" onclick="artistDetail();">
          <!-- card 2-1 -->
          <div class="card card-slide col-xs-6" style="display: inline-block;">
            <div class="embed-responsive embed-responsive-4by3 ">
              <img src="${pageContext.request.contextPath}/resources/images/idol/itzy.png" class="card-img-top embed-responsive-item  card-img" alt="tree" >
            </div>
            <div class="card-body">
              <p class="card-title-slide">ITZY</p>
              <button type="button" class="btn btn-sm btn-outline-main">상세보기</button>
            </div>
          <!-- card End -->
          </div>
          
          <!-- card 2-2 -->
          <div class="card card-slide col-xs-6" style="display: inline-block;">
            <div class="embed-responsive embed-responsive-4by3 ">
              <img src="${pageContext.request.contextPath}/resources/images/idol/monstax.jpg" class="card-img-top embed-responsive-item  card-img" alt="tree">
            </div>
            <div class="card-body card-body-slide">
              <p class="card-title-slide">MONSTA X</p>
              <button type="button" class="btn btn-sm btn-outline-main">상세보기</button>
            </div>
          <!-- card End -->
          </div>
        </div>
      </div>
      <a class="carousel-control-prev" href="#carouselExampleControls-card" role="button" data-slide="prev">
        <span class="carousel-control-prev-icon" aria-hidden="true"></span>
        <span class="sr-only">Previous</span>
      </a>
      <a class="carousel-control-next" href="#carouselExampleControls-card" role="button" data-slide="next">
        <span class="carousel-control-next-icon" aria-hidden="true"></span>
        <span class="sr-only">Next</span>
      </a>
    <!-- slide end -->
    </div>
  <!-- slide-card end -->
  </div>

  
  <!-- 신규 상품 -->
  <c:if test="${!empty newGoodsList}">
  <h5 style="font-weight: bold;">NEW GOODS</h5>
  <hr>
  <div class="idol-item row d-none d-sm-block">
    <div class="row g-3 ">
      <c:forEach items="${newGoodsList}" var="product">
      <div class="col-lg-3 col-md-4 col-sm-6 ">
        <div class="card" style="width: 13rem;">
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
                <button type="button" class="btn btn-sm btn-outline-main">장바구니 담기</button>
              </div>
            </div>
        </div>
      <!-- col-lg-3 col-md-6 End -->
      </div>
      </c:forEach>
    <!-- row g-3 End -->
    </div>
  <!-- row end -->
  </div>
  </c:if>

  <!-- 화면 최소화시만 보이는 div -->
  <div class="slide-card d-block d-sm-none">
    <div id="carouselExampleControls-card2" class="carousel slide slide-img" data-ride="carousel">
      <div class="carousel-inner">
        <div class="carousel-item active idol">
            <!-- card 1-1 -->
            <div class="card card-slide col-xs-6" style="display: inline-block;">
              <div class="embed-responsive embed-responsive-4by3 ">
                <img src="${pageContext.request.contextPath}/resources/images/idol/bts.jpg" class="card-img-top embed-responsive-item  card-img" alt="tree">
              </div>
              <div class="card-body ">
                <p class="card-title-slide">방탄소년단</p>
                <button type="button" class="btn btn-sm btn-outline-main">상세보기</button>
              </div>
            <!-- card End -->
            </div>                  
            <!-- card 1-2 -->
            <div class="card card-slide col-xs-6" style="display: inline-block;">
              <div class="embed-responsive embed-responsive-4by3 ">
                <img src="${pageContext.request.contextPath}/resources/images/idol/nct.png" class="card-img-top embed-responsive-item  card-img" alt="tree">
              </div>
              <div class="card-body">
                <p class="card-title-slide">NCT</p>
                <button type="button" class="btn btn-sm btn-outline-main">상세보기</button>
              </div>
            <!-- card End -->
            </div>
        </div>
        <div class="carousel-item idol" onclick="artistDetail();">
          <!-- card 2-1 -->
          <div class="card card-slide col-xs-6" style="display: inline-block;">
            <div class="embed-responsive embed-responsive-4by3 ">
              <img src="${pageContext.request.contextPath}/resources/images/idol/itzy.png" class="card-img-top embed-responsive-item  card-img" alt="tree" >
            </div>
            <div class="card-body">
              <p class="card-title-slide">ITZY</p>
              <button type="button" class="btn btn-sm btn-outline-main">상세보기</button>
            </div>
          <!-- card End -->
          </div>
          
          <!-- card 2-2 -->
          <div class="card card-slide col-xs-6" style="display: inline-block;">
            <div class="embed-responsive embed-responsive-4by3 ">
              <img src="${pageContext.request.contextPath}/resources/images/idol/monstax.jpg" class="card-img-top embed-responsive-item  card-img" alt="tree">
            </div>
            <div class="card-body card-body-slide">
              <p class="card-title-slide">MONSTA X</p>
              <button type="button" class="btn btn-sm btn-outline-main">상세보기</button>
            </div>
          <!-- card End -->
          </div>
        </div>
      </div>
      <a class="carousel-control-prev" href="#carouselExampleControls-card2" role="button" data-slide="prev">
        <span class="carousel-control-prev-icon" aria-hidden="true"></span>
        <span class="sr-only">Previous</span>
      </a>
      <a class="carousel-control-next" href="#carouselExampleControls-card2" role="button" data-slide="next">
        <span class="carousel-control-next-icon" aria-hidden="true"></span>
        <span class="sr-only">Next</span>
      </a>
    <!-- slide end -->
    </div>
  <!-- slide-card end -->
  </div>

  <!-- 인기 상품 -->
  <c:if test="${!empty bestSellList}">
  <h5 style="font-weight: bold;">인기 상품</h5>
  <hr>
  <div class="idol-item row d-none d-sm-block">
    <div class="row g-3 ">
      <c:forEach items="${bestSellList}" var="product">
      <div class="col-lg-3 col-md-4 col-sm-6 ">
        <div class="card" style="width: 13rem;">
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
                <button type="button" class="btn btn-sm btn-outline-main">장바구니 담기</button>
              </div>
            </div>
        </div>
      <!-- col-lg-3 col-md-6 End -->
      </div>
      </c:forEach>
    <!-- row g-3 End -->
    </div>
  <!-- row end -->
  </div>
  </c:if>

  <!-- 화면 최소화시만 보이는 div -->
  <div class="slide-card d-block d-sm-none">
    <div id="carouselExampleControls-card3" class="carousel slide slide-img" data-ride="carousel">
      <div class="carousel-inner">
        <div class="carousel-item active idol">
            <!-- card 1-1 -->
            <div class="card card-slide col-xs-6" style="display: inline-block;">
              <div class="embed-responsive embed-responsive-4by3 ">
                <img src="${pageContext.request.contextPath}/resources/images/idol/bts.jpg" class="card-img-top embed-responsive-item  card-img" alt="tree">
              </div>
              <div class="card-body ">
                <p class="card-title-slide">방탄소년단</p>
                <button type="button" class="btn btn-sm btn-outline-main">상세보기</button>
              </div>
            <!-- card End -->
            </div>                  
            <!-- card 1-2 -->
            <div class="card card-slide col-xs-6" style="display: inline-block;">
              <div class="embed-responsive embed-responsive-4by3 ">
                <img src="${pageContext.request.contextPath}/resources/images/idol/nct.png" class="card-img-top embed-responsive-item  card-img" alt="tree">
              </div>
              <div class="card-body">
                <p class="card-title-slide">NCT</p>
                <button type="button" class="btn btn-sm btn-outline-main">상세보기</button>
              </div>
            <!-- card End -->
            </div>
        </div>
        <div class="carousel-item idol" onclick="artistDetail();">
          <!-- card 2-1 -->
          <div class="card card-slide col-xs-6" style="display: inline-block;">
            <div class="embed-responsive embed-responsive-4by3 ">
              <img src="${pageContext.request.contextPath}/resources/images/idol/itzy.png" class="card-img-top embed-responsive-item  card-img" alt="tree" >
            </div>
            <div class="card-body">
              <p class="card-title-slide">ITZY</p>
              <button type="button" class="btn btn-sm btn-outline-main">상세보기</button>
            </div>
          <!-- card End -->
          </div>
          
          <!-- card 2-2 -->
          <div class="card card-slide col-xs-6" style="display: inline-block;">
            <div class="embed-responsive embed-responsive-4by3 ">
              <img src="${pageContext.request.contextPath}/resources/images/idol/monstax.jpg" class="card-img-top embed-responsive-item  card-img" alt="tree">
            </div>
            <div class="card-body card-body-slide">
              <p class="card-title-slide">MONSTA X</p>
              <button type="button" class="btn btn-sm btn-outline-main">상세보기</button>
            </div>
          <!-- card End -->
          </div>
        </div>
      </div>
      <a class="carousel-control-prev" href="#carouselExampleControls-card3" role="button" data-slide="prev">
        <span class="carousel-control-prev-icon" aria-hidden="true"></span>
        <span class="sr-only">Previous</span>
      </a>
      <a class="carousel-control-next" href="#carouselExampleControls-card3" role="button" data-slide="next">
        <span class="carousel-control-next-icon" aria-hidden="true"></span>
        <span class="sr-only">Next</span>
      </a>
    <!-- slide end -->
    </div>
  <!-- slide-card end -->
  </div>


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
