<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<jsp:include page="/WEB-INF/views/common/admin_header.jsp">
	<jsp:param value="Site 관리" name="title"/>
</jsp:include>

<style>
    a{
        color: black;
    }
    .slideImage{
        margin-top: 4rem;
        font-weight: bold;
        display: inline-block;
    }
</style>
<div class="container">    
    <h5  class="slideImage">SLIDE IMAGES</h5>
    <button type="button" class="btn btn-sm btn-danger" onclick="slideImgUpdate();">수정</button>
    <hr>
    <div>
        <!-- 슬라이드 이미지 -->
        <div id="carouselExampleControls" class="carousel slide slide-img" data-ride="carousel">
            <div class="carousel-inner">
                <div class="carousel-item active idol" onclick="artistDetail();">
                    <img src="${pageContext.request.contextPath }/resources/images/idol/bts.jpg" class="d-block w-100 idol-img" alt="...">
                </div>
                <div class="carousel-item idol" onclick="artistDetail();">
                    <img src="${pageContext.request.contextPath }/resources/images/idol/itzy.png " class="d-block w-100 idol-img"  alt="...">
                </div>
                <div class="carousel-item idol" onclick="artistDetail();">
                    <img src="${pageContext.request.contextPath }/resources/images/idol/monstax.jpg" class="d-block w-100 idol-img " alt="...">
                </div>
                <div class="carousel-item idol" onclick="artistDetail();">
                    <img src="${pageContext.request.contextPath }/resources/images/idol/nct.png" class="d-block w-100 idol-img " alt="...">
                </div>
            </div>
            <a class="carousel-control-prev" href="#carouselExampleControls" role="button" data-slide="prev">
                <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                <span class="sr-only">Previous</span>
            </a>
            <a class="carousel-control-next" href="#carouselExampleControls" role="button" data-slide="next">
                <span class="carousel-control-next-icon" aria-hidden="true"></span>
                <span class="sr-only">Next</span>
            </a>
        <!-- slide end -->
        </div>
        
    </div>

    <h5 style="font-weight: bold;" class="mt-5">NOTICE</h5>
    <hr>
    <div class="mt-4">
        <form class="d-flex justify-content-center">
            <select class="form-select search-selected" aria-label="Default select example">
                <option selected>분류</option>
                <option value="1">구매자</option>
                <option value="2">상품명</option>
                <option value="3">운송장번호</option>
            </select>
            <input type="search" placeholder="Search" aria-label="Search" style="margin-left: 2rem; width: 150px"  class="form-control me-2" >
            <button class="btn" type="submit"><img src="/images/search.png" alt="" style="height: 25px"></button>
        </form>
    </div>
    <button type="button" class="btn btn-sm btn-secondary" onclick="enrollNotice();">글쓰기</button>
    <table class="table mt-4">
        <thead>
            <tr class="table-dark text-center">
                <th>번호</th>
                <th>제목</th>
                <th>작성자</th>
                <th>날짜</th>
                <th>조회수</th>
                <th>삭제</th>
            </tr>
        </thead>
        <tbody class="text-center">
            <tr>
                <td >3</td>
                <td><a href="#"> 엑소 이벤트 공지사항입니다.</a></td>
                <td>관리자</td>
                <td>2021.06.10 19:01</td>
                <td>10</td>
                <td>
                    <button type="button" class="btn btn-sm btn-danger" onclick="deleteNotice();">삭제</button>
                </td>
            </tr>
            <tr>
                <td>3</td>
                <td><a href="#"> 엑소 이벤트 공지사항입니다.</a></td>
                <td>관리자</td>
                <td>2021.06.10 19:01</td>
                <td>10</td>
                <td>
                    <button type="button" class="btn btn-sm btn-danger" onclick="deleteNotice();">삭제</button>
                </td>
            </tr>
        </tbody>
    </table>

    <hr>
</div>


<script>
	function slideImgUpdate() {
	    location.href="${pageContext.request.contextPath }/admin/adminSlideImgUpdate";
	}

	function enrollNotice(){
	    location.href="${pageContext.request.contextPath }/admin/adminNoticeEnroll";
	}
</script>
<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>
