<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!-- 팬게시판 autocomplete 관련 -->
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

<!-- 팬게시판 css -->
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/fanBoard/fanBoardList.css" />

<jsp:include page="/WEB-INF/views/common/header.jsp">
   <jsp:param value="" name="title" />
</jsp:include>
<style>
body, html {
   margin: 0px;
   padding: 0px;
}

.carousel-control-prev{
   left:-120px;
}
.carousel-control-next{
   right:-120px;   
}

.card{
   height:480px;
}
.btn-group {
    position: absolute;
    left: 80px;
    bottom: 29px;
}

a{
   text-decoration: none;
   color: black;
}
a:hover{
   text-decoration: none;
   color: black;
}
#wrap {
   position: relative;
   width: 1230px;
   margin: 0 auto;
}

#container {
   width: 1230px;
}
.pd-nav{
   height: 50px;
   float: none;
   line-height: 50px;
   border : 1px solid #d4d8d9;
}
.artist-detail-menu {
   position: relative;
   margin-top: 10px;
   margin: 0 auto;
   margin-bottom: 50px;
}
.select{
   position: relative;
    top: -1px;
    margin: -12px 0 -1px;
    border: 2px solid #000;
    color: #000;
    font-size: 16px;
    font-weight: bold;
    background: #fff;
    border-bottom: 0px;
    height: 63px;
    line-height: 50px;   
}

div.album img{
   width:100%;
}

p.album-title{
   text-align: center;
}
p.album-singer{
   text-align: center;
}

</style>
<div id="wrap">
   <div class="container">
       <div class="row">
           <div class="col-xs-12" style="margin:0 auto;">
            <c:set var="loop_flag" value="false" />
               <c:forEach items="${idol}" var="idol">
                  <c:if test="${not loop_flag}">
                     <c:if test="${!empty idol}">
                        <c:set var="loop_flag" value="true"/> 
                        <img src="${pageContext.request.contextPath}/resources/upload/idol/${idol.idolImg.renamedFilename}" class="d-block w-100 idol-img" alt="...">
                     </c:if>
                  </c:if>
               </c:forEach>
           </div>
       </div>
       <div class="col-xs-12">
         <div class="artist-detail-menu">
            <div class="row text-center" style="width: 100%;">
               <div class="col-md-3 select artist-nav" id="nav1" >앨범</div>
               <div class="col-md-3 artist-nav" id="nav2">뮤직비디오</div>
               <div class="col-md-3 artist-nav" id="nav3">공식굿즈</div>
               <div class="col-md-3 artist-nav" id="nav4">팬게시판</div>
            </div>
         </div>
      </div>
      
      <div class="row artist-album">
         <c:if test="${empty idolAlbumList}">
            <h5 style="margin: 0 auto;">조회된 정보가 없습니다.</h5>
         </c:if>
           <c:if test="${!empty idolAlbumList}">
            <div class="idol-item row d-none d-sm-block">
                <div class="row g-3 ">
                  <div id="carouselExampleControlss" class="carousel slide slide-img" data-ride="carousel">
                      <div class="carousel-inner">
                         <div class="carousel-item active idol">
                           
                           <c:forEach items="${idolAlbumList}" var="product" varStatus="status">
                           <c:if test="${status.index < 4}">
                           <div class="mx-auto " style="display:inline-block;">
                             <div class="card col-xs-4" style="width:15em; display:inline-block; float: left; margin:13px; 0px; 10px; 0px;">
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
                          
                          <!-- 
                           <c:set var="loop_flag" value="fasle"/>
                           <c:forEach items="${idolAlbumList}" var="idol" varStatus="status">
                           <c:if test="${not loop_flag}">
                           <c:if test="${status.end >= 4 }">
                           <c:set var="loop_flag" value="true"/>
                           -->
                           <div class="carousel-item idol">
                           <c:forEach items="${idolAlbumList}" var="product" varStatus="status">
                           <c:if test="${status.index > 3}">
                           <div class="mx-auto" style="display:inline-block;">
                             <div class="card col-xs-4" style="width:15em; display:inline-block; float: left; margin:13px; 0px; 10px; 0px;">
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
                           <!-- 
                           </c:if>
                           </c:if>
                           </c:forEach>
                            -->
                        </div>
                        <!-- 
                      <c:set var="looop_flag" value="fasle"/>
                     <c:forEach items="${idolAlbumList}" var="idol" varStatus="status">
                     <c:if test="${not looop_flag}">
                     <c:if test="${status.end >= 4 }">
                      -->
                     <a class="carousel-control-prev" href="#carouselExampleControlss" role="button" data-slide="prev">
                        <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                        <span class="sr-only">Previous</span>
                      </a>
                      <a class="carousel-control-next" href="#carouselExampleControlss" role="button" data-slide="next">
                        <span class="carousel-control-next-icon" aria-hidden="true"></span>
                        <span class="sr-only">Next</span>
                      </a>
                      <!--
                      </c:if>
                      </c:if>
                      </c:forEach>
                        -->
                     </div>
                <!-- row g-3 End -->
                </div>
           <!-- row end -->
              </div>
           </c:if>  
       </div>
       
      <div class="row artist-mv" style="display: none;">
      <c:set var="loop" value="false"/>
      <c:forEach items="${idol}" var="idol" varStatus="status">
      <c:if test="${not loop}">
         <c:forEach items="${idol.idolMv}" var ="mv" varStatus="status">
         <c:if test="${!empty mv.mvLink}">
         <c:set var="loop" value="true"/>
           <div class="col-md-3 mv">
              <iframe width="100%" src="https://www.youtube.com/embed/${mv.mvLink}"  title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
           </div>
         </c:if>
         <c:if test="${empty mv.mvLink}">
         <c:set var="loop" value="true"/>
         	<h5 style="margin: 0 auto;">조회된 정보가 없습니다.</h5>
         </c:if>
         </c:forEach>
      </c:if>

      </c:forEach>
      </div>
       <div class="row artist-goods" style="display: none;">
          <c:if test="${empty idolProductList}">
            <h5 style="margin: 0 auto;">조회된 정보가 없습니다.</h5>
         </c:if>
         <c:if test="${!empty idolProductList}">
            <div class="idol-item row d-none d-sm-block">
                <div class="row g-3 ">
                  <div id="carouselExampleControlss" class="carousel slide slide-img" data-ride="carousel">
                      <div class="carousel-inner">
                         <div class="carousel-item active idol">
                           <c:forEach items="${idolProductList}" var="product" varStatus="status">
                           <c:if test="${status.index < 4}">
                           <div class="mx-auto " style="display:inline-block;">
                             <div class="card col-xs-4" style="width:15em; display:inline-block; float: left; margin:13px; 0px; 10px; 0px;">
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
                           
                           <c:set var="looop_flag" value="fasle"/>
                           <c:forEach items="${idolAlbumList}" var="idol" varStatus="status">
                           <c:if test="${not looop_flag}">
                           <c:if test="${status.end >= 4 }">
                           <div class="carousel-item idol">
                           <c:forEach items="${randomList}" var="product" varStatus="status">
                           <c:if test="${status.index > 3}">
                           <div class="mx-auto" style="display:inline-block;">
                             <div class="card col-xs-4" style="width:15em; display:inline-block; float: left; margin:13px; 0px; 10px; 0px;">
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
                                     <button type="button" class="btn btn-sm btn-outline-main" name="cart">장바구니 담기</button>
                                   </div>
                                 </div>
                             </div>
                           <!-- col-lg-3 col-md-6 End -->
                           </div>
                           </c:if>
                           </c:forEach>
                           </div>
                           </c:if>
                           </c:if>
                           </c:forEach>
                        </div>
                        <c:set var="loooop_flag" value="fasle"/>
                     <c:forEach items="${idolAlbumList}" var="idol" varStatus="status">
                     <c:if test="${not loooop_flag}">
                     <c:if test="${status.end >= 4 }">
                     <a class="carousel-control-prev" href="#carouselExampleControlss" role="button" data-slide="prev">
                        <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                        <span class="sr-only">Previous</span>
                      </a>
                      <a class="carousel-control-next" href="#carouselExampleControlss" role="button" data-slide="next">
                        <span class="carousel-control-next-icon" aria-hidden="true"></span>
                        <span class="sr-only">Next</span>
                      </a>
                      </c:if>
                      </c:if>
                      </c:forEach>
                     </div>
                <!-- row g-3 End -->
                </div>
           <!-- row end -->
              </div>
           </c:if>    
       </div>

