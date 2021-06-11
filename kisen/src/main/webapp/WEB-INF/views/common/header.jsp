<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <script src="http://code.jquery.com/jquery-latest.min.js"></script>

    <!-- bootstrap js: jquery load 이후에 작성할것.-->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy" crossorigin="anonymous"></script>
    
    <!-- bootstrap css -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.0/css/bootstrap.min.css" integrity="sha384-9gVQ4dYFwwWSjIDZnLEWnxCjeSWFphJiwGPXr1jddIhOegiu1FwO5qRGvFXOdJZ4" crossorigin="anonymous">
    
	<title>${param.title}</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/header.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/footer.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/main.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/sideBanner.css">
</head>
<body>
    <header>
        <div class="box  ">
            <div class="d-none d-sm-block">  
                <ul class=" search-ul d-flex justify-content-end">
                    <li>
                        <a href="${pageContext.request.contextPath}/member/login.do">LOGIN </span></a>
                    </li>
                    <span class="divide">|</span>
                    <li>
                        <a href="${pageContext.request.contextPath}/member/signupTerm.do">JOIN</a>
                    </li>
                    <span class="divide">|</span>
                    <li >
                        <a href="${pageContext.request.contextPath}/mypage/mypage_pay.do">MYPAGE</a>
                    </li>
                    <span class="divide">|</span>
                    <li>
                        <a href="${pageContext.request.contextPath}/basket/cart.do">장바구니</a>
                    </li>
                </ul>
            </div>
          
        </div>
        <nav class="navbar navbar-expand-lg navbar-light bg-light  justify-content-center main-navbar">
            <a class="navbar-brand" href="#"><img src="${pageContext.request.contextPath}/resources/images/kisen_logo.png" alt="logo" id="logo"/></a>
            <span id="name">KI-SEN</span>
        
            <div class="d-none d-sm-block" > 
                <form class="form-inline my-2 my-lg-0">
                    <input class="form-control mr-sm-2" type="search" placeholder="Search" aria-label="Search">
                    <button class="btn my-2 my-sm-0" type="submit"><img src="${pageContext.request.contextPath}/resources/images/search.png" alt="search" id="search_img"></button>
                </form>
            </div>
            <div class="d-none d-lg-block searchlist-div"> 
                <ul class="searchList">
                    <li class="border border-secondary rounded">방탄소년단</li>
                    <li class="border border-secondary rounded">레드벨벳</li>
                    <li class="border border-secondary rounded">엑소</li>
                    <li class="border border-secondary rounded">NCT</li>
                    <li class="border border-secondary rounded">BTOB</li>
                </ul>
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
                            <a class="nav-link" href="${pageContext.request.contextPath}/">Home <span class="sr-only">(current)</span></a>
                        </li>
                        <li class="nav-item ">
                            <a class="nav-link" href="${pageContext.request.contextPath}/unoffical">비공식굿즈</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="#" onclick="artistClick()">아티스트별</a>
                        </li>
                        <li class="nav-item ">
                            <a class="nav-link" href="${pageContext.request.contextPath}/notice">NOTICE</a>
                        </li>
                    </ul>
                </div>
                <div class="d-block d-sm-none" >  
                    <ul class="menu-ul">
                        <li class="nav-item active ">
                            <a class="nav-link" href="${pageContext.request.contextPath}/">Home <span class="sr-only">(current)</span></a>
                        </li>
                        <li class="nav-item ">
                            <a class="nav-link" href="${pageContext.request.contextPath}/unoffical">비공식굿즈</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="${pageContext.request.contextPath}/offical">아티스트별</a>
                        </li>
                        <li class="nav-item ">
                            <a class="nav-link" href="${pageContext.request.contextPath}/notice">NOTICE</a>
                        </li>
                    </ul>
                </div>
                <div class="d-block d-sm-none" >  
                    <ul class="menu-ul">
                        <li>
                            <a href="${pageContext.request.contextPath}/login">LOGIN </span></a>
                        </li>
                        <li>
                            <a href="${pageContext.request.contextPath}/enroll">JOIN</a>
                        </li>
                        <li >
                            <a href="${pageContext.request.contextPath}/mypage">MYPAGE</a>
                        </li>
                        <li>
                            <a href="${pageContext.request.contextPath}/basket">장바구니</a>
                        </li>
                    </ul>
                </div>
            </div>
            
          </nav>
        <hr>
        <!-- 아티스트 리스트 메뉴 -->
        <div class="artistLisContainer d-none d-sm-block">
          <div class=" memu-div d-none d-sm-block" >  
              <ul class="d-flex justify-content-around menu-ul">
                  <li class="nav-item active "></li>
                  <li class="nav-item "> </li>
                  <li class="nav-item">
                    <div class="artistListDiv bg-light rounded"></div>
                  </li>
                  <li class="nav-item "></li>
              </ul>
          </div>
        </div>
    </header>


    <script>
      let count =0;
      function artistClick(){
          console.log("click")
          if(count%2 == 0){
              $(".artistLisContainer").css("visibility","visible");   
          }
          else{
              $(".artistLisContainer").css("visibility","hidden");  
          }
          count++;
      }
  </script>
  <section>