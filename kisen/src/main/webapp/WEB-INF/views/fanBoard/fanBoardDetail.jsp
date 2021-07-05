<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
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

<!-- 공유하기 -->
<script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>

<!-- 댓글창 높이 자동조절 -->
<script>
function resize(obj) {
    obj.style.height = '1px';
    obj.style.height = (12 + obj.scrollHeight) + 'px';
}
</script>
<script>
/**
* 조회수 1 증가
*/
window.onload = function () {
	var fbNo = ${fanBoard.fbNo};
	$.ajax({
		url: `${pageContext.request.contextPath}/fanBoard/updateFbReadCnt/\${fbNo}`,
		method: "PUT",
		contentType: "application/json; charset=utf-8",
		success(data){
			console.log(data);
			const {msg} = data;
			const {readCnt} = data;
			console.log(msg);
			console.log(readCnt);
			$(".read-cnt").html(readCnt);
		},
		error: console.log,
	});
}
</script> <!-- -->
<div class="move col-10 move-top">
   <c:if test="${loginMember.fanId eq fanBoard.fbWriter}">
   <form id="fbDeleteFrm">
       <button class="move-btn" name="list-board">삭제</button>
   </form>
       <button class="move-btn" name="list-board" onclick="location.href='${pageContext.request.contextPath}/fanBoard/fanBoardUpdate.do?fbNo=${fanBoard.fbNo}'">수정</button>
   </c:if>
    <button class="move-btn" name="list-board" onclick="location.href='${pageContext.request.contextPath}/artist/artistInfo.do?no=${fanBoard.idolNo}&fbActive=1'">목록</button>
</div>
<div class="board-container">
<!-- 게시글 정보 --> 
<div class="board-header">
    <div class="jumbotron-fluid">
        <div class="container">
          <p class="display-4 title">${fanBoard.fbTitle}</p>
          <input type="hidden" id="share-title" value="${fanBoard.fbTitle}"/>
          <input type="hidden" id="share-desc" value="${idolName}"/>
          <div class="left-container">
                  <span class="writer lead">${fanBoard.fbWriter}</span>
                  <span class="lead user-role">
                        </span>
                  <br>
              <span class="enroll-date lead">
                    <fmt:formatDate value="${fanBoard.fbDate}" pattern="yyyy-MM-dd HH:mm" />
              </span>&nbsp;|
              <span>조회 </span><span class="lead read-cnt"></span>
              <button type="button" style="float: right; font-size: 13px;" class="copy-btn btn btn-secondary btn-sm">URL복사</button>
          </div>
        </div>
      </div>
</div>

<hr>
<!-- 본문 부분 -->
<div class="board-section">
    <div class="board-attachment">
   <c:if test="${not empty fanBoard.attachList}">
    <c:forEach items="${fanBoard.attachList}" var="attach">
   <!-- attachment의 pk번호를 가지고 가도록 -->
      <a href="${pageContext.request.contextPath}/fanBoard/fileDownload.do?no=${attach.fbAttachNo}">
      <img class="text-center" style="max-width: 85%; margin-bottom: 10px;" src="${pageContext.request.contextPath}/resources/upload/fanBoard/${attach.renamedFilename}"/>
      </a>
   </c:forEach>
   </c:if>
    </div>
    <div class="board-content col-11">
      ${fanBoard.fbContent}
    </div>
    <div class="d-block" style="padding: 0 0 18px;">
    <div class="more col-11">
        <button type="button" id="share-btn" onClick="sendLinkDefault();" value="Default">
        <img style="width: 30px; transform: translateY(-2px);" src="${pageContext.request.contextPath}/resources/images/fanBoard/shareKakao.png"/>
        <span style="color: #3c1e1e;">카카오톡 공유하기</span>
        </button>
    </div>
    </div>
	<!--좋아요 버튼 -->
	<div class="d-inline like-container">
	<button type="button" class="btn_like d-inline">
	  <span class="img_emoti">좋아요</span>
	  <span class="ani_heart_m"></span>
	</button>
	  <span>좋아요 </span><span class="like-cnt">${fanBoard.fbLike}</span>
	</div>
