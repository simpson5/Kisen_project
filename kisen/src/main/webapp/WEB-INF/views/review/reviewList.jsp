<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<jsp:include page="/WEB-INF/views/common/header.jsp"></jsp:include>
    
    <section>
    

<style>
#reviewBoard{
	width:1000px;
}
#reviewInfo{
	 text-align: center;
}
.height_90{
	height: 90px;
}

.btn-outline-warning {
    color:  #9033b5;
    background-color: transparent;
    background-image: none;
    border-color:  #9033b5;
    
 
}


.btn-outline-warning:hover{
    color:  white;
    background-color: #c7a2e0;
    background-image: none;
    border-color:  #c7a2e0;
}
#innerContent{
	width: 140px;
	text-align: center;	
	font-size: 12px;
	

}
.border-dark{
 	border-color: #d8d8d8!important;
}
#searchBtn{
    color: #fff;
    background-color: #c8aad2;
    border-color: #c8aad2;
}

.btn-danger.focus, .btn-danger:focus {
    box-shadow: 0 0 0 0.2rem rgb(100 0 165 / 50%);
}
.btn-danger:not(:disabled):not(.disabled).active:focus, .btn-danger:not(:disabled):not(.disabled):active:focus, .show>.btn-danger.dropdown-toggle:focus {
    box-shadow: 0 0 0 0.2rem rgb(100 0 165 / 50%);
}

img#productImg{
	width: 100px;
	height: 80px;
}

</style>

<!-- 리뷰 내역 -->
<div class="border border-0 mx-auto p-3 rounded " id="reviewBoard">
	<ul class="list-unstyled">
	  <li class="media border border-left-0 border-top-0 border-right-0">
	    <img src="${pageContext.request.contextPath}/resources/images/kisen_logo.png" alt="상품 이미지" id="productImg" >
	    <div class="col-2 height_90" id="reviewInfo">
			<div>
				상품명
			</div>
	    </div>
	    <div class="col-4 height_90" id="reviewInfo">
			<div>
				리뷰내용
			</div>
	    </div>
	    <div class="col-2 height_90" id="reviewInfo">
			<div>
				회원아이디
			</div>
	    </div>
	    <div class="col-2 height_90" id="reviewInfo">
			<div>
				2021.06.07 20:14
			</div>
	    </div>
	  </li>
	
	
	  
	 <%--  <c:forEach items="${list}" var="reviewboard">
		<tr data-no="${board.no}">
		<td>상품명</td>
			<td>제목</td>
			<td>아이디</td>
			<td><fmt:formatDate value="${board.regDate}" pattern="yy-MM-dd"/></td>
			
		</tr>
		</c:forEach> --%>
	  
		<style>
			.py-2{
				margin-right: 10px;
				
			}
		</style>

	    <div class="form-inline" id="edit">
		      <div class="py-2">
		      	<button type="button"  class="btn btn-outline-warning" onclick="goReviewForm();" >글쓰기</button>
		      	
		      </div>
		      <div class="py-2">
		      	<button type="submit" class="btn btn-outline-warning" onclick="goEditForm();" >수정하기</button>
		      </div>
		      <div class="py-2">
		      	<button type="submit" class="btn btn-outline-warning"  >삭제하기</button>
		      </div>
	    </div>
	    <div class="row">
	     <div class="col-xs-3">
    <input type="text" class="form-control" placeholder="아티스트이름">
  </div>
  </div>

  
  
   <div class="py-2">
		      	<button type="submit" class="btn btn-outline-warning" >검색하기</button>
		      </div>
		      
		      
	    
	    <script>
function goReviewForm(){
	location.href = "${pageContext.request.contextPath}/review/reviewForm.do";
}

function goEditForm(){
	location.href = "${pageContext.request.contextPath}/review/revieweditForm.do";
	
}

$(() => {
	$("tr[data-no]").click(e => {
		//화살표함수안에서는 this는 e.target이 아니다.
		//console.log(e.target); // td태그클릭 -> 부모tr로 이벤트전파(bubbling)
		var $tr = $(e.target).parent();
		var no = $tr.data("no");
		location.href = "${pageContext.request.contextPath}/board/boardDetail.do?no=" + no;
	});

	$( "#searchTitle" ).autocomplete({
  		source: function(request, response){
 		  //console.log(request);
 		  //console.log(response);
 		  //response([{label:'a', value:'a'}, {label:'b', value:'b'}]);
 		  
 		  //사용자입력값전달 ajax요청 -> success함수안에서 response호출 
  	 	  $.ajax({
			url: "${pageContext.request.contextPath}/board/searchTitle.do",
			data: {
				searchTitle: request.term
			},
			success(data){
				console.log(data);
				const {list} = data;
				//배열
				const arr = 
					list.map(({no, title}) => ({
						label: title,
						value: title,
						no		
					}));
				console.log(arr);
				response(arr);
			},
			error(xhr, statusText, err){
				console.log(xhr, statusText, err);
			}
  	  	  });
		},
		select: function(event, selected){
			// 클릭했을때, 해당게시글 상세페이지로 이동
			//console.log("select : ", selected);
			const {item: {no}} = selected;
			location.href = "${pageContext.request.contextPath}/board/boardDetail.do?no=" + no;
		},
		focus: function(event, focused){
		 return false;
		},
		autoFocus: true, 
		minLength: 2
  });
});
</script>

<section id="board-container" class="container">
	
	<table id="tbl-board" class="table table-striped table-hover">
		<tr>
			<th>리뷰번호</th>
			<th>상품번호</th>
			<th>리뷰내용</th>
			<th>작성자</th>
			<th>조회수</th>
			<th>추천수</th>
			<th>작성일</th>
			<!--<th>첨부파일</th>  첨부파일 있을 경우, /resources/images/file.png 표시 width: 16px-->
			
		</tr>
		<c:forEach items="${list}" var="review">
		<tr data-no="${review.Review_No}">
			<td>${review.Review_No}</td>
			<td>${review.Product_No}</td>
			<td>${review.Review_Content}</td>
			<td>${review.Fan_Id}</td>
			<td>${review.Read_Cnt}</td>
			<td>${review.Reco_Cnt}</td>
			<td><fmt:formatDate value="${review.Review_Date}" pattern="yy-MM-dd"/></td>
			
			<td>
				<c:if test="${board.hasAttachment}">
				<img src="${pageContext.request.contextPath}/resources/images/file.png" width="16px" alt="" />
				</c:if>
			</td>
		</tr>
		</c:forEach>
		
	</table>
	
	${pageBar}
	   
	   </ul>	    
</div>

</body>
</html>

<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>
	