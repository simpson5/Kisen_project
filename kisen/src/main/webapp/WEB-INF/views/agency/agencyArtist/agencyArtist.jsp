<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<jsp:include page="/WEB-INF/views/common/agency_header.jsp">
	<jsp:param value="회원/아티스트 관리" name="title"/>
</jsp:include>
<style>
.bg-success {
    background-color: #28a745!important;
    color: white;
}
</style>

<div class="container">
	<div class="d-flex justify-content-end mt-5">
	  <button type="button" class="btn btn-secondary" onclick="artistEroll()"> 아티스트 등록</button>
	</div>
	<c:forEach items="${idolList}" var="idol">
	  <div class="card mb-3 mt-4">
	    <div class="row g-0 idol-img">
	        <div class="col-4 idol-img">
	          <div class="idol-img text-center">
	              <%-- <img src="${pageContext.request.contextPath}/resources/upload/idol_img/" class="card-img mt-5" alt="tree"> --%>
	              <img src="<c:url value='/resources/upload/idol/${idol.idolImg.renamedFilename}'/>" class="card-img mt-5" alt="tree" style="width:300px">
	              <div class="btn-group m-1 mt-5" role="group" aria-label="Basic example">
	                <button type="button" class="btn btn-sm btn-outline-main"   onclick="artistDetail(event);" data-no="${idol.idolNo}">상세보기</button>
	                <button type="button" class="btn btn-sm btn-outline-main"   onclick="artistUpdate(event);" data-no="${idol.idolNo}">수정하기</button>
	              </div>
	          </div>
	        </div>
	        
	        <div class="col-8">
	            <div class="card-body">
	                <h5 class="card-title fw-bold" > <strong>${idol.idolName }</strong> </h5>
	                <p class="card-text"> 
		                <p class=""> <strong>MV </strong> : <br/>
		                <!-- mvList  -->
		                <c:forEach items="${idol.idolMv }" var="mv">
			                     <span> <a href="${mv.mvLink}"> ${mv.mvLink} </a></span>  <br/>
		                </c:forEach>
		                </p>
		                
		                
	                    <h5><p class=""> 팬 수  :  <span class= "badge bg-success" > ${idol.fanCnt} </span> </h5>
		                </p>
	                </p>
	            </div>
	        </div>
	    </div>
	  </div>
	</c:forEach>
  <!-- paging -->

	${pageBar}
</div>

<script> 
    $(function(){
        $('#carouselExampleControls-card, #carouselExampleControls-card2, #carouselExampleControls-card3').carousel({
        // false면 자동 순환하지 않는다.
        interval: false,
        // 순환 설정, true면 1 -> 2가면 다시 1로 돌아가서 반복
        wrap: true,
        // 키보드 이벤트 설정 여부(?)
        keyboard : true
        });
    });
	function artistEroll(){
        location.href="${pageContext.request.contextPath}/agency/agencyArtistEnroll";
	}
    
    function artistDetail(event) {
        const target = event.target;
        console.log(target);
        const idolNo= target.dataset.no;
        location.href=`${pageContext.request.contextPath}/agency/agencyArtistDetail/\${idolNo}`;

    }
    function artistUpdate(event) {
        const target = event.target;
        console.log(target);
        const idolNo= target.dataset.no;
        location.href=`${pageContext.request.contextPath}/agency/agencyArtistUpdate/\${idolNo}`;
    }
</script>
<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>
