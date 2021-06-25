<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%
     //치환 변수 선언
      pageContext.setAttribute("crcn", "\r\n"); //Space, Enter
      pageContext.setAttribute("br", "<br/>"); //br 태그
%>

<jsp:include page="/WEB-INF/views/common/agency_header.jsp">
	<jsp:param value="모든 상품" name="title"/>
</jsp:include>
<div class="container ">
    <div class="d-flex justify-content-end mt-3 mb-3" >
        <button type="button" class="btn btn-secondary" onclick="productEnroll()"> 상품등록</button>
    </div>
    
    <!-- 검색  -->
	<form:form 
		name="searchFrm" 
		onsubmit="return formValidate();"> 
		<div class="d-flex justify-content-center mb-3" >
	        <input type="search" placeholder="Search" aria-label="Search" style="width: 150px"  class="form-control me-2" >
		</div>
		
	    <div class="searchlist-div mb-3"> 
			<span>아이돌 : </span>
   			<c:forEach items="${idolList}" var="idol">
           	<button type="button" class="btn btn-outline-info"  id="idol${idol.idolNo}" data-no="${idol.idolNo}" onclick="idolSearch(event);">${idol.idolName }</button>
    		</c:forEach>
	    </div>
	    
	    <div class="searchlist-div mb-3"> 
			<span>종류 : </span>
    		<c:forEach items="${category}" var="category">
            <button type="button" class="btn btn-outline-dark" id="category${category}" data-category="${category}" onclick="categorySearch(event);">${category }</button>
    		</c:forEach>
	    </div>	
        <button class="btn" type="submit"><img src="${pageContext.request.contextPath }/resources/images/search.png" style="height: 25px"></button>
	</form:form>
	
	
	
    <c:forEach items="${productList}" var="product">
    <div class="card mb-3 item product">
        <div class="row g-0 idol-img">
            <div class="col-4 idol-img">
	            <div class="idol-img ">
	            	<c:forEach items="${product.pdImgList}" var="pdImg">
	            		<c:if test="${pdImg.pdCategory eq 'R'}">
    			        	<img src="<c:url value='/resources/upload/product/${pdImg.renamedFilename}'/>" class="card-img mt-1" alt="tree" style="width:250px; height: 100%;">
	            		</c:if>
	            	</c:forEach>
	            </div>
            </div>

            <div class="col-8">
	            <div class="card-body">
	                <h6 class="card-title">
	                	<span class=" fw-bold">${product.pdName}</span> 
	                	<span class="badge bg-info" style="color:white;">${product.idolName}</span>
	                </h6>
	                <p class="card-text badge bg-s" > ${fn:replace(product.pdContent, crcn, br)}</p>
	                <p class="card-text"> 
	                    <span class="badge bg-dark">${product.pdCategory}</span>           <!-- 분류 -->
	                    <span class="badge bg-s bg-warning ">재고 :  <fmt:formatNumber value="${product.pdStock}" pattern="#,###" /> </span>       
	                    <span class="badge bg-s bg-warning ">판매량  : <fmt:formatNumber value="${product.pdSales}" pattern="#,###" /></span>
	                </p>
            	    <p class="card-text"> 
                    	<c:if test="${product.pdOptionList ne  ''}">
                    		<span class="badge">옵션 : </span> 
	            	    	<c:forEach items="${product.pdOptionList}" var="option">
		                    	<span class="badge bg-light text-dark">${option.optionName }</span> 
	            	    	</c:forEach>
            	    	</c:if>
	                </p>
	                <p class="card-text badge bg-s"> 가격  : <fmt:formatNumber value="${product.price}" pattern="#,###" />원</p> <br />
	                <div class="btn-group" role="group" aria-label="Basic example">
	                    <button type="button" class="btn btn-sm btn-outline-main"  data-no="${product.pdNo}" onclick="productDetail(event);" >상세보기</button>
	                    <button type="button" class="btn btn-sm btn-outline-main"  data-no="${product.pdNo}" onclick="productUpdate(event);" >수정</button>
	                    <button type="button" class="btn btn-sm btn-outline-main"  data-no="${product.pdNo}" onclick="productDelete(event);">삭제</button>
	                </div>
	            </div>
            </div>
        </div>
    </div>
    </c:forEach>
    
    <!-- paging -->
	${pageBar }