</div>
<div class="board-footer">
<hr>
    <div class="footer-ext col-11">
        <img id="comment-img" src="${pageContext.request.contextPath}/resources/images/fanBoard/comment.png" alt="댓글 이미지">
        <span class="lead comment-cnt-text">댓글 ${commentCnt} </span>
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
                      <input type="submit" class="comment-submit" value="등록">
                    </div>
                  </div>
                </div> 
         </form>
           <div class="commented-section mt-2">
         <c:if test="${not empty commentList}">
            <c:forEach items="${commentList}" var="comment">
               <c:if test="${comment.commentLevel eq '1'}">
            	<hr />
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
                           <span class="dot ml-2"></span>
                           <button class="ml-2 mt-1 btn-reply button-reply"
                              name="reply-btn" value="${comment.commentNo}">답글쓰기</button>
                           <c:if test="${loginMember.fanId eq comment.writer}">
                           <button class="ml-2 mt-1 btn-reply button-delete-comment"
                              name="reply-btn" value="${comment.commentNo}">| 삭제하기</button>
                           </c:if>
                           <!-- 댓글 삭제하기를 처리할 폼 -->
							<form 
							id="fbCommentDelFrm"
							name="boardCommentDelFrm">
							<!-- name값으로 boardComment의 no -->
							<input type="hidden" name="commentNo" />
							</form>
                        </div>
                     </div>
                  </div>
               </c:if>
               <c:if test="${comment.commentLevel ne '1'}">
               <hr />
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
                           <span class="dot ml-2"></span>
                           <c:if test="${loginMember.fanId eq comment.writer}">
                           <button class="ml-2 mt-1 btn-reply button-delete-comment"
                              name="reply-btn" value="${comment.commentNo}"> 삭제하기</button>
                           </c:if>
                        </div>
                     </div>
                  </div>
               </c:if>
            </c:forEach>
         </c:if>
      </div>
    </div>
</div>
<hr style="width: 113%; transform: translateX(-54px); margin-top: 30px;"/>
<div class="move-bottom">
    <button class="move-btn board-enroll-btn" name="prev-board" onclick="location.href='${pageContext.request.contextPath}/fanBoard/fanBoardEnroll.do?idolNo=' + ${fanBoard.idolNo}">글쓰기</button>
    <button class="move-btn" name="prev-board" id="topBtn">▲ TOP</button>
    <button class="move-btn" name="list-board" onclick="location.href='${pageContext.request.contextPath}/artist/artistInfo.do?no=${fanBoard.idolNo}&fbActive=1'">목록</button>
</div>
<div class="list-container">
    <p><span>${idolName}</span> 게시판 글</p>
    <nav class="navbar navbar-expand-lg navbar-light">
        <div class="collapse navbar-collapse" id="navbarNav">
          <ul class="navbar-nav">
            <li class="nav-item active list-li board-nav">
              <button class="nav-btn" id="board-nav-btn" onclick="clickBoardNav()">팬게시판</button>
            </li>
          </ul>
        </div>
      </nav>
</div>
<c:if test="${not empty fbList}">
<table class="list-table table">
<tbody>
    <c:forEach items="${fbList}" var="fbList">
      <tr data-no="${fbList.fbNo}">
        <td style="width: 65%;" class="">${fbList.fbTitle}</td>
        <td>${fbList.fbWriter}</td>
        <td style="text-align: right;"><fmt:formatDate value="${fbList.fbDate}" pattern="yyyy.MM.dd."/></td>
      </tr>
   </c:forEach>
</tbody>
</table>
<div>${pageBar}</div>
</c:if>
<c:if test="${empty fbList}">
<table class="list-table table">
<tbody>
<tr data-no="${fbList.fbNo}">
  <td colspan="3" style="width: 60%;" class="">게시글이 없습니다.</td>
</tr>
</tbody>
</table>
</c:if>
</div>
</div>


<script>
/**
* 좋아요
*/
window.onload = function() { 
	var fbLikePoint = ${fbLikePoint};
	console.log(fbLikePoint);

	if(fbLikePoint == 1){
	       $('.btn_like').addClass('btn_unlike');
	       $('.ani_heart_m').removeClass('bye');
	}
}
	
