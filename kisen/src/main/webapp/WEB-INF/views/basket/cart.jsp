<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<jsp:include page="/WEB-INF/views/common/header.jsp">

	<jsp:param value="결제페이지" name="title"/>
</jsp:include>
<style>

/* cart css */
div#cartContainer{
	border: 2px solid #bc73d6!important;
	width:900px;
	height:180px;
}
div#cartHistory{
 width:900px;
}
.border-secondary {
    border-color:  #9033b5!important;
}


#thead{
 background-color:#c8a9c8;
}
div#payContainer{
	width:800px;
	border: 2px solid #bc73d6!important;
	
}


#innerContent{
	width: 140px;
	text-align: center;	
	font-size: 12px;
	

}
.border-dark{
 	border-color: #d8d8d8!important;
}


img#productImg{
	width: 100px;
	height: 80px;
}
img#plus{
	width:20px;
	height: 20px;
}

#marks{
	background-color: #c8a9c8;
}
#cartTitle{
 font-size: 30px;
}
#arrow img{
 	width: 20px;
 	height: 20px;
}
#cartinfo{
  font-size: 15px;
}
#cartImg img{
	width: 30px;
 	height: 30px;
}
td{
 	height: 120px;
}

.table td, .table th {
    vertical-align: middle;
	text-align: center;
}
#productImg{
	width: 55px;
	height:80px;
}
#btnOrder{
   color:  #9033b5;
    background-color: transparent;
    background-image: none;
    border-color:  #9033b5;
    width: 60px;
    height: 30px;
    font-size: 10px;
    text-align: center;

}

#btnOrder:hover{
    color:  white;
    background-color: #c7a2e0;
    background-image: none;
    border-color:  #c7a2e0;
}
#delivery{
 color:  #9033b5;
    background-color: transparent;
    background-image: none;
    border-color:  #9033b5;
    width: 50px;
    height: 20px;
    font-size: 10px;
    text-align: center;
}

#delivery:hover {
	cursor: default;
}
#selectProduct{
color:  #9033b5;
    background-color: transparent;
    background-image: none;
    border-color:  #9033b5;

    text-align: center;
}
#cartAgain{
 color:  #9033b5;
    background-color: transparent;
    background-image: none;
    border-color:  #9033b5;
}
#cartOder{
	 color:  white;
    background-color: #c7a2e0;
    background-image: none;
    border-color:  #c7a2e0;
}
</style>
		
<br /><br />
<!-- 타이틀 -->
<div class="row">
	<div class="col-md-1" ></div>
	<div class="col-md-7 " id="cartTitle">
	<h2 class="font-weight-bold" id="cartImg">장바구니<img class="mx-2 mb-2"src="${pageContext.request.contextPath}/resources/images/moonju/cart.png"/></h2>
	
	</div>
	<div class="col-md-4 float-left">
	 <ul id="cartinfo">
	 	<li class="float-left mx-2 "><span class="font-weight-bold" style="font-size: 18px;">장바구니</span></li>
	 	<li class="float-left mx-2" id="arrow"><img src="${pageContext.request.contextPath}/resources/images/moonju/next.png" /></li>
	 	<li class="float-left mx-2" style="color:gray;">주문/결제</li>
	 	<li class="float-left mx-2" id="arrow"><img src="${pageContext.request.contextPath}/resources/images/moonju/next.png" /></li>
	 	<li class="float-left mx-2" style="color:gray;">완료</li>
	 </ul>
	</div>
</div>
<br /><br />
	
<!-- 주의 사항  -->
<div id="cartContainer" class="border border-2 mx-auto p-3 rounded ">
	
		<ul class="my-3">
			<li class="my-2 font-weight-bold">
				<span>- 장바구니 상품은 <mark id="marks">최대 30일간</mark> 저장됩니다.</span>
			</li>
			<li class="my-2 font-weight-bold">
				<span>- 가격, 옵션 등 정보가 변경된 경우<mark id="marks"> 주문이 불가할 수 있습니다.</mark></span>
			</li>
			<li class="my-2 font-weight-bold">
				<span>- 오늘출발 상품은 판매자 설정 시점에 따라 오늘출발 여부가 변경될 수 있으니 <mark id="marks">주문 시 꼭 다시 확인해 주시기 바랍니다.</mark></span>
			</li>
		</ul>

</div>
<br /><br /><br />
 <hr />

