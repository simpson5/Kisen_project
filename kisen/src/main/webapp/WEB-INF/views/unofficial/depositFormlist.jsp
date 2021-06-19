
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<jsp:include page="/WEB-INF/views/common/header.jsp"></jsp:include>
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
</style>

</head>
<body>



	<section>
		<h2 class="text-center m-4" style="font-weight: bold;">입금폼목록</h2>

		<br /> <br />






		<script>
			function goDepositSubmit() {
				location.href = "${pageContext.request.contextPath}/unofficial/depositDetail.do";

			}
		</script>




		<div class="titleWrapper">
			<style>
div#topList {
	display: flex;
}
</style>

		</div>

		<div id="topList" class="boxWrapper">



			<style>
.card {
	margin-right: 10px;
	margin-left: 10px;
}
</style>



			<div class="card" style="width: 18rem;">
				<img class="card-img-top"
					src="${pageContext.request.contextPath }/resources/images/unofficial/2.png"
					alt="Card image cap" onclick="goDepositSubmit();" style="cursor: pointer;">
				<div class="card-body">
					<<h5 class="card-title">방탄소년단</h5>
                            <p class="card-text"> 
                              <span class="badge bg-dark">비공식굿즈</span>       <!-- 분류 -->
                              <span class="badge bg-dark">메모지</span>           <!-- 분류 -->
                              <span class="badge bg-s">기간 : 2021-06-17~2021-06-30 </span>       
                              <span class="badge bg-s">재고  : 100</span>
                               <span class="badge bg-s">판매량  : 100</span>
                               <span class="badge bg-s">판매자  : 정쿠키</span>
                               <span class="badge bg-s">조회수  : 1234</span>
                            </p>
				</div>
			</div>


			<div class="card" style="width: 18rem;">
				<img class="card-img-top"
					src="${pageContext.request.contextPath }/resources/images/unofficial/3.png"
					alt="Card image cap" onclick="goDepositSubmit();" style="cursor: pointer;">
				<div class="card-body">
					<h5 class="card-title">방탄소년단</h5>
                            <p class="card-text"> 
                              <span class="badge bg-dark">비공식굿즈</span>       <!-- 분류 -->
                              <span class="badge bg-dark">메모지</span>           <!-- 분류 -->
                              <span class="badge bg-s">기간 : 2021-06-17~2021-06-30 </span>       
                              <span class="badge bg-s">재고  : 100</span>
                               <span class="badge bg-s">판매량  : 100</span>
                               <span class="badge bg-s">판매자  : 정쿠키</span>
                               <span class="badge bg-s">조회수  : 1234</span>
                            </p>
				</div>
			</div>
			<div class="card" style="width: 18rem;">
				<img class="card-img-top"
					src="${pageContext.request.contextPath }/resources/images/unofficial/4.png"
					alt="Card image cap" onclick="goDepositSubmit();" style="cursor: pointer;">
				<div class="card-body">
					<h5 class="card-title">방탄소년단</h5>
                            <p class="card-text"> 
                              <span class="badge bg-dark">비공식굿즈</span>       <!-- 분류 -->
                              <span class="badge bg-dark">메모지</span>           <!-- 분류 -->
                              <span class="badge bg-s">기간 : 2021-06-17~2021-06-30 </span>       
                              <span class="badge bg-s">재고  : 100</span>
                               <span class="badge bg-s">판매량  : 100</span>
                               <span class="badge bg-s">판매자  : 정쿠키</span>
                               <span class="badge bg-s">조회수  : 1234</span>
                            </p>
				</div>
			</div>
			<div class="card" style="width: 18rem;">
				<img class="card-img-top"
					src="${pageContext.request.contextPath }/resources/images/unofficial/5.png"
					alt="Card image cap" onclick="goDepositSubmit();" style="cursor: pointer;">
				<div class="card-body">
					<h5 class="card-title">방탄소년단</h5>
                            <p class="card-text"> 
                              <span class="badge bg-dark">비공식굿즈</span>       <!-- 분류 -->
                              <span class="badge bg-dark">메모지</span>           <!-- 분류 -->
                              <span class="badge bg-s">기간 : 2021-06-17~2021-06-30 </span>       
                              <span class="badge bg-s">재고  : 100</span>
                               <span class="badge bg-s">판매량  : 100</span>
                               <span class="badge bg-s">판매자  : 정쿠키</span>
                               <span class="badge bg-s">조회수  : 1234</span>
                            </p>
				</div>
			</div>
			<div class="card" style="width: 18rem;">
				<img class="card-img-top"
					src="${pageContext.request.contextPath }/resources/images/unofficial/6.png"
					alt="Card image cap" onclick="goDepositSubmit();" style="cursor: pointer;">
				<div class="card-body">
					<h5 class="card-title">방탄소년단</h5>
                            <p class="card-text"> 
                              <span class="badge bg-dark">비공식굿즈</span>       <!-- 분류 -->
                              <span class="badge bg-dark">메모지</span>           <!-- 분류 -->
                              <span class="badge bg-s">기간 : 2021-06-17~2021-06-30 </span>       
                              <span class="badge bg-s">재고  : 100</span>
                               <span class="badge bg-s">판매량  : 100</span>
                               <span class="badge bg-s">판매자  : 정쿠키</span>
                               <span class="badge bg-s">조회수  : 1234</span>
                            </p>
				</div>
			</div>



		</div>

		<br /> <br />

		<!-- 카테고리별 -->
		<div class="titleWrapper">
			<style>
