<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<jsp:include page="/WEB-INF/views/common/agency_header.jsp">
	<jsp:param value="ARTIST 수정" name="title"/>
</jsp:include>
<div class="container ">
    <h2 class="text-center m-4" style="font-weight: bold;">ARTIST 수정하기</h2>

    <div class="mb-4 row">
        <label class="col-md-3 col-form-label" for="pdIdol">아이돌</label>
        <div class="col-md-9">
            <input type="text" class="form-control" name="pdIdol" id="pdIdol" readonly>
        </div>
    </div>

    <div class="mb-4 row">
        <label class="col-md-3 col-form-label" for="pdCategory">소속 기획사</label>
        <div class="col-md-9">
            <input type="text" class="form-control" name="pdCategory" id="pdCategory" readonly>
        </div>
    </div>

    <div class="mb-4 row">
        <label class="col-md-3 col-form-label" for="pdContent">MV 리스트</label>
        <div class="col-md-9">
            <textarea name="pdContent" id="pdContent"  rows="5" class="form-control" ></textarea>
        </div>
    </div>
    <div class="mb-4 row">
        <label class="col-md-3 col-form-label" for="price">상품수</label>
        <div class="col-md-9">
            <div class="input-group">
                <input type="number" class="form-control" name="price" id="price" readonly>
                <span class="input-group-text">원</span>
            </div>
        </div>
    </div>
    <div class="mb-4 row">
        <label class="col-md-3 col-form-label" for="price">팬수</label>
        <div class="col-md-9">
            <div class="input-group">
                <input type="number" class="form-control" name="price" id="price" readonly>
                <span class="input-group-text">원</span>
            </div>
        </div>
    </div>
    
    <div class="mb-4 row">
        <label class="col-md-3 col-form-label">대표 이미지</label>
        <div class="col-md-9">
            <input  type="file" class="form-control" id="formFile" accept="image/png,image/jpeg,image/jpg">
            <div class="alert alert-secondary" role="alert">
                <ul>
                    <li>이미지 사이즈 : 600 * 800px </li>
                    <li>파일 사이즈 : 1M 이하</li>
                    <li>파일 확장자 : png,jpeg,jpg만 가능</li>
                </ul>
            </div>
            <img src="/images/idol/bts.jpg" alt="" style="width: 300px;">
        </div>
    </div>
    <div class="container text-center">
        <div class="mb-4 row">
            <div class="col-6 d-grid p-1">
                <button type="button" class="btn btn-lg btn-dark" style="width: 100%;">취소하기</button>
            </div>
            <div class="col-6 d-grid p-1">
                <button type="button" class="btn btn-lg btn-main" style="width: 100%;" onclick="artistUpdate();" >수정하기</button>
            </div>
        </div>
    </div>
</div>

<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>