<!-- 장바구니 내역 -->
<div class="border border-0 mx-auto p-3 rounded " id="cartHistory">
	<table class="table">
  <thead class="thead " id="thead">
    <tr>
      <th scope="col" ><input type="checkbox" id="checkboxs"/></th>
      <th scope="col">상품정보</th>
      <th scope="col">옵션</th>
      <th scope="col">상품금액</th>
      <th scope="col">배송비</th>
    </tr>
  </thead>
  <tbody>
    <tr>
     <th scope="row" class="border border-left-0 border-top-0  border-right-0 ">
     	<input class="" type="checkbox" id="checkboxs"/>
     </th>
      <td class=" border border-left-0 border-top-0 ">
      	<div class="media">
		  <img class="mr-2" src="${pageContext.request.contextPath}/resources/images/moonju/blackpink.jpg" id="productImg">
		  <div class="media-body">
		    <a href=""><h6 class="mt-0">BLACK PINK 5TH ALBUM</h6></a> <!--이름 누를시 상품 상세페이지 -->
		    28,000원
		  </div>
		</div>
      </td>
      <td class="border border-left-0 border-top-0">
      	<div class="d-flex flex-column">
		  <div class="p-2" style="font-size: 12px;">상품 주문 수량: 1개 </div><hr />
		  <div class="p-2" style="font-size: 12px;">옵션: 멤버별 포카 4종 증정</div>
		</div>
      </td>
      <td class="border border-left-0 border-top-0 ">
      	<div class="d-flex flex-column">
		  <div class="p-2" style="font-size:20px; color:#bc73d6">28,000원</div>
		  <div class="p-2" style="font-size: 12px;">
		  	<button type="button" class="btn btn-outline p-0 font-weight-bold" id="btnOrder">주문하기</button>
		  </div>
		 </div>
	  </td>
      <td class="border border-right-0 border-top-0">
      	<div class="d-flex flex-column ">
		  <div class="p-1" style="font-size:18px;">무료</div>
		  <div class="p-1" style="font-size: 12px;">
		  	<button class="btn btn-outline p-0 " id="delivery">오늘출발</button>
		  </div>
		   <div class="p-1" style="font-size:9px;">15:00까지 결제 시</div>
		   <div class="p-1 font-weight-bold" style="font-size:9px;color:#bc73d6">오늘 바로 발송</div>
		 </div>
      </td>
    </tr>
    
    <tr>
      <th scope="row" class="border border-left-0 border-top-0 border-right-0 ">
      	<input type="checkbox" id="checkboxs"/>
      </th>
      <td class=" border border-left-0 border-top-0 ">
      	<div class="media">
		  <img class="mr-2" src="${pageContext.request.contextPath}/resources/images/moonju/gw.jpg" id="productImg">
		  <div class="media-body">
		    <a href=""><h6 class="mt-0">공원소녀 5TH MINI ALBUM</h6></a> <!--이름 누를시 상품 상세페이지 -->
		    28,000원
		  </div>
		</div>
      </td>
      <td class="border border-left-0 border-top-0 ">
      	<div class="d-flex flex-column">
		  <div class="p-2" style="font-size: 12px;">상품 주문 수량: 1개 </div><hr />
		  <div class="p-2" style="font-size: 12px;">옵션: 멤버별 포카 4종 증정 및 파우치 증정</div>
		</div>
      </td>
      <td class="border border-left-0 border-top-0 ">
      	<div class="d-flex flex-column">
		  <div class="p-2" style="font-size:20px; color:#bc73d6">28,000원</div>
		  <div class="p-2" style="font-size: 12px;">
		  	<button type="button" class="btn btn-outline p-0 font-weight-bold" id="btnOrder">주문하기</button>
		  </div>
		 </div>
	  </td>
      <td class="border border-right-0 border-top-0">
      	<div class="d-flex flex-column">
		  <div class="p-1" style="font-size:18px;">무료</div>
		  <div class="p-1" style="font-size: 12px;">
		  	<button class="btn btn-outline p-0 " id="delivery">오늘출발</button>
		  </div>
		   <div class="p-1" style="font-size:9px;">15:00까지 결제 시</div>
		   <div class="p-1 font-weight-bold" style="font-size:9px;color:#bc73d6">오늘 바로 발송</div>
		 </div>
      </td>
    </tr>
    
    <tr>
       <th scope="row" class="border border-left-0 border-top-0 border-right-0 ">
       	<input type="checkbox" id="checkboxs"/>
       </th>
      <td class=" border border-left-0 border-top-0">
      	<div class="media">
		  <img class="mr-2" src="${pageContext.request.contextPath}/resources/images/moonju/everglow.jpg" id="productImg">
		  <div class="media-body">
		    <a href=""><h6 class="mt-0">EVER GLOW 3TH ALBUM</h6></a> <!--이름 누를시 상품 상세페이지 -->
		    28,000원
		  </div>
		</div>
      </td>
      <td class="border border-left-0 border-top-0 ">
      	<div class="d-flex flex-column">
		  <div class="p-2" style="font-size: 12px;">상품 주문 수량: 1개 </div><hr />
		  <div class="p-2" style="font-size: 12px;">옵션: 멤버별 포카 4종 증정 및 응원봉 증정</div>
		</div>
      </td>
      <td class="border border-left-0 border-top-0 ">
      	<div class="d-flex flex-column">
		  <div class="p-2" style="font-size:20px; color:#bc73d6">28,000원</div>
		  <div class="p-2" style="font-size: 12px;">
		  	<button type="button" class="btn btn-outline p-0 font-weight-bold" id="btnOrder">주문하기</button>
		  </div>
		 </div>
	  </td>
      <td class="border border-right-0 border-top-0">
      	<div class="d-flex flex-column">
		  <div class="p-1" style="font-size:18px;">무료</div>
		  <div class="p-1" style="font-size: 12px;">
		  	<button class="btn btn-outline p-0 " id="delivery">오늘출발</button>
		  </div>
		   <div class="p-1" style="font-size:9px;">15:00까지 결제 시</div>
		   <div class="p-1 font-weight-bold" style="font-size:9px;color:#bc73d6">오늘 바로 발송</div>
		 </div>
      </td>
    </tr>
    
    <tr>
       <th scope="row" class="border border-left-0 border-top-0 border-right-0 ">
       	<input type="checkbox" id="checkboxs"/>
       </th>
      <td class="border border-left-0 border-top-0 border-right-0 "  colspan="4">
      	<div class="p-2" style="width: 250px">
		  	<button class="btn btn-outline p-2" id="selectProduct">선택 상품 삭제</button>
		  	<button class="btn btn-outline p-2 " id="selectProduct">선택 상품 찜</button>
		  </div>
      </td>
    </tr>
    
      <tr>
      <th scope="row" class="border border-left-0 border-top-0 border-right-0"></th>
      <td class="border border-left-0 border-top-0 " colspan="2">
      	<div class="d-flex justify-content-center">
      		<dl class="py-2 px-3 mb-0">
      			<dt>총 상품 금액</dt>
      			<dd>
      				<span>84,000</span>원
      			</dd>
      		</dl>
      		
      		<dl class="py-3 px-3 mb-0">
      			<dt></dt>
      			<dd>
      				<img src="${pageContext.request.contextPath}/resources/images/moonju/plus.png"  id="plus"/>
      			</dd>
      		</dl>
      		
      		<dl class="py-2 px-3 mb-0">
      			<dt>배송비</dt>
      			<dd>
      				<span>0</span>원
      			</dd>
      		</dl>
      		
      		<dl class="py-3 px-3 mb-0">
      			<dt></dt>
      			<dd>
      				<img src="${pageContext.request.contextPath}/resources/images/moonju/remove.png"  id="plus"/>
      			</dd>
      		</dl>
      		<dl class="py-2 px-3 mb-0">
      			<dt style="color: red">할인예상금액</dt>
      			<dd>
      				<span>0</span>원
      			</dd>
      		</dl>
      	</div>
      </td>
      <td class="border border-right-0 border-top-0" colspan="2">
      	<span class="font-weight-bold" >총 주문금액</span>
      	<span class="font-weight-bold" style="font-size:20px; color:#bc73d6"> 8,4000원</span>
      </td>
    </tr>
  </tbody>
</table>
		<div class="py-3 d-flex justify-content-around" >
		  	<button class="btn btn-outline py-2" id="cartAgain">쇼핑 계속하기</button>
		  	<a href="${pageContext.request.contextPath}/basket/payment.do"><button class="btn btn-outline py-2 " id="cartOder">주문하기</button></a>
		  </div>
	
</div>
<script>


</script>		

<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>
