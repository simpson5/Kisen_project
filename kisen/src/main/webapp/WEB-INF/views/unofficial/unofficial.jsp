
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





		<div class="col-2" id="edit">
			<div class="py-2">
				<button type="button" class="btn btn-outline-warning"
					onclick="goDemandForm();">수요조사폼만들기</button>

			</div>
			<div class="py-2">
				<button type="button" class="btn btn-outline-warning"
					onclick="goDepositForm();">입금폼만들기</button>
			</div>
		</div>

		<div class="col-2" id="edit">
			<div class="py-2">
				<button type="button" class="btn btn-outline-warning"
					onclick="goDemandFormlist();">수요조사폼목록</button>

			</div>
			<div class="py-2">
				<button type="button" class="btn btn-outline-warning"
					onclick="goDepositFormlist();">입금폼목록</button>
			</div>
		</div>

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

			
		</script>




		<div class="titleWrapper">
			<style>
div#topList {
	display: flex;
}
</style>
			<h2 class="text-center m-4" style="font-weight: bold;">인기상품</h2>
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
					alt="Card image cap" onclick="goDepositSubmit();"
					style="cursor: pointer;">
					
				<div class="card-body">
							<div class=" mx-auto font-weight-bold text-center" id="heart">
     		<i class="far fa-heart heartBtn" style="font-size: 20px; color: red;" ></i>
	  	 </div>
					<h5 class="card-title">방탄소년단</h5>
		
					<p class="card-text">
						<span class="badge bg-dark">비공식굿즈</span>
						<!-- 분류 -->
						<span class="badge bg-dark">메모지</span>
						<!-- 분류 -->
						<span class="badge bg-s">기간 : 2021-06-17~2021-06-30 </span> <span
							class="badge bg-s">재고 : 100</span> <span class="badge bg-s">판매량
							: 100</span> <span class="badge bg-s">판매자 : 정쿠키</span> <span
							class="badge bg-s">조회수 : 1234</span>
							
					</p>
				</div>
			</div>
			

			<div class="card" style="width: 18rem;">
				<img class="card-img-top"
					src="${pageContext.request.contextPath }/resources/images/unofficial/3.png"
					alt="Card image cap" onclick="goDepositSubmit();"
					style="cursor: pointer;">
				<div class="card-body">
					<h5 class="card-title">방탄소년단</h5>
					<p class="card-text">
						<span class="badge bg-dark">비공식굿즈</span>
						<!-- 분류 -->
						<span class="badge bg-dark">메모지</span>
						<!-- 분류 -->
						<span class="badge bg-s">기간 : 2021-06-17~2021-06-30 </span> <span
							class="badge bg-s">재고 : 100</span> <span class="badge bg-s">판매량
							: 100</span> <span class="badge bg-s">판매자 : 정쿠키</span> <span
							class="badge bg-s">조회수 : 1234</span>
					</p>
				</div>
			</div>



			<div class="card" style="width: 18rem;">
				<img class="card-img-top"
					src="${pageContext.request.contextPath }/resources/images/unofficial/4.png"
					alt="Card image cap" onclick="goDepositSubmit();"
					style="cursor: pointer;">
				<div class="card-body">
					<h5 class="card-title">방탄소년단</h5>
					<p class="card-text">
						<span class="badge bg-dark">비공식굿즈</span>
						<!-- 분류 -->
						<span class="badge bg-dark">메모지</span>
						<!-- 분류 -->
						<span class="badge bg-s">기간 : 2021-06-17~2021-06-30 </span> <span
							class="badge bg-s">재고 : 100</span> <span class="badge bg-s">판매량
							: 100</span> <span class="badge bg-s">판매자 : 정쿠키</span> <span
							class="badge bg-s">조회수 : 1234</span>
					</p>
				</div>
			</div>
			<div class="card" style="width: 18rem;">
				<img class="card-img-top"
					src="${pageContext.request.contextPath }/resources/images/unofficial/5.png"
					alt="Card image cap" onclick="goDepositSubmit();"
					style="cursor: pointer;">
				<div class="card-body">
					<h5 class="card-title">방탄소년단</h5>
					<p class="card-text">
						<span class="badge bg-dark">비공식굿즈</span>
						<!-- 분류 -->
						<span class="badge bg-dark">메모지</span>
						<!-- 분류 -->
						<span class="badge bg-s">기간 : 2021-06-17~2021-06-30 </span> <span
							class="badge bg-s">재고 : 100</span> <span class="badge bg-s">판매량
							: 100</span> <span class="badge bg-s">판매자 : 정쿠키</span> <span
							class="badge bg-s">조회수 : 1234</span>
					</p>
				</div>
			</div>
			<div class="card" style="width: 18rem;">
				<img class="card-img-top"
					src="${pageContext.request.contextPath }/resources/images/unofficial/6.png"
					alt="Card image cap" onclick="goDepositSubmit();"
					style="cursor: pointer;">
				<div class="card-body">
					<h5 class="card-title">방탄소년단</h5>
					<p class="card-text">
						<span class="badge bg-dark">비공식굿즈</span>
						<!-- 분류 -->
						<span class="badge bg-dark">메모지</span>
						<!-- 분류 -->
						<span class="badge bg-s">기간 : 2021-06-17~2021-06-30 </span> <span
							class="badge bg-s">재고 : 100</span> <span class="badge bg-s">판매량
							: 100</span> <span class="badge bg-s">판매자 : 정쿠키</span> <span
							class="badge bg-s">조회수 : 1234</span>
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
			<h2 class="text-center m-4" style="font-weight: bold;">진행중인
				수요조사폼</h2>
		</div>
		<div id="ingdemandList" class="boxWrapper">

			<div class="card" style="width: 18rem;">
				<img class="card-img-top"
					src="${pageContext.request.contextPath }/resources/images/unofficial/7.png"
					alt="Card image cap" onclick="goDemandSubmit();"
					style="cursor: pointer;">
				<div class="card-body">
					<h5 class="card-title">방탄소년단</h5>
					<p class="card-text">
						<span class="badge bg-dark">비공식굿즈</span>
						<!-- 분류 -->
						<span class="badge bg-dark">메모지</span>
						<!-- 분류 -->
						<span class="badge bg-s">기간 : 2021-06-17~2021-06-30 </span> <span
							class="badge bg-s">재고 : 100</span> <span class="badge bg-s">판매량
							: 100</span> <span class="badge bg-s">판매자 : 정쿠키</span> <span
							class="badge bg-s">조회수 : 1234</span>
					</p>
				</div>
			</div>


			<div class="card" style="width: 18rem;">
				<img class="card-img-top"
					src="${pageContext.request.contextPath }/resources/images/unofficial/8.png"
					alt="Card image cap" onclick="goDemandSubmit();"
					style="cursor: pointer;">
				<div class="card-body">
					<h5 class="card-title">방탄소년단</h5>
					<p class="card-text">
						<span class="badge bg-dark">비공식굿즈</span>
						<!-- 분류 -->
						<span class="badge bg-dark">메모지</span>
						<!-- 분류 -->
						<span class="badge bg-s">기간 : 2021-06-17~2021-06-30 </span> <span
							class="badge bg-s">재고 : 100</span> <span class="badge bg-s">판매량
							: 100</span> <span class="badge bg-s">판매자 : 정쿠키</span> <span
							class="badge bg-s">조회수 : 1234</span>
					</p>
				</div>
			</div>
			<div class="card" style="width: 18rem;">
				<img class="card-img-top"
					src="${pageContext.request.contextPath }/resources/images/unofficial/9.png"
					alt="Card image cap" onclick="goDemandSubmit();"
					style="cursor: pointer;">
				<div class="card-body">
					<h5 class="card-title">방탄소년단</h5>
					<p class="card-text">
						<span class="badge bg-dark">비공식굿즈</span>
						<!-- 분류 -->
						<span class="badge bg-dark">메모지</span>
						<!-- 분류 -->
						<span class="badge bg-s">기간 : 2021-06-17~2021-06-30 </span> <span
							class="badge bg-s">재고 : 100</span> <span class="badge bg-s">판매량
							: 100</span> <span class="badge bg-s">판매자 : 정쿠키</span> <span
							class="badge bg-s">조회수 : 1234</span>
					</p>
				</div>
			</div>
			<div class="card" style="width: 18rem;">
				<img class="card-img-top"
					src="${pageContext.request.contextPath }/resources/images/unofficial/10.png"
					alt="Card image cap" onclick="goDemandSubmit();"
					style="cursor: pointer;">
				<div class="card-body">
					<h5 class="card-title">방탄소년단</h5>
					<p class="card-text">
						<span class="badge bg-dark">비공식굿즈</span>
						<!-- 분류 -->
						<span class="badge bg-dark">메모지</span>
						<!-- 분류 -->
						<span class="badge bg-s">기간 : 2021-06-17~2021-06-30 </span> <span
							class="badge bg-s">재고 : 100</span> <span class="badge bg-s">판매량
							: 100</span> <span class="badge bg-s">판매자 : 정쿠키</span> <span
							class="badge bg-s">조회수 : 1234</span>
					</p>
				</div>
			</div>
			<div class="card" style="width: 18rem;">
				<img class="card-img-top"
					src="${pageContext.request.contextPath }/resources/images/unofficial/11.png"
					alt="Card image cap" onclick="goDemandSubmit();"
					style="cursor: pointer;">
				<div class="card-body">
					<h5 class="card-title">방탄소년단</h5>
					<p class="card-text">
						<span class="badge bg-dark">비공식굿즈</span>
						<!-- 분류 -->
						<span class="badge bg-dark">메모지</span>
						<!-- 분류 -->
						<span class="badge bg-s">기간 : 2021-06-17~2021-06-30 </span> <span
							class="badge bg-s">재고 : 100</span> <span class="badge bg-s">판매량
							: 100</span> <span class="badge bg-s">판매자 : 정쿠키</span> <span
							class="badge bg-s">조회수 : 1234</span>
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
			<h2 class="text-center m-4" style="font-weight: bold;">진행중인 입금폼</h2>
		</div>
		<div id="ingdepositlist" class="boxWrapper">
			<div class="card" style="width: 18rem;">
				<img class="card-img-top"
					src="${pageContext.request.contextPath }/resources/images/unofficial/12.png"
					alt="Card image cap" onclick="goDepositSubmit();"
					style="cursor: pointer;">
				<div class="card-body">
					<h5 class="card-title">방탄소년단</h5>
					<p class="card-text">
						<span class="badge bg-dark">비공식굿즈</span>
						<!-- 분류 -->
						<span class="badge bg-dark">메모지</span>
						<!-- 분류 -->
						<span class="badge bg-s">기간 : 2021-06-17~2021-06-30 </span> <span
							class="badge bg-s">재고 : 100</span> <span class="badge bg-s">판매량
							: 100</span> <span class="badge bg-s">판매자 : 정쿠키</span> <span
							class="badge bg-s">조회수 : 1234</span>
					</p>
				</div>
			</div>

			<div class="card" style="width: 18rem;">
				<img class="card-img-top"
					src="${pageContext.request.contextPath }/resources/images/unofficial/13.png"
					alt="Card image cap" onclick="goDepositSubmit();"
					style="cursor: pointer;">
				<div class="card-body">
					<h5 class="card-title">방탄소년단</h5>
					<p class="card-text">
						<span class="badge bg-dark">비공식굿즈</span>
						<!-- 분류 -->
						<span class="badge bg-dark">메모지</span>
						<!-- 분류 -->
						<span class="badge bg-s">기간 : 2021-06-17~2021-06-30 </span> <span
							class="badge bg-s">재고 : 100</span> <span class="badge bg-s">판매량
							: 100</span> <span class="badge bg-s">판매자 : 정쿠키</span> <span
							class="badge bg-s">조회수 : 1234</span>
					</p>
				</div>
			</div>
			<div class="card" style="width: 18rem;">
				<img class="card-img-top"
					src="${pageContext.request.contextPath }/resources/images/unofficial/14.png"
					alt="Card image cap" onclick="goDepositSubmit();"
					style="cursor: pointer;">
				<div class="card-body">
					<h5 class="card-title">방탄소년단</h5>
					<p class="card-text">
						<span class="badge bg-dark">비공식굿즈</span>
						<!-- 분류 -->
						<span class="badge bg-dark">메모지</span>
						<!-- 분류 -->
						<span class="badge bg-s">기간 : 2021-06-17~2021-06-30 </span> <span
							class="badge bg-s">재고 : 100</span> <span class="badge bg-s">판매량
							: 100</span> <span class="badge bg-s">판매자 : 정쿠키</span> <span
							class="badge bg-s">조회수 : 1234</span>
					</p>
				</div>
			</div>
			<div class="card" style="width: 18rem;">
				<img class="card-img-top"
					src="${pageContext.request.contextPath }/resources/images/unofficial/15.png"
					alt="Card image cap" onclick="goDepositSubmit();"
					style="cursor: pointer;">
				<div class="card-body">
					<h5 class="card-title">방탄소년단</h5>
					<p class="card-text">
						<span class="badge bg-dark">비공식굿즈</span>
						<!-- 분류 -->
						<span class="badge bg-dark">메모지</span>
						<!-- 분류 -->
						<span class="badge bg-s">기간 : 2021-06-17~2021-06-30 </span> <span
							class="badge bg-s">재고 : 100</span> <span class="badge bg-s">판매량
							: 100</span> <span class="badge bg-s">판매자 : 정쿠키</span> <span
							class="badge bg-s">조회수 : 1234</span>
					</p>
				</div>
			</div>
			<div class="card" style="width: 18rem;">
				<img class="card-img-top"
					src="${pageContext.request.contextPath }/resources/images/unofficial/16.png"
					alt="Card image cap" onclick="goDepositSubmit();"
					style="cursor: pointer;">
				<div class="card-body">
					<h5 class="card-title">방탄소년단</h5>
					<p class="card-text">
						<span class="badge bg-dark">비공식굿즈</span>
						<!-- 분류 -->
						<span class="badge bg-dark">메모지</span>
						<!-- 분류 -->
						<span class="badge bg-s">기간 : 2021-06-17~2021-06-30 </span> <span
							class="badge bg-s">재고 : 100</span> <span class="badge bg-s">판매량
							: 100</span> <span class="badge bg-s">판매자 : 정쿠키</span> <span
							class="badge bg-s">조회수 : 1234</span>
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
			<h2 class="text-center m-4" style="font-weight: bold;">새로올라온
				수요조사폼</h2>
		</div>
		<div id="newdemandlist" class="boxWrapper">
			<div class="card" style="width: 18rem;">
				<img class="card-img-top"
					src="${pageContext.request.contextPath }/resources/images/unofficial/17.png"
					alt="Card image cap" onclick="goDemandSubmit();"
					style="cursor: pointer;">
				<div class="card-body">
					<h5 class="card-title">방탄소년단</h5>
					<p class="card-text">
						<span class="badge bg-dark">비공식굿즈</span>
						<!-- 분류 -->
						<span class="badge bg-dark">메모지</span>
						<!-- 분류 -->
						<span class="badge bg-s">기간 : 2021-06-17~2021-06-30 </span> <span
							class="badge bg-s">재고 : 100</span> <span class="badge bg-s">판매량
							: 100</span> <span class="badge bg-s">판매자 : 정쿠키</span> <span
							class="badge bg-s">조회수 : 1234</span>
					</p>
				</div>
			</div>


			<div class="card" style="width: 18rem;">
				<img class="card-img-top"
					src="${pageContext.request.contextPath }/resources/images/unofficial/18.png"
					alt="Card image cap" onclick="goDemandSubmit();"
					style="cursor: pointer;">
				<div class="card-body">
					<h5 class="card-title">방탄소년단</h5>
					<p class="card-text">
						<span class="badge bg-dark">비공식굿즈</span>
						<!-- 분류 -->
						<span class="badge bg-dark">메모지</span>
						<!-- 분류 -->
						<span class="badge bg-s">기간 : 2021-06-17~2021-06-30 </span> <span
							class="badge bg-s">재고 : 100</span> <span class="badge bg-s">판매량
							: 100</span> <span class="badge bg-s">판매자 : 정쿠키</span> <span
							class="badge bg-s">조회수 : 1234</span>
					</p>
				</div>
			</div>
			<div class="card" style="width: 18rem;">
				<img class="card-img-top"
					src="${pageContext.request.contextPath }/resources/images/unofficial/19.png"
					alt="Card image cap" onclick="goDemandSubmit();"
					style="cursor: pointer;">
				<div class="card-body">
					<h5 class="card-title">방탄소년단</h5>
					<p class="card-text">
						<span class="badge bg-dark">비공식굿즈</span>
						<!-- 분류 -->
						<span class="badge bg-dark">메모지</span>
						<!-- 분류 -->
						<span class="badge bg-s">기간 : 2021-06-17~2021-06-30 </span> <span
							class="badge bg-s">재고 : 100</span> <span class="badge bg-s">판매량
							: 100</span> <span class="badge bg-s">판매자 : 정쿠키</span> <span
							class="badge bg-s">조회수 : 1234</span>
					</p>
				</div>
			</div>
			<div class="card" style="width: 18rem;">
				<img class="card-img-top"
					src="${pageContext.request.contextPath }/resources/images/unofficial/20.png"
					alt="Card image cap" onclick="goDemandSubmit();"
					style="cursor: pointer;">
				<div class="card-body">
					<h5 class="card-title">방탄소년단</h5>
					<p class="card-text">
						<span class="badge bg-dark">비공식굿즈</span>
						<!-- 분류 -->
						<span class="badge bg-dark">메모지</span>
						<!-- 분류 -->
						<span class="badge bg-s">기간 : 2021-06-17~2021-06-30 </span> <span
							class="badge bg-s">재고 : 100</span> <span class="badge bg-s">판매량
							: 100</span> <span class="badge bg-s">판매자 : 정쿠키</span> <span
							class="badge bg-s">조회수 : 1234</span>
					</p>
				</div>
			</div>
			<div class="card" style="width: 18rem;">
				<img class="card-img-top"
					src="${pageContext.request.contextPath }/resources/images/unofficial/21.png"
					alt="Card image cap" onclick="goDemandSubmit();"
					style="cursor: pointer;">
				<div class="card-body">
					<h5 class="card-title">방탄소년단</h5>
					<p class="card-text">
						<span class="badge bg-dark">비공식굿즈</span>
						<!-- 분류 -->
						<span class="badge bg-dark">메모지</span>
						<!-- 분류 -->
						<span class="badge bg-s">기간 : 2021-06-17~2021-06-30 </span> <span
							class="badge bg-s">재고 : 100</span> <span class="badge bg-s">판매량
							: 100</span> <span class="badge bg-s">판매자 : 정쿠키</span> <span
							class="badge bg-s">조회수 : 1234</span>
					</p>
				</div>
			</div>
		</div>
</body>
</html>

<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>



