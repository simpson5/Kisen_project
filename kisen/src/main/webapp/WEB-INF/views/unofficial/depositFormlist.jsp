
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<jsp:include page="/WEB-INF/views/common/header.jsp"></jsp:include>
<title>depositFormlist</title>
<style>
.btn-outline-warning {
	color: #9033b5;
	background-color: transparent;
	background-image: none;
	border-color: #9033b5;
}

.btn-outline-warning:hover {
	color: white;
	background-color: #c7a2e0;
	background-image: none;
	border-color: #c7a2e0;
}
.card {
	margin-right: 10px;
	margin-left: 10px;
}
.boxWrapper {
	display: flex;
}
</style>
<script>
function goDepositSubmit(dno) {
	console.log(dno);
	location.href = "${pageContext.request.contextPath}/unofficial/depositDetail.do?dno="+dno;
}
</script>

<div class="container">

		<h2 class="text-center m-4" style="font-weight: bold;">입금폼목록</h2>
		<br /> <br />
		<c:forEach items="${unofficialdepositList}" var="unofficialdeposit" varStatus="vs">
		<c:if test="${vs.index % 5 == 0}">
		<div id="" class="boxWrapper">
		</c:if>
			<div class="card" style="width: 18rem;">
					
				<c:forEach items="${unofficialdeposit.depositpdImgList}" var="pdImg">
            		<c:if test="${pdImg.pdCategory eq 'R'}">
   			        	<img src="<c:url value='/resources/upload/unofficial/${pdImg.renamedFilename}'/>" class="card-img mt-1" alt="tree" style="cursor: pointer;" onclick="goDepositSubmit(${unofficialdeposit.dno});"
   			        	>
            		</c:if>
				</c:forEach>

				<div class="card-body">
					<h5 class="card-title">${unofficialdeposit.pdName}</h5>
					<p class="card-text">
						<span class="badge bg-dark">비공식굿즈</span>
						<!-- 분류 -->
						<span class="badge bg-dark">${unofficialdeposit.pdCategory}</span>
						<!-- 분류 -->
						<span class="badge bg-s">기간 : 
							<fmt:formatDate value="${unofficialdeposit.depositStartDate}" pattern="yy/MM/dd"/>
							~
							<fmt:formatDate value="${unofficialdemand.depositEndDate}" pattern="yy/MM/dd"/>
						</span>
						<span class="badge bg-s">재고 : ${unofficialdeposit.pdStock}</span>
						<span class="badge bg-s">판매량: ${unofficialdeposit.pdSales}</span>
<%-- 						<span class="badge bg-s">판매자 : ${unofficialdemand.}</span> --%>
					</p>
				</div>
			</div>
		<c:if test="${vs.index % 5 == 4}">		
		</div>
		</c:if>
		</c:forEach>
</div>
<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>





