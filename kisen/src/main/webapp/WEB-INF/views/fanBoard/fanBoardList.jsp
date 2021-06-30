<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>

<!-- bootstrap js: jquery load 이후에 작성할것.-->
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy" crossorigin="anonymous"></script>

<!-- bootstrap css -->
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.0/css/bootstrap.min.css" integrity="sha384-9gVQ4dYFwwWSjIDZnLEWnxCjeSWFphJiwGPXr1jddIhOegiu1FwO5qRGvFXOdJZ4" crossorigin="anonymous">

<!-- 사용자작성 css -->
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/fanBoard/fanBoardList.css" />
<script>
$(document).ready(function(){
	var idolNo = ${param.artistNo};
		$.ajax({
			url: "${pageContext.request.contextPath}/fanBoard/fanBoardList",
			method: "GET",
			data: {idolNo},
			success(data){
				console.log(data);
				const {list} = data;
				const {pageBar} = data;
				$("#pagingBar").append(pageBar);
				for(i=0; i<list.length; i++){
				$("#tBody").append(
					'<tr data-no="' + list[i].fbNo + '"> '
						+ '<th scope="row">' + (i + 1) + '</th>'
						+ '<td class="title">' + list[i].fbTitle + '</td>'
						+ '<td>' + list[i].fbWriter + '</td>'
						+ '<td>' + list[i].fbDate+ '</td>'
						+ '<td>' + list[i].fbReadCnt + '</td>'
					+ '</tr>');			
				if(list[i].hasAttachment){
					$(".title").append('&nbsp;' + '<img src="${pageContext.request.contextPath}/resources/images/fanBoard/attach.png" width="16px" alt="" />');
				};
				}
				$("tr[data-no]").click(e => {
					console.log(e.target);
					// tr에 적혀있는 data-no를 가져오기
					var $tr = $(e.target).parent();
					var no = $tr.data("no");
					location.href = "${pageContext.request.contextPath}/fanBoard/fanBoardDetail.do?no=" + no;
				});
			},
			error: console.log
		})
});

</script>
<div class="board-container">
  <!-- 글쓰기 버튼 -->
  <div class="enroll-btn">
  <button type="button" class="btn board-enroll-btn" onclick="location.href='${pageContext.request.contextPath}/fanBoard/fanBoardEnroll.do?idolNo=' + ${param.artistNo}">글쓰기</button>
    </div>
    <!-- 검색바 -->
    <div class="search-bar">
      <div class="input-group-prepend dropdown-container">
        <button class="btn dropdown-toggle" type="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">전체검색</button>
        <div class="dropdown-menu">
          <a class="dropdown-item" href="#">Action</a>
          <a class="dropdown-item" href="#">Another action</a>
          <a class="dropdown-item" href="#">Something else here</a>
          <div role="separator" class="dropdown-divider"></div>
          <a class="dropdown-item" href="#">Separated link</a>
        </div>
        <input type="text" id="search-text" name="search" placeholder="search">
        <img src="${pageContext.request.contextPath}/resources/images/fanBoard/search.png" id="search-img" alt="검색이미지">
    </div>
    </div>
  <!-- 공지사항 list 테이블 -->
  <table class="table">
    <thead class="thead-light">
      <tr>
        <th scope="col" class="col-1">번호</th>
        <th scope="col" class="col-6">제목</th>
        <th scope="col" class="col-2">작성자</th>
        <th scope="col" class="col-2">날짜</th>
        <th scope="col" class="col-1">조회수</th>
      </tr>
    </thead>
    <tbody id="tBody">
<%--     <c:forEach items="${list}" var="board">
      <tr>
        <th scope="row">${board.fbNo}</th>
        <td class="title">${board.fbTitle}</td>
        <td>gg</td>
        <td>@mdo</td>
        <td>@mdo</td>
      </tr>
    </c:forEach>  --%>
  </table>
  <!-- 페이징 바 -->
  <div id="pagingBar">
  
<!-- ¿  </div>
  <div class="paging-bar">
    <nav aria-label="Page navigation example">
      <ul class="pagination">
        <li class="page-item">
          <a class="page-link" href="#" aria-label="Previous">
            <span aria-hidden="true">&laquo;</span>
            <span class="sr-only">Previous</span>
          </a>
        </li>
        <li class="page-item"><a class="page-link" href="#">1</a></li>
        <li class="page-item"><a class="page-link" href="#">2</a></li>
        <li class="page-item"><a class="page-link" href="#">3</a></li>
        <li class="page-item"><a class="page-link" href="#">4</a></li>
        <li class="page-item"><a class="page-link" href="#">5</a></li>
        <li class="page-item">
          <a class="page-link" href="#" aria-label="Next">
            <span aria-hidden="true">&raquo;</span>
            <span class="sr-only">Next</span>
          </a>
        </li>
      </ul>
    </nav>
  </div>
</div> -->

