<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<jsp:include page="/WEB-INF/views/common/agency_header.jsp">
	<jsp:param value="Agency" name="title"/>
</jsp:include>

<div class="container">
    <div class="d-flex justify-content-end mt-3" >
        <button type="button" class="btn btn-secondary" onclick="productEnroll()"> 상품등록</button>
    </div>
    <!-- 상품 목록 -->
    <h5 style="font-weight: bold; margin-top: 3rem;"> 상품목록 <a href="/admin/adminProduct/adminAllProduct.html" class="more">더보기</a></h5>
    <hr>
    <div class="adminMain"> 
        <div class="slide-card">
            <div id="carouselExampleControls-card" class="carousel slide slide-img" data-ride="carousel">
            <div class="carousel-inner">
                <div class="carousel-item active idol">
                    <!-- card 1-1 -->
                    <div class="card col-xs-6" style="display: inline-block; width: 13rem;">
                        <div class="embed-responsive embed-responsive-4by3 ">
                            <img src="${pageContext.request.contextPath}/resources/images/idol/bts.jpg" class="card-img-top embed-responsive-item  card-img" alt="tree">
                        </div>
                        <div class="card-body ">
                            <h5 class="card-title">엑소</h5>
                            <p class="card-text"> 
                              <span class="badge bg-dark">공식굿즈</span>       <!-- 분류 -->
                              <span class="badge bg-dark">앨범</span>           <!-- 분류 -->
                              <span class="badge bg-s">재고 : 10000 </span>       
                              <span class="badge bg-s">판매량  : 10000</span>
                            </p>
                            <div class="btn-group" role="group" aria-label="Basic example">
                                <button type="button" class="btn btn-sm btn-outline-main"  onclick="productDetail();">상세보기</button>
                                <button type="button" class="btn btn-sm btn-outline-main"  onclick="productUpdate();">수정</button>
                              <button type="button" class="btn btn-sm btn-outline-main" onclick="productDelete();">삭제</button>
                            </div>
                        </div>
                    <!-- card End -->
                    </div> 
                </div>
                <div class="carousel-item idol">
                    <!-- card 1-1 -->
                    <div class="card col-xs-6" style="display: inline-block; width: 13rem;">
                        <div class="embed-responsive embed-responsive-4by3 ">
                            <img src="${pageContext.request.contextPath}/resources/images/idol/itzy.png" class="card-img-top embed-responsive-item  card-img" alt="tree">
                        </div>
                        <div class="card-body ">
                            <h5 class="card-title">레드벨벳</h5>
                            <p class="card-text"> 
                              <span class="badge bg-dark">공식굿즈</span>       <!-- 분류 -->
                              <span class="badge bg-dark">앨범</span>           <!-- 분류 -->
                              <span class="badge bg-s">재고 : 10000 </span>       
                              <span class="badge bg-s">판매량  : 10000</span>
                            </p>
                            <div class="btn-group" role="group" aria-label="Basic example">
                                <button type="button" class="btn btn-sm btn-outline-main"  onclick="productDetail();">상세보기</button>
                                <button type="button" class="btn btn-sm btn-outline-main"  onclick="productUpdate();">수정</button>
                              <button type="button" class="btn btn-sm btn-outline-main" onclick="productDelete();">삭제</button>
                            </div>
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
    </div>

    <!-- 품절 상품 목록 -->
    <h5 style="font-weight: bold; margin-top: 3rem;"> 품절 상품 </h5>
    <hr>
    <div class="adminMain"> 
        <div class="slide-card">
            <div id="carouselExampleControls-card2" class="carousel slide slide-img" data-ride="carousel">
            <div class="carousel-inner">
                <div class="carousel-item active idol">
                    <!-- card 1-1 -->
                    <div class="card col-xs-6" style="display: inline-block; width: 13rem;">
                        <div class="embed-responsive embed-responsive-4by3 ">
                            <img src="${pageContext.request.contextPath}/resources/images/idol/bts.jpg" class="card-img-top embed-responsive-item  card-img" alt="tree">
                        </div>
                        <div class="card-body ">
                            <h5 class="card-title">엑소</h5>
                            <p class="card-text"> 
                              <span class="badge bg-dark">공식굿즈</span>       <!-- 분류 -->
                              <span class="badge bg-dark">앨범</span>           <!-- 분류 -->
                              <p class="badge bg-s">재고 : <span class="badge btn-danger" style="color: white;"> 0 </span></p>  
                              <p class="badge bg-s">판매량  : 10000</p>
                            </p>
                            <div class="input-group">
                                <input type="number" class="form-control" placeholder="재고 추가" aria-label="Recipient's username" aria-describedby="button-addon2">
                                <button type="button" class="btn btn-sm btn-outline-main" onclick="productStockUpdate();">수정</button>
                            </div>
                        </div>
                    <!-- card End -->
                    </div> 
                </div>
                <div class="carousel-item idol">
                    <!-- card 1-1 -->
                    <div class="card col-xs-6" style="display: inline-block; width: 13rem;">
                        <div class="embed-responsive embed-responsive-4by3 ">
                            <img src="${pageContext.request.contextPath}/resources/images/idol/itzy.png" class="card-img-top embed-responsive-item  card-img" alt="tree">
                        </div>
                        <div class="card-body ">
                            <h5 class="card-title"></h5>
                            <p class="card-text"> 
                              <span class="badge bg-dark">공식굿즈</span>       <!-- 분류 -->
                              <span class="badge bg-dark">앨범</span>           <!-- 분류 -->
                              <p class="badge bg-s">재고 : <span class="badge btn-danger" style="color: white;"> 0 </span></p>  
                              <span class="badge bg-s">판매량  : 10000</span>
                            </p>
                            <div class="input-group">
                                <input type="number" class="form-control" placeholder="재고 추가" aria-label="Recipient's username" aria-describedby="button-addon2" >
                                <button type="button" class="btn btn-sm btn-outline-main" onclick="productStockUpdate();">수정</button>
                            </div>
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
    </div>
    <!-- 인기 상품 목록 -->
    <h5 style="font-weight: bold; margin-top: 3rem;"> BEST 10</h5>
    <hr>
    <div class="adminMain"> 
        <div class="slide-card">
            <div id="carouselExampleControls-card3" class="carousel slide slide-img" data-ride="carousel">
            <div class="carousel-inner">
                <div class="carousel-item active idol">
                    <!-- card 1-1 -->
                    <div class="card col-xs-6" style="display: inline-block; width: 13rem;">
                        <div class="embed-responsive embed-responsive-4by3 ">
                            <img src="${pageContext.request.contextPath}/resources/images/idol/bts.jpg" class="card-img-top embed-responsive-item  card-img" alt="tree">
                        </div>
                        <div class="card-body ">
                            <h5 class="card-title">방탄소년단</h5>
                            <p class="card-text"> 
                              <span class="badge bg-dark">공식굿즈</span>       <!-- 분류 -->
                              <span class="badge bg-dark">앨범</span>           <!-- 분류 -->
                              <span class="badge bg-s">재고 : 10000 </span>  
                              <span class="badge bg-s">판매량  : 10000</span>
                            </p>
                            <div class="btn-group" role="group" aria-label="Basic example">
                                <button type="button" class="btn btn-sm btn-outline-main"  onclick="productDetail();">상세보기</button>
                                <button type="button" class="btn btn-sm btn-outline-main"  onclick="productUpdate();">수정</button>
                              <button type="button" class="btn btn-sm btn-outline-main" onclick="productDelete();">삭제</button>
                            </div>
                        </div>
                    <!-- card End -->
                    </div> 
                </div>
                <div class="carousel-item idol">
                    <!-- card 1-1 -->
                    <div class="card col-xs-6" style="display: inline-block; width: 13rem;">
                        <div class="embed-responsive embed-responsive-4by3 ">
                            <img src="${pageContext.request.contextPath}/resources/images/idol/itzy.png" class="card-img-top embed-responsive-item  card-img" alt="tree">
                        </div>
                        <div class="card-body ">
                            <h5 class="card-title">ITZY</h5>
                            <p class="card-text"> 
                              <span class="badge bg-dark">공식굿즈</span>       <!-- 분류 -->
                              <span class="badge bg-dark">앨범</span>           <!-- 분류 -->
                              <p class="badge bg-s">재고 : <span class="badge btn-danger" style="color: white;"> 0 </span></p>  
                              <span class="badge bg-s">판매량  : 10000</span>
                            </p>
                            <div class="btn-group" role="group" aria-label="Basic example">
                                <button type="button" class="btn btn-sm btn-outline-main"  onclick="productDetail();">상세보기</button>
                                <button type="button" class="btn btn-sm btn-outline-main"  onclick="productUpdate();">수정</button>
                              <button type="button" class="btn btn-sm btn-outline-main" onclick="productDelete();">삭제</button>
                            </div>
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
    </div>
<!--container end -->
</div>
<script> 
    $(function(){
        $('#carouselExampleControls-card, #carouselExampleControls-card2, #carouselExampleControls-card3').carousel({
        // false면 자동 순환하지 않는다.
        interval: false,
        // 순환 설정, true면 1 -> 2가면 다시 1로 돌아가서 반복
        wrap: true,
        // 키보드 이벤트 설정 여부(?)
        keyboard : true
        });
        });

    function productEnroll() {
        location.href="${pageContext.request.contextPath}/agency/agencyProductEnroll";
    }
    function productDetail(){
        location.href="${pageContext.request.contextPath}/agency/agencyProductDetail";
    }
    function productUpdate(){
        location.href="${pageContext.request.contextPath}/agency/agencyProductUpdate";
    }
    function productDelete(){
        
    }



    function productStockUpdate(){
        $.ajax({

        });
    }
</script>
<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>
