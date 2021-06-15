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
				제목
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
</script>
	    </li>
	   </ul>	    
</div>

</body>
</html>

<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>
	