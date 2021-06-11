  <%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<jsp:include page="/WEB-INF/views/common/header.jsp"></jsp:include>

<title>Unofficial</title>
<style>
* {
	margin: 0;
	padding: 0;
}

#logo {
	height: 50px;;
}

ul li {
	list-style: none;
}

.searchList li {
	float: left;
	margin: 0.5rem;
	padding: 0.3rem 0.7rem;
}

.searchList {
	margin-bottom: 0;
}

#name {
	font-size: 25px;
	color: black;
	font-weight: bolder;
}

#search_img {
	height: 23px;
}

.box {
	margin-top: 0;
	height: 45px;
	background-color: #C8A9C8;
}

.search-ul {
	margin-right: 5rem;
	height: 29px;
	list-style: none;
}

.search-ul li {
	height: 80%;
	margin: 0.5rem 1rem 0 1rem;
}

.search-ul li a {
	padding-top: 0.3rem;
	margin-top: 1rem;
}

a {
	color: black;
}

.navbar {
	float: none;
	margin: 0 auto;
	padding: 0.5rem 1rem;
}

header {
	text-align: center;
}
/* position:absolute;
            left:50%;
            transform: translateX(-50%); */
.main-navbar form {
	margin: 0 1rem 0 3.5rem;
}

.main-navbar {
	padding: 0.5rem 1rem;
}

.divide {
	height: 80%;
	margin: 0.5rem 0.5rem 0 0.5rem;
}

.menu-ul {
	width: 100%;
	height: 100%;
	margin-bottom: 0;
}

footer {
	height: 200px;
}

.footer-introduce {
	width: 908px;
}

.footer-introduce li span {
	color: gray;
}

.footer-ul {
	margin: 1rem 2.5rem;
	width: 250px;
}

.span-color {
	background-color: #39516A;
	color: whitesmoke;
	padding: 0 0.5rem;
}

.span-color-h {
	background-color: #39516A;
	color: whitesmoke;
	padding: 0.1rem 0.5rem;
	margin-bottom: 2rem;
}

header hr {
	margin: 0;
	border: 0;
	border-top: 1px solid rgba(0, 0, 0, .1);
}

.memu-div {
	width: 100%;
}

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
				location.href = "${pageContext.request.contextPath}/unofficial/demandForm.do";
			}

			function goDepositForm() {
				location.href = "${pageContext.request.contextPath}/unofficial/depositForm.do";
			}

			function goDepositSubmit() {
				location.href = "${pageContext.request.contextPath}/unofficial/depositsubmit.do";

			}

			function goDemandSubmit() {
				location.href = "${pageContext.request.contextPath}/unofficial/demandsubmit.do";

			}

			function goDemandFormlist(){
				location.href = "${pageContext.request.contextPath}/unofficial/demandFormlist.do";}

			function goDepositFormlist(){
				location.href = "${pageContext.request.contextPath}/unofficial/depositFormlist.do";}
		</script>




		<div class="titleWrapper">
			<style>
