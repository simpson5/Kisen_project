<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<jsp:include page="/WEB-INF/views/common/agency_header.jsp">
	<jsp:param value="결제/매출/배송" name="title"/>
</jsp:include>

<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/adminMember.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/adminPayment.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/adminSales.css">

<div class="container">
     <!-- 네비 (회원/아티스트) -->
     <div class="mt-3">
         <ul class="nav nav-tabs mb-3">
             <li  class="nav-item"><a href="#member" data-toggle="tab" class="nav-link active">결제내역</a></li>
             <li  class="nav-item"><a href="#artist" data-toggle="tab" class="nav-link">매출/배송</a></li>
         </ul>
     </div>

     <div class="tab-content mb-5">
         <!-- 일반, 기업회원 tab -->
         <div class="tab-pane fade-in active" id="member">

           <!-- 일반, 기업회원 tab -->
           <h5 style="font-weight: bold;" class="mt-3">결제내역</h5>
           <hr>
           <!-- 일반회원 리스트 -->
           <table class="table table-bordered table-striped mb-0 table-light">
               <thead>
                   <tr>
                       <th scope="col">No</th>
                       <th scope="col">구매자</th>
                       <th scope="col">상품명</th>
                       <th scope="col">수량</th>
                       <th scope="col">결제금액</th>
                       <th scope="col">결제날짜</th>
                       <th scope="col">사용 포인트</th>
                       <th scope="col">운송장번호</th>
                   </tr>
               </thead>
               <tbody>
                   <tr>
                       <th scope="row">1</th>
                       <td>fan_id</td>
                       <td>pd_name</td>
                       <td>1</td>
                       <td>30000 <span>원</span></td>
                       <td>2020.12.01 19:31</td>
                       <td>200 <span>point</span></td>
                       <td>
                         <form name="delivery">
                             <input type="text">
                             <button class="btn btn-sm btn-secondary"> 등록</button>
                         </form>
                         <!-- <a href="#"> 419103942180</a> -->
                       </td>
                   </tr>
                   <tr>
                       <th scope="row">2</th>
                       <td>fan_id</td>
                       <td>pd_name</td>
                       <td>1</td>
                       <td>30000 <span>원</span></td>
                       <td>2020.12.01 19:31</td>
                       <td>200 <span>point</span></td>
                       <td><a href="#"> 419103942180</a></td>
                   </tr>
                   <tr>
                       <th scope="row">3</th>
                       <td>fan_id</td>
                       <td>pd_name</td>
                       <td>1</td>
                       <td>30000 <span>원</span></td>
                       <td>2020.12.01 19:31</td>
                       <td>200 <span>point</span></td>
                       <td><a href="#"> 419103942180</a></td>
                   </tr>
                   <tr>
                       <th scope="row">4</th>
                       <td>fan_id</td>
                       <td>pd_name</td>
                       <td>1</td>
                       <td>30000 <span>원</span></td>
                       <td>2020.12.01 19:31</td>
                       <td>200 <span>point</span></td>
                       <td><a href="#"> 419103942180</a></td>
                   </tr>
                   <tr>
                       <th scope="row">5</th>
                       <td>fan_id</td>
                       <td>pd_name</td>
                       <td>1</td>
                       <td>30000 <span>원</span></td>
                       <td>2020.12.01 19:31</td>
                       <td>200 <span>point</span></td>
                       <td><a href="#"> 419103942180</a></td>
                   </tr>
                   <tr>
                       <th scope="row">6</th>
                       <td>fan_id</td>
                       <td>pd_name</td>
                       <td>1</td>
                       <td>30000 <span>원</span></td>
                       <td>2020.12.01 19:31</td>
                       <td>200 <span>point</span></td>
                       <td><a href="#"> 419103942180</a></td>
                   </tr>
                   <tr>
                       <th scope="row">7</th>
                       <td>fan_id</td>
                       <td>pd_name</td>
                       <td>1</td>
                       <td>30000 <span>원</span></td>
                       <td>2020.12.01 19:31</td>
                       <td>200 <span>point</span></td>
                       <td><a href="#"> 419103942180</a></td>
                   </tr>
                   <tr>
                       <th scope="row">8</th>
                       <td>fan_id</td>
                       <td>pd_name</td>
                       <td>1</td>
                       <td>30000 <span>원</span></td>
                       <td>2020.12.01 19:31</td>
                       <td>200 <span>point</span></td>
                       <td><a href="#"> 419103942180</a></td>
                   </tr>
                   <tr>
                       <th scope="row">9</th>
                       <td>fan_id</td>
                       <td>pd_name</td>
                       <td>1</td>
                       <td>30000 <span>원</span></td>
                       <td>2020.12.01 19:31</td>
                       <td>200 <span>point</span></td>
                       <td><a href="#"> 419103942180</a></td>
                   </tr>
                   <tr>
                       <th scope="row">10</th>
                       <td>fan_id</td>
                       <td>pd_name</td>
                       <td>1</td>
                       <td>30000 <span>원</span></td>
                       <td>2020.12.01 19:31</td>
                       <td>200 <span>point</span></td>
                       <td><a href="#"> 419103942180</a></td>
                   </tr>
                   <tr>
                       <th scope="row">11</th>
                       <td>fan_id</td>
                       <td>pd_name</td>
                       <td>1</td>
                       <td>30000 <span>원</span></td>
                       <td>2020.12.01 19:31</td>
                       <td>200 <span>point</span></td>
                       <td><a href="#"> 419103942180</a></td>
                   </tr>
                   <tr>
                       <th scope="row">12</th>
                       <td>fan_id</td>
                       <td>pd_name</td>
                       <td>1</td>
                       <td>30000 <span>원</span></td>
                       <td>2020.12.01 19:31</td>
                       <td>200 <span>point</span></td>
                       <td><a href="#"> 419103942180</a></td>
                   </tr>
                   <tr>
                       <th scope="row">13</th>
                       <td>fan_id</td>
                       <td>pd_name</td>
                       <td>1</td>
                       <td>30000 <span>원</span></td>
                       <td>2020.12.01 19:31</td>
                       <td>200 <span>point</span></td>
                       <td><a href="#"> 419103942180</a></td>
                   </tr>
                   <tr>
                       <th scope="row">14</th>
                       <td>fan_id</td>
                       <td>pd_name</td>
                       <td>1</td>
                       <td>30000 <span>원</span></td>
                       <td>2020.12.01 19:31</td>
                       <td>200 <span>point</span></td>
                       <td><a href="#"> 419103942180</a></td>
                   </tr>
                   <tr>
                       <th scope="row">15</th>
                       <td>fan_id</td>
                       <td>pd_name</td>
                       <td>1</td>
                       <td>30000 <span>원</span></td>
                       <td>2020.12.01 19:31</td>
                       <td>200 <span>point</span></td>
                       <td><a href="#"> 419103942180</a></td>
                   </tr>
               </tbody>
           </table>
               

           <!-- paging -->
           <div class="d-flex justify-content-center mt-3">
               <div class="btn-toolbar mb-3" role="toolbar" aria-label="Toolbar with button groups">
                   <div class="btn-group me-2 " role="group" aria-label="First group">
                     <button type="button" class="btn btn-outline-secondary"><<</button>
                     <button type="button" class="btn btn-outline-secondary">1</button>
                     <button type="button" class="btn btn-outline-secondary">2</button>
                     <button type="button" class="btn btn-outline-secondary">3</button>
                     <button type="button" class="btn btn-outline-secondary">4</button>
                     <button type="button" class="btn btn-outline-secondary">5</button>
                     <button type="button" class="btn btn-outline-secondary">>></button>
                   </div>
               </div>
           </div>
         </div>
         <!-- 아티스트 tab -->
         <div class="tab-pane fade-in" id="artist">
             <div class="tab-content mb-5">
                 <div class="tab-pane fade-in active" id="member">
                     <!-- 기업회원 승인 대기 리스트 -->
                     <h5 style="font-weight: bold;" class="mt-3">월별매출</h5>
                     <hr>
                     <div class="slide-card  mb-5 text-center ">
                         <div id="carouselExampleControls-card2 text-center" class="carousel slide slide-img" data-ride="carousel">
                         <div class="carousel-inner  text-center ">
                             <div class="carousel-item active idol text-center">
                                 <!-- card 1-1 -->
                                 <div class="card col-xs-6" style="display: inline-block; width: 14.5rem;">
                                     <div class="card-body ">
                                         <h5 class="card-title" style="font-weight: bold;">2020.03 매출</h5>
                                         <p class="card-text"> 
                                             <div class=" col-md-12 rounded-circle circle" >
                                                 <p class="badge bg-s price">2,000,000 <br> <span>원</span></p>
                                             </div> 
                                         </p>
                                         <button type="button" class="btn btn-sm btn-outline-main" onclick="productUpdate();">자세히보기</button>
                                     </div>
                                 <!-- card End -->
                                 </div>
                                 <!-- card 1-1 -->
                                 <div class="card col-xs-6" style="display: inline-block; width: 14.5rem;">
                                     <div class="card-body ">
                                         <h5 class="card-title" style="font-weight: bold;">2020.04 매출</h5>
                                         <p class="card-text"> 
                                             <div class=" col-md-12 rounded-circle circle" >
                                                 <p class="badge bg-s price">2,190,000<br> <span>원</span></p>
                                             </div> 
                                         </p>
                                         <button type="button" class="btn btn-sm btn-outline-main" onclick="productUpdate();">자세히보기</button>
                                     </div>
                                 <!-- card End -->
                                 </div>
                                 <!-- card 1-1 -->
                                 <div class="card col-xs-6" style="display: inline-block; width: 14.5rem;">
                                     <div class="card-body ">
                                         <h5 class="card-title" style="font-weight: bold;">2020.05 매출</h5>
                                         <p class="card-text"> 
                                             <div class=" col-md-12 rounded-circle circle" >
                                                 <p class="badge bg-s price">3,190,000 <br><span>원</span></p>
                                             </div> 
                                         </p>
                                         <button type="button" class="btn btn-sm btn-outline-main" onclick="productUpdate();">자세히보기</button>
                                     </div>
                                 <!-- card End -->
                                 </div>
                                 <!-- card 1-1 -->
                                 <div class="card col-xs-6" style="display: inline-block; width: 14.5rem;">
                                     <div class="card-body ">
                                         <h5 class="card-title" style="font-weight: bold;">2020.06 매출</h5>
                                         <p class="card-text"> 
                                             <div class=" col-md-12 rounded-circle circle" >
                                                 <p class="badge bg-s price">4,190,000 <br><span>원</span></p>
                                             </div> 
                                         </p>
                                         <button type="button" class="btn btn-sm btn-outline-main" onclick="productUpdate();">자세히보기</button>
                                     </div>
                                 <!-- card End -->
                                 </div>
                             </div>
                             <div class="carousel-item idol text-center">
                                 <!-- card 1-1 -->
                                 <div class="card col-xs-6" style="display: inline-block; width: 14.5rem;">
                                     <div class="card-body ">
                                         <h5 class="card-title" style="font-weight: bold;">2020.06 매출</h5>
                                         <p class="card-text"> 
                                             <div class=" col-md-12 rounded-circle circle" >
                                                 <p class="badge bg-s price">60,000,000 <br><span>원</span></p>
                                             </div> 
                                         </p>
                                         <button type="button" class="btn btn-sm btn-outline-main" onclick="productUpdate();">자세히보기</button>
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
 
                     <!-- 배송 검색 -->
                     <h5 style="font-weight: bold;">배송확인</h5>
                     <hr>
                     <div >
                         <form class="d-flex justify-content-center">
                             <select class="form-select search-selected" aria-label="Default select example">
                                 <option selected>분류</option>
                                 <option value="1">구매자</option>
                                 <option value="2">상품명</option>
                                 <option value="3">운송장번호</option>
                             </select>
                             <input type="search" placeholder="Search" aria-label="Search" style="width: 150px"  class="form-control me-2" >
                             <button class="btn" type="submit"><img src="/images/search.png" alt="" style="height: 25px"></button>
                         </form>
                     </div>
                     <div class="table-wrapper-scroll-y my-custom-scrollbar mt-5 mb-5">
                         <table class="table table-bordered table-striped mb-0 table-light">
                             <thead>
                                 <tr>
                                     <th scope="col">No</th>
                                     <th scope="col">구매자</th>
                                     <th scope="col">상품명</th>
                                     <th scope="col">수량</th>
                                     <th scope="col">결제금액</th>
                                     <th scope="col">결제날짜</th>
                                     <th scope="col">사용 포인트</th>
                                     <th scope="col">운송장번호</th>
                                 </tr>
                             </thead>
                             <tbody>
                                 <tr>
                                     <th scope="row">1</th>
                                     <td>fan_id</td>
                                     <td>pd_name</td>
                                     <td>1</td>
                                     <td>30000 <span>원</span></td>
                                     <td>2020.12.01 19:31</td>
                                     <td>200 <span>point</span></td>
                                     <td><a href="#"> 419103942180</a></td>
                                 </tr>
                           </tbody>
                         </table>
                     </div>
                 </div>
             </div>
         </div>
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
   function artistDetail() {
       location.href="adminArtistDetail"
   }
   function artistUpdate() {
       location.href="adminArtistUpdate"
   }
</script>
<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>
