<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<jsp:include page="/WEB-INF/views/common/agency_header.jsp">
	<jsp:param value="회원/아티스트 관리" name="title"/>
</jsp:include>

<div class="container">
  <div class="d-flex justify-content-end mt-5">
    <button type="button" class="btn btn-secondary" onclick="artistEroll()"> 아티스트 등록</button>
  </div>
  <div class="card mb-3 mt-4">
    <div class="row g-0 idol-img">
        <div class="col-4 idol-img">
          <div class="idol-img text-center">
              <img src="/images/idol/itzy.png" class="card-img mt-5" alt="tree">
              <div class="btn-group m-1 mt-5" role="group" aria-label="Basic example">
                <button type="button" class="btn btn-sm btn-outline-main"   onclick="artistDetail();">상세보기</button>
                <button type="button" class="btn btn-sm btn-outline-main"   onclick="artistUpdate();">수정하기</button>
              </div>
          </div>
        </div>
        <div class="col-8">
            <div class="card-body">
                <h5 class="card-title">ITZY</h5>
                <p class="card-text"> 
                <p class=""> <strong>MV </strong> : <br/>
                    <span> <a href=""> https://youtu.be/_ysomCGaZLw </a></span> <br/>
                    <span> <a href=""> https://youtu.be/_ysomCGaZLw </a></span><br/>
                    <span> <a href=""> https://youtu.be/_ysomCGaZLw </a></span><br/>
                    <span> <a href=""> https://youtu.be/_ysomCGaZLw </a></span><br/>
                </p>  
                </p>
                <p class="card-text"> 
                <p class=""> <strong> IMG</strong> : 
                    <span> <img src="/images/kisen_logo.png" alt="" style="height: 60px; width: 80px;"></span>
                    <span> <img src="/images/kisen_logo.png" alt="" style="height: 60px; width: 80px;"></span>
                    <span> <img src="/images/kisen_logo.png" alt="" style="height: 60px; width: 80px;"></span>
                    <span> <img src="/images/kisen_logo.png" alt="" style="height: 60px; width: 80px;"></span>
                    <span> <img src="/images/kisen_logo.png" alt="" style="height: 60px; width: 80px;"></span>
                </p>  
                </p>
            </div>
        </div>
    </div>
  </div>
  <!-- paging -->
  <div class="d-flex justify-content-center">
    <div class="btn-toolbar mb-3" role="toolbar" aria-label="Toolbar with button groups">
        <div class="btn-group me-2 " role="group" aria-label="First group">
          <button type="button" class="btn btn-outline-secondary"><<</button>
          <button type="button" class="btn btn-outline-secondary">1</button>
          <button type="button" class="btn btn-outline-secondary">2</button>
          <button type="button" class="btn btn-outline-secondary">3</button>
          <button type="button" class="btn btn-outline-secondary">4</button>
          <button type="button" class="btn btn-outline-secondary">5</button>
          <button type="button" class="btn btn-outline-secondary">>></button>
        </div>
    </div>
  </div>
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
    
    function artistDetail() {
        location.href="agencyArtistDetail.html"
    }
    function artistUpdate() {
        location.href="agencyArtistUpdate.html"
    }
</script>
<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>
