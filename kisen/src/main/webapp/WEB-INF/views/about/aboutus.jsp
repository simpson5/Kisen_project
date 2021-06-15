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

h5.mapTitle{
	margin: 0 0 24px;
    font-size: 18px;
    text-transform: uppercase;
    color: #fff;
    line-height: 1.3;
}
.th{
	text-align: center;
    color: #fff;
    font-weight: bold;
    white-space: nowrap;
    letter-spacing: 0;
    font-size: 14px;
    vertical-align: top;
}
.mapContent{
	padding: 6px 0;
    text-align: right;
    font-size: 12px;
    color:#989898;
    letter-spacing: -1px;
    vertical-align: middle
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
	    <div class="row about" style="text-align: center; ">
	    	<div class="col-xs-12 mx-auto" style="width:100%;">
	    		<h2>공식 굿즈와 비공식 굿즈의 종합 쇼핑몰</h2>
	    		<h4><span class="font-color">K</span>-pop의 <span class="font-color">I</span>dentity를 <span class="font-color">Sen</span>se있게 실현하다</h4>
	    		<p><img style="width:100%;" src="${pageContext.request.contextPath}/resources/images/one0/identy.png"/></p>
	    		<p><img style="width:100%;" src="${pageContext.request.contextPath}/resources/images/one0/identity4.png" alt="" /></p>
	    	</div>
	    </div>
	    <div class="row map mx-auto" style="text-align: center; vertical-align:middle; display:none; width:100%;">
	    	<div class="col-xs-6 ml-auto">
	    		<div id="map" style="width:500px; height : 300px; margin:0 auto; text-align:center; disableAutoPan: true; "></div>
			    <!-- 지도 확대, 축소 컨트롤 div 입니다 -->
			    <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=6b7f33ed5517285d15a818940fe8f0fe"></script>
				<script>			
					var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
				    mapOption = { 
				        center: new kakao.maps.LatLng(37.52904809384202, 126.96405689833054), // 지도의 중심좌표
				        level: 3 // 지도의 확대 레벨
				    };
				</script>
	    	</div>	    
	    	<div class="col-xs-5 mr-auto p-3" style="background-color:#363636;">
	    		<h5 class="p-1 mapTitle mt-2">용산 아이파크몰 리빙파크<br /> 오프라인 스토어 위치</h5>
	    		<table>
				<colgroup>
				<col>
				<col>
				</colgroup>
				<tbody>
				<tr>
					<td class="th">주소</td>
					<td class="mapContent">서울특별시 용산구 한강로3가 한강대로23길 55 용산 아이파크몰 리빙파크 6층</td>
				</tr>
				<tr>
					<td class="th">전화번호</td>
					<td class="mapContent">02-2012-2525</td>
				</tr>
				<tr>
					<td class="th" style="vertical-align:top;">지하철</td>
					<td class="mapContent">1호선 용산역</td>
				</tr>
				<tr>
					<td class="th">영업시간</td>
					<td class="mapContent">월-금&nbsp;&nbsp;AM 10:00 - PM 17:00<br>토,일&nbsp;&nbsp;휴무</td>
				</tr>
			</tbody>
			</table>
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
		var map = new kakao.maps.Map(mapContainer, mapOption);
		// display: block 이 된 직 후,
		window.setTimeout(function() {
		    map.relayout();
		}, 0);
		var markerPosition  = new kakao.maps.LatLng(37.52904809384202, 126.96405689833054); 

		// 마커를 생성합니다
		var marker = new kakao.maps.Marker({
		    position: markerPosition
		});

		// 마커가 지도 위에 표시되도록 설정합니다
		marker.setMap(map);

		
		// 마커를 클릭했을 때 마커 위에 표시할 인포윈도우를 생성합니다
		var iwContent = '<div style="padding:5px; margin: 0 auto;">키센 본점</div>', // 인포윈도우에 표출될 내용으로 HTML 문자열이나 document element가 가능합니다
		    iwRemoveable = true; // removeable 속성을 ture 로 설정하면 인포윈도우를 닫을 수 있는 x버튼이 표시됩니다
		
		// 인포윈도우를 생성합니다
		var infowindow = new kakao.maps.InfoWindow({
		    content : iwContent,
		    removable : iwRemoveable
		});

		// 마커에 클릭이벤트를 등록합니다
		kakao.maps.event.addListener(marker, 'click', function() {
		      // 마커 위에 인포윈도우를 표시합니다
		      infowindow.open(map, marker);  
		});
	}
});

</script>

<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>