div#topList {
	display: flex;
}
</style>
			<h2>인기상품</h2>
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
					alt="Card image cap" onclick="goDepositSubmit();">
				<div class="card-body">
					<div class="data-form">
						<div class="txt-title">레트로 다꾸용품 입금폼 _ 나 백원만! : 그 시절로 돌아갈 ...</div>
						<div class="txt-calen">
							<span class="txt-day">2021-05-31~2021-06-27</span>
						</div>
						<div class="txt-user">
							<span class="txt-id"><div class="profile"
									style="border-radius: 50%; background-size: cover; background-position: center; background-image: url(/upload/profile/20210531185251306031582.png);"></div>구백원</span><span
								class="txt-num">조회수 1,349</span>
						</div>
					</div>
				</div>
			</div>
			
			<div class="card" style="width: 18rem;">
				<img class="card-img-top"
					src="${pageContext.request.contextPath }/resources/images/unofficial/3.png"
					alt="Card image cap">
				<div class="card-body">
					<div class="data-form">
						<div class="txt-title">레트로 다꾸용품 입금폼 _ 나 백원만! : 그 시절로 돌아갈 ...</div>
						<div class="txt-calen">
							<span class="txt-day">2021-05-31~2021-06-27</span>
						</div>
						<div class="txt-user">
							<span class="txt-id"><div class="profile"
									style="border-radius: 50%; background-size: cover; background-position: center; background-image: url(/upload/profile/20210531185251306031582.png);"></div>구백원</span><span
								class="txt-num">조회수 1,349</span>
						</div>
					</div>
				</div>
			</div>


			
			<div class="card" style="width: 18rem;">
				<img class="card-img-top"
					src="${pageContext.request.contextPath }/resources/images/unofficial/4.png"
					alt="Card image cap">
				<div class="card-body">
					<div class="data-form">
						<div class="txt-title">레트로 다꾸용품 입금폼 _ 나 백원만! : 그 시절로 돌아갈 ...</div>
						<div class="txt-calen">
							<span class="txt-day">2021-05-31~2021-06-27</span>
						</div>
						<div class="txt-user">
							<span class="txt-id"><div class="profile"
									style="border-radius: 50%; background-size: cover; background-position: center; background-image: url(/upload/profile/20210531185251306031582.png);"></div>구백원</span><span
								class="txt-num">조회수 1,349</span>
						</div>
					</div>
				</div>
			</div>
			<div class="card" style="width: 18rem;">
				<img class="card-img-top"
					src="${pageContext.request.contextPath }/resources/images/unofficial/5.png"
					alt="Card image cap">
				<div class="card-body">
					<div class="data-form">
						<div class="txt-title">레트로 다꾸용품 입금폼 _ 나 백원만! : 그 시절로 돌아갈 ...</div>
						<div class="txt-calen">
							<span class="txt-day">2021-05-31~2021-06-27</span>
						</div>
						<div class="txt-user">
							<span class="txt-id"><div class="profile"
									style="border-radius: 50%; background-size: cover; background-position: center; background-image: url(/upload/profile/20210531185251306031582.png);"></div>구백원</span><span
								class="txt-num">조회수 1,349</span>
						</div>
					</div>
				</div>
			</div>
			<div class="card" style="width: 18rem;">
				<img class="card-img-top"
					src="${pageContext.request.contextPath }/resources/images/unofficial/6.png"
					alt="Card image cap">
				<div class="card-body">
					<div class="data-form">
						<div class="txt-title">레트로 다꾸용품 입금폼 _ 나 백원만! : 그 시절로 돌아갈 ...</div>
						<div class="txt-calen">
							<span class="txt-day">2021-05-31~2021-06-27</span>
						</div>
						<div class="txt-user">
							<span class="txt-id"><div class="profile"
									style="border-radius: 50%; background-size: cover; background-position: center; background-image: url(/upload/profile/20210531185251306031582.png);"></div>구백원</span><span
								class="txt-num">조회수 1,349</span>
						</div>
					</div>
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
			<h2>진행중인 수요조사폼</h2>
		</div>
		<div id="ingdemandList" class="boxWrapper">
		
		<div class="card" style="width: 18rem;">
				<img class="card-img-top"
					src="${pageContext.request.contextPath }/resources/images/unofficial/7.png"
					alt="Card image cap" onclick="goDemandSubmit();">
				<div class="card-body">
					<div class="data-form">
						<div class="txt-title">레트로 다꾸용품 입금폼 _ 나 백원만! : 그 시절로 돌아갈 ...</div>
						<div class="txt-calen">
							<span class="txt-day">2021-05-31~2021-06-27</span>
						</div>
						<div class="txt-user">
							<span class="txt-id"><div class="profile"
									style="border-radius: 50%; background-size: cover; background-position: center; background-image: url(/upload/profile/20210531185251306031582.png);"></div>구백원</span><span
								class="txt-num">조회수 1,349</span>
						</div>
					</div>
				</div>
			</div>

			