</div>
<script>
	function productEnroll(){
        location.href=`${pageContext.request.contextPath}/agency/agencyProductEnroll`
	}
    function productDetail(event) {
        const target = event.target;
        const pdNo= target.dataset.no;
        location.href=`${pageContext.request.contextPath}/agency/agencyProductDetail/\${pdNo}`
    }
    function productUpdate(event) {
        const target = event.target;
        const pdNo= target.dataset.no;
        location.href=`${pageContext.request.contextPath}/agency/agencyProductUpdate/\${pdNo}`
    }
    function productDelete(event) {
        const target = event.target;
        const pdNo= target.dataset.no;
        if(!confirm("정말 삭제하시겠습니까?")){
			return false;
        }
		$.ajax({
			url: `${pageContext.request.contextPath}/agency/agencyProductDelete/\${pdNo}`,
			method : 'delete',
			success: function (data){
				console.log("삭제 성공");
				const {msg} = data;
				alert(msg);
				refreshMemList();
			},
			error(xhr, statusText, err){
				console.log(err);
			}
		});
    }
	function refreshMemList(){
		location.reload();
	}

	var arrNumber = new Array();
	
	/* 검색 */
	function idolSearch(event){
        const target = event.target;
        const idolNo= target.dataset.no;
        console.log(target);

        const id = $("#idol"+idolNo);
        
        //버튼 눌림 
        if(id.hasClass("btn-outline-info")){
            //css 변경
        	id.removeClass("btn-outline-info");
        	id.addClass("btn-info");

    		arrNumber.push(idolNo);
    		console.log(arrNumber);
        }
        else{
            //css 변경
        	id.removeClass("btn-info");
        	id.addClass("btn-outline-info");

        	//배열 삭제
    		for(let i = 0; i < arrNumber.length; i++) {
   			  if(arrNumber[i] === idolNo)  {
   				arrNumber.splice(i, 1);
   			    i--;
   			  }
   			}
    		console.log(arrNumber);
        }
		searchIdolNo(arrNumber);	
	}

	//비동기 처리 후 html 대입
	function searchIdolNo(arrNumber){
		$.ajax({
			url: `${pageContext.request.contextPath}/agency/searchIdolProduct`,
			method : "get",
			data : {idolNoList : arrNumber},
		    dataType : 'json',
			success: function (data){
				forDiv("product", data);
				
			},
			error(xhr, statusText, err){
				console.log(err);
			}
		});
	}

	function categorySearch(event){
        const target = event.target;
        const category= target.dataset.category;

        const categoryId = $("#category"+category);
        //버튼 눌림 
        if(categoryId.hasClass("btn-outline-dark")){
        	categoryId.removeClass("btn-outline-dark");
        	categoryId.addClass("btn-dark");
        	$
        }

        //버튼 취소
        else{
        	categoryId.removeClass("btn-dark");
        	categoryId.addClass("btn-outline-dark");
        }
	}

	
	function forDiv(id, data){
		const productId = $("."+id);	//product
		if(productId.length){
			productId.remove();
		}

		for(var i=0;i<data.length;i++){
			displayResultDiv(data[i])
		}
		
		
	}
	function getContextPath(){
		var hostIndex = location.href.indexOf(location.host)+location.host.length;
		return location.href.substring(hostIndex,location.href.indexOf('/',hostIndex+1));
	}
	
	function displayResultDiv(data){
		var renamedfile;
		for(var i=0;i<data.pdImgList.length; i++){
			if(data.pdImgList[i].pdCategory == 'R')
				renamedfile = data.pdImgList[i].renamedFilename;
		}
		console.log(renamedfile);

		var optionHtml;
		for(var i=0;i<data.pdOptionList.length; i++){
			optionHtml += 'span class="badge bg-light text-dark">'+data.pdOptionList[i].optionName+'</span> ';
		}
		console.log(getContextPath());
		const img = '<img src='+getContextPath()+'/resources/upload/product/'+renamedfile +' class="card-img mt-1" alt="tree" style="width:250px; height: 100%;">';

		
		var html = '<div class="card mb-3 item product"><div class="row g-0 idol-img"><div class="col-4 idol-img"><div class="idol-img ">' + img+ ' </div></div>';
		html+= '<div class="col-8"><div class="card-body"><h6 class="card-title">  <span class=" fw-bold">'+data.pdName+'</span> <span class="badge bg-info" style="color:white;">'+data.idolName+' </span></h6>';
		html+= '<p class="card-text badge bg-s" > '+ data.pdContent+'</p>';
		html+= ' <p class="card-text"> <span class="badge bg-dark">' + data.pdCategory+' </span>';
		html+= '<span class="badge bg-s bg-warning ">재고 :  '+ data.pdStock + ' </span>';
		html+= '<span class="badge bg-s bg-warning ">판매량  : ' + data.pdSales +'</span></p>';
		html+= '<p class="card-text">  <span class="badge">옵션 : </span> ' +optionHtml+'</p>';
		html+=' <p class="card-text badge bg-s"> 가격  : '+data.price+'원</p> <br />';
		html+= '<div class="btn-group" role="group" aria-label="Basic example">';
		html+= ' <button type="button" class="btn btn-sm btn-outline-main"  data-no="'+data.pdNo+'" onclick="productDetail(event);" >상세보기</button>';
		html+= ' <button type="button" class="btn btn-sm btn-outline-main"  data-no="'+data.pdNo+'" onclick="productUpdate(event);" >수정</button>';
		html+= ' <button type="button" class="btn btn-sm btn-outline-main"  data-no="'+data.pdNo+'" onclick="productDelete(event);" >삭제</button>';
		html += '</div></div></div></div></div>'   ; 


		$(".container").append(html);
	}
</script>
<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>
