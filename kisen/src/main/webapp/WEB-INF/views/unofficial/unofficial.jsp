
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<jsp:include page="/WEB-INF/views/common/header.jsp"></jsp:include>

<title>Unofficial</title>
<style>
.btn-outline-warning {
	color: #9033b5;
	background-color: transparent;
	background-image: none;
	border-color: #9033b5;
	display: flex;
}

.btn-outline-warning:hover {
	color: white;
	background-color: #c7a2e0;
	background-image: none;
	border-color: #c7a2e0;
	display: flex;
}

.card {
	margin-right: 10px;
	margin-left: 10px;
	margin-top: 20px;
}

div#ingdemandList {
	display: flex;
}

div#ingdepositlist {
	display: flex;
}

div#btn{
	display: flex;
	margin-right: 30px;
}

</style>






<div class="container">

		<div class="col-2" id="btn">
			<div class="py-2" id="btn">
				<button type="button" class="btn btn-outline-warning"
					onclick="goDemandForm();">수요조사폼만들기</button>

			</div>
			<div class="py-2" id="btn">
				<button type="button" class="btn btn-outline-warning"
					onclick="goDepositForm();">입금폼만들기</button>
			</div>
		

		
			<div class="py-2" id="btn">
				<button type="button" class="btn btn-outline-warning"
					onclick="goDemandFormlist();">수요조사폼목록</button>

			</div>
			<div class="py-2" id="btn">
				<button type="button" class="btn btn-outline-warning"
					onclick="goDepositFormlist();">입금폼목록</button>
			</div>
			
				<div class="py-2" id="btn">
				<button type="button" class="btn btn-outline-warning"
					onclick="goDemandFormUpdate();">수요조사폼 수정</button>
			</div>
			
				<div class="py-2" id="btn">
				<button type="button" class="btn btn-outline-warning"
					onclick="goDepositFormUpdate();">입금폼 수정</button>
			</div>
		</div>
		<br /><br />
		

		<script>
			function goDemandForm() {
				location.href = "${pageContext.request.contextPath}/unofficial/demandFormEnroll.do";
			}

			function goDepositForm() {
				location.href = "${pageContext.request.contextPath}/unofficial/depositFormEnroll.do";
			}

			function goDepositSubmit() {
				location.href = "${pageContext.request.contextPath}/unofficial/depositDetail.do";

			}

			function goDemandSubmit() {
				location.href = "${pageContext.request.contextPath}/unofficial/demandDetail.do";

			}

			function goDemandFormlist() {
				location.href = "${pageContext.request.contextPath}/unofficial/demandFormlist.do";
			}

			function goDepositFormlist() {
				location.href = "${pageContext.request.contextPath}/unofficial/depositFormlist.do";
			}

			function goDemandFormUpdate() {
				location.href = "${pageContext.request.contextPath}/unofficial/demandformUpdate.do";
			}

			function goDepositFormUpdate() {
				location.href = "${pageContext.request.contextPath}/unofficial/depositformUpdate.do";
			}

			$(function() {
				$(
						'#carouselExampleControls-card, #carouselExampleControls-card2, #carouselExampleControls-card3')
						.carousel({
							// false면 자동 순환하지 않는다.
							interval : false,
							// 순환 설정, true면 1 -> 2가면 다시 1로 돌아가서 반복
							wrap : true,
							// 키보드 이벤트 설정 여부(?)
							keyboard : true
						});
			});

			function goDemandSubmit(demandNo) {
				console.log(demandNo);
				location.href = "${pageContext.request.contextPath}/unofficial/demandDetail.do?demandNo="+demandNo;
			}

			
			function goDepositSubmit(event) {
				const target = event.target;
				const dno = target.dataset.no;
				console.log(dno);
				location.href = "${pageContext.request.contextPath}/unofficial/depositDetail.do?dno="+dno;
			}
			

			
		</script>




		<section>
		<h2 class="text-center m-4" style="font-weight: bold;"> 진행중인 수요조사폼</h2>
		<hr>
		<br /> <br />
		<c:forEach items="${unofficialdemandList}" var="unofficialdemand" varStatus="vs">
		<c:if test="${vs.index % 5 == 0}">
		<div id="ingdemandList" class="boxWrapper">
		</c:if>
			<div class="card" style="width: 18rem;">
				<c:forEach items="${unofficialdemand.demandpdImgList}" var="pdImg">
            		<c:if test="${pdImg.pdCategory eq 'R'}">
   			        	<img src="<c:url value='/resources/upload/unofficial/${pdImg.renamedFilename}'/>" class="card-img mt-1" alt="tree" style="cursor: pointer;" onclick="goDemandSubmit(${unofficialdemand.demandNo});"
   			        	>
            		</c:if>
            	</c:forEach>
				<div class="card-body">
					<h5 class="card-title">${unofficialdemand.pdName}</h5>
					<p class="card-text">
						<span class="badge bg-dark">비공식굿즈</span>
						<!-- 분류 -->
						<span class="badge bg-dark">${unofficialdemand.pdCategory}</span>
						<!-- 분류 -->
						<span class="badge bg-s">기간 : 
							<fmt:formatDate value="${unofficialdemand.demandstartDate}" pattern="yy/MM/dd"/>
							~
							<fmt:formatDate value="${unofficialdemand.demandendDate}" pattern="yy/MM/dd"/>
						</span>
						<span class="badge bg-s">재고 : ${unofficialdemand.pdStock}</span>
						<span class="badge bg-s">판매량: ${unofficialdemand.pdSales}</span>
<%-- 						<span class="badge bg-s">판매자 : ${unofficialdemand.}</span> --%>
					</p>
				</div>
			</div>
		<c:if test="${vs.index % 5 == 4}">		
		</div>
		</c:if>
		</c:forEach>
	</section>
		
	
		<br /> <br />
		
		<section>
		<h2 class="text-center m-4" style="font-weight: bold;">진행중인 입금폼</h2>
		<hr>
		<br /> <br />
		<c:forEach items="${unofficialdepositList}" var="unofficialdeposit" varStatus="vs">
		<c:if test="${vs.index % 5 == 0}">
		<div id="ingdepositlist" class="boxWrapper">
		</c:if>
		<div class="card" style="width: 18rem;">
					
				<c:forEach items="${unofficialdeposit.depositpdImgList}" var="pdImg">
            		<c:if test="${pdImg.pdCategory eq 'R'}">
   			        	<img src="<c:url value='/resources/upload/unofficial/${pdImg.renamedFilename}'/>" class="card-img mt-1" alt="tree" style="cursor: pointer;" onclick="goDepositSubmit(event);" data-no="${unofficialdeposit.dno}"
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



