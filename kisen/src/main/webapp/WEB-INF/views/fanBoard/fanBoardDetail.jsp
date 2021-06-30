<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param value="게시글 상세보기" name="title" />
</jsp:include>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>

<!-- bootstrap js: jquery load 이후에 작성할것.-->
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy" crossorigin="anonymous"></script>

<!-- bootstrap css -->
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.0/css/bootstrap.min.css" integrity="sha384-9gVQ4dYFwwWSjIDZnLEWnxCjeSWFphJiwGPXr1jddIhOegiu1FwO5qRGvFXOdJZ4" crossorigin="anonymous">

<!-- 사용자작성 css -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/fanBoard/fanBoardDetail.css" />

<link href='https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css'>
<script src='https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.bundle.min.js'></script>
<link href='https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css'>
<script src='https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js'></script>

<!-- 댓글창 높이 자동조절 -->
<script>
function resize(obj) {
    obj.style.height = '1px';
    obj.style.height = (12 + obj.scrollHeight) + 'px';
}
</script>
<div class="move col-10 move-top">
	<c:if test="${loginMember.fanId eq fanBoard.fbWriter}">
	<form id="fbDeleteFrm">
	    <button class="move-btn" name="list-board">삭제</button>
	</form>
	    <button class="move-btn" name="list-board" onclick="location.href='${pageContext.request.contextPath}/fanBoard/fanBoardUpdate.do?fbNo=${fanBoard.fbNo}'">수정</button>
	</c:if>
    <button class="move-btn" name="list-board" onclick="location.href='${pageContext.request.contextPath}/fanBoard/fanBoardListWithArtistInfo.do?artistNo=${fanBoard.idolNo}'">목록</button>
</div>
<div class="board-container">
<!-- 게시글 정보 -->
<div class="board-header">
    <div class="jumbotron-fluid">
        <div class="container">
          <p class="display-4 title">${fanBoard.fbTitle}</p>
          <div class="left-container">
                  <span class="writer lead">${fanBoard.fbWriter}</span>&nbsp;|
                  <span class="lead user-role">
                  		</span>
                  <br>
              <span class="enroll-date lead">
              		<fmt:formatDate value="${fanBoard.fbDate}" pattern="yyyy-MM-dd HH:mm" />
              </span>&nbsp;|
              <span class="lead read-cnt">조회 ${fanBoard.fbReadCnt}</span>
              <button type="button" style="float: right;" class="btn btn-secondary btn-sm">URL복사</button>
          </div>
        </div>
      </div>
</div>
<hr>
<!-- 본문 부분 -->
<div class="board-section">
    <div class="board-attachment">
    <c:forEach items="${fanBoard.attachList}" var="attach">
	<!-- attachment의 pk번호를 가지고 가도록 -->
		<a href="${pageContext.request.contextPath}/fanBoard/fileDownload.do?no=${attach.fbAttachNo}">
		<img class="text-center" style="max-width: 90%;" src="${pageContext.request.contextPath}/resources/upload/fanBoard/${attach.renamedFilename}"/>
		</a>
	</c:forEach>
    </div>
    <div class="board-content col-11">
		${fanBoard.fbContent}
    </div>
    <div class="more col-11">
        <a href=""><span id="more-id">${fanBoard.fbWriter}</span>님의 게시글 더보기 <span class="clamp">></span></a>
    </div>
