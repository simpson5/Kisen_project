<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<jsp:include page="/WEB-INF/views/common/admin_header.jsp">
	<jsp:param value="결제/매출/배송" name="title" />
</jsp:include>

<style>
.searchBtn {	margin-left: 2rem;	height: 80%;}
.optionName {	color: white;}
</style>
<link rel="stylesheet"	href="${pageContext.request.contextPath}/resources/css/adminMember.css">
<link rel="stylesheet"	href="${pageContext.request.contextPath}/resources/css/adminPayment.css">
<link rel="stylesheet"	href="${pageContext.request.contextPath}/resources/css/adminSales.css">

<div class="container">
	<!-- 네비 (회원/아티스트) -->
	<div class="mt-3">
		<ul class="nav nav-tabs mb-3">
			<li class="nav-item"><a href="#member" data-toggle="tab"
				class="nav-link active">결제내역</a></li>
			<li class="nav-item"><a href="#artist" data-toggle="tab"
				class="nav-link">매출/배송</a></li>
		</ul>
	</div>

	<div class="tab-content mb-5">
		<!-- 일반, 기업회원 tab -->
		<div class="tab-pane fade-in active" id="member">
			<!-- 일반, 기업회원 tab -->
			<h5 style="font-weight: bold;" class="mt-3">결제내역</h5>
			<hr>

			<!-- 검색  -->
			<form:form name="searchFrm" id="searchFrm" method="get"
				class="border mt-3 mb-3">
				<div class="d-flex justify-content-center mb-3">
					<div>
						<div class="mt-2">
							<input type="search" placeholder="상품명을 입력하세요" id="searchString"
								name="searchString" class="form-control mb-3 mt-3">

							<div class="form-check form-check-inline">
								<input class="form-check-input" type="radio"
									name="searchOptions" id="inlineRadio1" value="all"> <label
									class="form-check-label" for="inlineRadio1">All</label>
							</div>
							<div class="form-check form-check-inline">
								<input class="form-check-input" type="radio"
									name="searchOptions" id="inlineRadio2" value="incomplete">
								<label class="form-check-label" for="inlineRadio2">미배송</label>
							</div>
							<div class="form-check form-check-inline">
								<input class="form-check-input" type="radio"
									name="searchOptions" id="inlineRadio3" value="complete">
								<label class="form-check-label" for="inlineRadio3">배송완료</label>
							</div>
						</div>
					</div>

					<div>
						<button class="btn mt-3 searchBtn" type="submit"
							onclick="searchFrmClick();">검색하기</button>
						<button class="btn mt-3 searchBtn" type="button"
							onclick="resetClick();">초기화</button>
					</div>
				</div>
			</form:form>


			<!-- 일반회원 리스트 -->
			<table class="table table-bordered table-striped mb-0 table-light">
				<thead>
					<tr>
						<th scope="col">No</th>
						<th scope="col">구매자</th>
						<th scope="col">상품명</th>
						<th scope="col">수량</th>
						<th scope="col">결제금액</th>
						<th scope="col">결제날짜</th>
						<th scope="col">사용 포인트</th>
						<th scope="col">운송장번호</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${paymentList}" var="payment" varStatus="num">
						<tr>
							<th scope="row">${num.count}</th>
							<td>${payment.fanId}</td>
							<td><c:forEach items="${payment.product}" var="product">
									<strong>[${product.idolName}]</strong> ${product.pdName}
		                        	
								<c:forEach items="${product.pdOptionList}" var="pdOption">
										<span class="badge bg-info optionName">${pdOption.optionName }</span>
									</c:forEach>
									<br />
								</c:forEach>
							</td>
							<td>${payment.amount}</td>
							<td><c:set var="total" value="0" /> <c:forEach
									items="${payment.product}" var="product">
									<c:set var="total" value="${total + product.price}" />
								</c:forEach> <c:if test="${not empty payment.point}">
									<c:set var="total" value="${total - payment.point}" />
								</c:if> <c:out value="${total}" /> <span>원</span></td>
							<td><fmt:formatDate value="${payment.payDate}"  pattern="yyyy-MM-dd HH:mm:ss"/>
							<td>${payment.point}<span>point</span></td>
							<c:if test="${empty payment.waybill}">
								<td id="deliveryTd${payment.paymentNo}">
									<div id="delivery" class="input-group">
										<input type="number" class="form-control"
											id="waybill${payment.paymentNo}">
										<button class="btn btn-sm btn-secondary"
											onclick="wayBill(event)" data-no="${payment.paymentNo}">등록</button>
									</div>
								</td>
							</c:if>


							<c:if test="${not empty payment.waybill}">
								<td><a href="${payment.waybill }"> ${payment.waybill }</a>
								</td>
							</c:if>
						</tr>
					</c:forEach>
				</tbody>
			</table>
			<!-- paging -->
		</div>

		<!-- 아티스트 tab -->
		<div class="tab-pane fade-in" id="artist">
			<div class="tab-content mb-5">
				<div class="tab-pane fade-in active" id="member">
    				<div class="adminMain">     
						<!-- 월매출 -->
						<h5 style="font-weight: bold;" class="mt-3">월별매출</h5>
						<hr>
						<c:forEach items="${totalList}" var="totalPrice1">
							<c:out value="${totalPrice1 }"/> <br />
						</c:forEach>
						<!-- Swiper -->
						<div class="swiper-container salesSwiper">
							<div class="swiper-wrapper text-center">
								<c:forEach items="${totalList}" var="totalPrice">
									<!-- card 1-1 -->
									<div class="swiper-slide card col-xs-6"
										style="display: inline-block; width: 13rem;">
										<div class="card-body ">
											<h5 class="card-title" style="font-weight: bold;">
											${totalPrice.month}
												매출</h5>
											<p class="card-text">
												<div class=" col-md-12 rounded-circle circle">
												<c:if test="${empty totalPrice.month }">
													<p class="badge bg-s price">0<br> <span>원</span></p>
												</c:if>
												<c:if test="${not empty totalPrice.month }">
													<p class="badge bg-s price">${totalPrice.total}<br> <span>원</span></p>
												</c:if>
												</div>
											</p>
										</div>
										<!-- card End -->
										<button type="button" class="btn btn-sm btn-outline-main"
											onclick="salesDetail();">자세히보기</button>
									</div>
								</c:forEach>
							</div>
							<div class="swiper-button-next"></div>
							<div class="swiper-button-prev"></div>
						</div>
					</div>
				</div>
	
				<!-- chart -->
				<div class="card shadow mb-4 mt-4">
					<div class="card-header py-3">
						<h6 class="m-0 font-weight-bold text-primary">6월 그래프</h6>
					</div>
					<div class="card-body">
						<canvas id="myChartOne"></canvas>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>

