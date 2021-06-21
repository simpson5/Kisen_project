<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<jsp:include page="/WEB-INF/views/common/agency_header.jsp">
	<jsp:param value="ARTIST 상세보기" name="title"/>
</jsp:include>


<div class="container ">
	<c:if test="${not empty msg}">
	<div class="alert alert-warning alert-dismissible fade show" role="alert">
	  <strong>${msg}</strong>
	  <button type="button" class="close" data-dismiss="alert" aria-label="Close">
	    <span aria-hidden="true">&times;</span>
	  </button>
	</div>
	</c:if>
    <h2 class="text-center m-4" style="font-weight: bold;">ARTIST 상세보기</h2>

    <div class="mb-4 row">
        <label class="col-md-3 col-form-label" for="pdIdol">아이돌</label>
        <div class="col-md-9">
            <input type="text" class="form-control" name="pdIdol" id="pdIdol" value="${idol.idolName }" readonly>
        </div>
    </div>

    <div class="mb-4 row">
        <label class="col-md-3 col-form-label" for="pdCategory">소속 기획사</label>
        <div class="col-md-9">
            <input type="text" class="form-control" name="pdCategory" id="pdCategory" value="${agencyMember.agencyName}" readonly>
        </div>
    </div>

    <div class="mb-4 row">
        <label class="col-md-3 col-form-label" for="pdContent">MV 리스트</label>
        <div class="col-md-9">
        <c:forEach items="${idol.idolMv }" var="mv">
            <input type="text" class="form-control" name="idolMv" value="${mv.mvLink}" readonly>	   
        </c:forEach>
        </div>
    </div>
    <div class="mb-4 row">
        <label class="col-md-3 col-form-label" for="price">상품수</label>
        <div class="col-md-9">
            <div class="input-group">
                <input type="text" class="form-control" name="price" id="price" value="${pdCnt}" readonly>
                <span class="input-group-text">개</span>
            </div>
        </div>
    </div>
    <div class="mb-4 row">
        <label class="col-md-3 col-form-label" for="price">팬수</label>
        <div class="col-md-9">
            <div class="input-group">
                <input type="text" class="form-control" name="fanCnt" id="fanCnt" value="${idol.fanCnt}" readonly>
                <span class="input-group-text">명</span>
            </div>
        </div>
    </div>
    <!-- 상품 설명 이미지 - 여러개 -->
    <div class="mb-4 row">
        <label class="col-md-3 col-form-label">대표 이미지</label>
        <div class="col-md-9">
            <input  type="file" class="form-control" id="formFile" accept="image/png,image/jpeg,image/jpg" readonly>
            <img src="<c:url value='/resources/upload/idol/${idol.idolImg.renamedFilename}'/>" class="card-img mt-5" alt="tree" style="width:300px">
        </div>
    </div>
    <div class="container text-center">
        <div class="mb-4 row">
            <div class="col-6 d-grid p-1">
                <button type="button" class="btn btn-lg btn-dark" style="width: 100%;">취소하기</button>
            </div>
            <div class="col-6 d-grid p-1">
                <button type="button" class="btn btn-lg btn-main" style="width: 100%;" onclick="artistUpdate(event);" data-no="${idol.idolNo}"  >수정하기</button>
            </div>
        </div>
    </div>
</div>
<script>
    function artistUpdate(event) {
        const target = event.target;
        console.log(target);
        const idolNo= target.dataset.no;
        location.href=`${pageContext.request.contextPath}/agency/agencyArtistUpdate/\${idolNo}`;
    }
</script>
<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>
