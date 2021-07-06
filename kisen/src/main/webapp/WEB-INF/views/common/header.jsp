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
<script>
window.onload = function() {
	$("#headerModal")
		.modal() // modal이 튀어나오는 함수
}
</script>
<head>
	<link rel="icon" type="image/png"  href="${pageContext.request.contextPath}/resources/images/kisen_logo.png""/>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <script src="http://code.jquery.com/jquery-latest.min.js"></script>

    <!-- bootstrap js: jquery load 이후에 작성할것.-->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy" crossorigin="anonymous"></script>
    
    <!-- bootstrap css -->
<!--     <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.0/css/bootstrap.min.css" integrity="sha384-9gVQ4dYFwwWSjIDZnLEWnxCjeSWFphJiwGPXr1jddIhOegiu1FwO5qRGvFXOdJZ4" crossorigin="anonymous"> -->
    
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
                   <!-- security : 로그인한 경우 -->
                <sec:authorize access="isAuthenticated()">
                <!-- property : principal.username -> 인증한 객체의 아이디 -->
                <li class="user-id">
                   <sec:authentication property="principal.username"/>
                <sec:authentication property="authorities" var="authority"/>
                <c:if test="${fn:contains(authority , 'ROLE_AGENCY')}">
	                <span class="divide">|</span>
                   <li>
                     <a href="${pageContext.request.contextPath}/agency/agencyMain.do">기획사</a>
                  </li>
                </c:if>
                <c:if test="${fn:contains(authority , 'ROLE_ADMIN')}">
	                <span class="divide">|</span>
                   <li>
                      <a href="${pageContext.request.contextPath}/admin/adminMain.do">관리자</a>
                   </li>
                </c:if>
                </sec:authorize>
                
                <!-- 소셜로그인 -->
                <!-- property : principal.username -> 인증한 객체의 아이디 
                
                안녕하세요 윤지님 저는 정문주 입니다 뭐라도 하나 수정해야 올라 갈거 같아서 써봤어용! 
                항상 열심히 하는 윤지님 화이팅 머져머쩌 남윤지
                저희 가장 열심히 했으니 공로상 줘야함
                -->
                <c:if test="${loginMember.oauth eq 'kakao' || loginMember.oauth eq 'google'}">
                <li class="user-id">
                   ${loginMember.fanId}
                </li>
                </c:if>
                <c:forEach items="${loginMemberAuthorities}" var="authorities" varStatus="vs">
                   <c:if test="${fn:contains(authorities.authority, 'ROLE_AGENCY')}">
                   <span class="divide">|</span>
                  <li>
                     <a href="${pageContext.request.contextPath}/agency/agencyMain.do">기획사</a>
                  </li>          
                   </c:if>
                   <c:if test="${fn:contains(authorities.authority, 'ROLE_ADMIN')}">
                   <span class="divide">|</span>
                  <li>
                     <a href="${pageContext.request.contextPath}/admin/adminMain.do">관리자</a>
                  </li>          
                   </c:if>
                </c:forEach>
                    
                <!-- security : 로그인하지 않은 경우 -->
                <c:if test="${loginMember.oauth ne 'kakao' && loginMember.oauth ne 'google'}">
                <sec:authorize access="isAnonymous()">
                <li>
                    <a href="${pageContext.request.contextPath}/member/login.do">LOGIN </span></a>
                </li>
                <span class="divide">|</span>
                <li>
                    <a href="${pageContext.request.contextPath}/member/signupTerm.do">JOIN</a>
                </li>
                </sec:authorize>
                </c:if>

                    
                    <span class="divide">|</span>
                    <li >
                        <a href="${pageContext.request.contextPath}/mypage/mypagePay.do">MYPAGE</a>
                    </li>
                    <span class="divide">|</span>
                    <li>
                        <a href="${pageContext.request.contextPath}/basket/cart.do">장바구니</a>
                    </li>
                    <span class="divide">|</span>
                    <sec:authorize access="isAuthenticated()">
                    <li>   
                   <form:form class="d-inline"
                            action="${pageContext.request.contextPath}/member/logout.do"
                            method="POST">
                      <button class="logout-btn" type="submit">LOGOUT</button>
                   </form:form>
                </li>
                    <span class="divide">|</span>
                    </sec:authorize>
                    <c:if test="${loginMember.oauth eq 'kakao' || loginMember.oauth eq 'google'}">
                    <li>   
                   <form:form class="d-inline"
                            action="${pageContext.request.contextPath}/member/logout.do"
                            method="POST">
                      <button class="logout-btn" type="submit">LOGOUT</button>
                   </form:form>
                </li>
                    </c:if>
                </ul>
            </div>
          
        </div>
        <nav class="navbar navbar-expand-lg navbar-light bg-light  justify-content-center main-navbar">
            <a class="navbar-brand" href="${pageContext.request.contextPath}/"><img src="${pageContext.request.contextPath}/resources/images/kisen_logo.png" alt="logo" id="logo"/></a>
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
                            <a class="nav-link" href="${pageContext.request.contextPath}/unofficial/unofficial.do">비공식굿즈</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" onclick="artistClick()">아티스트별</a>
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
                            <a class="nav-link" href="${pageContext.request.contextPath}/unofficial/unofficial.do">비공식굿즈</a>
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
                  <li class="nav-item"></li>
                  <li class="nav-item"> </li>
                  <li class="nav-item">
                    <div class="artistListDiv bg-light rounded text-start">
                        <ul id="list1" style="display: inline-block; margin: 0.3rem 2rem;">
                        	<!-- 12개 -->
                        </ul>
                        <ul id="list2" style="display: inline-block; margin: 0.3rem 2rem;">
                        </ul>
                        <ul id="list3" style="display: inline-block; margin: 0.3rem 2rem;">
                        </ul>
                        <ul id="list4" style="display: inline-block; margin: 0.3rem 2rem;">
                        </ul>
                    </div>
                  </li>
                  <li class="nav-item "></li>
              </ul>
          </div>
        </div>
    </header>
