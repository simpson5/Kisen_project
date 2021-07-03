<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!-- security관련 taglib -->
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>   
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
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
                <c:forEach items="${slideImgList}" var="slideImg">
	                <div class="carousel-item idol">
						<img src="<c:url value='/resources/upload/slide/${slideImg.renamedFilename}'/>" class="card-img idol-img" alt="tree" style="height: 100%">
	                </div>
           		</c:forEach>
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
        <form 
		name="noticeFrm" 
		id="noticeSearchFrm" 
		action="${pageContext.request.contextPath}/admin/searchNotice"
		method ="get" class="d-flex justify-content-end">
            <input type="search" placeholder="제목을 입력하세요" name="search" style="margin-left: 2rem; width:200px;"  class="form-control me-2" >
            <button class="btn" type="button" onclick="searchClick();"><img src="${pageContext.request.contextPath }/resources/images/search.png" alt="" style="height: 25px"></button>
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
            <c:forEach items="${noticeList }" var="notice" varStatus="n">
	            <tr>
	                <td>${n.count}</td>
	                <td><a href="${pageContext.request.contextPath}/admin/adminNoticeDetail/${notice.noticeNo }"> ${notice.noticeTitle}</a></td>
	                <td>${notice.noticeWriter}</td>
	                <td>${notice.uploadDate}</td>
	                <td>${notice.readCnt}</td>
	                <td>
	                    <button type="button" class="btn btn-sm btn-danger" onclick="deleteNotice(event);" data-no="${notice.noticeNo}">삭제</button>
	                </td>
	            </tr>
        	</c:forEach>
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
	function deleteNotice(event){
        const target = event.target;
        const noticeNo= target.dataset.no;
        if(!confirm("정말 삭제하시겠습니까?")){
			return false;
        }
		$.ajax({
			url: `${pageContext.request.contextPath}/admin/noticeDelete/`+noticeNo,
			method : 'delete',
			success: function (data){
				console.log("삭제 성공");
				const {msg} = data;
				alert("삭제 성공");
				refreshMemList();
			},
			error(xhr, statusText, err){
				console.log(statusText);
			}
		});
	}

	function refreshMemList(){
		location.reload();
	}

	function searchClick(){
		const $search= $("input[name=search]");
		if($search.val() ==""){
			alert("검색어를 입력하세요");
			$search.focus();
			return false;
		}
		$("#noticeSearchFrm").submit();
	}
	$(document).ready(function(){
		$(".carousel-inner").children().first().addClass("active");
	});
</script>
<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>
