<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param value="depositForm" name="title" />
</jsp:include>

<!-- include summernote css/js-->
<link
	href="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.11/summernote-bs4.css"
	rel="stylesheet">
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.11/summernote-bs4.js"></script>
<!-- include summernote-ko-KR -->

		<form id="depositFrm" name="depositFrm"
			action="${pageContext.request.contextPath}/unofficial//depositEnroll.do"
			method="post">
			
					
		<h2 class="text-center m-4" style="font-weight: bold;">입금폼만들기</h2>
		

			<div class="mb-4 row">
				<label class="col-md-3 col-form-label" for="pdName">상품명</label>
				<div class="col-md-9">
					<input type="text" class="form-control" name="pdName" id="pdName">
				</div>
			</div>
			<div class="mb-4 row">
				<label class="col-md-3 col-form-label" for="idolName">아이돌</label>
				<div class="col-md-9">
					<input type="text" class="form-control" name="idolName"
						id="idolName">
				</div>
			</div>

			<div class="mb-4 row">
				<label class="col-md-3 col-form-label" for="pdCategory">분류</label>
				<div class="col-md-9">
					<div class="row">
						<div class="col-auto">
							<select name="pdCategory" id="pdCategory"
								class="form-select">
								<option value="unOfficalProd_doll">인형</option>
								<option value="unOfficalProd_photocard">포토카드</option>
								<option value="unOfficalProd_goods">기타</option>
							</select>
						</div>
					</div>
				</div>
			</div>
			
			 <!-- 이미지 -->
	    <!-- 썸네일&대표 -->
	    <div class="mb-4 row">
	        <label class="col-md-3 col-form-label">대표 이미지</label>
	        <div class="col-md-9">
	            <input  type="file" class="form-control" id="thumbnailFile" name="thumbnailFile"  accept="image/png,image/jpeg,image/jpg" onchange="setThumbnail(event)">
	            <div class="alert alert-secondary" role="alert">
	                <ul>
	                    <li>이미지 사이즈 : 600 * 800px  </li>
	                    <li>파일 사이즈 : 1M 이하</li>
	                    <li>파일 확장자 : png,jpeg,jpg만 가능</li>
	                </ul>
	            </div>
            	<img class="thumbnailFile"  style="width:600px"/>
	        </div>
	    </div>
	
	    <!-- 상품 설명 이미지 -->
	    <div class="mb-4 row">
	        <label class="col-md-3 col-form-label">상품 설명 이미지</label>
	        <div class="col-md-9">
	            <input  type="file" class="form-control" id="detailFile" name="detailFile" accept="image/png,image/jpeg,image/jpg" onchange="setThumbnail(event)">
	            <div class="alert alert-secondary" role="alert">
	                <ul>
	                    <li>파일 사이즈 : 5M 이하</li>
	                    <li>파일 확장자 : png,jpeg,jpg만 가능</li>
	                </ul>
	            </div>
            	<img class="detailFile" style="width:600px"/>
	        </div>
	    </div>
	    
	    
	    <!-- 썸머노트 -->
	    <h3>상세설명</h3>
					<div class="col-12 col-md-12">
						<br />
						<textarea name="pdContent" class="summernote" placeholder="내용 입력"
							id="summernote"></textarea>
					</div>
	    
	    <div class="register-date-group" name="depositPeriod" id="depositPeriod">
                            <h4>입금기간</h4>
                            시작일:  <input type="date" class="input--text" name="depositStartDate" placeholder="시작일" id="depositStartDate" required>
                            마감일:  <input type="date" class="input--text" name="depositEndDate" placeholder="마감일" id="depositEndDate" required>
                        </div>
                        
                        <div class="form-group" id="bankInfo" name="bankInfo">
							<label for="bankinfo">은행정보</label> <input type="text"
								class="form-control" placeholder="은행명" id="bankName" name="bankName"> <input
								type="text" class="form-control" placeholder="계좌번호" id="accountNo" name="accountNo"> <input
								type="text" class="form-control" placeholder="예금주명" id="accountHolder" name="accountHolder">


						</div>
						
             <div class="mb-4 row">
				<label class="col-md-3 col-form-label" for="price">가격</label>
				<div class="col-md-3">
					<div class="input-group">
						<input type="number" class="form-control" name="price" id="price">
						<span class="input-group-text">원</span>
					</div>
				</div>
			</div>
			<div class="mb-4 row">
							<label class="col-md-3 col-form-label" for="deliveryOption">배송방법</label>
							<div class="col-md-9">
								<input type="text" class="form-control" name="deliveryOption"
									id="deliveryOption">
							</div>
						</div>
			<div class="mb-4 row">
				<label class="col-md-3 col-form-label" for="deliveryPrice">배송비</label>
				<div class="col-md-3">
					<div class="input-group">
						<input type="number" class="form-control" name="deliveryPrice"
							id="deliveryPrice"> <span class="input-group-text">원</span>
					</div>
				</div>
			</div>
			<div class="mb-4 row">
				<label class="col-md-3 col-form-label" for="pdStock">재고량</label>
				<div class="col-md-3">
					<input type="number" class="form-control" name="pdStock"
						id="pdStock">
				</div>
			</div>
			<!-- <div class="mb-4 row">
					<label class="col-md-3 col-form-label" for="pdSales">판매량</label>
					<div class="col-md-9">
						<input type="number" class="form-control" name="pdSales"
							id="pdSales">
					</div>
				</div> -->

		 <div class="form-group">
							<label for="deliveryNotice">(선택)배송안내</label>
							<textarea class="form-control" rows="3" name="deliveryNotice" id="deliverynotice"
								placeholder="배송에 대한 안내가 필요할 경우 작성하세요"></textarea>
						</div>


				<div class="container text-center">
					<div class="mb-4 row">
						<div class="col-6 d-grid p-1">
							<button type="button" class="btn btn-lg btn-dark"
								style="width: 100%;">취소하기</button>
						</div>
						<div class="col-6 d-grid p-1">
							<button type="submit" class="btn btn-lg btn-main" id="enrollbtn"
								 style="width: 100%;">등록하기</button>
						</div>
					</div>
				</div>
		</form>

