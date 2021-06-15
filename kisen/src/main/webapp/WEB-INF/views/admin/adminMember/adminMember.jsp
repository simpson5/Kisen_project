<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<jsp:include page="/WEB-INF/views/common/admin_header.jsp">
	<jsp:param value="회원/아티스트 관리" name="title"/>
</jsp:include>

<div class="container">
    <!-- 네비 (회원/아티스트) -->
    <div class="mt-3">
        <ul class="nav nav-tabs mb-3">
            <li  class="nav-item"><a href="#member" data-toggle="tab" class="nav-link active">회원관리</a></li>
            <li  class="nav-item"><a href="#artist" data-toggle="tab" class="nav-link">아티스트 관리</a></li>
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
                    <tr>
                      <th scope="col">No</th>
                      <th scope="col">ID</th>
                      <th scope="col">NAME</th>
                      <th scope="col">E-mail</th>
                      <th scope="col">PHONE</th>
                      <th scope="col">회원등급</th>
                      <th scope="col">인증상태</th>
                      <th scope="col">가입일</th>
                      <th scope="col">관리</th>
                    </tr>
                  </thead>
                  <tbody>
                    <tr>
                      <th scope="row">1</th>
                      <td>admin</td>
                      <td>관리자</td>
                      <td>admin@naver.com</td>
                      <td>01045276649</td>
                      <td>1</td>
                      <td>Y</td>
                      <td>2020.12.01</td>
                      <td>
                        <div class="btn-group container " role="group" aria-label="Basic example">
                          <button type="button" class="btn btn-sm btn-outline-main" onclick="memberDelete();">삭제</button>
                        </div>
                    </td>
                    </tr>
                  </tbody>
                </table>
            </div>
            <!-- 기업회원 승인 대기 리스트 -->
            <h5 style="font-weight: bold;" class="">기업회원 승인 대기</h5>
            <hr>
            <div class="slide-card  mb-5">
                <div id="carouselExampleControls-card2" class="carousel slide slide-img" data-ride="carousel">
                <div class="carousel-inner">
                    <div class="carousel-item active idol container">
                        <!-- card 1-1 -->
                        <div class="card col-xs-6" style="display: inline-block; width: 14.5rem;">
                            <div class="card-body ">
                                <h5 class="card-title" style="font-weight: bold;">SM</h5>
                                <p class="card-text"> 
                                  <p class="badge bg-s"> <strong>ID</strong> : companyMember</p>  
                                  <p class="badge bg-s"><strong>사업자번호</strong> : 0000-0000</p>
                                  <p class="badge bg-s"><strong>NAME</strong> : 에스엠</p>
                                  <p class="badge bg-s"><strong>E-mail</strong> : sment@gmail.com</p>
                                  <p class="badge bg-s"><strong>Phone</strong> : 02-9999-9999</p>
                                </p>
                                <div class="btn-group container " role="group" aria-label="Basic example">
                                  <button type="button" class="btn btn-sm btn-outline-main"  onclick="agencyConfirm();">인증확인</button>
                                  <button type="button" class="btn btn-sm btn-outline-main" onclick="agencyDelete();">삭제하기</button>
                                </div>
                            </div>
                        <!-- card End -->
                        </div>
                        <!-- card 1-1 -->
                        <div class="card col-xs-6" style="display: inline-block; width: 14.5rem;">
                            <div class="card-body ">
                                <h5 class="card-title" style="font-weight: bold;">JYP</h5>
                                <p class="card-text"> 
                                  <p class="badge bg-s"> <strong>ID</strong> : companyMember_JYP</p>  
                                  <p class="badge bg-s"><strong>사업자번호</strong> : 0000-0000</p>
                                  <p class="badge bg-s"><strong>NAME</strong> : 제와피</p>
                                  <p class="badge bg-s"><strong>E-mail</strong> : jypent@gmail.com</p>
                                  <p class="badge bg-s"><strong>Phone</strong> : 02-9999-9999</p>
                                </p>
                                <div class="btn-group container " role="group" aria-label="Basic example">
                                  <button type="button" class="btn btn-sm btn-outline-main"  onclick="agencyConfirm();">인증확인</button>
                                  <button type="button" class="btn btn-sm btn-outline-main" onclick="agencyDelete();">삭제하기</button>
                                </div>
                            </div>
                        <!-- card End -->
                        </div>
                        <!-- card 1-1 -->
                        <div class="card col-xs-6" style="display: inline-block; width: 14.5rem;">
                            <div class="card-body ">
                                <h5 class="card-title" style="font-weight: bold;">FnC</h5>
                                <p class="card-text"> 
                                  <p class="badge bg-s"> <strong>ID</strong> : companyMember_FnC</p>  
                                  <p class="badge bg-s"><strong>사업자번호</strong> : 0000-0000</p>
                                  <p class="badge bg-s"><strong>NAME</strong> : FnC</p>
                                  <p class="badge bg-s"><strong>E-mail</strong> : fncent@gmail.com</p>
                                  <p class="badge bg-s"><strong>Phone</strong> : 02-9999-9999</p>
                                </p>
                                <div class="btn-group container " role="group" aria-label="Basic example">
                                  <button type="button" class="btn btn-sm btn-outline-main"  onclick="agencyConfirm();">인증확인</button>
                                  <button type="button" class="btn btn-sm btn-outline-main" onclick="agencyDelete();">삭제하기</button>
                                </div>
                            </div>
                        <!-- card End -->
                        </div>
                        <!-- card 1-1 -->
                        <div class="card col-xs-6" style="display: inline-block; width: 14.5rem;">
                            <div class="card-body ">
                                <h5 class="card-title" style="font-weight: bold;">스타쉽</h5>
                                <p class="card-text"> 
                                  <p class="badge bg-s"> <strong>ID</strong> : companyMember_starship</p>  
                                  <p class="badge bg-s"><strong>사업자번호</strong> : 0000-0000</p>
                                  <p class="badge bg-s"><strong>NAME</strong> : 스타쉽</p>
                                  <p class="badge bg-s"><strong>E-mail</strong> : starent@gmail.com</p>
                                  <p class="badge bg-s"><strong>Phone</strong> : 02-9999-9999</p>
                                </p>
                                <div class="btn-group container " role="group" aria-label="Basic example">
                                  <button type="button" class="btn btn-sm btn-outline-main"  onclick="agencyConfirm();">인증확인</button>
                                  <button type="button" class="btn btn-sm btn-outline-main" onclick="agencyDelete();">삭제하기</button>
                                </div>
                            </div>
                        <!-- card End -->
                        </div>
                    </div>
                    <div class="carousel-item idol container">
                        <!-- card 1-1 -->
                        <div class="card col-xs-6" style="display: inline-block; width: 14.5rem;">
                            <div class="card-body ">
                                <h5 class="card-title">YG</h5>
                                <p class="card-text"> 
                                  <p class="badge bg-s"> <strong>ID</strong> : companyMemberYG</p>  
                                  <p class="badge bg-s"><strong>사업자번호</strong> : 0000-0000</p>
                                  <p class="badge bg-s"><strong>NAME</strong> : 와이지</p>
                                  <p class="badge bg-s"><strong>E-mail</strong> : ygent@gmail.com</p>
                                  <p class="badge bg-s"><strong>Phone</strong> : 02-9999-9999</p>
                                </p>
                                <div class="btn-group container" role="group" aria-label="Basic example">
                                  <button type="button" class="btn btn-sm btn-outline-main"  onclick="agencyConfirm();">인증확인</button>
                                  <button type="button" class="btn btn-sm btn-outline-main" onclick="agencyDelete();">삭제하기</button>
                                </div>
                            </div>
                        <!-- card End -->
                        </div> 
                    </div>
                </div>
                <a class="carousel-control-prev" href="#carouselExampleControls-card2" role="button" data-slide="prev">
                    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                    <span class="sr-only">Previous</span>
                </a>
                <a class="carousel-control-next" href="#carouselExampleControls-card2" role="button" data-slide="next">
                    <span class="carousel-control-next-icon" aria-hidden="true"></span>
                    <span class="sr-only">Next</span>
                </a>
                <!-- slide end -->
                </div>
            <!-- slide-card end -->
            </div>
            <!-- 승인완료된 기업회원 -->
            <h5 style="font-weight: bold;">기업회원</h5>
            <hr>
            <div class="table-wrapper-scroll-y my-custom-scrollbar mb-5">
                <table class="table table-bordered table-striped mb-0 table-light">
                  <thead>
                    <tr>
                      <th scope="col">No</th>
                      <th scope="col">ID</th>
                      <th scope="col">NAME</th>
                      <th scope="col">E-mail</th>
                      <th scope="col">PHONE</th>
                      <th scope="col">회원등급</th>
                      <th scope="col">인증상태</th>
                      <th scope="col">가입일</th>
                    </tr>
                  </thead>
                  <tbody>
                    <tr>
                      <th scope="row">1</th>
                      <td>admin</td>
                      <td>관리자</td>
                      <td>admin@naver.com</td>
                      <td>01045276649</td>
                      <td>1</td>
                      <td>Y</td>
                      <td>2020.12.01</td>
                    </tr>
                  </tbody>
                </table>
            </div>
        </div>
        <!-- 아티스트 tab -->
        <div class="tab-pane fade-in" id="artist">
            <div class="container">
                <div class="card mb-3 ">
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
    </div>
    <table>

    </table>
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
    function memberDelete(){
		$.ajax({
			
		});
    }
    
    function artistDetail() {
        location.href="${pageContext.request.contextPath}/admin/adminArtistDetail"
    }
    function artistUpdate() {
        location.href="${pageContext.request.contextPath}/admin/adminArtistUpdate"
    }
    
    function agencyConfirm() {
		$.ajax({
			
		});
    }
    function agencyDelete() {
		$.ajax({
			
		});
    }
</script>
<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>
