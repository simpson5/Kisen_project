<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<jsp:include page="/WEB-INF/views/common/admin_header.jsp">
	<jsp:param value="모든 상품" name="title"/>
</jsp:include>

<%-- 
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/adminAllProduct.css"> --%>
<div class="container ">
    <h2 class="text-center m-4" style="font-weight: bold;">상품 수정하기</h2>

    <div class="mb-4 row">
        <label class="col-md-3 col-form-label" for="pdName">상품명</label>
        <div class="col-md-9">
            <input type="text" class="form-control" name="pdName" id="pdName">
        </div>
    </div>
    <div class="mb-4 row">
        <label class="col-md-3 col-form-label" for="pdIdol">아이돌</label>
        <div class="col-md-9">
            <input type="text" class="form-control" name="pdIdol" id="pdIdol">
        </div>
    </div>

    <div class="mb-4 row">
        <label class="col-md-3 col-form-label" for="pdCategory">분류</label>
        <div class="col-md-9">
            <div class="row">
                <div class="col-auto">
                    <select name="officalProd" id="officalProd" class="form-select">
                        <option value="officalProd_goods"> 공식굿즈</option>
                    </select>
                </div>
                <!-- <div class="col-auto">
                    <select name="unOfficalProd" id="unOfficalProd" class="form-select">
                        <option value="unOfficalProd_goods"> 비공식굿즈</option>
                    </select>
                </div> -->
            </div>
        </div>
    </div>

    <div class="mb-4 row">
        <label class="col-md-3 col-form-label" for="pdContent">상품 설명</label>
        <div class="col-md-9">
            <textarea name="pdContent" id="pdContent"  rows="5" class="form-control"></textarea>
        </div>
    </div>
    <div class="mb-4 row">
        <label class="col-md-3 col-form-label" for="price">가격</label>
        <div class="col-md-9">
            <div class="input-group">
                <input type="number" class="form-control" name="price" id="price">
                <span class="input-group-text">원</span>
            </div>
        </div>
    </div>
    <div class="mb-4 row">
        <label class="col-md-3 col-form-label" for="price">배송비</label>
        <div class="col-md-9">
            <div class="input-group">
                <input type="number" class="form-control" name="price" id="price">
                <span class="input-group-text">원</span>
            </div>
        </div>
    </div>
    <div class="mb-4 row">
        <label class="col-md-3 col-form-label" for="pdStock">재고량</label>
        <div class="col-md-9">
            <input type="number" class="form-control" name="pdStock" id="pdStock">
        </div>
    </div>
    <div class="mb-4 row">
        <label class="col-md-3 col-form-label" for="pdSales">판매량</label>
        <div class="col-md-9">
            <input type="number" class="form-control" name="pdSales" id="pdSales">
        </div>
    </div>

    <!-- 이미지 -->
    <!-- 썸네일&대표 -->
    <div class="mb-4 row">
        <label class="col-md-3 col-form-label">대표 이미지</label>
        <div class="col-md-9">
            <input  type="file" class="form-control" id="formFile" accept="image/png,image/jpeg,image/jpg">
            <div class="alert alert-secondary" role="alert">
                <ul>
                    <li>이미지 사이즈 : 300 * 400px  </li>
                    <li>파일 사이즈 : 1M 이하</li>
                    <li>파일 확장자 : png,jpeg,jpg만 가능</li>
                </ul>
            </div>
            <img src="/images/kisen_logo.png" alt="" style="width: 300px;">
        </div>
    </div>

    <!-- 상품 설명 이미지 - 여러개 -->
    <div class="mb-4 row">
        <label class="col-md-3 col-form-label">상품 설명 이미지</label>
        <div class="col-md-9">
            <input  type="file" class="form-control" id="formFile" accept="image/png,image/jpeg,image/jpg">
            <div class="alert alert-secondary" role="alert">
                <ul>
                    <li>파일 사이즈 : 5M 이하</li>
                    <li>파일 확장자 : png,jpeg,jpg만 가능</li>
                </ul>
            </div>
            <img src="/images/kisen_logo.png" alt="" style="width: 300px;">
        </div>
    </div>
    <div class="container text-center">
        <div class="mb-4 row">
            <div class="col-6 d-grid p-1">
                <button type="button" class="btn btn-lg btn-dark" style="width: 100%;">취소하기</button>
            </div>
            <div class="col-6 d-grid p-1">
                <button type="button" class="btn btn-lg btn-main" style="width: 100%;" >저장하기</button>
            </div>
        </div>
    </div>
</div>

<script>
    function adminProductUpdate() {
        location.href="${pageContext.request.contextPath}/admin/adminProductUpdate"
    }
</script>
<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>
