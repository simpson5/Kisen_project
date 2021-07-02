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

.form-controller {
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
			<c:forEach items="${product.pdImgList}" var="pdImg">
		        <c:if test="${pdImg.pdCategory eq 'R'}">
					<img src="<c:url value='/resources/upload/product/${pdImg.renamedFilename}'/>" class="card-img mt-1" alt="${product.pdContent}" style="width:100%; height:auto;">
			   	</c:if>
		    </c:forEach>
			</div>
			<div class="media-body col-5 ">
				<table class="table">
					<thead>
						<tr>
							<th scope="col" colspan="4" id="pd_name">${product.pdName}
								<input type="hidden" name=pdN value="${product.pdNo}">
								<input type="hidden" name=fanN value="${loginMember.fanNo}">
							</th>
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
						
						<c:set var="loop_flag" value="false"/>
						
						<c:forEach items="${product.pdOptionList}" var="pdOp" varStatus="status">
						<c:if test="${not loop_flag}">	
							<c:if test="${not empty pdOp.optionName}">	
							<c:set var="loop_flag" value="true"/>
							<tr>
								<th>옵션</th>
								<td colspan="3" style="border: 0; outline: 0;"><select
									class="form-select" aria-label="Default select example"
									name="option-select">
									
										<option selected disabled>- [필수] 옵션을 선택해 주세요 -</option>
										<c:forEach items="${product.pdOptionList}" var="pdOp" varStatus="status">
											<option value="${status.index}">${pdOp.optionName}</option>
										</c:forEach>
								</select></td>
							</tr>
							</c:if>
						</c:if>
						</c:forEach>
					</tbody>
				</table>
				<c:set var="loop_flag" value="false"/>

				<c:forEach items="${product.pdOptionList}" var="pdOp" varStatus="status">
					<c:if test="${not loop_flag}">	
						<c:if test="${not empty pdOp.optionName}">	
							<c:set var="loop_flag" value="true"/> 
				<p
					style="font-size: 11px; color: #f76560; margin: 10px auto; text-align: center; padding-bottom: 5px; border-bottom: 1px solid #d4d8d9">
					위 옵션선택 박스를 선택하시면 아래에 상품이 추가됩니다.</p>
						</c:if>
					</c:if>
				</c:forEach>
				<div class="select-option">
				<c:set var="looop_flag" value="false"/>
				<c:forEach items="${product.pdOptionList}" var="pdOp" varStatus="status" >
				<c:if test="${!empty product}">
									
				</c:if>
					<c:if test="${not looop_flag}">
						<c:if test="${empty pdOp.optionName}">	
						<c:set var="looop_flag" value="true"/>
						<table>
						<tr>
							<td style="border-top: 1px solid #eee; padding: 19px 9px 10px; vertical-align: middle;">
							<p class="pt-1">${product.pdName}<br /></p
							></td>
							<td colspan="1" class="col-1" style="border-top: 1px solid #eee; padding: 22px 9px 10px; vertical-align: middle;"><span
							style="position: relative; display: inline-block;"> 
							<input
								type="text" class="form-controller" name="stock" value="1" min="1" size="5" />
							<img class="up"
									src="//img.echosting.cafe24.com/design/skin/default/product/btn_count_up.gif"
									alt="수량증가">
							<img class="down"
									src="//img.echosting.cafe24.com/design/skin/default/product/btn_count_down.gif"
									alt="수량감소">
							</span></td>
						</tr>
						</table>
						</c:if>
					</c:if>
				</c:forEach>
				</div>
				<div class="total-pd">
					<table class="pd-option-tbl">
						<tbody>
							<tr>
								<td colspan="3" class="total-td"><strong>총 상품금액</strong>(수량)
									: <span class="total"></span></td>
							</tr>
							<tr>
								<td class="btn-buy" colspan="3" style="border-bottom:1px solid #eee;">
								<!-- pdStock == 0 -> 품절상품입니다. 로 대체 -->
								<c:if test="${product.pdStock ne 0}">
									<button type="button" class="btn btn-dark col-5 mx-2 py-2" onclick="buyNow(this);">구매하기</button>
									<button type="button"
										class="btn btn-outline-secondary col-5 mx-2 py-2">장바구니
										담기</button>
								</c:if>
								<c:if test="${product.pdStock eq 0}">
									<p class="my-auto" style="color:red;">품절 상품입니다.</p>
								</c:if>
								</td>
							</tr>
						</tbody>
					</table>
				</div>
			</div>
		</div>
		<div class="pd-detail-menu">
			<div class="row text-center" style="width: 100%;">
				<div class="col-md-4 select pd-nav" id="nav1">Detail</div>
				<div class="col-md-4 pd-nav" id="nav2">Review</div>
				<div class="col-md-4 pd-nav" id="nav3">Another</div>
			</div>
		</div>

		<div class="pd-detail">
			<p>${product.pdContent}</p>
	       	<c:forEach items="${product.pdImgList}" var="pdImg">
		        <c:if test="${pdImg.pdCategory eq 'D'}">
					<img src="<c:url value='/resources/upload/product/${pdImg.renamedFilename}'/>" class="card-img mt-1" alt="${product.pdContent}" style="width:100%; height:auto;">
			   	</c:if>
		    </c:forEach>
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
						<td onclick="location.href='${pageContext.request.contextPath}/review/reviewDetail?no=${no}&reviewNo=${review.reviewNo}'">${review.reviewTitle}</td>
						<td>${review.fanId}</td>
						<td><fmt:formatDate value="${review.reviewDate}" pattern="YYYY-MM-dd"/></td>
						<td>${review.readCnt}</td>
					</tr>
				</c:forEach>
				</c:if>
				</tbody>
			</table>
			
			<div class="btn-area">
				<div class="btn-group" role="group" aria-label="Basic example">
				<c:if test="${not empty loginMember}">
					<button type="button" class="btn btn-dark write" name="reviewWrite"  onclick="location.href='${pageContext.request.contextPath}/review/reviewForm.do?no=${no}'">글 작성</button>
				</c:if>
				</div>
			</div>
			<div class="paging-area">
				${pageBar}
			</div>
		</div>
	

		<div class="pd-another border border-0 mx-auto p-3"
			style="display: none;">
			<c:if test="${!empty randomList}">
				<div class="idol-item row d-none d-sm-block">
				    <div class="row g-3 ">
					<c:forEach items="${randomList}" var="product">
						<div class="col-lg-3 col-md-4 col-sm-6 ">
					        <div class="card" style="width: 13rem;">
					            	<c:forEach items="${product.pdImgList}" var="pdImg">
								        <c:if test="${pdImg.pdCategory eq 'R'}">
											<img src="<c:url value='/resources/upload/product/${pdImg.renamedFilename}'/>" class="card-img mt-1" alt="${product.pdContent}" style="width:100%; height:auto;">
									   	</c:if>
							    	</c:forEach>
					           
					            <div class="card-body">
					              <h5 class="card-title">${product.pdName}</h5>
					              <p class="card-text">  
					                <span class="badge bg-s">${product.idolName}</span><br />
					                <span class="badge bg-dark">공식굿즈</span>
					                <span class="badge bg-dark">${product.pdCategory}</span>
					              </p>
					              <div class="btn-group" role="group" aria-label="Basic example" data-no="${product.pdNo}">
					                <button type="button" class="btn btn-sm btn-outline-main" name="pdDetail">상세보기</button>
					                <button type="button" class="btn btn-sm btn-outline-main">장바구니 담기</button>
					              </div>
					            </div>
							</div>
					      <!-- col-lg-3 col-md-6 End -->
						      
						</div>
					</c:forEach>
				    <!-- row g-3 End -->
				    </div>
			  <!-- row end -->
			 	 </div>
		  	</c:if>
		</div>
	</div>
</div>
<form action="${pageContext.request.contextPath}/basket/buyNow.do" method="POST" name=buyNowFrm>
 </form>
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
	}
	else if(id =='nav2'){
		$('.pd-detail').hide();
		$('.pd-review').show();
		$('.pd-another').hide();
	}
	else if(id=='nav3'){
		$('.pd-detail').hide();
		$('.pd-review').hide();
		$('.pd-another').show();
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


function total(){
	var cnt = 0;
	var get_input = $(".form-controller");
	$.each(get_input, function (index, value) {
		cnt += Number($(value).val());
	});
	
	var $total = $(".total");
	var price = ${product.price};
	var total = price * cnt;

	console.log(get_input);
	console.log(price);
	console.log($total);
	console.log(total);

	$total += $total.html("<strong>"+total+"</strong>"+"("+cnt+"개)");
}
window.onload=total;

function Converter(str){
	str = str.replace(/`/g,"&#96;");
}

$("[name=option-select]").change(function(e){
	var $table = $("<table></table>");
	
	$table
		.append(`<tr><td><p class="pt-1">${product.pdName}<br /> <span class="add-option">옵션명</span></p></td>
			<td colspan="1" class="col-1"><span
			style="position: relative; display: inline-block;"> <input
				type="text" class="form-controller" name="stock" value="1" min="1" size="3"/>
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
		$this = $(this).parent().parent().parent();
		$this.remove();
		total();
	});
});




