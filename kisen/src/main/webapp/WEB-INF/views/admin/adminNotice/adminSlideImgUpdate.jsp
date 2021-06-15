<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<jsp:include page="/WEB-INF/views/common/admin_header.jsp">
	<jsp:param value="슬라이드 이미지 수정" name="title"/>
</jsp:include>

<style>
    .slideUpdate-img{
        width: 300px;
    }
    .btn-main {
        color: #fff;
        background-color: #C8A9C8;
        border-color: #C8A9C8;
    }
</style>
<div class="container ">
    <h2 class="text-center m-4" style="font-weight: bold;">Slide Image 수정하기</h2>
    <!-- 슬라이드 이미지 -->
    <h5 style="font-weight: bold;"> 현재 슬라이드 이미지 리스트</h5>
    <hr>
    <div class="text-center mb-5">
        <img src="${pageContext.request.contextPath}/resources/images/idol/bts.jpg" alt="" class="slideUpdate-img">
        <img src="${pageContext.request.contextPath}/resources/images/idol/itzy.png" alt="" class="slideUpdate-img" >
        <img src="${pageContext.request.contextPath}/resources/images/idol/monstax.jpg" alt="" class="slideUpdate-img">
    </div>

    <h5 style="font-weight: bold;">이미지 선택</h5>
    <hr>
    <div class="alert alert-secondary" role="alert">
        <ul>
            <li>이미지 사이즈 : 1100 * 400px </li>
            <li>파일 사이즈 : 1M 이하</li>
            <li>파일 확장자 : png,jpeg,jpg만 가능</li>
        </ul>
    </div>
    <!-- 상품 설명 이미지 - 여러개 -->
    <div class="mb-4 row">
        <label class="col-md-3 col-form-label">이미지 1</label>
        <div class="col-md-9">
            <input  type="file" class="form-control mb-2" id="formFile" accept="image/png,image/jpeg,image/jpg">
            <img src="${pageContext.request.contextPath}/resources/images/idol/bts.jpg" alt="" class="slideUpdate-img">
        </div>
    </div>
    <div class="mb-4 row">
        <label class="col-md-3 col-form-label">이미지 2</label>
        <div class="col-md-9">
            <input  type="file" class="form-control mb-2" id="formFile" accept="image/png,image/jpeg,image/jpg">
            <img src="${pageContext.request.contextPath}/resources/images/idol/itzy.png" alt="" class="slideUpdate-img">
        </div>
    </div>
    <div class="mb-4 row">
        <label class="col-md-3 col-form-label">이미지 3</label>
        <div class="col-md-9">
            <input  type="file" class="form-control mb-2" id="formFile" accept="image/png,image/jpeg,image/jpg">
            <img src="${pageContext.request.contextPath}/resources/images/idol/monstax.jpg" alt="" class="slideUpdate-img">
        </div>
    </div>
    <div class="container text-center">
        <div class="mb-4 row">
            <div class="col-6 d-grid p-1">
                <button type="button" class="btn btn-lg btn-dark" style="width: 100%;">취소하기</button>
            </div>
            <div class="col-6 d-grid p-1">
                <button type="button" class="btn btn-lg btn-main" style="width: 100%;" onclick="slideUpdate();" >수정하기</button>
            </div>
        </div>
    </div>
</div>

<script>
    function slideUpdate() {
        location.href="${pageContext.request.contextPath}/admin/slideUpdate"
    }
</script>
<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>
