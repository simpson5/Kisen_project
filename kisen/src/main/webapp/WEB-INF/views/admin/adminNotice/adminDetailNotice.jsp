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
                <th> 엑소 이벤트 공지사항입니다.</th>
            </tr>
            <tr>
                <th>WRITER</th>
                <th>관리자</th>
            </tr>
            <tr>
                <th>DATE</th>
                <th>2021-05-21</th>
            </tr>
        </thead>
        <tbody>
            <tr>
                <td colspan="2">
                    <textarea class="notice" name="notice" readonly></textarea>
                </td>
            </tr>
            <tr>
                <td colspan="2">
                <div class=" text-center">
                    <div class="mt-1 row">
                        <div class="col-6 d-grid">
                            <button type="button" class="btn btn-sm btn-dark" style="width: 100%;">취소하기</button>
                        </div>
                        <div class="col-6 d-grid">
                            <button type="button" class="btn btn-sm btn-main" style="width: 100%;" onclick="artistUpdate();" >수정하기</button>
                        </div>
                    </div>
                </div>
                </td>
            </tr>
        </tbody>
    </table>
    <hr>
    <button type="button" class="btn btn-light"> 목록</button>
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
<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>
