<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param value="상품 상세" name="title" />
</jsp:include>
<style>
body, html {
	margin: 0px;
	padding: 0px;
}

a {
	text-decoration: none;
	color: black;
}

a:hover {
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
	margin: 0 auto;
	zoom: 1;
}

.detail {
	position: relative;
	z-index: 2;
	min-height: 500px;
	margin: 30px 0;
}

.product_img {
	float: left;
	width: 600px;
	margin: 0 50px 0 0;
}

.img-thumbnail {
	width: 100%;
}

.product_tbl {
	float: left;
	position: relative;
	width: 500px;
}

.table {
	width: 100%;
	text-align: left;
}

.table th, td {
	height: 30px;
	border: none;
}

.hr {
	width: 100%;
}

#pd_name {
	font-size: 1.5em;
	padding: 5px 0;
}

.pd-option-tbl {
	width: 100%;
}

.add-option {
	font-size: 0.5em;
	color: #757575;
}

.up {
	position: absolute;
	left: 30px;
	top: -9px;
}

.down {
	position: absolute;
	left: 30px;
	top: 2px;
}

.delete {
	position: absolute;
	left: 55px;
	top: -3px;
	vertical-align: middle;
}

.total-td {
	padding: 19px 9px 19px;
	border-top: 1px solid #eee;
	color: #353535;
	vertical-align: middle;
}

.btn-buy {
	height: 50px;
	line-height: 50px;
	border-top: 1px solid #eee;
	text-align: center;
}

.pd-detail-menu {
	position: relative;
	margin-top: 10px;
	margin: 0 auto;
	margin-bottom: 50px;
}

.link {
	float: left;
}

.link li {
	float: left;
	width: 250px;
	height: 30px;
	padding: 5px;
	vertical-align: middle;
}

#pdStock {
	width: 50px;
	height: 15px;
}

.form-control {
	width: 50px;
	height: 23px;
	padding: 0 2px 0 3px;
	line-height: 23px;
	border: 1px solid #d4d8d9;
	border-radius: 3px 0 0 3px;
	position: relative;
	top: -10px;
}

.col-md-3 {
	height: 50px;
	float: none;
	margin: 0 auto;
	line-height: 50px;
	border: 1px solid #d4d8d9;
}

.select {
	position: relative;
	top: -1px;
	margin: -12px 0 -1px;
	border: 2px solid #000;
	color: #000;
	font-size: 16px;
	font-weight: bold;
	background: #fff;
	border-bottom: 0px;
	height: 63px;
	line-height: 50px;
}

.pd-detail {
	width: 100%;
	margin: 0 auto;
	vertical-align: middle;
	text-align: center;
}

.pd-detail img {
	height: 500px;
}

.pd-review {
	width: 100%;
	margin: 0 auto;
}

pd-review-board {
	width: 100%;
}

.pd-review-board th {
	min-width: 30px;
	text-align: center;
	background-color: #c7a2e0;
}

.pd-review-board td {
	text-align: center;
}

.pd-review-board td:nth-of-type(2) {
	text-align: left;
}

button .write {
	margin-right: 10px;
}

.btn-area {
	width: 100%;
	height: 50px;
	vertical-align: middle;
	line-height: 50px;
	border-bottom: 1px solid #d4d8d9;
	border-top: 1px solid #d4d8d9;
}

.btn-group {
	float: right;
	line-height: 50px;
	padding-top: 5px;
}

.paging-area {
	width: 100%;
	height: 50px;
	line-height: 50px;
	margin-top: 20px;
}

.review-paging-nav {
	width: 100%;
	position: relative;
}

.review-paging-nav .pagination {
	text-align: center;
	margin: 0 auto;
}

.review-paging-nav .pagination li {
	display: inline-block;
}

div#pd-slide img {
	width: 200px;
	height: 150px;
}

.another-pd-price {
	color: #0066ff;
	font-size: 13px;
}

