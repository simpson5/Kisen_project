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

<jsp:include page="/WEB-INF/views/common/admin_header.jsp">
	<jsp:param value="모든 상품" name="title"/>
</jsp:include>
<div class="container ">
    <!-- 검색  -->
	<form:form 
		name="searchFrm"
		id="searchFrm" 
		class="border mt-3 mb-3 p-3"> 
			<div class="d-flex justify-content-center mb-2" >
			
			<div>
		        <input type="search" placeholder="Search" aria-label="검색어를 입력하세요" name="searchString" class="form-control mb-3 mt-3" >
			    <div class="searchlist-div mb-3"> 
					<span>아이돌</span>
					<div class="mt-2">
		   			<c:forEach items="${idolList}" var="idol">
		           	<button type="button" class="btn btn-outline-info"  id="idol${idol.idolNo}" data-no="${idol.idolNo}" onclick="idolSearch(event);">${idol.idolName }</button>
		    		</c:forEach>
		    		</div>
			    </div>
			    
			    <div class="searchlist-div mb-3"> 
					<span>종류</span>
					<div class="mt-2">
		    		<c:forEach items="${category}" var="category">
		            <button type="button" class="btn btn-outline-dark" id="category${category}" data-category="${category}" onclick="categorySearch(event);">${category }</button>
		    		</c:forEach>
		    		</div>
			    </div>	
			</div>
	
		    <div>
	        <button class="btn mt-3" type="button" onclick="searchFrmClick(event);" style="margin-left: 2rem; height:70% ; width: 80%">검색하기</button>
	        <button class="btn mt-3" type="button" onclick="resetClick(event);" style="margin-left: 2rem; height:20%; width: 80%">초기화</button>
		    </div>
		</div>
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
        location.href=`${pageContext.request.contextPath}/admin/adminProductEnroll`
	}
    function productDetail(event) {
        const target = event.target;
        const pdNo= target.dataset.no;
        location.href=`${pageContext.request.contextPath}/admin/adminProductDetail/\${pdNo}`
    }
    function productDelete(event) {
        const target = event.target;
        const pdNo= target.dataset.no;
        if(!confirm("정말 삭제하시겠습니까?")){
			return false;
        }
		$.ajax({
			url: `${pageContext.request.contextPath}/admin/adminProductDelete/\${pdNo}`,
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

	var idol_arrNumber = new Array();

	var category_arrNumber = new Array();
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
        	id.addClass("checked");

        	idol_arrNumber.push(idolNo);
    		console.log(idol_arrNumber);
        }
        else{
            //css 변경
        	id.removeClass("btn-info");
        	id.addClass("btn-outline-info");
        	id.removeClass("checked");

        	//배열 삭제
    		for(let i = 0; i < idol_arrNumber.length; i++) {
   			  if(idol_arrNumber[i] === idolNo)  {
   				idol_arrNumber.splice(i, 1);
   			    i--;
   			  }
   			}
    		console.log(idol_arrNumber);
        }
	}


	function categorySearch(event){
        const target = event.target;
        const category= target.dataset.category;

        const categoryId = $("#category"+category);
        //버튼 눌림 
        if(categoryId.hasClass("btn-outline-dark")){
        	categoryId.removeClass("btn-outline-dark");
        	categoryId.addClass("btn-dark");
        	categoryId.addClass("checked");
        	
        	category_arrNumber.push(category);
    		console.log(category_arrNumber);
        }

        //버튼 취소
        else{
        	categoryId.removeClass("btn-dark");
        	categoryId.addClass("btn-outline-dark");
        	categoryId.removeClass("checked");

        	//배열 삭제
    		for(let i = 0; i < category_arrNumber.length; i++) {
   			  if(category_arrNumber[i] === category)  {
   				category_arrNumber.splice(i, 1);
   			    i--;
   			  }
   			}
    		console.log(category_arrNumber);
        	
        }
	}



	function searchFrmClick(event){
		var $searchFrm = $("#searchFrm");
		var idolHidden ='';
		var categoryHidden='' ;
		for(var i = 0; i < idol_arrNumber.length; i++) {
			idolHidden+= '<input type="hidden" value="'+idol_arrNumber[i] +'" name="idolNo"/>'
	    }
		for(var i = 0; i < category_arrNumber.length; i++) {
			categoryHidden+= '<input type="hidden" value="'+category_arrNumber[i] +'" name="category"/>'
	    }
		console.log(categoryHidden);
		$searchFrm.append(idolHidden).append(categoryHidden);

		$searchFrm
			.attr("action", `${pageContext.request.contextPath}/admin/searchProduct`)
			.attr("method", 'get')
			.submit();
	}


	function resetClick(event){
        location.href=`${pageContext.request.contextPath}/admin/adminProduct`
	}
</script>
<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>
