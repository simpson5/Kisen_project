<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>	
<jsp:include page="/WEB-INF/views/common/header.jsp">

	<jsp:param value="결제페이지" name="title"/>
</jsp:include>
<style>
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
#checkboxAll{
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
  
<!-- 장바구니 내역 action="${pageContext.request.contextPath}/basket/payment.do"-->

<div class="border border-0 mx-auto p-3 rounded " id="cartHistory">
	<table class="table">
  <thead class="thead " id="thead">
    <tr>
      <th scope="col" ><input type="checkbox" id="checkboxAll" name="checkboxAll"/></th>
      <th scope="col">상품정보</th>
      <th scope="col">옵션</th>
      <th scope="col">상품금액</th>
      <th scope="col">배송비</th>
    </tr>
  </thead>
  <tbody>
	<c:forEach items="${basketList}" var ="basketList" >

	 <tr>
     <th scope="row" class="border border-left-0 border-top-0  border-right-0 "> 
     	<input class="selectProduct" type="checkbox" id="checkboxOne" name="selectProduct" onclick="select(this);" />
 		<input type="hidden"  name="productNo" value="${basketList.pdNo}"> 
     	 <input type="hidden" name="opNooo" value="${basketList.pdNo}-${basketList.opNo}"> 
     </th>
      <td class=" border border-left-0 border-top-0 ">
      	<div class="media">
		  <img class="mr-2" src="${pageContext.request.contextPath}/resources/upload/product/${basketList.productImg.renamedFilename}" id="productImg">
		  <div class="media-body pContent">
		    <h6 class="mt-0 "> 
		    	<input type="hidden" name="pdName" value="${basketList.pdName}">
		    	${basketList.pdName} 
		    </h6>
		    <input type="hidden" name="pContent" value="${basketList.pdContent}" >
		    ${basketList.pdContent}
		  </div>
		</div>
      </td>
  
      <td class="border border-left-0 border-top-0" >
      	<div class="d-flex flex-column">
		  <div class="p-2 amount" style="font-size: 12px;">
			  <input type="hidden" name="amount" value="${basketList.pdAmount}" >
			  상품 주문 수량: ${basketList.pdAmount} 
		  </div>
		  <hr />
		  <div class="p-2 " style="font-size: 12px;">
			   <input type="hidden" name="option" value="${basketList.productOption.optionName}">
			   <input type="hidden" name="opN" value="${basketList.productOption.optionNo}">
			  옵션: ${basketList.productOption.optionName} 
		  </div>
		</div>
      </td>
      <td class="border border-left-0 border-top-0 ">
      	<div class="d-flex flex-column">
		  <div class="p-2" style="font-size:20px; color:#bc73d6" >
		   <input type="hidden"  name="price" value="${basketList.price}">
		   ${basketList.price}
		   </div>
		 </div>

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

	</c:forEach>
    <tr>
       <th scope="row" class="border border-left-0 border-top-0 border-right-0 ">
       <input type="checkbox" id="checkboxDel" name="checkboxdel" />
       </th>
       <td class="border border-left-0 border-top-0 border-right-0 " colspan="4">
      	<div class="p-1" style="width:100px;">
		  	<button class="btn btn-outline p-2" id="checkboxAll" onclick="cartDel(this);" >선택 상품 삭제</button>	  
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
      				<span class="totalOne"></span>원
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
      	<span class="font-weight-bold total" style="font-size:20px; color:#bc73d6"> </span>
      </td>
    </tr>
  </tbody>
</table>

		<div class="py-3 d-flex justify-content-around" >
		  	<button class="btn btn-outline py-2" id="cartAgain">쇼핑 계속하기</button>
		  	<%-- <a href="${pageContext.request.contextPath}/basket/payment.do"> --%>
		  	<button class="btn btn-outline py-2 " id="cartOder" onclick="order(this);"> 주문하기</button>
		  </div>
		  <input type="hidden" name="fanN" value="${loginMember.fanNo}">
		 
<form 
	name="orderFrm" 
	method="GET" 
	id="orderFrm"
	action="${pageContext.request.contextPath}/basket/payment.do" >
</form> 
<form 
	name="delCart" 
	method="POST" 
	id="orderFrm"
	action="${pageContext.request.contextPath}/basket/delCart.do">
</form> 
		
</div>

<script>
//선택시 장바구니 내역 삭제
 function cartDel(obj){
	 var $formId = $(document.delCart);
	 console.log("formId= "+ $formId);

	    var bNoHtml='';
	    var oNoHtml='';
	    const fanNoo = '<input type="hidden" name ="fanNo" value="'
			+ $("[name=fanN]").val() + '"/>';
	   
			
	    //체크된 것의 bNo가져오기
	    const $one = $(".selectProduct:checked");
		console.log($one);
	   
	    
		if($one.prop("checked") == true){

			 var bNo = $one.next();
			 console.log(bNo);
			 
			   $.each(bNo, function (index, value){
				    console.log(value);

				    bNoHtml +='<input type="hidden" name ="bNo" value="'+$(value).val()+'"/>';

				    console.log(bNoHtml);
				    });

			   const oppN = $one.next().next();
			   console.log(oppN);
			    
			   $.each(oppN, function (index, value){
				    console.log(value);

				    bNoHtml +='<input type="hidden" name ="opNo" value="'+$(value).val()+'"/>';

				    console.log(oNoHtml);
				    });

		}//if절 끝
		 $formId.append(bNoHtml); 
		 $formId.append(fanNoo); 
		 $formId.append(oNoHtml); 
		$formId.submit();
		console.log("formId= "+ $formId);
		
	
}