.another-pd-name {
	font-size: 1.3em;
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
.btn-outline-success {
	color: #9033b5;
	background-color: transparent;
	background-image: none;
	border-color: #9033b5;
}

.btn-outline-success:hover {
	color: white;
	background-color: #c7a2e0;
	background-image: none;
	border-color: #c7a2e0;
}

.form-control{
	display: block;
    width: 75%;
    height: 2rem;
    padding: .375rem .75rem;
    font-size: 1rem;
    line-height: 1.5;
    color: #495057;
    background-color: #fff;
    background-clip: padding-box;
    border: 1px solid #ced4da;
    border-radius: .25rem;
    transition: border-color .15s ease-in-out,box-shadow .15s ease-in-out;

}


textarea.autosize {
 min-height: 300px; 
 width: 75%
 }

</style>

<div id="wrap">
	<div class="container" id="container">
		<div class="detail row">
			<div class="media  product_img">
				<img
					src="${pageContext.request.contextPath}/resources/images/kisen_logo.png"
					class="img-thumbnail" alt="...">
			</div>
			<div class="media-body col-5 ">
				<table class="table">
					<thead>
						<tr>
							<th scope="col" colspan="4" id="pd_name">${product.pdName}</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<th>판매가격</th>
							<td colspan="3" style="color: #0066ff; border: 0; outline: 0;">${product.price} 원</td>
						</tr>
						<tr>
							<th>판매일</th>
							<td colspan="3" style="border: 0; outline: 0;"><fmt:formatDate value="${product.salesDate}" pattern="yy-MM-dd"/></td>
						</tr>
						<tr>
							<th>배송정보</th>
							<td colspan="3" style="border: 0; outline: 0;">영업일 기준 3일</td>
						</tr>
						<tr>
							<th>옵션</th>
							<td colspan="3" style="border: 0; outline: 0;"><select
								class="form-select" aria-label="Default select example"
								name="option-select">
									<option selected disabled>- [필수] 옵션을 선택해 주세요 -</option>
									<option value="1">옵션 1</option>
									<option value="2">옵션 2</option>
									<option value="3">옵션 3</option>
							</select></td>
						</tr>
					</tbody>
				</table>
				<p
					style="font-size: 11px; color: #f76560; margin: 10px auto; text-align: center; padding-bottom: 5px; border-bottom: 1px solid #d4d8d9">
					위 옵션선택 박스를 선택하시면 아래에 상품이 추가됩니다.</p>
				<div class="select-option"></div>
				<div class="total-pd">
					<table class="pd-option-tbl">
						<tbody>
							<tr>
								<td colspan="3" class="total-td"><strong>총 상품금액</strong>(수량)
									: <span class="total"></span></td>
							</tr>
							<tr>
								<td class="btn-buy" colspan="3">
									<button type="button" class="btn btn-dark col-5 mx-2 py-2">구매하기</button>
									<button type="button"
										class="btn btn-outline-secondary col-5 mx-2 py-2">장바구니
										담기</button>
								</td>
							</tr>
						</tbody>
					</table>
				</div>
			</div>
		</div>
		<div class="pd-detail-menu">
			<div class="row text-center" style="width: 100%;">
				<div class="col-md-3 select pd-nav" id="nav1">Detail</div>
				<div class="col-md-3 pd-nav" id="nav2">Review</div>
				<div class="col-md-3 pd-nav" id="nav3">Another</div>
				<div class="col-md-3 pd-nav" id="nav4">QnA</div>
			</div>
		</div>

		<div class="pd-detail">
			<img
				src="${pageContext.request.contextPath}/resources/images/kisen_logo.png"
				class="col-9" />
		</div>

		<div class="pd-review mx-auto" style="display: none;">
			<p class="h5"
				style="color: #353535; font-size: 16px; line-height: 18px; font-family: 'Lato', 'Nanum Gothic', 'verdana', '돋움', '굴림';">Review</p>
			<table class="table pd-review-board table table-hover">
				<thead>
					<tr>
						<th scope="col" class="col-1 table-primary">번호</th>
						<th scope="col" class="col-6 table-primary">제목</th>
						<th scope="col" class="col-1 table-primary">작성자</th>
						<th scope="col" class="col-1 table-primary">작성일</th>
						<th scope="col" class="col-1 table-primary">조회</th>
					</tr>
				</thead>
				<tbody>
				<c:if test="${empty list}">
					<tr>
						<td colspan="10">조회된 정보가 없습니다.</td>
					</tr>
				</c:if>
				<c:if test="${!empty list}">
				<c:forEach items="${list}" var="review" varStatus="status">
					<tr data-no="${review.reviewNo}">
						<td>${status.count}</td>
						<td>${review.reviewTitle}</td>
						<td>${review.fanId}</td>
						<td><fmt:formatDate value="${review.reviewDate}" pattern="YYYY-MM-dd"/></td>
						<td>${review.readCnt}</td>
					</tr>
				</c:forEach>
				</c:if>
				</tbody>
			</table>
			
			<div class="btn-area">
				<div class="btn-group" role="group" aria-label="Basic example" onclick="location.href='${pageContext.request.contextPath}/productInfo?no=${no}'">
					<button type="button" class="btn btn-dark write" name="reviewWrite">글 작성</button>
					<button type="button" class="btn btn-secondary">전체보기</button>
				</div>
			</div>
			<div class="paging-area">
				${pageBar}
			</div>
		</div>
	

		<div class="pd-another border border-0 mx-auto p-3"
			style="display: none;">
			<div id="carouselExampleIndicators2" class="carousel slide"
				data-ride="carousel">
				<div class="carousel-inner">
					<div class="carousel-item active">
						<div class="d-flex flex-row justify-content-center" id="pd-slide">
							<br />
							<c:forEach var="i" begin="1" end="5" step="1">
								<div class="p-2 my-3 col-xs-1">
									<div class=" mx-auto font-weight-bold text-center">
										<img
											src="${pageContext.request.contextPath}/resources/images/kisen_logo.png" />
									</div>
									<div class=" mx-auto font-weight-bold text-center">
										<p class="another-pd-name">상품명</p>
										<span class="another-pd-price">상품가격</span>
									</div>
								</div>
							</c:forEach>
						</div>
					</div>
					<div class="carousel-item">
						<div class="d-flex flex-row justify-content-center" id="pd-slide">
							<br />
							<c:forEach var="i" begin="1" end="5" step="1">
								<div class="p-2 my-3 col-xs-1">
									<div class=" mx-auto font-weight-bold text-center">
										<img
											src="${pageContext.request.contextPath}/resources/images/kisen_logo.png" />
									</div>
									<div class=" mx-auto font-weight-bold text-center">
										<p class="another-pd-name">상품명</p>
										<span class="another-pd-price">상품가격</span>
									</div>
								</div>
							</c:forEach>
						</div>
					</div>
				</div>
			</div>

			<a class="carousel-control-prev" href="#carouselExampleIndicators2"
				role="button" data-slide="prev" id="btnPrev"> <span
				class="carousel-control-prev-icon" aria-hidden="true"></span> <span
				class="sr-only">Previous</span>
			</a> <a class="carousel-control-next" href="#carouselExampleIndicators2"
				role="button" data-slide="next" id="btnNext"> <span
				class="carousel-control-next-icon" aria-hidden="true"></span> <span
				class="sr-only">Next</span>
			</a>
		</div>


		<div class="pd-qna" style="display: none;">
			<p class="h5"
				style="color: #353535; font-size: 16px; line-height: 18px; font-family: 'Lato', 'Nanum Gothic', 'verdana', '돋움', '굴림';">QnA</p>
			<table class="table pd-review-board table table-hover">
				<thead>
					<tr>
						<th scope="col" class="col-1 table-primary">번호</th>
						<th scope="col" class="col-6 table-primary">제목</th>
						<th scope="col" class="col-1 table-primary">작성자</th>
						<th scope="col" class="col-1 table-primary">작성일</th>
						<th scope="col" class="col-1 table-primary">조회</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td>1</td>
						<td><a href="#">Mark</a></td>
						<td>dsadasd</td>
						<td>@mdo</td>
						<td>@mdo</td>
					</tr>
					<tr>
						<td>2</td>
						<td><a href="#">Mark</a></td>
						<td>Thornton</td>
						<td>@fat</td>
						<td>@fat</td>
					</tr>
					<tr>
						<td>3</td>
						<td><a href="#">Mark</a></td>
						<td>@twitter</td>
						<td>@twitter</td>
						<td>@twitter</td>
					</tr>
				</tbody>
			</table>
			<div class="btn-area">
				<div class="btn-group" role="group" aria-label="Basic example">
					<button type="button" class="btn btn-dark write">글 작성</button>
					<button type="button" class="btn btn-secondary">전체보기</button>
				</div>
			</div>
			<div class="paging-area">
				<nav class="review-paging-nav" aria-label="Page navigation example">
					<ul class="pagination col-2">
						<li class="page-item"><a class="page-link" href="#"
							aria-label="Previous"> <span aria-hidden="true">&laquo;</span>
						</a></li>
						<li class="page-item"><a class="page-link" href="#">1</a></li>
						<li class="page-item"><a class="page-link" href="#">2</a></li>
						<li class="page-item"><a class="page-link" href="#">3</a></li>
						<li class="page-item"><a class="page-link" href="#"
							aria-label="Next"> <span aria-hidden="true">&raquo;</span>
						</a></li>
					</ul>
				</nav>
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
		$('.pd-detail').show();
		$('.pd-review').hide();
		$('.pd-another').hide();
		$('.pd-qna').hide();
	}
	else if(id =='nav2'){
		$('.pd-detail').hide();
		$('.pd-review').show();
		$('.pd-another').hide();
		$('.pd-qna').hide();
	}
	else if(id=='nav3'){
		$('.pd-detail').hide();
		$('.pd-review').hide();
		$('.pd-another').show();
		$('.pd-qna').hide();
	}else if(id=='nav4'){
		$('.pd-detail').hide();
		$('.pd-review').hide();
		$('.pd-another').hide();
		$('.pd-qna').show();
	}
});
/**
 * 부모요소에서 eventhandling
 */
