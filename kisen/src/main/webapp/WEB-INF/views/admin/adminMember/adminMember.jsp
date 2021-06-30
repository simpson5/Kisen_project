<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<jsp:include page="/WEB-INF/views/common/admin_header.jsp">
	<jsp:param value="회원/아티스트 관리" name="title"/>
</jsp:include>
<style>
.my-custom-scrollbar {
position: relative;
height: 400px;
overflow: auto;
}
.table-wrapper-scroll-y {display: block;}
</style>

<div class="container">
    <!-- 네비 (회원/아티스트) -->
    <div class="mt-3">
        <ul class="nav nav-tabs mb-3">
            <li  class="nav-item"><a href="#member" data-toggle="tab" class="nav-link active">회원관리</a></li>
        </ul>
    </div>

    <div class="tab-content mb-5">
        <!-- 일반, 기업회원 tab -->
        <div class="tab-pane fade-in active" id="member">
            <h5 style="font-weight: bold;">일반회원</h5>
            <hr>
            <!-- 일반회원 리스트 -->
            <div class="table-wrapper-scroll-y my-custom-scrollbar mb-5">
                <table class="table table-bordered table-striped mb-0 table-light">
                  <thead>
                    <tr style="height: 50px;">
                      <th scope="col" >No</th>
                      <th scope="col" >ID</th>
                      <th scope="col">NAME</th>
                      <th scope="col">E-mail</th>
                      <th scope="col">PHONE</th>
                      <th scope="col">주소</th>
                      <th scope="col">인증</th>
                      <th scope="col">가입일</th>
                      <th scope="col">관리</th>
                    </tr>
                  </thead>
                  <tbody>
                  	<c:forEach items="${fanList}" var="fan" varStatus="status">
                    <tr>
                      <th scope="row">${status.count }</th>                      <td class="fanId">${fan.fanId}</td>
                      <td >${fan.fanName}</td>
                      <td >${fan.email}</td>
                      <td >${fan.phone}</td>
                      <td >${fan.address}</td>
                      <td >
                      	<c:if test="${fan.certification eq 'false'}">N</c:if>
                      	<c:if test="${fan.certification eq 'true'}">Y</c:if>
                      </td>
                      <td ><fmt:formatDate value="${fan.enrollDate}" pattern="yyyy-MM-dd"/></td>
                      <td>
                          <button type="button" class="btn btn-sm btn-outline-main" onclick="memberDelete(event);" data-no="${fan.fanId}">삭제</button>
                      </td>
                    </tr>
                    </c:forEach>
                  </tbody>
                </table>
            </div>
            <!-- 기업회원 승인 대기 리스트 -->
            <h5 style="font-weight: bold;" class="">기업회원 승인 대기</h5>
            <hr>
	            
		    <!-- Swiper -->
		    <div class="swiper-container mySwiper">
		      <div class="swiper-wrapper text-center">
		        <!-- card 1-1 -->
			    <c:forEach items="${nc_agencyList}" var ="nc_agency" >
			        <div class="swiper-slide card col-xs-6" style="display: inline-block; width: 13rem;">
			            <div class="card-body ">
                            <h5 class="card-title" style="font-weight: bold;">${nc_agency.fanId}</h5>
                            <p class="card-text"> 
                              <p class="badge bg-s"> <strong>ID</strong> : ${nc_agency.fanId}</p>  
                              <p class="badge bg-s"><strong>사업자번호</strong> : ${ fn:substring(nc_agency.fanNo,5,50)}</p>
                              <p class="badge bg-s"><strong>NAME</strong> : ${nc_agency.fanName}</p>
                              <p class="badge bg-s"><strong>E-mail</strong> : ${nc_agency.email}</p>
                              <p class="badge bg-s"><strong>Phone</strong> : ${nc_agency.phone}</p>
                            </p>
                            <button type="button" class="btn btn-sm btn-outline-main"  onclick="agencyConfirm(event);" data-no="${nc_agency.fanNo}">인증확인</button>
			            </div>
			        <!-- card End -->
			        </div>  
			    </c:forEach> 
		      </div>
		      <div class="swiper-button-next"></div>
		      <div class="swiper-button-prev"></div>
		      <div class="swiper-pagination"></div>
		    </div>
		    
            <!-- 승인완료된 기업회원 -->
            <h5 style="font-weight: bold;">기업회원</h5>
            <hr>
            <div class="table-wrapper-scroll-y my-custom-scrollbar mb-5">
                <table class="table table-bordered table-striped mb-0 table-light">
                  <thead>
                    <tr style="height: 50px;">
                      <th scope="col" >No</th>
                      <th scope="col">ID</th>
                      <th scope="col">NAME</th>
                      <th scope="col">E-mail</th>
                      <th scope="col">PHONE</th>
                      <th scope="col">주소</th>
                      <th scope="col">인증</th>
                      <th scope="col">가입일</th>
                    </tr>
                  </thead>
                  <tbody>
                  	<c:forEach items="${c_agencyList}" var="c_agency" varStatus="status">
                    <tr>
                      <th scope="row">${status.count }</th>                      
                      <td class="fanId">${c_agency.fanId}</td>
                      <td >${c_agency.fanName}</td>
                      <td >${c_agency.email}</td>
                      <td >${c_agency.phone}</td>
                      <td >${c_agency.address}</td>
                      <td >
                      	<c:if test="${c_agency.certification eq 'true'}">Y</c:if>
                      </td>
                      <td ><fmt:formatDate value="${c_agency.enrollDate}" pattern="yyyy-MM-dd"/></td>
                    </tr>
                    </c:forEach>
                  </tbody>
                </table>
            </div>
        </div>
    </div>
</div>

<script> 
var swiper = new Swiper(".mySwiper", {
    slidesPerView: 4,
    spaceBetween: 30,
    slidesPerGroup: 4,
    loop: true,
    loopFillGroupWithBlank: true,
    navigation: {
      nextEl: ".swiper-button-next",
      prevEl: ".swiper-button-prev",
    },
  });
    function memberDelete(event){
        const target = event.target;
        const fanId = target.dataset.no;
        console.log(fanId);
		$.ajax({
			url:`${pageContext.request.contextPath}/admin/memberDelete/`+fanId,
			method:'delete',
			success: function (data){
				console.log("삭제 성공");
				alert("삭제 성공");
				location.reload();
			},
			error(xhr, statusText, err){
				console.log(statusText);
			}
		});
    }
    
    function artistDetail() {
        location.href="${pageContext.request.contextPath}/admin/adminArtistDetail"
    }
    function artistUpdate() {
        location.href="${pageContext.request.contextPath}/admin/adminArtistUpdate"
    }
    
    function agencyConfirm(event) {
        const target = event.target;
        const fanNo = target.dataset.no;
        console.log(fanNo);
		$.ajax({
			url:`${pageContext.request.contextPath}/admin/agencyUpdateCertification/`+fanNo,
			method:'put',
			success: function (data){
				console.log(data);
				alert("인증 확인 성공");
				location.reload();
			},
			error(xhr, statusText, err){
				console.log(statusText);
			}
			
		});
    }
    function agencyDelete() {
		$.ajax({
		});
			
    }
</script>
<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>