//유효성 검사  토탈값 넘겨주는거
function order(obj){
	//유효성 검사 하기 체크가 되었을 시 폼에다가 히든값을...담는다...
	// 체크 
	//데이터는 int 배열 
	const total = Number($(".total").text());//전체 금액값
	console.log(total);
	const totalHtml ='<input type="hidden" name ="total" value="'+total+'"/>';
	const fanNoo = '<input type="hidden" name ="fanNo" value="'
		+ $("[name=fanN]").val() + '"/>';
	var $formId = $(document.orderFrm);
	 console.log("formId= "+ $formId);
	
    var bNoHtml='';
    
    //체크된 것의 bNo가져오기
    const $one = $(".selectProduct:checked");
	console.log($one);
   
    
	if($one.prop("checked") == true){

		 var bNo = $one.next().next();
		 console.log(bNo);
		 
		   $.each(bNo, function (index, value){
			    console.log(value);

			    bNoHtml +='<input type="hidden" name ="bNo" value="'+$(value).val()+'"/>';

			    console.log(bNoHtml);
			    });

	}//if절 끝
	 $formId.append(bNoHtml);
		$formId.append(totalHtml);                     
		 $formId.append(fanNoo);                    
		$formId.submit();
	console.log("formId= "+ $formId);
	

} 


//체크박스 전체 선택 이밴트
var sum = 0;

 //전체 선택시 값 더해지게
 $("#checkboxAll").change(function(e){
	 $("[type=checkbox]").prop("checked", this.checked);
	 const check = $("[type=checkbox]").prop("checked");
		 const $one = $(".selectProduct:checked");
		console.log($one);
		
		if(check==true){
		var $total = $(".total");
		var $totalO = $(".totalOne");
		var price = $("[type=hidden]").val();
		console.log(price);             
		var total = 0;

	   	var get_input = $one.parent().next().next().next().children().children().children();
		$.each(get_input, function (index, value) {
			total +=Number($(value).val());
			
			console.log(value);
			console.log(total);
		});
		
			sum = total;
			 console.log("sum = "+ sum);
	   	   $total  += $total.html("<strong>"+total+"</strong>");
	   	  $totalO  += $totalO.html("<strong>"+total+"</strong>");
	}
	else{
		var $total = $(".total");
		var $totalO = $(".totalOne");
		console.log($total);
		var price = $("[type=hidden]").val();
		console.log(price);             


		var total =0;
		sum = total;
			/* total -=price; */
		
	   	   $total  += $total.html("<strong>"+total+"</strong>");
	   	   $totalO  += $totalO.html("<strong>"+total+"</strong>");
	}
});
 
$("#checkboxDel").click(function(e){
	
	 $("[type=checkbox]").prop("checked", this.checked);
	  const check = $("[type=checkbox]").prop("checked");	
	  const $one = $(".selectProduct:checked");
		console.log($one);
	 if(check==true){
			var $total = $(".total");
			var $totalO = $(".totalOne");
			var price = $("[type=hidden]").val();
			console.log(price);             
			var total = 0;

			var get_input = $one.parent().next().next().next().children().children().children();
			$.each(get_input, function (index, value) {
				total +=Number($(value).val());
				
				console.log(value);
				console.log(total);
			});
			sum=total;
		   	   $total  += $total.html("<strong>"+total+"</strong>");
		   	   $totalO  += $totalO.html("<strong>"+total+"</strong>");
		}else{
			var $total = $(".total");
			var $totalO = $(".totalOne");
			console.log($total);
			var price = $("[type=hidden]").val();
			console.log(price);             
		
			var total =0;
			sum=total;				
		   	$total  += $total.html("<strong>"+total+"</strong>");
		   	$totalO  += $totalO.html("<strong>"+total+"</strong>");
		}
}); 

//체크박스 총합계
$(".selectProduct").change(e => {
	console.log(e.target);
	$this = $(e.target);
	
	var $total = $(".total");
	var $totalO = $(".totalOne");
	var price = Number($this.parent().next().next().next().children().children().children().val());
	
       var cnt = $this.length; 
       console.log(cnt);
           if($this.prop("checked")){ 
               sum += price;
            console.log("sum = "+ sum);
          
			}
           else{
        	   console.log("sum = "+ sum);
        	   sum -= price;
               console.log("sum = "+ sum);
              $("#checkboxAll").prop("checked",false);
           	 $("#checkboxDel").prop("checked",false);
             }
         var total = sum;
 	    console.log(total);
            
 	   $total  += $total.html("<strong>"+total+"</strong>");
 	   $totalO  += $totalO.html("<strong>"+total+"</strong>");
     
		
		const checkbox_length = $(".selectProduct").length;
		const checked_length = $(".selectProduct:checked").length;

		console.log(checkbox_length);
		console.log(checked_length);
		if(checkbox_length == checked_length){
            $("#checkboxAll").prop("checked",true);  
            $("#checkboxDel").prop("checked",true);
		}
		
	
});

</script>
<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>