$(".select-option").on("click", ".up", e => {
	var $up = $(e.target).siblings();
	var num = $up.first();
	if(num.val()==100){
		return;
	}
	num.val(parseInt(num.val())+1);
	total();
});

$(".select-option").on("click", ".down", e => {
	var $down = $(e.target).siblings();
	var num = $down.first();
	if(num.val()==1){
		return;
	}
	num.val(parseInt(num.val())-1);
	total();
});


$("[name=option-select]").change(function(e){
	var $table = $("<table></table>");
	$table
	.append(`<tr>
			<td><p class="pt-1">상품명<br /> <span class="add-option">옵션명</span>	</p></td>
			<td colspan="1" class="col-1"><span
			style="position: relative; display: inline-block;"> <input
				type="text" class="form-control" name="stock" value="1" min="1" size="3"/>
			<img class="up"
					src="//img.echosting.cafe24.com/design/skin/default/product/btn_count_up.gif"
					alt="수량증가">
			<img class="down"
					src="//img.echosting.cafe24.com/design/skin/default/product/btn_count_down.gif"
					alt="수량감소">
			<img class="delete"
					src="//img.echosting.cafe24.com/design/skin/default/product/btn_price_delete.gif"
					alt="삭제" id="option_box1_del" class="option_box_del">
			</span></td>
			</tr>`);
	
	$(".select-option").append($table);
	total();
	$(".delete").click(function(){
		console.log($(this).parent().parent().parent());
		$this = $(this).parent().parent().parent();
		$this.remove();
		total();
	});
});

function total(){
	var cnt = 0;
	var get_input = $(".form-control");
	$.each(get_input, function (index, value) {
		cnt += Number($(value).val());
	});
	
	var $total = $(".total");
	var price = 10000;
	var total = price * cnt;

	console.log(typeof(cnt));
	console.log($total);
	console.log(cnt);
	console.log(total);
	$total += $total.html("<strong>"+total+"</strong>"+"("+cnt+"개)");
}

/* $(() => {
	$("button[name=reviewWrite]").click(e => {
		//var $no = $(e.target).parent();
		//var no = $no.data("no");
		console.log('${no}');
		
		//location.href = "${pageContext.request.contextPath}/product/productInfo?no=" + no;
	});
}); */

</script>

<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>
