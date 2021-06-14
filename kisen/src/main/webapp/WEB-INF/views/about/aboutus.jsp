<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param value="Main" name="title"/>
</jsp:include>
<style>
div#wrap{
    position: relative;
    width: 1230px;
	margin: 0 auto;
}

.pd-detail-menu {
	position: relative;
	margin-top: 10px;
	margin: 0 auto;
	width: 1230px;
	margin-bottom: 50px;
}

.col-md-2 {
	height: 50px;
	font-size:13px;
	float: none;
	margin: 0 auto;
	line-height: 50px;
	border : 1px solid #d4d8d9;
}
.col-md-3 {
	height: 50px;
	font-size:13px;
	float: none;
	margin: 0 auto;
	line-height: 50px;
	border : 1px solid #999;
}
.col-md-4 {
    width: 200px;
	height: 50px;
	float: none;
	margin: 0 auto;
	line-height: 50px;
	border : 1px solid #d4d8d9;
	font-size: 12px;
}
.select{
    border: 1px solid #999;
    color: #000;
    border-bottom: 0px;
    height: 60px;
    line-height: 50px;	
    position: relative;
    top:-10px;
}


.pd-detail{
	width: 100%;
	margin:0 auto;
	vertical-align: middle;
	text-align: center;
}
div#nav2{
	font-size:12px;
}

span.font-color{
	color: #BA55D3;
	font-size:1.3em;
}
</style>
<div id="wrap">
	<div class="container mx-auto">
	    <div class="row pt-5 pb-5" style="text-align: center;">
	        <div class="col-xs-12 mx-auto">
	        	<img class="center-block col-8" src="${pageContext.request.contextPath}/resources/images/one0/kisen_logo.png" alt="" />
	        </div>
	    </div>
	    <div class="row" style="text-align: center;">
	        <div class="col-xs-12 mx-auto" style="width:100%;">
	        	<div class="pd-detail-menu" style="width:100%;">
					<div class="row text-center">
						<div class="col-md-3 border border-top-0 border-left-0 border-right-0"></div>
						<div class="col-md-2 select pd-nav" id="nav1" >회사소개</div>
						<div class="col-md-4 pd-nav" id="nav2">오프라인매장안내</div>
						<div class="col-md-3 border border-top-0 border-left-0 border-right-0"></div>
					</div>
				</div>
	        </div>
	    </div>
	    <div class="row about" style="text-align: center; display:none">
	    	<div class="col-xs-12 mx-auto" style="width:100%;">
	    		<h2>공식 굿즈와 비공식 굿즈의 종합 쇼핑몰</h2>
	    		<h4><span class="font-color">K</span>-pop의 <span class="font-color">I</span>dentity를 <span class="font-color">Sen</span>se있게 실현하다</h4>
	    		<p><img style="width:100%;" src="${pageContext.request.contextPath}/resources/images/one0/identy.png"/></p>
	    		<p><img style="width:100%;" src="${pageContext.request.contextPath}/resources/images/one0/identity4.png" alt="" /></p>
	    	</div>
	    </div>
	    <div class="row map" style="text-align: center;">
	    	<div class="col-xs-12 mx-auto" style="width:100%;">
	    		<div id="map" style="width:600px; height : 300px; margin:0 auto; text-align:center; disableAutoPan: true; ">
	    			<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=6b7f33ed5517285d15a818940fe8f0fe"></script>
					<script>
					var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
				    mapOption = { 
				        center: new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
				        level: 3 // 지도의 확대 레벨
				    };

					var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다
	
					// 지도를 표시하는 div 크기를 변경하는 함수입니다
					function resizeMap() {
					    var mapContainer = document.getElementById('map');
					    mapContainer.style.width = '650px';
					    mapContainer.style.height = '300px'; 
					}
	
					function relayout() {    
					    
					    // 지도를 표시하는 div 크기를 변경한 이후 지도가 정상적으로 표출되지 않을 수도 있습니다
					    // 크기를 변경한 이후에는 반드시  map.relayout 함수를 호출해야 합니다 
					    // window의 resize 이벤트에 의한 크기변경은 map.relayout 함수가 자동으로 호출됩니다
					    map.relayout();
					}
					resizeMap();
					relayout();
					</script>
	    		</div>
	    	</div>
	    </div>
	</div>
</div>

<script>
$(".pd-nav").click(function(e){
	var id = $(e.target).attr('id');
	console.log($(e.target).attr('id'));
	$(e.target).addClass('select');
	$(e.target).siblings().removeClass('select');
	if(id == 'nav1'){
		$('.about').show();
		$('.map').hide();
	}
	else if(id =='nav2'){
		$('.about').hide();
		$('.map').show();
	}
});

</script>

<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>