$(() => {
	$("button[name=pdDetail]").click(e => {
		//화살표함수안에서는 this는 e.target이 아니다.
		console.log(e.target); // td태그클릭 -> 부모tr로 이벤트전파(bubbling)
		var $no = $(e.target).parent();
		var no = $no.data("no");
		console.log(no);
		
		location.href = "${pageContext.request.contextPath}/product/productInfo?no=" + no;
	});
});

function buyNow(obj){
	var $formId = $(document.buyNowFrm);
	 console.log("formId= "+ $formId);
	 const fanNo = '<input type="hidden" name ="fanNo" value="'+ $("[name=fanN]").val()+'"/>';
	 const pdNo = '<input type="hidden" name ="pdNo" value="'+ $("[name=pdN]").val()+'"/>';
	 const opNo = '<input type="hidden" name ="opNo" value="'+ $("[name=opN]").val()+'"/>';
	var cnt = 0; //수량
	var get_input = $(".form-controller");
	$.each(get_input, function (index, value) {
		cnt +='<input type="hidden" name ="cnt" value="'+Number($(value).val())+'"/>';
		
	});
	
	console.log(fanNo);
	console.log(pdNo);
	console.log(cnt);
	console.log(opNo);
	$formId.append(fanNo);
	$formId.append(pdNo);
	$formId.append(opNo);
	$formId.append(cnt);
	$from.submit;
}

</script>

<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>
