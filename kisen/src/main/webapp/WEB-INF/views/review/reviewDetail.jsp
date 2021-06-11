<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param value="Review Detail" name="title" />
</jsp:include>



<div id="reviewdetail">
	<div id="reviewcontent">
		<div id="div">
			<div class="view">
				<input type="button" value="< 목록으로 이동" id="nv-view-btn" />
				
				<h2>너무 이뻐요!!!</h2>
				<p>2021.06.10 18:20</p>
			</div>
			<div class="review_contents">
				<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit.
					Doloremque quae id earum a fuga corporis asperiores non deleniti
					provident tempora saepe ducimus dicta vero. Delectus mollitia illo
					asperiores deleniti cupiditate.Lorem ipsum dolor sit amet,
					consectetur adipisicing elit. Quos voluptates quasi sit labore et
					itaque quia non veniam laborum magni repudiandae odit doloremque
					adipisci aut voluptatibus illum asperiores harum totam?</p>
				
			</div>

			<!-- 댓글 -->
			
				
				<div>
					<input type="button" value="답글" id="comment-btn" />
				</div>
				<div class="comment" id="comment">
					<textarea class="nv-c-comment" id="nv-c-comment"></textarea>
					<input type="button" value="등록" id="nv-c-comment-btn" />
				</div>
				<div class="comment">
					<div>
						<strong>id</strong> <span>kisen</span> <span>17시간전</span>
					</div>
					<div>
						<p>감사합니다!</p>
					</div>
				</div>
			</div>
		</div>
	</div>
	


<script>
$("#nv-view-btn").click(() => {
	location.href = "${pageContext.request.contextPath}/board/reviewboard.do"
});


$("#comment-btn").click(function(){
		//만일 Pop라는 녀석이 닫혀있다면??

        if(document.getElementById("comment").style.display=="none"){

           //열어주어라

           document.getElementById("comment").style.display='block'

        //그렇지 않은 모든 경우라면??

        }else{

           //닫아주어라

           document.getElementById("comment").style.display='none'

        }
});

</script>

<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>
