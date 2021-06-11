<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param value="Main" name="title"/>
</jsp:include>

<a href="${pageContext.request.contextPath}/admin/adminMain.do">관리자</a>
<a href="${pageContext.request.contextPath}/agency/agencyMain.do">기획사</a>
<div class="container">
  <!-- 슬라이드 이미지 -->
  <div id="carouselExampleControls" class="carousel slide slide-img" data-ride="carousel">
    <div class="carousel-inner">
      <div class="carousel-item active idol" onclick="artistDetail();">
        <img src="${pageContext.request.contextPath}/resources/images/idol/bts.jpg" class="d-block w-100 idol-img" alt="...">
      </div>
      <div class="carousel-item idol" onclick="artistDetail();">
        <img src="${pageContext.request.contextPath}/resources/images/idol/itzy.png " class="d-block w-100 idol-img"  alt="...">
      </div>
      <div class="carousel-item idol" onclick="artistDetail();">
        <img src="${pageContext.request.contextPath}/resources/images/idol/monstax.jpg" class="d-block w-100 idol-img " alt="...">
      </div>
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
  <h5 style="font-weight: bold;">추천상품</h5>
  <hr>
  <div class="idol-item row d-none d-sm-block">
    <div class="row g-3 ">
      <div class="col-lg-3 col-md-4 col-sm-6 ">
        <div class="card" style="width: 13rem;">
            <div class="embed-responsive embed-responsive-4by3 ">
              <img src="${pageContext.request.contextPath}/resources/images/idol/bts.jpg" class="card-img-top embed-responsive-item  card-img" alt="tree" style="">
            </div>
            <div class="card-body">
              <h5 class="card-title">방탄소년단</h5>
              <p class="card-text"> 
                <span class="badge bg-s"> BTS</span>
                <span class="badge bg-dark">공식굿즈</span>
                <span class="badge bg-dark">앨범</span>
              </p>
              <div class="btn-group" role="group" aria-label="Basic example">
                <button type="button" class="btn btn-sm btn-outline-main">상세보기</button>
                <button type="button" class="btn btn-sm btn-outline-main">장바구니 담기</button>
              </div>
            </div>
        </div>
      <!-- col-lg-3 col-md-6 End -->
      </div>

      <div class="col-lg-3 col-md-4 col-sm-6">
        <div class="card" style="width: 13rem;">
          <div class="embed-responsive embed-responsive-4by3">
            <img src="${pageContext.request.contextPath}/resources/images/idol/itzy.png" class="card-img-top embed-responsive-item" alt="tree">
          </div>
            <div class="card-body">
              <h5 class="card-title">ITZY</h5>
              <p class="card-text"> 
                <span class="badge bg-s">ITZY</span>
                <span class="badge bg-dark">공식굿즈</span>
                <span class="badge bg-dark">앨범</span>
              </p>
              <div class="btn-group" role="group" aria-label="Basic example">
                <button type="button" class="btn btn-sm btn-outline-main">상세보기</button>
                <button type="button" class="btn btn-sm btn-outline-main">장바구니 담기</button>
              </div>
            </div>
        </div>
      <!-- col-lg-3 col-md-6 End -->
      </div>

      <div class="col-lg-3 col-md-4 col-sm-6">
        <div class="card" style="width: 13rem;">
          <div class="embed-responsive embed-responsive-4by3">
            <img src="${pageContext.request.contextPath}/resources/images/idol/nct.png" class="card-img-top embed-responsive-item" alt="tree" >
          </div>
            <div class="card-body">
              <h5 class="card-title">NCT</h5>
              <p class="card-text"> 
                <span class="badge bg-s">NCT</span>
                <span class="badge bg-dark">공식굿즈</span>
                <span class="badge bg-dark">앨범</span>
              </p>
              <div class="btn-group" role="group" aria-label="Basic example">
                <button type="button" class="btn btn-sm btn-outline-main">상세보기</button>
                <button type="button" class="btn btn-sm btn-outline-main">장바구니 담기</button>
              </div>
            </div>
        </div>
      <!-- col-lg-3 col-md-6 End -->
      </div>
      <div class="col-lg-3 col-md-4 col-sm-6">
        <div class="card" style="width: 13rem;">
          <div class="embed-responsive embed-responsive-4by3">
            <img src="${pageContext.request.contextPath}/resources/images/idol/tiwce.png" class="card-img-top embed-responsive-item" alt="tree">
          </div>
            <div class="card-body">
              <h5 class="card-title">TIWCE</h5>
              <p class="card-text"> 
                <span class="badge bg-s">TIWCE</span>
                <span class="badge bg-dark">공식굿즈</span>
                <span class="badge bg-dark"></span>
              </p>
              <div class="btn-group" role="group" aria-label="Basic example">
                <button type="button" class="btn btn-sm btn-outline-main">상세보기</button>
                <button type="button" class="btn btn-sm btn-outline-main">장바구니 담기</button>
              </div>
            </div>
        </div>
      <!-- col-lg-3 col-md-6 End -->
      </div>
    <!-- row g-3 End -->
    </div>
  <!-- row end -->
  </div>

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

  
  <!-- 인기 상품 -->
  <h5 style="font-weight: bold; margin-top: 3rem;">NEW GOODS</h5>
  <hr>
  <div class="idol-item row d-none d-sm-block">
    <div class="row g-3 ">
      <div class="col-lg-3 col-md-4 col-sm-6 ">
        <div class="card" style="width: 13rem;">
            <div class="embed-responsive embed-responsive-4by3 ">
              <img src="${pageContext.request.contextPath}/resources/images/idol/bts.jpg" class="card-img-top embed-responsive-item  card-img" alt="tree" style="">
            </div>
            <div class="card-body">
              <h5 class="card-title">방탄소년단</h5>
              <p class="card-text"> 
                <span class="badge bg-s"> BTS</span>
                <span class="badge bg-dark">공식굿즈</span>
                <span class="badge bg-dark">앨범</span>
              </p>
              <div class="btn-group" role="group" aria-label="Basic example">
                <button type="button" class="btn btn-sm btn-outline-main">상세보기</button>
                <button type="button" class="btn btn-sm btn-outline-main">장바구니 담기</button>
              </div>
            </div>
        </div>
      <!-- col-lg-3 col-md-6 End -->
      </div>

      <div class="col-lg-3 col-md-4 col-sm-6">
        <div class="card" style="width: 13rem;">
          <div class="embed-responsive embed-responsive-4by3">
            <img src="${pageContext.request.contextPath}/resources/images/idol/itzy.png" class="card-img-top embed-responsive-item" alt="tree">
          </div>
            <div class="card-body">
              <h5 class="card-title">ITZY</h5>
              <p class="card-text"> 
                <span class="badge bg-s">ITZY</span>
                <span class="badge bg-dark">공식굿즈</span>
                <span class="badge bg-dark">앨범</span>
              </p>
              <div class="btn-group" role="group" aria-label="Basic example">
                <button type="button" class="btn btn-sm btn-outline-main">상세보기</button>
                <button type="button" class="btn btn-sm btn-outline-main">장바구니 담기</button>
              </div>
            </div>
        </div>
      <!-- col-lg-3 col-md-6 End -->
      </div>

      <div class="col-lg-3 col-md-4 col-sm-6">
        <div class="card" style="width: 13rem;">
          <div class="embed-responsive embed-responsive-4by3">
            <img src="${pageContext.request.contextPath}/resources/images/idol/nct.png" class="card-img-top embed-responsive-item" alt="tree" >
          </div>
            <div class="card-body">
              <h5 class="card-title">NCT</h5>
              <p class="card-text"> 
                <span class="badge bg-s">NCT</span>
                <span class="badge bg-dark">공식굿즈</span>
                <span class="badge bg-dark">앨범</span>
              </p>
              <div class="btn-group" role="group" aria-label="Basic example">
                <button type="button" class="btn btn-sm btn-outline-main">상세보기</button>
                <button type="button" class="btn btn-sm btn-outline-main">장바구니 담기</button>
              </div>
            </div>
        </div>
      <!-- col-lg-3 col-md-6 End -->
      </div>
      <div class="col-lg-3 col-md-4 col-sm-6">
        <div class="card" style="width: 13rem;">
          <div class="embed-responsive embed-responsive-4by3">
            <img src="${pageContext.request.contextPath}/resources/images/idol/tiwce.png" class="card-img-top embed-responsive-item" alt="tree">
          </div>
            <div class="card-body">
              <h5 class="card-title">TIWCE</h5>
              <p class="card-text"> 
                <span class="badge bg-s">TIWCE</span>
                <span class="badge bg-dark">공식굿즈</span>
                <span class="badge bg-dark"></span>
              </p>
              <div class="btn-group" role="group" aria-label="Basic example">
                <button type="button" class="btn btn-sm btn-outline-main">상세보기</button>
                <button type="button" class="btn btn-sm btn-outline-main">장바구니 담기</button>
              </div>
            </div>
        </div>
      <!-- col-lg-3 col-md-6 End -->
      </div>
    <!-- row g-3 End -->
    </div>
  <!-- row end -->
  </div>

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
  <h5 style="font-weight: bold; margin-top: 3rem;">인기 상품</h5>
  <hr>
  <div class="idol-item row d-none d-sm-block">
    <div class="row g-3 ">
      <div class="col-lg-3 col-md-4 col-sm-6 ">
        <div class="card" style="width: 13rem;">
            <div class="embed-responsive embed-responsive-4by3 ">
              <img src="${pageContext.request.contextPath}/resources/images/idol/bts.jpg" class="card-img-top embed-responsive-item  card-img" alt="tree" style="">
            </div>
            <div class="card-body">
              <h5 class="card-title">방탄소년단</h5>
              <p class="card-text"> 
                <span class="badge bg-s"> BTS</span>
                <span class="badge bg-dark">공식굿즈</span>
                <span class="badge bg-dark">앨범</span>
              </p>
              <div class="btn-group" role="group" aria-label="Basic example">
                <button type="button" class="btn btn-sm btn-outline-main">상세보기</button>
                <button type="button" class="btn btn-sm btn-outline-main">장바구니 담기</button>
              </div>
            </div>
        </div>
      <!-- col-lg-3 col-md-6 End -->
      </div>

      <div class="col-lg-3 col-md-4 col-sm-6">
        <div class="card" style="width: 13rem;">
          <div class="embed-responsive embed-responsive-4by3">
            <img src="${pageContext.request.contextPath}/resources/images/idol/itzy.png" class="card-img-top embed-responsive-item" alt="tree">
          </div>
            <div class="card-body">
              <h5 class="card-title">ITZY</h5>
              <p class="card-text"> 
                <span class="badge bg-s">ITZY</span>
                <span class="badge bg-dark">공식굿즈</span>
                <span class="badge bg-dark">앨범</span>
              </p>
              <div class="btn-group" role="group" aria-label="Basic example">
                <button type="button" class="btn btn-sm btn-outline-main">상세보기</button>
                <button type="button" class="btn btn-sm btn-outline-main">장바구니 담기</button>
              </div>
            </div>
        </div>
      <!-- col-lg-3 col-md-6 End -->
      </div>

      <div class="col-lg-3 col-md-4 col-sm-6">
        <div class="card" style="width: 13rem;">
          <div class="embed-responsive embed-responsive-4by3">
            <img src="${pageContext.request.contextPath}/resources/images/idol/nct.png" class="card-img-top embed-responsive-item" alt="tree" >
          </div>
            <div class="card-body">
              <h5 class="card-title">NCT</h5>
              <p class="card-text"> 
                <span class="badge bg-s">NCT</span>
                <span class="badge bg-dark">공식굿즈</span>
                <span class="badge bg-dark">앨범</span>
              </p>
              <div class="btn-group" role="group" aria-label="Basic example">
                <button type="button" class="btn btn-sm btn-outline-main">상세보기</button>
                <button type="button" class="btn btn-sm btn-outline-main">장바구니 담기</button>
              </div>
            </div>
        </div>
      <!-- col-lg-3 col-md-6 End -->
      </div>
      <div class="col-lg-3 col-md-4 col-sm-6">
        <div class="card" style="width: 13rem;">
          <div class="embed-responsive embed-responsive-4by3">
            <img src="${pageContext.request.contextPath}/resources/images/idol/tiwce.png" class="card-img-top embed-responsive-item" alt="tree">
          </div>
            <div class="card-body">
              <h5 class="card-title">TIWCE</h5>
              <p class="card-text"> 
                <span class="badge bg-s">TIWCE</span>
                <span class="badge bg-dark">공식굿즈</span>
                <span class="badge bg-dark"></span>
              </p>
              <div class="btn-group" role="group" aria-label="Basic example">
                <button type="button" class="btn btn-sm btn-outline-main">상세보기</button>
                <button type="button" class="btn btn-sm btn-outline-main">장바구니 담기</button>
              </div>
            </div>
        </div>
      <!-- col-lg-3 col-md-6 End -->
      </div>
    <!-- row g-3 End -->
    </div>
  <!-- row end -->
  </div>

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

<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>
