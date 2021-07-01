<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param value="" name="title" />
</jsp:include>
<style>
body, html {
	margin: 0px;
	padding: 0px;
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
	        <div class="col-xs-12">
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
	        </div>
	    </div>
	    <div class="col-xs-12">
			<div class="artist-detail-menu">
				<div class="row text-center" style="width: 100%;">
					<div class="col-md-3 artist-nav" id="nav1" >앨범</div>
					<div class="col-md-3 artist-nav" id="nav2">뮤직비디오</div>
					<div class="col-md-3 artist-nav" id="nav3">공식굿즈</div>
					<div class="col-md-3 select artist-nav" id="nav4">팬게시판</div>
				</div>
			</div>
		</div>
		
		<div class="row artist-album" style="display: none;">
	        <div class="slide-card">
	             <div id="carouselExampleControls-card" class="carousel slide slide-img" data-ride="carousel">
	             <div class="carousel-inner">
	                 <div class="carousel-item active idol">
	                 <c:forEach begin="1" step="1" end="5" var="x" varStatus="x++">
	                     <!-- card 1-1 -->
	                     <div class="card col-xs-3" style="display: inline-block; width: 13rem;">
	                         <div>
	                             <img src="${pageContext.request.contextPath}/resources/images/idol/bts.jpg" class="card-img-top embed-responsive-item  card-img" alt="tree">
	                         </div>
	                         <div class="card-body ">
	                             <h5 class="card-title">방탄소년단</h5>
	                             <p class="card-text"> 
	                               <span class="badge bg-dark" style="block">${x}집</span>       <!-- 분류 -->   
	                               <span class="badge bg-s">앨범명</span>       
	                             </p>
	                             <div class="btn-group" role="group" aria-label="Basic example">
	                               <button type="button" class="btn btn-sm btn-outline-main mx-auto"   onclick="productDetail();">상세보기</button>
	                             </div>
	                         </div>
	                     <!-- card End -->
	                     </div> 
	                 </c:forEach>
	                 </div>
	             </div>
	             
	             <a class="carousel-control-prev" href="#carouselExampleControls-card" role="button" data-slide="prev" style="margin-right:300px;">
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
	    
		<div class="row artist-mv" style="display: none;">
	        <div class="col-md-3 mv">
	        	<iframe width="100%" src="https://www.youtube.com/embed/gdZLi9oWNZg"  title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
	        	<p style="text-align: center;">뮤비 제목</p>
	        </div>
	        <div class="col-md-3 mv">
	        	<iframe width="100%" src="https://www.youtube.com/embed/gdZLi9oWNZg"  title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
	        	<p style="text-align: center;">뮤비 제목</p>
	        </div><div class="col-md-3 mv">
	        	<iframe width="100%" src="https://www.youtube.com/embed/gdZLi9oWNZg"  title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
	        	<p style="text-align: center;">뮤비 제목</p>
	        </div><div class="col-md-3 mv">
	        	<iframe width="100%" src="https://www.youtube.com/embed/gdZLi9oWNZg"  title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
	        	<p style="text-align: center;">뮤비 제목</p>
	        </div>
	    </div>
	    <div class="row artist-goods" style="display: none;">
		    <div class="slide-card">
	             <div id="carouselExampleControls-card" class="carousel slide slide-img" data-ride="carousel">
	             <div class="carousel-inner">
	                 <div class="carousel-item active idol">
	                 <c:forEach begin="1" step="1" end="5">
	                     <!-- card 1-1 -->
	                     <div class="card col-xs-3" style="display: inline-block; width: 13rem;">
	                         <div class="embed-responsive embed-responsive-4by3 ">
	                             <img src="${pageContext.request.contextPath}/resources/images/idol/bts.jpg" class="card-img-top embed-responsive-item  card-img" alt="tree">
	                         </div>
	                         <div class="card-body ">
	                             <h5 class="card-title">방탄소년단</h5>
	                             <p class="card-text"> 
	                               <span class="badge bg-dark">공식굿즈</span>       <!-- 분류 -->
	                               <span class="badge bg-dark">앨범</span>           <!-- 분류 -->
	                               <span class="badge bg-s">가격 : 10000 </span>       
	                             </p>
	                             <div class="btn-group" role="group" aria-label="Basic example">
	                               <button type="button" class="btn btn-sm btn-outline-main mx-auto" id="pdInfo-btn">상세보기</button>
	                             </div>
	                         </div>
	                     <!-- card End -->
	                     </div> 
	                 </c:forEach>
	                 </div>
	                 <div class="carousel-item idol">
	                    
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
			
		<div class="row artist-pan-board">
				<jsp:include page="/WEB-INF/views/fanBoard/fanBoardList.jsp">
					<jsp:param value="${param.artistNo}" name="artistNo" />
				</jsp:include>
	    </div>
		
	    
	</div>
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

$("#pdInfo-btn").click(function(){
	window.location.href="${pageContext.request.contextPath}/product/productInfo";
});

</script>

<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>
