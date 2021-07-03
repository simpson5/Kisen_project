<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<jsp:include page="/WEB-INF/views/common/admin_header.jsp">
	<jsp:param value="모든 상품" name="title"/>
</jsp:include>

<style>
    .btn-main{
        background-color: #C8A9C8;
        color: white;
        font-weight: bold;
    }
    .notice{
        height: 600px;
        width: 100%;
    }
</style>

<div class="container">
    <h5 class="mt-5" style="font-weight: bold;">| NOTICE</h5>
    <hr>
    <table class="table">
        <thead>
            <tr>
                <th>SUBJECT</th>
                <th> ${notice.noticeTitle }</th>
            </tr>
            <tr>
                <th>WRITER</th>
                <th>${notice.noticeWriter }</th>
            </tr>
            <tr>
                <th>DATE</th>
                <th>${notice.uploadDate }</th>
            </tr>
        </thead>
        <tbody>
            <tr>
                <td colspan="2" class="text-center">
                	${notice.noticeContent}
                	<c:if test="${not empty notice.noticeImg.renamedFilename}">
		        	<img src="<c:url value='/resources/upload/notice/${notice.noticeImg.renamedFilename}'/>" class="card-img"  style="height: 100%">
                	</c:if>
                </td>
            </tr>
            <tr>
                <td colspan="2">
                <div class=" text-center">
                    <div class="mt-1 row">
                        <div class="col-6 d-grid">
                            <button type="button" class="btn btn-sm btn-dark" style="width: 100%;" onclick="goBack();">취소하기</button>
                        </div>
                        <div class="col-6 d-grid">
                            <button type="button" class="btn btn-sm btn-main" style="width: 100%;" onclick="noticeUpdate(event);" data-no="${notice.noticeNo}" >수정하기</button>
                        </div>
                    </div>
                </div>
                </td>
            </tr>
        </tbody>
    </table>
    <hr>
    <button type="button" class="btn btn-light" onclick="list();"> 목록</button>
    <hr>
    <div>
        <table class="table">
            <thead>
                <tr>
                    <td>다음글</td>
                    <td> 엑소 이벤트 공지사항입니다.</td>
                </tr>
        </table>
    </div>
</div>

<script>
function list(){
	location.href=`${pageContext.request.contextPath}/admin/adminNotice`
}
function noticeUpdate(event){
	const target = event.target;
	const noticeNo = target.dataset.no;
	location.href=`${pageContext.request.contextPath}/admin/adminNoticeUpdate/`+noticeNo
}
function goBack(){
	window.history.back();
}
</script>
<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>