div#ingdemandList {
	display: flex;
}
</style>

		</div>
		<div id="ingdemandList" class="boxWrapper">

			<div class="card" style="width: 18rem;">
				<img class="card-img-top"
					src="${pageContext.request.contextPath }/resources/images/unofficial/7.png"
					alt="Card image cap" onclick="goDepositSubmit();" style="cursor: pointer;">
				<div class="card-body">
					<h5 class="card-title">방탄소년단</h5>
                            <p class="card-text"> 
                              <span class="badge bg-dark">비공식굿즈</span>       <!-- 분류 -->
                              <span class="badge bg-dark">메모지</span>           <!-- 분류 -->
                              <span class="badge bg-s">기간 : 2021-06-17~2021-06-30 </span>       
                              <span class="badge bg-s">재고  : 100</span>
                               <span class="badge bg-s">판매량  : 100</span>
                               <span class="badge bg-s">판매자  : 정쿠키</span>
                               <span class="badge bg-s">조회수  : 1234</span>
                            </p>
				</div>
			</div>


			<div class="card" style="width: 18rem;">
				<img class="card-img-top"
					src="${pageContext.request.contextPath }/resources/images/unofficial/8.png"
					alt="Card image cap" onclick="goDepositSubmit();" style="cursor: pointer;">
				<div class="card-body">
					<h5 class="card-title">방탄소년단</h5>
                            <p class="card-text"> 
                              <span class="badge bg-dark">비공식굿즈</span>       <!-- 분류 -->
                              <span class="badge bg-dark">메모지</span>           <!-- 분류 -->
                              <span class="badge bg-s">기간 : 2021-06-17~2021-06-30 </span>       
                              <span class="badge bg-s">재고  : 100</span>
                               <span class="badge bg-s">판매량  : 100</span>
                               <span class="badge bg-s">판매자  : 정쿠키</span>
                               <span class="badge bg-s">조회수  : 1234</span>
                            </p>
				</div>
			</div>
			<div class="card" style="width: 18rem;">
				<img class="card-img-top"
					src="${pageContext.request.contextPath }/resources/images/unofficial/9.png"
					alt="Card image cap" onclick="goDepositSubmit();" style="cursor: pointer;">
				<div class="card-body">
					<h5 class="card-title">방탄소년단</h5>
                            <p class="card-text"> 
                              <span class="badge bg-dark">비공식굿즈</span>       <!-- 분류 -->
                              <span class="badge bg-dark">메모지</span>           <!-- 분류 -->
                              <span class="badge bg-s">기간 : 2021-06-17~2021-06-30 </span>       
                              <span class="badge bg-s">재고  : 100</span>
                               <span class="badge bg-s">판매량  : 100</span>
                               <span class="badge bg-s">판매자  : 정쿠키</span>
                               <span class="badge bg-s">조회수  : 1234</span>
                            </p>
				</div>
			</div>
			<div class="card" style="width: 18rem;">
				<img class="card-img-top"
					src="${pageContext.request.contextPath }/resources/images/unofficial/10.png"
					alt="Card image cap" onclick="goDepositSubmit();" style="cursor: pointer;">
				<div class="card-body">
					<h5 class="card-title">방탄소년단</h5>
                            <p class="card-text"> 
                              <span class="badge bg-dark">비공식굿즈</span>       <!-- 분류 -->
                              <span class="badge bg-dark">메모지</span>           <!-- 분류 -->
                              <span class="badge bg-s">기간 : 2021-06-17~2021-06-30 </span>       
                              <span class="badge bg-s">재고  : 100</span>
                               <span class="badge bg-s">판매량  : 100</span>
                               <span class="badge bg-s">판매자  : 정쿠키</span>
                               <span class="badge bg-s">조회수  : 1234</span>
                            </p>
				</div>
			</div>
			<div class="card" style="width: 18rem;">
				<img class="card-img-top"
					src="${pageContext.request.contextPath }/resources/images/unofficial/11.png"
					alt="Card image cap" onclick="goDepositSubmit();" style="cursor: pointer;">
				<div class="card-body">
					<h5 class="card-title">방탄소년단</h5>
                            <p class="card-text"> 
                              <span class="badge bg-dark">비공식굿즈</span>       <!-- 분류 -->
                              <span class="badge bg-dark">메모지</span>           <!-- 분류 -->
                              <span class="badge bg-s">기간 : 2021-06-17~2021-06-30 </span>       
                              <span class="badge bg-s">재고  : 100</span>
                               <span class="badge bg-s">판매량  : 100</span>
                               <span class="badge bg-s">판매자  : 정쿠키</span>
                               <span class="badge bg-s">조회수  : 1234</span>
                            </p>
				</div>
			</div>


		</div>

		<br /> <br />


		<div class="titleWrapper">
			<style>