$(document).on('click', '.btn_like', function(){

      if($(this).hasClass('btn_unlike')){
         
       $(this).removeClass('btn_unlike');
       $('.ani_heart_m').removeClass('hi');
       $('.ani_heart_m').addClass('bye');

       var fanId = `${loginMember.fanId}`;
       var fbNo = ${fanBoard.fbNo};
       
      console.log(fanId);
      console.log(fbNo);
      $.ajax({
          url: '${pageContext.request.contextPath}/fanBoard/fanBoardLikeCancel.do',
          method: "post",
          data: {fanId, fbNo},
          success(data){
             console.log(data);
             const {msg} = data;
             if(msg == '좋아요를 1 감소 하였습니다.'){
            	 $(".like-cnt").text(Number($(".like-cnt").text()) - 1);
             }
          },
          error(xhr, statusText, err){
             const {status} = xhr;
             switch(status){
                case 404: alert("좋아요 반영에 실패하였습니다."); break;
                default: alert("좋아요 반영에 실패하였습니다.");
             }
          },
          complete(){
             $(e.target)[0].reset();
          }
       });

     }
     else{

       // 좋아요 클릭
       $(this).addClass('btn_unlike');
       $('.ani_heart_m').addClass('hi');
       $('.ani_heart_m').removeClass('bye');

       var fanId = `${loginMember.fanId}`;
       var fbNo = ${fanBoard.fbNo};
       
      console.log(fanId);
      console.log(fbNo);
      $.ajax({
          url: '${pageContext.request.contextPath}/fanBoard/fanBoardLikeAdd.do',
          method: "post",
          data: {fanId, fbNo},
          success(data){
             console.log(data);
             const {msg} = data;
             if(msg == '좋아요를 1 증가 하였습니다.'){
            	 $(".like-cnt").text(Number($(".like-cnt").text()) + 1);
             }
          },
          error(xhr, statusText, err){
             const {status} = xhr;
             switch(status){
                case 404: alert("좋아요 반영에 실패하였습니다."); break;
                default: alert("좋아요 반영에 실패하였습니다.");
             }
          },
          complete(){
             $(e.target)[0].reset();
          }
       });
     }
});

</script>

<script>
/**
* 상세보기
*/
$("tr[data-no]").click(e => {
	console.log(e.target);
	// tr에 적혀있는 data-no를 가져오기
	var $tr = $(e.target).parent();
	var no = $tr.data("no");
	location.href = "${pageContext.request.contextPath}/fanBoard/fanBoardDetail.do?no=" + no;
});
</script>
<script>
/**
* top으로 이동
*/
var topEle = $('#topBtn');
var delay = 1000;
topEle.on('click', function() {
  $('html, body').stop().animate({scrollTop: 0}, delay);
});
</script>
<script>
/**
* 댓글 추가
*/
$("#fbCommentFrm").submit(e => {

	// 로그인 검사
	<c:if test="${empty loginMember}">
		alert("로그인 후 댓글을 등록하실 수 있습니다.");
		return false;
	</c:if>

	// 내용 검사
	var content = $("[name=content]");
	if(/^(.|\n)+$/.test(content.val()) == false){
		alert("답글의 내용을 입력하세요.");
		return false;
	}
	   
   e.preventDefault(); // 폼 제출 방지
   const $frm = $(e.target);

   const frmData = new FormData(e.target);

   const comment = {};
   frmData.forEach((value, key) => {
      comment[key] = value;
   });
   console.log(comment);

   $.ajax({
      url: "${pageContext.request.contextPath}/fanBoard/fbComment",
      data: JSON.stringify(comment),
      contentType: "application/json; charset=utf-8",
      method: "POST",
      success(data) {
         console.log(data);
         const {msg} = data;
         // location.href="";
         location.reload();
      },
      error: console.log, 
      complete(){
         e.target.reset(); // 폼초기화
      } 
   });
});
</script>