<c:if test="${not empty msg}">
  <div class="modal fade" id="headerModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog" role="document">
      <div class="modal-content">
        <div class="modal-header">
          <h5 class="modal-title" id="exampleModalLabel">KISEN</h5>
          <button type="button" class="close" data-dismiss="modal" aria-label="Close">
            <span aria-hidden="true">&times;</span>
          </button>
        </div>
        <div class="modal-body">
          ${msg}
        </div>
        <div class="modal-footer">
          <button type="button" data-dismiss="modal" class="btn btn-outline-secondary">확인</button>
        </div>
      </div>
    </div>
  </div>
</c:if>

<script>
let count =0;
function artistClick(){
    console.log("click")
    if(count%2 == 0){
        $(".artistLisContainer").css("visibility","visible");   
        searchIdol(count);
    }
    else{
        $(".artistLisContainer").css("visibility","hidden");  
    }
    count++;
}


function searchIdol(count){
    $.ajax({
        url : "${pageContext.request.contextPath}/artist/allArtist",
        method : "get",
        success(data){
            console.log(data);
            console.log(data.length);
            var $list1 = $("#list1");
            var $list2 = $("#list2");
            var $list3 = $("#list3");
            var $list4 = $("#list4");
            for(var i=0; i<data.length; i++) {
                var htmlStr = '<li><a href="${pageContext.request.contextPath}/artist/artistInfo?no='+data[i].idolNo+'" class="idolList text-start">'+data[i].idolName+'</a></li>';
                console.log(htmlStr);
                if( 0<i && i<12){
                    if(!$list1.hasClass("hasList"))
                        $list1.append(htmlStr);
                }
                
                else if(12<= i && i< 24){
                    if(!$list2.hasClass("hasList"))
                        $list2.append(htmlStr);
                }
                else if(24<= i && i< 36){
                    if(!$list3.hasClass("hasList"))
                        $list3.append(htmlStr);
                }
                else if(36<= i && i< 48){
                    if(!$list4.hasClass("hasList"))
                        $list4.append(htmlStr);
                }
            }
            if($list1.children('li'))
                $list1.addClass("hasList");
            if($list2.children('li'))
                $list2.addClass("hasList");
            if($list3.children('li'))
                $list3.addClass("hasList");
            if($list4.children('li'))
                $list4.addClass("hasList");
        },
        error : console.log
    });
}
</script>
  <section>