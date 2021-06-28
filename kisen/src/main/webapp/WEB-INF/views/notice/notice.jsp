<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!-- security관련 taglib -->
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>   
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<jsp:include page="/WEB-INF/views/common/header.jsp">
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
    <h5 style="font-weight: bold;" class="mt-5">NOTICE</h5>
    <hr>
    
    <div class="mt-4 ">
        <form:form 
		name="noticeFrm" 
		id="noticeSearchFrm" 
		action="${pageContext.request.contextPath}/notice/searchNotice"
		method ="get" class="d-flex justify-content-end">
            <input type="search" placeholder="제목을 입력하세요" name="search" style="margin-left: 2rem; width:200px;"  class="form-control me-2" >
            <button class="btn" type="button" onclick="searchClick();"><img src="${pageContext.request.contextPath }/resources/images/search.png" alt="" style="height: 25px"></button>
        </form:form>
    </div>
    <table class="table mt-4">
        <thead>
            <tr class="table-dark text-center">
                <th>번호</th>
                <th>제목</th>
                <th>작성자</th>
                <th>날짜</th>
                <th>조회수</th>
            </tr>
        </thead>
        <tbody class="text-center">
 			<c:if test="${empty noticeList }">
	            <tr>
	                <td colspan="5">조회된 공지사항이 없습니다.
	                	
            			<button class="btn btn-sm" type="button" onclick="resetClick();">초기화</button>
	                </td>
	            </tr>
 			</c:if>
            <c:forEach items="${noticeList }" var="notice" varStatus="n">
	            <tr>
	                <td>${n.count}</td>
	                <td><a href="${pageContext.request.contextPath}/notice/detail/${notice.noticeNo}"> ${notice.noticeTitle}</a></td>
	                <td>${notice.noticeWriter}</td>
	                <td>${notice.uploadDate}</td>
	                <td>${notice.readCnt}</td>
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
	
	$(document).ready(function(){
		$(".carousel-inner").children().first().addClass("active");
	});

	function searchClick(){
		const $search= $("input[name=search]");
		if($search.val() ==""){
			alert("검색어를 입력하세요");
			$search.focus();
			return false;
		}
		$("#noticeSearchFrm").submit();
	}
	function resetClick(){
        location.href=`${pageContext.request.contextPath}/notice`
	}
</script>
<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>