div#ingdepositlist {
	display: flex;
}
</style>

		</div>
		<div id="ingdepositlist" class="boxWrapper">
			<div class="card" style="width: 18rem;">
				<img class="card-img-top"
					src="${pageContext.request.contextPath }/resources/images/unofficial/12.png"
					alt="Card image cap" onclick="goDepositSubmit();" style="cursor: pointer;">
				<div class="card-body">
					<h5 class="card-title">방탄소년단</h5>
                            <p class="card-text"> 
                              <span class="badge bg-dark">비공식굿즈</span>       <!-- 분류 -->
                              <span class="badge bg-dark">메모지</span>           <!-- 분류 -->
                              <span class="badge bg-s">기간 : 2021-06-17~2021-06-30 </span>       
                              <span class="badge bg-s">재고  : 100</span>
                               <span class="badge bg-s">판매량  : 100</span>
                               <span class="badge bg-s">판매자  : 정쿠키</span>
                               <span class="badge bg-s">조회수  : 1234</span>
                            </p>
				</div>
			</div>


			<div class="card" style="width: 18rem;">
				<img class="card-img-top"
					src="${pageContext.request.contextPath }/resources/images/unofficial/13.png"
					alt="Card image cap" onclick="goDepositSubmit();" style="cursor: pointer;">
				<div class="card-body">
					<h5 class="card-title">방탄소년단</h5>
                            <p class="card-text"> 
                              <span class="badge bg-dark">비공식굿즈</span>       <!-- 분류 -->
                              <span class="badge bg-dark">메모지</span>           <!-- 분류 -->
                              <span class="badge bg-s">기간 : 2021-06-17~2021-06-30 </span>       
                              <span class="badge bg-s">재고  : 100</span>
                               <span class="badge bg-s">판매량  : 100</span>
                               <span class="badge bg-s">판매자  : 정쿠키</span>
                               <span class="badge bg-s">조회수  : 1234</span>
                            </p>
				</div>
			</div>
			<div class="card" style="width: 18rem;">
				<img class="card-img-top"
					src="${pageContext.request.contextPath }/resources/images/unofficial/14.png"
					alt="Card image cap" onclick="goDepositSubmit();" style="cursor: pointer;">
				<div class="card-body">
					<h5 class="card-title">방탄소년단</h5>
                            <p class="card-text"> 
                              <span class="badge bg-dark">비공식굿즈</span>       <!-- 분류 -->
                              <span class="badge bg-dark">메모지</span>           <!-- 분류 -->
                              <span class="badge bg-s">기간 : 2021-06-17~2021-06-30 </span>       
                              <span class="badge bg-s">재고  : 100</span>
                               <span class="badge bg-s">판매량  : 100</span>
                               <span class="badge bg-s">판매자  : 정쿠키</span>
                               <span class="badge bg-s">조회수  : 1234</span>
                            </p>
				</div>
			</div>
			<div class="card" style="width: 18rem;">
				<img class="card-img-top"
					src="${pageContext.request.contextPath }/resources/images/unofficial/15.png"
					alt="Card image cap" onclick="goDepositSubmit();" style="cursor: pointer;">
				<div class="card-body">
					<h5 class="card-title">방탄소년단</h5>
                            <p class="card-text"> 
                              <span class="badge bg-dark">비공식굿즈</span>       <!-- 분류 -->
                              <span class="badge bg-dark">메모지</span>           <!-- 분류 -->
                              <span class="badge bg-s">기간 : 2021-06-17~2021-06-30 </span>       
                              <span class="badge bg-s">재고  : 100</span>
                               <span class="badge bg-s">판매량  : 100</span>
                               <span class="badge bg-s">판매자  : 정쿠키</span>
                               <span class="badge bg-s">조회수  : 1234</span>
                            </p>
				</div>
			</div>
			<div class="card" style="width: 18rem;">
				<img class="card-img-top"
					src="${pageContext.request.contextPath }/resources/images/unofficial/16.png"
					alt="Card image cap" onclick="goDepositSubmit();" style="cursor: pointer;">
				<div class="card-body">
					<h5 class="card-title">방탄소년단</h5>
                            <p class="card-text"> 
                              <span class="badge bg-dark">비공식굿즈</span>       <!-- 분류 -->
                              <span class="badge bg-dark">메모지</span>           <!-- 분류 -->
                              <span class="badge bg-s">기간 : 2021-06-17~2021-06-30 </span>       
                              <span class="badge bg-s">재고  : 100</span>
                               <span class="badge bg-s">판매량  : 100</span>
                               <span class="badge bg-s">판매자  : 정쿠키</span>
                               <span class="badge bg-s">조회수  : 1234</span>
                            </p>
				</div>
			</div>
		</div>

		<br /> <br />


		<div class="titleWrapper">
			<style>
