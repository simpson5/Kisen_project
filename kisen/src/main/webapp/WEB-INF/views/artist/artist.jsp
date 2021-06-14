<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param value="헬로우 스프으으으리이이잉" name="title" />
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
div.artist{
	
}
</style>
<div id="wrap">
	<div class="container mx-auto" id="container">
	<div id="carouselExampleIndicators2" class="carousel slide" data-ride="carousel">
		<div class="row pt-5 pb-5 artist carousel-inner" style="text-align: center;">
			<div class="col-xs-12 mx-auto carousel-item active">
				<div class="row mb-5 d-flex flex-row justify-content-center" id="pd-slide">
					<c:forEach var="i" begin="1" end="4" step="1">
			        <div class="col-sm-3">
			        	<div class=" mx-auto font-weight-bold text-center">
					    	<img style="width:100%;"src="${pageContext.request.contextPath}/resources/images/one0/kisen_logo.png" />
						</div>
			        </div>
			        </c:forEach>
			    </div>
			    <div class="row">
					<c:forEach var="i" begin="1" end="4" step="1">
			        <div class="col-sm-3">
			        	<div class=" mx-auto font-weight-bold text-center">
					    	<img style="width:100%;"src="${pageContext.request.contextPath}/resources/images/one0/kisen_logo.png" />
						</div>
			        </div>
			        </c:forEach>
			    </div>
			</div>
			
			<div class="col-xs-12 mx-auto carousel-item">
				<div class="row mb-5 d-flex flex-row justify-content-center" id="pd-slide">
					<c:forEach var="i" begin="1" end="4" step="1">
			        <div class="col-sm-3">
			        	<div class=" mx-auto font-weight-bold text-center">
					    	<img style="width:100%;"src="${pageContext.request.contextPath}/resources/images/one0/kisen_logo.png" />
						</div>
			        </div>
			        </c:forEach>
			    </div>
			    <div class="row">
					<c:forEach var="i" begin="1" end="4" step="1">
			        <div class="col-sm-3">
			        	<div class=" mx-auto font-weight-bold text-center">
					    	<img style="width:100%;"src="${pageContext.request.contextPath}/resources/images/one0/kisen_logo.png" />
						</div>
			        </div>
			        </c:forEach>
			    </div>
			</div>
				<a class="carousel-control-prev" href="#carouselExampleIndicators2" role="button" data-slide="prev" id="btnPrev">
					<span class="carousel-control-prev-icon" aria-hidden="true" ></span>
					<span class="sr-only">Previous</span>
				</a>
				<a class="carousel-control-next" href="#carouselExampleIndicators2" role="button" data-slide="next" id="btnNext">
					<span class="carousel-control-next-icon" aria-hidden="true"></span>
					<span class="sr-only">Next</span>
				</a>
			
		</div>
	</div>
	</div>
</div>
<script>

</script>

<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>