<div class="card" style="width: 18rem;">
				<img class="card-img-top"
					src="${pageContext.request.contextPath }/resources/images/unofficial/8.png"
					alt="Card image cap">
				<div class="card-body">
					<div class="data-form">
						<div class="txt-title">레트로 다꾸용품 입금폼 _ 나 백원만! : 그 시절로 돌아갈 ...</div>
						<div class="txt-calen">
							<span class="txt-day">2021-05-31~2021-06-27</span>
						</div>
						<div class="txt-user">
							<span class="txt-id"><div class="profile"
									style="border-radius: 50%; background-size: cover; background-position: center; background-image: url(/upload/profile/20210531185251306031582.png);"></div>구백원</span><span
								class="txt-num">조회수 1,349</span>
						</div>
					</div>
				</div>
			</div>
			<div class="card" style="width: 18rem;">
				<img class="card-img-top"
					src="${pageContext.request.contextPath }/resources/images/unofficial/9.png"
					alt="Card image cap">
				<div class="card-body">
					<div class="data-form">
						<div class="txt-title">레트로 다꾸용품 입금폼 _ 나 백원만! : 그 시절로 돌아갈 ...</div>
						<div class="txt-calen">
							<span class="txt-day">2021-05-31~2021-06-27</span>
						</div>
						<div class="txt-user">
							<span class="txt-id"><div class="profile"
									style="border-radius: 50%; background-size: cover; background-position: center; background-image: url(/upload/profile/20210531185251306031582.png);"></div>구백원</span><span
								class="txt-num">조회수 1,349</span>
						</div>
					</div>
				</div>
			</div>
			<div class="card" style="width: 18rem;">
				<img class="card-img-top"
					src="${pageContext.request.contextPath }/resources/images/unofficial/10.png"
					alt="Card image cap">
				<div class="card-body">
					<div class="data-form">
						<div class="txt-title">레트로 다꾸용품 입금폼 _ 나 백원만! : 그 시절로 돌아갈 ...</div>
						<div class="txt-calen">
							<span class="txt-day">2021-05-31~2021-06-27</span>
						</div>
						<div class="txt-user">
							<span class="txt-id"><div class="profile"
									style="border-radius: 50%; background-size: cover; background-position: center; background-image: url(/upload/profile/20210531185251306031582.png);"></div>구백원</span><span
								class="txt-num">조회수 1,349</span>
						</div>
					</div>
				</div>
			</div>
			<div class="card" style="width: 18rem;">
				<img class="card-img-top"
					src="${pageContext.request.contextPath }/resources/images/unofficial/11.png"
					alt="Card image cap">
				<div class="card-body">
					<div class="data-form">
						<div class="txt-title">레트로 다꾸용품 입금폼 _ 나 백원만! : 그 시절로 돌아갈 ...</div>
						<div class="txt-calen">
							<span class="txt-day">2021-05-31~2021-06-27</span>
						</div>
						<div class="txt-user">
							<span class="txt-id"><div class="profile"
									style="border-radius: 50%; background-size: cover; background-position: center; background-image: url(/upload/profile/20210531185251306031582.png);"></div>구백원</span><span
								class="txt-num">조회수 1,349</span>
						</div>
					</div>
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
			<h2>진행중인 입금폼</h2>
		</div>
		<div id="ingdepositlist" class="boxWrapper">
			<div class="card" style="width: 18rem;">
				<img class="card-img-top"
					src="${pageContext.request.contextPath }/resources/images/unofficial/12.png"
					alt="Card image cap">
				<div class="card-body">
					<div class="data-form">
						<div class="txt-title">레트로 다꾸용품 입금폼 _ 나 백원만! : 그 시절로 돌아갈 ...</div>
						<div class="txt-calen">
							<span class="txt-day">2021-05-31~2021-06-27</span>
						</div>
						<div class="txt-user">
							<span class="txt-id"><div class="profile"
									style="border-radius: 50%; background-size: cover; background-position: center; background-image: url(/upload/profile/20210531185251306031582.png);"></div>구백원</span><span
								class="txt-num">조회수 1,349</span>
						</div>
					</div>
				</div>
			</div>

			<div class="card" style="width: 18rem;">
				<img class="card-img-top"
					src="${pageContext.request.contextPath }/resources/images/unofficial/13.png"
					alt="Card image cap">
				<div class="card-body">
					<div class="data-form">
						<div class="txt-title">레트로 다꾸용품 입금폼 _ 나 백원만! : 그 시절로 돌아갈 ...</div>
						<div class="txt-calen">
							<span class="txt-day">2021-05-31~2021-06-27</span>
						</div>
						<div class="txt-user">
							<span class="txt-id"><div class="profile"
									style="border-radius: 50%; background-size: cover; background-position: center; background-image: url(/upload/profile/20210531185251306031582.png);"></div>구백원</span><span
								class="txt-num">조회수 1,349</span>
						</div>
					</div>
				</div>
			</div>
			<div class="card" style="width: 18rem;">
				<img class="card-img-top"
					src="${pageContext.request.contextPath }/resources/images/unofficial/14.png"
					alt="Card image cap">
				<div class="card-body">
					<div class="data-form">
						<div class="txt-title">레트로 다꾸용품 입금폼 _ 나 백원만! : 그 시절로 돌아갈 ...</div>
						<div class="txt-calen">
							<span class="txt-day">2021-05-31~2021-06-27</span>
						</div>
						<div class="txt-user">
							<span class="txt-id"><div class="profile"
									style="border-radius: 50%; background-size: cover; background-position: center; background-image: url(/upload/profile/20210531185251306031582.png);"></div>구백원</span><span
								class="txt-num">조회수 1,349</span>
						</div>
					</div>
				</div>
			</div>
			<div class="card" style="width: 18rem;">
				<img class="card-img-top"
					src="${pageContext.request.contextPath }/resources/images/unofficial/15.png"
					alt="Card image cap">
				<div class="card-body">
					<div class="data-form">
						<div class="txt-title">레트로 다꾸용품 입금폼 _ 나 백원만! : 그 시절로 돌아갈 ...</div>
						<div class="txt-calen">
							<span class="txt-day">2021-05-31~2021-06-27</span>
						</div>
						<div class="txt-user">
							<span class="txt-id"><div class="profile"
									style="border-radius: 50%; background-size: cover; background-position: center; background-image: url(/upload/profile/20210531185251306031582.png);"></div>구백원</span><span
								class="txt-num">조회수 1,349</span>
						</div>
					</div>
				</div>
			</div>
			<div class="card" style="width: 18rem;">
				<img class="card-img-top"
					src="${pageContext.request.contextPath }/resources/images/unofficial/16.png"
					alt="Card image cap">
				<div class="card-body">
					<div class="data-form">
						<div class="txt-title">레트로 다꾸용품 입금폼 _ 나 백원만! : 그 시절로 돌아갈 ...</div>
						<div class="txt-calen">
							<span class="txt-day">2021-05-31~2021-06-27</span>
						</div>
						<div class="txt-user">
							<span class="txt-id"><div class="profile"
									style="border-radius: 50%; background-size: cover; background-position: center; background-image: url(/upload/profile/20210531185251306031582.png);"></div>구백원</span><span
								class="txt-num">조회수 1,349</span>
						</div>
					</div>
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
			<h2>새로올라온 수요조사폼</h2>
		</div>
		<div id="newdemandlist" class="boxWrapper">
			<div class="card" style="width: 18rem;">
				<img class="card-img-top"
					src="${pageContext.request.contextPath }/resources/images/unofficial/17.png"
					alt="Card image cap">
				<div class="card-body">
					<div class="data-form">
						<div class="txt-title">레트로 다꾸용품 입금폼 _ 나 백원만! : 그 시절로 돌아갈 ...</div>
						<div class="txt-calen">
							<span class="txt-day">2021-05-31~2021-06-27</span>
						</div>
						<div class="txt-user">
							<span class="txt-id"><div class="profile"
									style="border-radius: 50%; background-size: cover; background-position: center; background-image: url(/upload/profile/20210531185251306031582.png);"></div>구백원</span><span
								class="txt-num">조회수 1,349</span>
						</div>
					</div>
				</div>
			</div>


			<div class="card" style="width: 18rem;">
				<img class="card-img-top"
					src="${pageContext.request.contextPath }/resources/images/unofficial/18.png"
					alt="Card image cap">
				<div class="card-body">
					<div class="data-form">
						<div class="txt-title">레트로 다꾸용품 입금폼 _ 나 백원만! : 그 시절로 돌아갈 ...</div>
						<div class="txt-calen">
							<span class="txt-day">2021-05-31~2021-06-27</span>
						</div>
						<div class="txt-user">
							<span class="txt-id"><div class="profile"
									style="border-radius: 50%; background-size: cover; background-position: center; background-image: url(/upload/profile/20210531185251306031582.png);"></div>구백원</span><span
								class="txt-num">조회수 1,349</span>
						</div>
					</div>
				</div>
			</div>
			<div class="card" style="width: 18rem;">
				<img class="card-img-top"
					src="${pageContext.request.contextPath }/resources/images/unofficial/19.png"
					alt="Card image cap">
				<div class="card-body">
					<div class="data-form">
						<div class="txt-title">레트로 다꾸용품 입금폼 _ 나 백원만! : 그 시절로 돌아갈 ...</div>
						<div class="txt-calen">
							<span class="txt-day">2021-05-31~2021-06-27</span>
						</div>
						<div class="txt-user">
							<span class="txt-id"><div class="profile"
									style="border-radius: 50%; background-size: cover; background-position: center; background-image: url(/upload/profile/20210531185251306031582.png);"></div>구백원</span><span
								class="txt-num">조회수 1,349</span>
						</div>
					</div>
				</div>
			</div>
			<div class="card" style="width: 18rem;">
				<img class="card-img-top"
					src="${pageContext.request.contextPath }/resources/images/unofficial/20.png"
					alt="Card image cap">
				<div class="card-body">
					<div class="data-form">
						<div class="txt-title">레트로 다꾸용품 입금폼 _ 나 백원만! : 그 시절로 돌아갈 ...</div>
						<div class="txt-calen">
							<span class="txt-day">2021-05-31~2021-06-27</span>
						</div>
						<div class="txt-user">
							<span class="txt-id"><div class="profile"
									style="border-radius: 50%; background-size: cover; background-position: center; background-image: url(/upload/profile/20210531185251306031582.png);"></div>구백원</span><span
								class="txt-num">조회수 1,349</span>
						</div>
					</div>
				</div>
			</div>
			<div class="card" style="width: 18rem;">
				<img class="card-img-top"
					src="${pageContext.request.contextPath }/resources/images/unofficial/21.png"
					alt="Card image cap">
				<div class="card-body">
					<div class="data-form">
						<div class="txt-title">레트로 다꾸용품 입금폼 _ 나 백원만! : 그 시절로 돌아갈 ...</div>
						<div class="txt-calen">
							<span class="txt-day">2021-05-31~2021-06-27</span>
						</div>
						<div class="txt-user">
							<span class="txt-id"><div class="profile"
									style="border-radius: 50%; background-size: cover; background-position: center; background-image: url(/upload/profile/20210531185251306031582.png);"></div>구백원</span><span
								class="txt-num">조회수 1,349</span>
						</div>
					</div>
				</div>
			</div>
		</div>



	


</body>
</html>

<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>



