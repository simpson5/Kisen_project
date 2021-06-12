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
	        	<img class="center-block col-8" src="${pageContext.request.contextPath}/resources/images/kisen_logo.png" alt="" />
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
	    <div class="row about" style="text-align: center;">
	    	<div class="col-xs-12 mx-auto" style="width:100%;">
	    		<h2>공식 굿즈와 비공식 굿즈의 종합 쇼핑몰</h2>
	    		<h4><span class="font-color">K</span>-pop의 <span class="font-color">I</span>dentity를 <span class="font-color">Sen</span>se있게 실현하다</h4>
	    		<p><img style="width:100%;" src="${pageContext.request.contextPath}/resources/images/identy.png"/></p>
	    		<p><img style="width:100%;" src="${pageContext.request.contextPath}/resources/images/identity4.png" alt="" /></p>
	    	</div>
	    </div>
	    <div class="row map" style="text-align: center; display:none;">
	    	<div class="col-xs-12 mx-auto" style="width:100%;">
	    		<h2>공식 굿즈와 비공식 굿즈의 종합 쇼핑몰</h2>
	    		<h4><span class="font-color">K</span>-pop의 <span class="font-color">I</span>dentity를 <span class="font-color">Sen</span>se있게 실현하다</h4>
	    		<p><img style="width:100%;" src="${pageContext.request.contextPath}/resources/images/identy.png"/></p>
	    		<p><img style="width:100%;" src="${pageContext.request.contextPath}/resources/images/identity4.png" alt="" /></p>
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