</div>
<hr>
<div class="board-footer">
    <div class="footer-ext col-11">
        <img id="comment-img" src="${pageContext.request.contextPath}/resources/images/fanBoard/comment.png" alt="댓글 이미지">
        <span class="lead comment-cnt-text">댓글 2,413</span>
    </div>
    <!-- 댓글 -->
    <div class="container col-11 mb-5">
        <div class="d-flex justify-content-center row">
            <div class="d-flex flex-column comment-container" style="width: 100%;">
            <form
				name="fbCommentFrm"
				id="fbCommentFrm">
                <div class="coment-bottom">
                    <div class="add-comment-section mt-4 mb-4">
                      <input type="hidden" name="fbNo" value="${fanBoard.fbNo}" />
                      <input type="hidden" name="commentLevel" value="1" />
                      <input type="hidden" name="commentRef" value="0" />
                      <input type="text" class="comment-writer" name="writer" value="${loginMember.fanId}"></input>
                      <textarea id="newTweetContent" name="content" placeholder="댓글을 남겨보세요." onkeydown="resize(this)" onkeyup="resize(this)"></textarea>
                      <div class="comment-submit-div">
                      <input type="submit" class="comment-submit"value="등록">
                    </div>
                  </div>
                </div>
			</form>
                  <br>
           <div class="commented-section mt-2">
			<c:if test="${not empty commentList}">
				<c:forEach items="${commentList}" var="comment">
					<c:if test="${comment.commentLevel eq '1'}">
						<div class="commented-section mt-2" class="level1">
							<div class="d-flex flex-row align-items-center commented-user">
								<h5 class="mr-2">${comment.writer}</h5>
								<span class="dot mb-1"></span><span class="mb-1 ml-2">${comment.regDate}</span>
							</div>
							<div class="comment-text-sm">
								<span>${comment.content}</span>
							</div>
							<div class="reply-section">
								<div class="d-flex flex-row align-items-center voting-icons">
									<span class="ml-2">10</span> <span class="dot ml-2"></span>
									<button class="ml-2 mt-1 btn-reply"
										name="reply-btn" value="${comment.commentNo}">답글쓰기</button>
								</div>
							</div>
						</div>
					</c:if>
					<c:if test="${comment.commentLevel ne '1'}">
						<div class="commented-section comment-level2 mt-2">
							<div class="d-flex flex-row align-items-center commented-user">
								<h5 class="mr-2">${comment.writer}</h5>
								<span class="dot mb-1"></span><span class="mb-1 ml-2">${comment.regDate}</span>
							</div>
							<div class="comment-text-sm">
								<span>${comment.content}</span>
							</div>
							<div class="reply-section">
								<div class="d-flex flex-row align-items-center voting-icons">
									<i class="fa fa-sort-up fa-2x mt-3 hit-voting"></i> <i
										class="fa fa-sort-down fa-2x mb-3 hit-voting"></i>
								</div>
							</div>
						</div>
					</c:if>
				</c:forEach>
			</c:if>
		</div>
    </div>
</div>
<hr />
<div class="move">
    <button class="move-btn board-enroll-btn" name="prev-board" onclick="location.href='${pageContext.request.contextPath}/fanBoard/fanBoardEnroll.do?idolNo=' + ${fanBoard.idolNo}">글쓰기</button>
    <button class="move-btn" name="prev-board" id="topBtn">▲ TOP</button>
    <button class="move-btn" name="list-board" onclick="location.href='${pageContext.request.contextPath}/fanBoard/fanBoardListWithArtistInfo.do?artistNo=${fanBoard.idolNo}'">목록</button>
</div>
<div class="list-container">
    <p><span>블랙핑크</span> 게시판 글</p>
    <nav class="navbar navbar-expand-lg navbar-light">
        <div class="collapse navbar-collapse" id="navbarNav">
          <ul class="navbar-nav">
            <li class="nav-item active list-li board-nav">
              <button class="nav-btn" id="board-nav-btn" onclick="clickBoardNav()">팬게시판</button>
            </li>
          </ul>
        </div>
      </nav>
<table class="list-table table">
    <tbody>
      <tr>
        <td style="width: 60%;" class="">Mark</td>
        <td>Otto</td>
        <td>@mdo</td>
      </tr>
      <tr>
        <td style="width: 60%;" class="">Jacob</td>
        <td>Thornton</td>
        <td>@mdo</td>
      </tr>
      <tr>
        <td style="width: 60%;" class="">Larry</td>
        <td>the Bird</td>
        <td>@mdo</td>
      </tr>
    </tbody>
  </table>





  <div class="paging-bar">
  <nav aria-label="Page navigation">
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
      <li class="page-item">
        <a class="page-link" href="#" aria-label="Next">
          <span aria-hidden="true">&raquo;</span>
          <span class="sr-only">Next</span>
        </a>
      </li>
    </ul>
  </nav>