<script> 
	var swiper = new Swiper(".salesSwiper", {
	  slidesPerView: 4,
	  spaceBetween: 30,
	  slidesPerGroup: 4,
	  loop: true,
	  loopFillGroupWithBlank: true,
	  navigation: {
	    nextEl: ".swiper-button-next",
	    prevEl: ".swiper-button-prev",
	  },
	});
   function artistDetail() {
       location.href="adminArtistDetail"
   }
   function artistUpdate() {
       location.href="adminArtistUpdate"
   }


   var totalPrice = 0;
   function total(price){
	   totalPrice =+ price;
	   console.log(totalPrice);
	   //return totalPrice;
	}

	function resetClick(){
        location.href=`${pageContext.request.contextPath}/agency/agencySales`
	}
	function wayBill(e){
		const target = e.target;
		const paymentNo = target.dataset.no;
		const waybill = $("#waybill"+paymentNo);;
		console.log(waybill.val());
		console.log();
		const payment = {
				paymentNo : paymentNo,
				waybill :waybill.val()
				}
		$.ajax({
			url:`${pageContext.request.contextPath}/agency/updateWaybill`,
			method: 'PUT',
			contentType: 'application/json',
		    dataType : "json",
			data : JSON.stringify(payment),
			success: function (data){
				console.log(data);
				waybill.parent().remove();
				const htmlStr = '<a href="#">'+data+'</a>';
				$("#deliveryTd"+paymentNo).html(htmlStr);
			},
			error(xhr, statusText, err){
				console.log(err);
			}
		});
		
	}
</script>

<script>
    let myChartONe = document.getElementById('myChartOne');

    var myLineChart = new Chart(myChartONe, {
    type: 'line',
    data: {
        labels: ["Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec"],
        datasets: [{
        label: "월 별 매출",
        lineTension: 0.3,
        backgroundColor: "rgba(78, 115, 223, 0.05)",
        borderColor: "rgba(78, 115, 223, 1)",
        pointRadius: 3,
        pointBackgroundColor: "rgba(78, 115, 223, 1)",
        pointBorderColor: "rgba(78, 115, 223, 1)",
        pointHoverRadius: 3,
        pointHoverBackgroundColor: "rgba(78, 115, 223, 1)",
        pointHoverBorderColor: "rgba(78, 115, 223, 1)",
        pointHitRadius: 10,
        pointBorderWidth: 2,
        data: [0, 10000, 5000, 15000, 10000, 20000, 15000, 25000, 20000, 30000, 25000, 40000],
        }],
    },
    options: {
        maintainAspectRatio: false,
        layout: {
        padding: {
            left: 10,
            right: 25,
            top: 25,
            bottom: 0
        }
        },
        scales: {
        xAxes: [{
            time: {
            unit: 'date'
            },
            gridLines: {
            display: false,
            drawBorder: false
            },
            ticks: {
            maxTicksLimit: 7
            }
        }],
        yAxes: [{
            ticks: {
            maxTicksLimit: 5,
            padding: 10,
            // Include a dollar sign in the ticks
            callback: function(value, index, values) {
                return '$' + number_format(value);
            }
            },
            gridLines: {
            color: "rgb(234, 236, 244)",
            zeroLineColor: "rgb(234, 236, 244)",
            drawBorder: false,
            borderDash: [2],
            zeroLineBorderDash: [2]
            }
        }],
        },
        legend: {
        display: false
        },
        tooltips: {
        backgroundColor: "rgb(255,255,255)",
        bodyFontColor: "#858796",
        titleMarginBottom: 10,
        titleFontColor: '#6e707e',
        titleFontSize: 14,
        borderColor: '#dddfeb',
        borderWidth: 1,
        xPadding: 15,
        yPadding: 15,
        displayColors: false,
        intersect: false,
        mode: 'index',
        caretPadding: 10,
        callbacks: {
            label: function(tooltipItem, chart) {
            var datasetLabel = chart.datasets[tooltipItem.datasetIndex].label || '';
            return datasetLabel + ': $' + number_format(tooltipItem.yLabel);
            }
        }
        }
    }
    });

</script>
<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>