<script>
function cancelEnrollComment2(){
  $(".comment-level2-enroll").hide();
}
/**
* 답글 폼 제공
*/
$(".button-reply").click(function(e){

   var html = "<form name='fbReplyFrm'>";
   html += '<div class="add-comment-section comment-level2-enroll mt-4 mb-4">';
   html += '<input type="hidden" name="fbNo" value="${fanBoard.fbNo}" />';
   html += '<input type="hidden" name="commentLevel" value="2" />';
   html += '<input type="hidden" name="commentRef" value="' + $(this).val() + '" />';
   html += '<input  class="comment-writer" name="writer" value="${loginMember.fanId}"></input>';
   html += '<textarea id="newTweetContent" name="content" placeholder="답글을 남겨보세요." onkeydown="resize(this)" onkeyup="resize(this)"></textarea>';
   html += '<div class="comment-submit-div">';
   html += '<input type="button" class="comment-submit" onclick="cancelEnrollComment2()" value="취소">';
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
/**
* 답글 추가
*/
$(document).on('submit', '[name=fbReplyFrm]', function(e){
	
	<c:if test="${empty loginMember}">
	alert("로그인 후 댓글을 등록하실 수 있습니다.");
	return false;
	</c:if>

	// 내용 검사
	var content = $("[name=content]");
	if(/^(.|\n)+$/.test(content.val()) == false){
		alert("답글의 내용을 입력하세요.");
		return false;
	}
	

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
   const reply = {};
   frmData.forEach((value, key) => {
	   reply[key] = value;
   });
   console.log(reply);

   // data로 JSON문자열로 바뀐 값 전달 -> JSON문자열로 바뀌어서 텍스트로 날아감
   // json문자열로 보낼 때는 꼭 contentType 작성
   $.ajax({
      url: "${pageContext.request.contextPath}/fanBoard/fbReply",
      data: JSON.stringify(reply),
      contentType: "application/json; charset=utf-8",
      method: "POST",
      success(data) {
         console.log(data);
         const {msg} = data;
         // location.href="";
         location.reload();
      },
      error: console.log, 
      complete(){
         e.target.reset(); // 폼초기화
      } 
   });
});
</script>
<script>
/**
* 게시글 삭제
*/
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
         location.href="${pageContext.request.contextPath}/artist/artistInfo?no=${fanBoard.idolNo}&fbActive=1";
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

<script>
/* 댓글 삭제 */
$(".button-delete-comment").click(function(){
	if(confirm("해당 댓글을 삭제하시겠습니까?")){
		var $frm = $(document.boardCommentDelFrm);
		var commentNo = $(this).val(); // 삭제 button의 val를 가져옴
		// 어떤 댓글/답글에 대한 삭제버튼인지 가져와야 함
		// no의 value값을 buttonCommentNo로 세팅
		$frm.find("[name=commentNo]").val(commentNo);
		$frm.submit();
		}
	});

$("#fbCommentDelFrm").submit(e => {
   e.preventDefault();

   // 아이디값 알아내기
   const commentNo = $("[name=commentNo]").val();
   $.ajax({
      url: `${pageContext.request.contextPath}/fanBoard/fbCommentDelete/\${commentNo}`,
      method: "DELETE",
      success(data){
         console.log(data);
         const {msg} = data;
         location.reload();
      },
      error(xhr, statusText, err){
         const {status} = xhr;
         switch(status){
            case 404: alert("해당 댓글이 이미 존재하지 않습니다."); break;
            default: alert("댓글 삭제에 실패하였습니다.");
         }
      },
      complete(){
         $(e.target)[0].reset();
      }
   });
});
</script>
<script>
try {
  function sendLinkDefault() {

	var link = document.location.href; 
	console.log(link);

	var title = $("#share-title").val();
	var description = $("#share-desc").val();
	
    Kakao.init('0b0a650c17a45b81e69c4e56faa24227')
    Kakao.Link.sendDefault({
      objectType: 'feed',
      content: {
        title: title,
        description: '#' + description + ' #팬게시판 #키센 #K-POP 굿즈 종합 쇼핑몰',
        imageUrl:
          'https://postfiles.pstatic.net/MjAyMTA2MjVfMjk4/MDAxNjI0NjA5ODQzMDQx.LJecEdDc183KLHTb-4MIJZd0b3Wih7dquRSJaqLYc2Mg.4hjwxApg9j2nPHj9erBQn_gw6hJP86v3rIaNdi5bwgEg.PNG.dbs7wl7/kisen_logo.png?type=w773',
        link: {
          mobileWebUrl: link,
          webUrl: link,
        },
      },
      buttons: [
        {
          title: '웹으로 보기',
          link: {
            mobileWebUrl: link,
            webUrl: link,
          },
        },
        {
          title: '앱으로 보기',
          link: {
            mobileWebUrl: link,
            webUrl: link,
          },
        },
      ],
    })
  }
;
}
catch(e) {
	window.kakaoDemoException && window.kakaoDemoException(e)
}
</script>
<script>
//URL 복사
	function copyClip(url){
		var $temp = $('<input>');
		$('body').append($temp);
		$temp.val(url).select();
		document.execCommand('copy');
		$temp.remove();
		alert('URL이 복사되었습니다.');
	}
	$('.copy-btn').on('click', function(e){
		e.preventDefault();
		var link = location.href;
		copyClip(link);
	});
</script>