</div>
</div>
<script>
/**
* POST /menu
* post는 message body에 작성되기 때문에, url에 쓰지 않음
*/
$("#fbCommentFrm").submit(e => {
	e.preventDefault(); // 폼 제출 방지
	const $frm = $(e.target);

	// formData를 활용해서 객체만들기
	// formData를 사용하면 form안의 값을 쉽게 가져올 수 있음
	// formData 객체는 해당 폼 안의 데이터값을 고스란히 가지고 있음
	// but 보여주지 않음 -> 꺼내는 작업 필요
	const frmData = new FormData(e.target);
	// 빈 menu 객체 생성
	// -> json문자열로 만들기 위해, key, value속성을 menu객체에 옮겨담기
	// 이때, key - value 순이 아닌, value - key순으로 들어옴
	const comment = {};
	frmData.forEach((value, key) => {
		comment[key] = value;
	});
	console.log(comment);

	// data로 JSON문자열로 바뀐 값 전달 -> JSON문자열로 바뀌어서 텍스트로 날아감
	// json문자열로 보낼 때는 꼭 contentType 작성
	$.ajax({
		url: "${pageContext.request.contextPath}/fanBoard/fbComment",
		data: JSON.stringify(comment),
		contentType: "application/json; charset=utf-8",
		method: "POST",
		success(data) {
			console.log(data);
			const {msg} = data;
			alert(msg);
			location.href="";
		},
		error: console.log, 
		complete(){
			e.target.reset(); // 폼초기화
		} 
	});
});
</script>
<script>
var topEle = $('#topBtn');
var delay = 1000;
topEle.on('click', function() {
  $('html, body').stop().animate({scrollTop: 0}, delay);
});
</script>
<script>

function cancelEnrollComment2(){
  $(".comment-level2-enroll").hide();
}


$(".btn-reply").click(function(e){


	var html = "<form name='fbReplyFrm'>";
	html += '<div class="add-comment-section comment-level2-enroll mt-4 mb-4">';
	html += '<input type="hidden" name="fbNo" value="${fanBoard.fbNo}" />';
	html += '<input type="hidden" name="commentLevel" value="2" />';
	html += '<input type="hidden" name="commentRef" value="' + $(this).val() + '" />';
	html += '<input  class="comment-writer" value="${loginMember.fanId}"></input>';
	html += '<textarea id="newTweetContent" name="content" placeholder="답글을 남겨보세요." onkeydown="resize(this)" onkeyup="resize(this)"></textarea>';
	html += '<div class="comment-submit-div">';
	html += '<input type="submit" class="comment-submit" onclick="cancelEnrollComment2()" value="취소">';
	html += '<input type="submit" class="comment-submit" value="등록">';
	html += '</div>';
	html += '</div>';
	html += '</form>';

	// 버튼의 tr태그 찾기
	var $parentOfbtn = $(e.target).parent().parent().parent(); // 버튼의 parent(td), 그 td의 parent(tr)
	console.log($parentOfbtn);
	
	// 위에서 만든 html을 jQuery객체로 만든 후 insertAfter
	$(html)
		.insertAfter($parentOfbtn)
		.children("div")
		.slideDown(500);  // 버튼 태그가 속한 tr태그 다음요소로 html을 추가함
	
	// 버튼은 1회용으로 처리
	// 한번만 버튼이 생성되고 그 후로는 답글 버튼을 눌러도 답글폼이 만들어지지 않도록
	$(this).off("click"); // click 이벤트 핸들러를 막기 */
});

</script>

<script>
$("#fbDeleteFrm").submit(e => {
	e.preventDefault();

	// 아이디값 알아내기
	const fbNo = ${fanBoard.fbNo};
	$.ajax({
		url: `${pageContext.request.contextPath}/fanBoard/fanBoardDelete/\${fbNo}`,
		method: "DELETE",
		success(data){
			console.log(data);
			const {msg} = data;
			alert(msg);
			location.href="${pageContext.request.contextPath}/fanBoard/fanBoardListWithArtistInfo.do?artistNo=${fanBoard.idolNo}";
		},
		error(xhr, statusText, err){
			const {status} = xhr;
			switch(status){
				case 404: alert("해당 게시글이 이미 존재하지 않습니다."); break;
				default: alert("게시글 삭제에 실패하였습니다.");
			}
		},
		complete(){
			$(e.target)[0].reset();
		}
	});
});
</script>