<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<jsp:include page="/WEB-INF/views/common/header.jsp">

	<jsp:param value="결제페이지" name="title"/>
</jsp:include>
<style>
div#cartContainer{
	border: 2px solid #bc73d6!important;
	width:900px;
	
}
div#cartHistory{
 width:900px;
}
.border-secondary {
    border-color:  #9033b5!important;
}
div#payContainer{
	width:800px;
	border: 2px solid #bc73d6!important;
	
}
img#productImg{
	width: 100px;
	height: 80px;
}
img#plus{
	width:20px;
	height: 20px;
}
#marks{
	background-color: #c8a9c8;
}
#cartTitle{
 font-size: 30px;
}
#arrow img{
 	width: 20px;
 	height: 20px;
}
#cartinfo{
  font-size: 15px;
}
#cartImg img{
	width: 30px;
 	height: 30px;
}
#cartAgain{
 color:  #9033b5;
    background-color: transparent;
    background-image: none;
    border-color:  #9033b5;
}
</style>

<br /><br />
<!-- 타이틀 -->
<div class="row">
	<div class="col-md-1" ></div>
	<div class="col-md-7 " id="cartTitle">
	<h2 class="font-weight-bold" id="cartImg">완료</h2>

	</div>
	<div class="col-md-4 float-left">
	 <ul id="cartinfo">
	 	<li class="float-left mx-2" style="color:gray;">장바구니</li>
	 	<li class="float-left mx-2" id="arrow"><img src="${pageContext.request.contextPath}/resources/images/moonju/next.png" /></li>
	 	<li class="float-left mx-2" style="color:gray;">주문/결제</li>
	 	<li class="float-left mx-2" id="arrow"><img src="${pageContext.request.contextPath}/resources/images/moonju/next.png" /></li>
	 	<li class="float-left mx-2"><span class="font-weight-bold" style="font-size: 18px;">완료</span></li>
	 </ul>
	</div>
</div>
<br /><br />

<!-- 주의 사항  -->
<div id="cartContainer" class="border border-2 mx-auto p-3 rounded ">

		<div class ="p-1 d-flex justify-content-center" id="logoBox">
			<img src="${pageContext.request.contextPath}/resources/images/kisen_logo.png" alt="logo" style="width: 130px; height: 110px; "/>
		</div>
		<div class="py-3 d-flex justify-content-center" >
		 <h4 class="font-weight-bold">주문이 성공적으로 완료되었습니다!</h4>
		 </div>
		<div class="py-1 d-flex justify-content-centern"  >
			<div class="p-2 mx-auto" style="text-align: center;">
		 	 	<mark id="marks">주문 내역</mark>
		 	 	<div class="p-2">
		 	 	<ul>
		 	 	<c:forEach items="${paymentList}" var ="paymentList" >
			 			<li>${paymentList.product.pdName}</li>
			 	</c:forEach>
			 		</ul>
		 	 	</div>
		 	 <hr />
		 	 </div>
	 	</div>
		<div class="py-2 d-flex justify-content-center" >
		  	<a href="${pageContext.request.contextPath}">
		  	<button class="btn btn-outline py-2 mx-3" id="cartAgain">메인화면</button>
		  	</a>
		  </div>

</div>
<br/><br/><br/>


<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>