div#newdemandlist {
	display: flex;
}
</style>

		</div>
		<div id="newdemandlist" class="boxWrapper">
			<div class="card" style="width: 18rem;">
				<img class="card-img-top"
					src="${pageContext.request.contextPath }/resources/images/unofficial/17.png"
					alt="Card image cap" onclick="goDepositSubmit();" style="cursor: pointer;">
				<div class="card-body">
					<h5 class="card-title">방탄소년단</h5>
                            <p class="card-text"> 
                              <span class="badge bg-dark">비공식굿즈</span>       <!-- 분류 -->
                              <span class="badge bg-dark">메모지</span>           <!-- 분류 -->
                              <span class="badge bg-s">기간 : 2021-06-17~2021-06-30 </span>       
                              <span class="badge bg-s">재고  : 100</span>
                               <span class="badge bg-s">판매량  : 100</span>
                               <span class="badge bg-s">판매자  : 정쿠키</span>
                               <span class="badge bg-s">조회수  : 1234</span>
                            </p>
				</div>
			</div>


			<div class="card" style="width: 18rem;">
				<img class="card-img-top"
					src="${pageContext.request.contextPath }/resources/images/unofficial/18.png"
					alt="Card image cap" onclick="goDepositSubmit();" style="cursor: pointer;">
				<div class="card-body">
					<h5 class="card-title">방탄소년단</h5>
                            <p class="card-text"> 
                              <span class="badge bg-dark">비공식굿즈</span>       <!-- 분류 -->
                              <span class="badge bg-dark">메모지</span>           <!-- 분류 -->
                              <span class="badge bg-s">기간 : 2021-06-17~2021-06-30 </span>       
                              <span class="badge bg-s">재고  : 100</span>
                               <span class="badge bg-s">판매량  : 100</span>
                               <span class="badge bg-s">판매자  : 정쿠키</span>
                               <span class="badge bg-s">조회수  : 1234</span>
                            </p>
				</div>
			</div>
			<div class="card" style="width: 18rem;">
				<img class="card-img-top"
					src="${pageContext.request.contextPath }/resources/images/unofficial/19.png"
					alt="Card image cap" onclick="goDepositSubmit();" style="cursor: pointer;">
				<div class="card-body">
					<h5 class="card-title">방탄소년단</h5>
                            <p class="card-text"> 
                              <span class="badge bg-dark">비공식굿즈</span>       <!-- 분류 -->
                              <span class="badge bg-dark">메모지</span>           <!-- 분류 -->
                              <span class="badge bg-s">기간 : 2021-06-17~2021-06-30 </span>       
                              <span class="badge bg-s">재고  : 100</span>
                               <span class="badge bg-s">판매량  : 100</span>
                               <span class="badge bg-s">판매자  : 정쿠키</span>
                               <span class="badge bg-s">조회수  : 1234</span>
                            </p>
				</div>
			</div>
			<div class="card" style="width: 18rem;">
				<img class="card-img-top"
					src="${pageContext.request.contextPath }/resources/images/unofficial/20.png"
					alt="Card image cap" onclick="goDepositSubmit();" style="cursor: pointer;">
				<div class="card-body">
					<h5 class="card-title">방탄소년단</h5>
                            <p class="card-text"> 
                              <span class="badge bg-dark">비공식굿즈</span>       <!-- 분류 -->
                              <span class="badge bg-dark">메모지</span>           <!-- 분류 -->
                              <span class="badge bg-s">기간 : 2021-06-17~2021-06-30 </span>       
                              <span class="badge bg-s">재고  : 100</span>
                               <span class="badge bg-s">판매량  : 100</span>
                               <span class="badge bg-s">판매자  : 정쿠키</span>
                               <span class="badge bg-s">조회수  : 1234</span>
                            </p>
				</div>
			</div>
			<div class="card" style="width: 18rem;">
				<img class="card-img-top"
					src="${pageContext.request.contextPath }/resources/images/unofficial/21.png"
					alt="Card image cap" onclick="goDepositSubmit();" style="cursor: pointer;">
				<div class="card-body">
					<h5 class="card-title">방탄소년단</h5>
                            <p class="card-text"> 
                              <span class="badge bg-dark">비공식굿즈</span>       <!-- 분류 -->
                              <span class="badge bg-dark">메모지</span>           <!-- 분류 -->
                              <span class="badge bg-s">기간 : 2021-06-17~2021-06-30 </span>       
                              <span class="badge bg-s">재고  : 100</span>
                               <span class="badge bg-s">판매량  : 100</span>
                               <span class="badge bg-s">판매자  : 정쿠키</span>
                               <span class="badge bg-s">조회수  : 1234</span>
                            </p>
				</div>
			</div>
		</div>



	</section>


</body>
</html>

<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>





