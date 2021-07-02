<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>


<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param value="demandForm" name="title" />
</jsp:include>


<!-- include summernote css/js-->
<link
	href="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.11/summernote-bs4.css"
	rel="stylesheet">
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.11/summernote-bs4.js"></script>
<!-- include summernote-ko-KR -->
<div class="container">

 <form id="demandFrm" name="demandFrm"
 class="justify-content-center" 
			enctype="multipart/form-data"
			action="${pageContext.request.contextPath}/unofficial/demandEnroll.do"
			method="post">
		<h2 class="text-center m-4" style="font-weight: bold;">수요조사폼만들기</h2>
		

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
								<option value="인형">인형</option>
								<option value="포토카드">포토카드</option>
								<option value="기타">기타</option>
							</select>
						</div>
					</div>
				</div>
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
				
				
				<div class="register-date-group">
                            <h4>수요조사기간</h4>
                            시작일:  <input type="date" class="input--text" name="demandstartDate" placeholder="시작일" id="startDate" required>
                            마감일:  <input type="date" class="input--text" name="demandendDate" placeholder="마감일" id="endDate" required>
                        </div>
                        
                        <div class="form-group">
					<label for="question">(선택)추가질문</label> <input type="text"
						class="form-control" id="question" placeholder="추가질문을 받으시려면 작성하세요">
				</div>

				<div class="container text-center">
					<div class="mb-4 row">
						<div class="col-6 d-grid p-1">
							<button type="reset" class="btn btn-lg btn-dark" style="width: 100%;">
							취소하기</button>
						</div>
						<div class="col-6 d-grid p-1">
							<button type="submit" class="btn btn-lg btn-main" id="enrollbtn" style="width: 100%;">
							등록하기</button>
						</div>
					</div>
				</div>
				
		</form>
		</div>

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


// $("#demandFrm").submit(e =>{
// 	  e.preventDefault();
// 	  const $frm = $(e.target);
// 	  const pdName = $('#pdName').val();
// 	  console.log(pdName);
// 	  const idolName = $('#idolName').val();
// 	  console.log(idolName);
// 	  const pdCategory = $('#pdCategory').val();
// 	  console.log(pdCategory);
// 	  const price = $('#price').val();
// 	  console.log(price);
// 	  const deliveryPrice = $('#deliveryPrice').val();
// 	  console.log(deliveryPrice);
// 	  const pdStock = $('#pdStock').val();
// 	  console.log(pdStock);
// 	  const thumbnailFile = $('#thumbnailFile').val();
// 	  console.log(thumbnailFile);
// 	  const detailFile = $('#detailFile').val();
// 	  console.log(detailFile);
// 	  const pdContent = $frm.find("[name=pdContent]").val();
// 	  console.log(pdContent);
// 	  const demandstartDate = $frm.find("[name=demandstartDate]").val();
// 	  console.log(demandstartDate);
// 	  const demandendDate = $frm.find("[name=demandendDate]").val();
// 	  console.log(demandendDate);
// 	  const question = $('#question').val();
// 	  console.log(question);
// 	  const demandForm ={
// 			  pdName,
// 			  idolName,
// 			  pdCategory,
// 			  price,
// 			  deliveryPrice,
// 			  pdStock,
// 			  thumbnailFile,
// 			  detailFile,
// 			  pdContent,
// 			  demandstartDate,
// 			  demandendDate,
// 			  question
// 			  };
	  
// 	  $.ajax({
// 	      url : "${pageContext.request.contextPath}/unofficial/demandEnroll.do",
// 	      data: JSON.stringify(demandForm),
// 	      contentType: "application/json; charset=utf-8",
// 	      method: "POST",
// 	      success(data) {
// 				console.log(data);
// 	    	  	e.target.reset(); // 폼초기화
// 			},
// 			error(xhr, statusText, err){
// 				console.log(xhr, statusText, err);
// 			}
			 
// 	  	});
// 	});


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

$(document).on("click", "#enrollbtn", function () {
    action_popup.alert("경고창 테스트!!!");
});

</script>


<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>