<script>

$(document).ready(
function() {
	jQuery('#summernote').summernote(
			{
				height : 400, // 에디터 높이
				minHeight : null, // 최소 높이
				maxHeight : null, // 최대 높이
				focus : false, // 에디터 로딩후 포커스를 맞출지 여부
				lang : "ko-KR", // 한글 설정
				placeholder : '최대 2000자까지 쓸 수 있습니다', //placeholder 설정
			});
});

$("#depositFrm").submit(e =>{
	  e.preventDefault();
	  const $frm = $(e.target);
	  const pdName = $('#pdName').val();
	  console.log(pdName);
	  const idolName = $('#idolName').val();
	  console.log(idolName);
	  const pdContent = $frm.find("[name=pdContent]").val();
	  console.log(pdContent);
	  const price = $('#price').val();
	  console.log(price);
	  const deliveryOption = $('#deliveryOption').val();
	  console.log(deliveryOption);
	  const deliveryPrice = $('#deliveryPrice').val();
	  console.log(deliveryPrice);
	  const pdStock = $('#pdStock').val();
	  console.log(pdStock);
	  const deliveryNotice = $('#deliveryNotice').val();
	  console.log(deliveryNotice);
	  const pdCategory = $('#pdCategory').val();
	  console.log(pdCategory);
	  const depositStartDate = $('#depositStartDate').val();
	  console.log(depositStartDate);
	  const bankName = $('#bankName').val();
	  console.log(bankName);
	  const accountNo = $('#accountNo').val();
	  console.log(accountNo);
	  const accountHolder = $('#accountHolder').val();
	  console.log(accountHolder);
	  const depositEndDate = $('#depositEndDate').val();
	  console.log(depositEndDate);
	  const thumbnailFile = $('#thumbnailFile').val();
	  console.log(thumbnailFile);
	  const detailFile = $('#detailFile').val();
	  console.log(detailFile);
	
	 
	  
	  
	
	 
	 
	
	 
	  const depositForm ={
			  pdName,
			  idolName,
			  pdContent,
			  price,
			  deliveryOption,
			  deliveryPrice,
			  pdStock,
			  deliveryNotice,
			  pdCategory,
			  depositStartDate,
			  bankName,
			  accountNo,
			  accountHolder,
			  depositEndDate,
			  thumbnailFile,
			  detailFile
			  
			  };
	  
	  $.ajax({
	      url : "${pageContext.request.contextPath}/unofficial/depositEnroll.do",
	      data: JSON.stringify(depositForm),
	      contentType: "application/json; charset=utf-8",
	      method: "POST",
	      success(data) {
				console.log(data);
	    	  	e.target.reset(); // 폼초기화
			},
			error(xhr, statusText, err){
				console.log(xhr, statusText, err);
			}
			 
	  	});
	});


function setThumbnail(event){
	var file = event.target.files;
	var name = event.target.id;
	console.log(name);
	var fileArr = Array.prototype.slice.call(file);

	fileArr.forEach(function(f){
		if(!f.type.match("image.*")){
			alert("확장자는 이미지만 가능합니다.");
			return;
		}	

		var reader = new FileReader();
		reader.onload=function(e){
			$("."+name).attr("src",e.target.result);
		}
		reader.readAsDataURL(f);
	});
}

</script>

<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>