<script>
$(".artist-nav").click(function(e){
   var id = $(e.target).attr('id');
   console.log($(e.target).attr('id'));
   $(e.target).addClass('select');
   $(e.target).siblings().removeClass('select');
   if(id == 'nav1'){
      $('.artist-album').show();
      $('.artist-mv').hide();
      $('.artist-goods').hide();
      $('.artist-pan-board').hide();
   }
   else if(id =='nav2'){
      $('.artist-album').hide();
      $('.artist-mv').show();
      $('.artist-goods').hide();
      $('.artist-pan-board').hide();
   }
   else if(id=='nav3'){
      $('.artist-album').hide();
      $('.artist-mv').hide();
      $('.artist-goods').show();
      $('.artist-pan-board').hide();
   }else if(id=='nav4'){
      $('.artist-album').hide();
      $('.artist-mv').hide();
      $('.artist-goods').hide();
      $('.artist-pan-board').show();
   }
});

//팬게시판
if($("input[name=fbActive]").val() == 1){
   $("#nav4").addClass('select');
   $("#nav1").removeClass('select');
   $('.artist-album').hide();
   $('.artist-mv').hide();
   $('.artist-goods').hide();
   $('.artist-pan-board').show();
}


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
      <!-- 팬게시판 -->
      <div class="row artist-pan-board" style="display: none;">
            <jsp:include page="/WEB-INF/views/fanBoard/fanBoardList.jsp">
               <jsp:param value="${param.no}" name="artistNo" />
               <jsp:param value="${cPage}" name="cPage" />
            </jsp:include>
            <input type="hidden" value="${fbActive}" name="fbActive" />
       </div>
   </div>
</div>

<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>