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
    <div class="card mb-3 item">
        <div class="row g-0 idol-img">
          <div class="col-4 idol-img">
            <div class="idol-img ">
                <img src="${pageContext.request.contextPath}/resources/images/idol/bts.jpg" class="card-img-top embed-responsive-item card-img" alt="tree">
            </div>
          </div>

          <div class="col-8">
            <div class="card-body">
                <h5 class="card-title">방탄소년단</h5>
                <p class="card-text"> 
                    <span class="badge bg-dark">공식굿즈</span>       <!-- 분류 -->
                    <span class="badge bg-dark">앨범</span>           <!-- 분류 -->
                    <span class="badge bg-s">재고 : 10000 </span>       
                    <span class="badge bg-s">판매량  : 10000</span>
                </p>
                <div class="btn-group" role="group" aria-label="Basic example">
                  <button type="button" class="btn btn-sm btn-outline-main"   onclick="productDetail();">상세보기</button>
                  <button type="button" class="btn btn-sm btn-outline-main"   onclick="productUpdate();">수정하기</button>
                </div>
            </div>
          </div>
        </div>
    </div>
    <div class="card mb-3 item">
        <div class="row g-0 idol-img">
            <div class="col-4 idol-img">
            <div class="idol-img ">
                <img src="${pageContext.request.contextPath}/resources/images/idol/itzy.png" class="card-img" alt="tree">
            </div>
            </div>
            <div class="col-8">
            <div class="card-body">
                <h5 class="card-title">ITZY</h5>
                <p class="card-text"> 
                  <span class="badge bg-dark">공식굿즈</span>       <!-- 분류 -->
                  <span class="badge bg-dark">앨범</span>           <!-- 분류 -->
                  <span class="badge bg-s">재고 : 10000 </span>       
                  <span class="badge bg-s">판매량  : 10000</span>
                </p>
                <div class="btn-group" role="group" aria-label="Basic example">
                  <button type="button" class="btn btn-sm btn-outline-main"   onclick="productDetail();">상세보기</button>
                  <button type="button" class="btn btn-sm btn-outline-main"   onclick="productUpdate();">수정하기</button>
                </div>
            </div>
            </div>
        </div>
    </div>
    <div class="card mb-3 item">
        <div class="row g-0 idol-img">
            <div class="col-4 idol-img">
            <div class="idol-img ">
                <img src="${pageContext.request.contextPath}/resources/images/idol/monstax.jpg" class="card-img" alt="tree">
            </div>
            </div>
            <div class="col-8">
            <div class="card-body">
                <h5 class="card-title">MONSTA X</h5>
                <p class="card-text"> 
                    <span class="badge bg-dark">공식굿즈</span>       <!-- 분류 -->
                    <span class="badge bg-dark">앨범</span>           <!-- 분류 -->
                    <span class="badge bg-s">재고 : 10000 </span>       
                    <span class="badge bg-s">판매량  : 10000</span>
                </p>
                <div class="btn-group" role="group" aria-label="Basic example">
                  <button type="button" class="btn btn-sm btn-outline-main"   onclick="productDetail();">상세보기</button>
                  <button type="button" class="btn btn-sm btn-outline-main"   onclick="productUpdate();">수정하기</button>
                </div>
            </div>
            </div>
        </div>
    </div>
    <div class="card mb-3 item">
        <div class="row g-0 idol-img">
            <div class="col-4 idol-img">
            <div class="idol-img ">
                <img src="${pageContext.request.contextPath}/resources/images/idol/nct.png" class="card-img" alt="tree">
            </div>
            </div>
            <div class="col-8">
            <div class="card-body">
                <h5 class="card-title">NCT</h5>
                <p class="card-text"> 
                    <span class="badge bg-dark">공식굿즈</span>       <!-- 분류 -->
                    <span class="badge bg-dark">앨범</span>           <!-- 분류 -->
                    <span class="badge bg-s">재고 : 10000 </span>       
                    <span class="badge bg-s">판매량  : 10000</span>
                </p>
                <div class="btn-group" role="group" aria-label="Basic example">
                  <button type="button" class="btn btn-sm btn-outline-main"   onclick="productDetail();">상세보기</button>
                  <button type="button" class="btn btn-sm btn-outline-main"   onclick="productUpdate();">수정하기</button>
                </div>
            </div>
            </div>
        </div>
    </div>
    <div class="card mb-3 item">
        <div class="row g-0 idol-img">
            <div class="col-4 idol-img">
            <div class="idol-img ">
                <img src="${pageContext.request.contextPath}/resources/images/idol/tiwce.png" class="card-img" alt="tree">
            </div>
            </div>
            <div class="col-8">
            <div class="card-body">
                <h5 class="card-title">TWICE</h5>
                <p class="card-text"> 
                    <span class="badge bg-dark">공식굿즈</span>       <!-- 분류 -->
                    <span class="badge bg-dark">앨범</span>           <!-- 분류 -->
                    <span class="badge bg-s">재고 : 10000 </span>       
                    <span class="badge bg-s">판매량  : 10000</span>
                </p>
                <div class="btn-group" role="group" aria-label="Basic example">
                  <button type="button" class="btn btn-sm btn-outline-main"   onclick="productDetail();">상세보기</button>
                  <button type="button" class="btn btn-sm btn-outline-main"   onclick="productUpdate();">수정하기</button>
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


<script>
    function productDetail() {
        location.href="${pageContext.request.contextPath}/admin/adminProductDetail"
    }
    function productUpdate() {
        location.href="${pageContext.request.contextPath}/admin/adminProductUpdate"
    }
</script>
<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>
