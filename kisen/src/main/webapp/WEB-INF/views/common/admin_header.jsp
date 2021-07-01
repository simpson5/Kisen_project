<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!-- security관련 taglib -->
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>	
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
	<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.0/jquery.js"></script> 

    <!-- bootstrap js: jquery load 이후에 작성할것.-->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy" crossorigin="anonymous"></script>
    
    <!-- bootstrap css -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.0/css/bootstrap.min.css" integrity="sha384-9gVQ4dYFwwWSjIDZnLEWnxCjeSWFphJiwGPXr1jddIhOegiu1FwO5qRGvFXOdJZ4" crossorigin="anonymous">
    
	<title>${param.title}</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/header.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/footer.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/adminProduct.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/sideBanner.css">
    
	<!-- include summernote css/js-->
	<link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.css" rel="stylesheet">
	<script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.js"></script>
    
    
    <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/3.4.0/chart.min.js"></script> 
    
    <!-- swiper  -->
	<link rel="stylesheet" href="https://unpkg.com/swiper/swiper-bundle.min.css" />
 	<script src="https://unpkg.com/swiper/swiper-bundle.min.js"></script>
</head>
<body>
	
    <header>
        <div class="box  ">
            <div class="d-none d-sm-block">
                <ul class=" search-ul d-flex justify-content-end">
                	<!-- security : 로그인한 경우 -->
				    <sec:authorize access="isAuthenticated()">
                    	<li>
				    		<sec:authentication property="principal.username"/>님
                    	</li>
				    	<span class="divide">|</span>
				    	<li>
					    	<form:form class="d-inline"
					    				action="${pageContext.request.contextPath}/member/logout.do"
					    				method="POST">
				    			<button class="logout-btn" type="submit">LOGOUT</button>
				    		</form:form>
				    	</li>
				    	<span class="divide">|</span>
 	                    <li>
				    		<a href="${pageContext.request.contextPath}">HOME</a>
                    	</li>
			    	</sec:authorize>
                </ul>
            </div>
        </div>
        <nav class="navbar navbar-expand-lg navbar-light bg-light  justify-content-center main-navbar">
            <a class="navbar-brand" href="${pageContext.request.contextPath}/admin/adminMain.do"><img src="${pageContext.request.contextPath}/resources/images/kisen_logo.png" alt="logo" id="logo"/></a>
            <span id="name">KI-SEN</span>
        
            <div class="d-none d-sm-block" > 
                <form class="form-inline my-2 my-lg-0">
                    <input class="form-control mr-sm-2" type="search" placeholder="Search" aria-label="Search">
                    <button class="btn my-2 my-sm-0" type="submit"><img src="${pageContext.request.contextPath}/resources/images/search.png" alt="search" id="search_img"></button>
                </form>
            </div>
            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
            </button>
          </nav>

          <hr class="d-none d-lg-block ">
          <nav class="navbar navbar-expand-lg navbar-light bg-light menu-nav">
            <div class="collapse navbar-collapse" id="navbarSupportedContent">
                <div class=" memu-div d-none d-sm-block" >  
                    <ul class="d-flex justify-content-around menu-ul">
                        <li class="nav-item active ">
                            <a class="nav-link" href="${pageContext.request.contextPath}/admin/adminProduct">상품관리<span class="sr-only">(current)</span></a>
                        </li>
                        <li class="nav-item ">
                            <a class="nav-link" href="${pageContext.request.contextPath}/admin/adminMember">회원관리</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="${pageContext.request.contextPath}/admin/adminSales">결제/배송/매출</a>
                        </li>
                        <li class="nav-item ">
                            <a class="nav-link" href="${pageContext.request.contextPath}/admin/adminNotice">Site 관리</a>
                        </li>
                    </ul>
                </div>
                <div class="d-block d-sm-none" >  
                    <ul class="menu-ul">
                        <li class="nav-item active ">
                            <a class="nav-link" href="${pageContext.request.contextPath}/admin/adminProduct"> 상품관리<span class="sr-only">(current)</span></a>
                        </li>
                        <li class="nav-item ">
                            <a class="nav-link" href="${pageContext.request.contextPath}/admin/adminMember">아티스트/회원 관리</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="${pageContext.request.contextPath}/admin/adminSales">결제/배송/매출 </a>
                        </li>
                        <li class="nav-item ">
                            <a class="nav-link" href="${pageContext.request.contextPath}/admin/adminNotice">Site 관리</a>
                        </li>
                    </ul>
                </div>
            </div>
            
          </nav>
        <hr>
    </header>


    <!-- 관리자 메인페이지 -->
    <section>
    <c:if test="${not empty msg}">
		<div class="alert alert-warning alert-dismissible fade show" role="alert">
		  <strong>${msg}</strong>
		  <button type="button" class="close" data-dismiss="alert" aria-label="Close">
		    <span aria-hidden="true">&times;</span>
		  </button>
		</div>
	</c:if>