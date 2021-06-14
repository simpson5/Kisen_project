<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
</section>

<div class="d-flex flex-row-reverse">
    <div class="sideBanner rounded">
        <!-- 톡(카카오 상담) -->
        <img class="floating-img"  id="talk" src="data:image/svg+xml;base64,PHN2ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHZlcnNpb249IjEuMSIgeG1sbnM6eGxpbms9Imh0dHA6Ly93d3cudzMub3JnLzE5OTkveGxpbmsiIHhtbG5zOnN2Z2pzPSJodHRwOi8vc3ZnanMuY29tL3N2Z2pzIiB3aWR0aD0iNTEyIiBoZWlnaHQ9IjUxMiIgeD0iMCIgeT0iMCIgdmlld0JveD0iMCAwIDUxMi4wMTIgNTEyLjAxMiIgc3R5bGU9ImVuYWJsZS1iYWNrZ3JvdW5kOm5ldyAwIDAgNTEyIDUxMiIgeG1sOnNwYWNlPSJwcmVzZXJ2ZSIgY2xhc3M9IiI+PGc+PGcgeG1sbnM9Imh0dHA6Ly93d3cudzMub3JnLzIwMDAvc3ZnIj48cGF0aCBkPSJtMzMzLjIwMSAxMTUuMDM4Yy0yOC45MDUtNTkuMDIxLTg5LjM3LTk4LjA0Mi0xNTcuMTkzLTk4LjA0Mi05Ny4wNDcgMC0xNzYgNzguNTA1LTE3NiAxNzUgMCAyNi4yMjQgNS42MyA1MS4zNTkgMTYuNzQyIDc0Ljc5NGwtMTYuNDUxIDgyLjI2NWMtMi4wOTQgMTAuNDcyIDcuMTQ0IDE5LjcyOCAxNy42MTggMTcuNjU2bDgzLjI3OS0xNi40NjVjMTEuMjEzIDUuMzE5IDIyLjgxMyA5LjM2NCAzNC43MzIgMTIuMTUxLTI2LjcxNy0xMjYuNTQxIDY5LjE5OS0yNDUuMzIxIDE5Ny4yNzMtMjQ3LjM1OXoiIGZpbGw9IiNmM2M1MTIiIGRhdGEtb3JpZ2luYWw9IiMwMDAwMDAiIHN0eWxlPSIiIGNsYXNzPSIiPjwvcGF0aD48cGF0aCBkPSJtNDk1LjI2NiAzOTQuNzljMi44NzQtNi4wNjEgNS4zNzMtMTIuMjM3IDcuNTExLTE4LjUxNGgtLjU0OWMzNy40NDgtMTA5LjkxNy00MS4zMDUtMjI1LjQ0MS0xNTcuNTY3LTIzMS4wNjYtLjAwMi0uMDA2LS4wMDMtLjAxMi0uMDA1LS4wMTgtMTAwLjAzNi00LjYxLTE4My4xNDggNzUuNDg2LTE4My4xNDggMTc0LjgwNCAwIDk2LjQxNCA3OC4zNjEgMTc0Ljg1NyAxNzQuNzQzIDE3NC45OTcgMjYuMTQzLS4wMzUgNTEuMjAxLTUuNjYzIDc0LjU2OC0xNi43NDcgOTEuMjA3IDE4LjAzMiA4NC4wOTQgMTYuNzUgODYuMTg5IDE2Ljc1IDkuNDc5IDAgMTYuNTYtOC42ODYgMTQuNzA5LTE3Ljk0MXoiIGZpbGw9IiNmM2M1MTIiIGRhdGEtb3JpZ2luYWw9IiMwMDAwMDAiIHN0eWxlPSIiIGNsYXNzPSIiPjwvcGF0aD48L2c+PC9nPjwvc3ZnPg==" />
        <!-- 하트(관심아이돌) -->
        <img  class="floating-img" id="heart" src="data:image/svg+xml;base64,PHN2ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHZlcnNpb249IjEuMSIgeG1sbnM6eGxpbms9Imh0dHA6Ly93d3cudzMub3JnLzE5OTkveGxpbmsiIHhtbG5zOnN2Z2pzPSJodHRwOi8vc3ZnanMuY29tL3N2Z2pzIiB3aWR0aD0iNTEyIiBoZWlnaHQ9IjUxMiIgeD0iMCIgeT0iMCIgdmlld0JveD0iMCAwIDUxMS42MjYgNTExLjYyNiIgc3R5bGU9ImVuYWJsZS1iYWNrZ3JvdW5kOm5ldyAwIDAgNTEyIDUxMiIgeG1sOnNwYWNlPSJwcmVzZXJ2ZSIgY2xhc3M9IiI+PGc+CjxnIHhtbG5zPSJodHRwOi8vd3d3LnczLm9yZy8yMDAwL3N2ZyI+Cgk8cGF0aCBkPSJNNDc1LjM2Niw3MS45NDljLTI0LjE3NS0yMy42MDYtNTcuNTc1LTM1LjQwNC0xMDAuMjE1LTM1LjQwNGMtMTEuOCwwLTIzLjg0MywyLjA0Ni0zNi4xMTcsNi4xMzYgICBjLTEyLjI3OSw0LjA5My0yMy43MDIsOS42MTUtMzQuMjU2LDE2LjU2MmMtMTAuNTY4LDYuOTQ1LTE5LjY1LDEzLjQ2Ny0yNy4yNjksMTkuNTU2Yy03LjYxLDYuMDkxLTE0Ljg0NSwxMi41NjQtMjEuNjk2LDE5LjQxNCAgIGMtNi44NTQtNi44NS0xNC4wODctMTMuMzIzLTIxLjY5OC0xOS40MTRjLTcuNjE2LTYuMDg5LTE2LjcwMi0xMi42MDctMjcuMjY4LTE5LjU1NmMtMTAuNTY0LTYuOTUtMjEuOTg1LTEyLjQ2OC0zNC4yNjEtMTYuNTYyICAgYy0xMi4yNzUtNC4wODktMjQuMzE2LTYuMTM2LTM2LjExNi02LjEzNmMtNDIuNjM3LDAtNzYuMDM5LDExLjgwMS0xMDAuMjExLDM1LjQwNEMxMi4wODcsOTUuNTUsMCwxMjguMjg2LDAsMTcwLjE2ICAgYzAsMTIuNzUzLDIuMjQsMjUuODkxLDYuNzExLDM5LjM5OGM0LjQ3MSwxMy41MTQsOS41NjYsMjUuMDMxLDE1LjI3NSwzNC41NDZjNS43MDgsOS41MTQsMTIuMTgxLDE4Ljc5MiwxOS40MTQsMjcuODM0ICAgYzcuMjMzLDkuMDQxLDEyLjUxOSwxNS4yNzIsMTUuODQ2LDE4LjY5OGMzLjMzLDMuNDI2LDUuOTQ4LDUuOTAzLDcuODUxLDcuNDI3TDI0My4yNSw0NjkuOTM4ICAgYzMuNDI3LDMuNDI2LDcuNjE0LDUuMTQ0LDEyLjU2Miw1LjE0NHM5LjEzOC0xLjcxOCwxMi41NjMtNS4xNDRsMTc3Ljg3LTE3MS4zMWM0My41ODgtNDMuNTgsNjUuMzgtODYuNDA2LDY1LjM4LTEyOC40NzIgICBDNTExLjYyNiwxMjguMjc5LDQ5OS41NCw5NS41NDYsNDc1LjM2Niw3MS45NDl6IE00MjEuNDA1LDI3MS43OTVMMjU1LjgxMyw0MzEuMzkxTDg5LjkzOCwyNzEuNTA3ICAgQzU0LjM0NCwyMzUuOTIyLDM2LjU1LDIwMi4xMzMsMzYuNTUsMTcwLjE1NmMwLTE1LjQxNSwyLjA0Ni0yOS4wMjYsNi4xMzYtNDAuODI0YzQuMDkzLTExLjgsOS4zMjctMjEuMTc3LDE1LjcwMy0yOC4xMjQgICBjNi4zNzctNi45NDksMTQuMTMyLTEyLjYwNywyMy4yNjgtMTYuOTg4YzkuMTQxLTQuMzc3LDE4LjA4Ni03LjMyOCwyNi44NC04Ljg1YzguNzU0LTEuNTIsMTguMDc5LTIuMjgxLDI3Ljk3OC0yLjI4MSAgIGM5Ljg5NiwwLDIwLjU1NywyLjQyNCwzMS45NzcsNy4yNzljMTEuNDE4LDQuODUzLDIxLjkzNCwxMC45NDQsMzEuNTQ1LDE4LjI3MWM5LjYxMyw3LjMzMiwxNy44NDUsMTQuMTgzLDI0LjcsMjAuNTU3ICAgYzYuODUxLDYuMzgsMTIuNTU5LDEyLjIyOSwxNy4xMjgsMTcuNTU5YzMuNDI0LDQuMTg5LDguMDkxLDYuMjgzLDEzLjk4OSw2LjI4M2M1LjksMCwxMC41NjItMi4wOTQsMTMuOTktNi4yODMgICBjNC41NjgtNS4zMywxMC4yOC0xMS4xODIsMTcuMTMxLTE3LjU1OWM2Ljg1Mi02LjM3NCwxNS4wODUtMTMuMjIyLDI0LjY5NC0yMC41NTdjOS42MTMtNy4zMjcsMjAuMTI5LTEzLjQxOCwzMS41NTMtMTguMjcxICAgYzExLjQxNi00Ljg1NCwyMi4wOC03LjI3OSwzMS45NzctNy4yNzlzMTkuMjE5LDAuNzYxLDI3Ljk3NywyLjI4MWM4Ljc1NywxLjUyMSwxNy43MDIsNC40NzMsMjYuODQsOC44NSAgIGM5LjEzNyw0LjM4LDE2Ljg5MiwxMC4wNDIsMjMuMjY3LDE2Ljk4OGM2LjM3Niw2Ljk0NywxMS42MTIsMTYuMzI0LDE1LjcwNSwyOC4xMjRjNC4wODYsMTEuNzk4LDYuMTMyLDI1LjQwOSw2LjEzMiw0MC44MjQgICBDNDc1LjA3OCwyMDIuMTMzLDQ1Ny4xOSwyMzYuMDE2LDQyMS40MDUsMjcxLjc5NXoiIGZpbGw9IiNmZjAwMDAiIGRhdGEtb3JpZ2luYWw9IiMwMDAwMDAiIHN0eWxlPSIiPjwvcGF0aD4KPC9nPgo8ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciPgo8L2c+CjxnIHhtbG5zPSJodHRwOi8vd3d3LnczLm9yZy8yMDAwL3N2ZyI+CjwvZz4KPGcgeG1sbnM9Imh0dHA6Ly93d3cudzMub3JnLzIwMDAvc3ZnIj4KPC9nPgo8ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciPgo8L2c+CjxnIHhtbG5zPSJodHRwOi8vd3d3LnczLm9yZy8yMDAwL3N2ZyI+CjwvZz4KPGcgeG1sbnM9Imh0dHA6Ly93d3cudzMub3JnLzIwMDAvc3ZnIj4KPC9nPgo8ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciPgo8L2c+CjxnIHhtbG5zPSJodHRwOi8vd3d3LnczLm9yZy8yMDAwL3N2ZyI+CjwvZz4KPGcgeG1sbnM9Imh0dHA6Ly93d3cudzMub3JnLzIwMDAvc3ZnIj4KPC9nPgo8ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciPgo8L2c+CjxnIHhtbG5zPSJodHRwOi8vd3d3LnczLm9yZy8yMDAwL3N2ZyI+CjwvZz4KPGcgeG1sbnM9Imh0dHA6Ly93d3cudzMub3JnLzIwMDAvc3ZnIj4KPC9nPgo8ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciPgo8L2c+CjxnIHhtbG5zPSJodHRwOi8vd3d3LnczLm9yZy8yMDAwL3N2ZyI+CjwvZz4KPGcgeG1sbnM9Imh0dHA6Ly93d3cudzMub3JnLzIwMDAvc3ZnIj4KPC9nPgo8L2c+PC9zdmc+" />
        <!-- 장바구니 -->
        <img  class="floating-img"  id="basket" src="data:image/svg+xml;base64,PHN2ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHZlcnNpb249IjEuMSIgeG1sbnM6eGxpbms9Imh0dHA6Ly93d3cudzMub3JnLzE5OTkveGxpbmsiIHhtbG5zOnN2Z2pzPSJodHRwOi8vc3ZnanMuY29tL3N2Z2pzIiB3aWR0aD0iNTEyIiBoZWlnaHQ9IjUxMiIgeD0iMCIgeT0iMCIgdmlld0JveD0iMCAwIDUxMiA1MTIiIHN0eWxlPSJlbmFibGUtYmFja2dyb3VuZDpuZXcgMCAwIDUxMiA1MTIiIHhtbDpzcGFjZT0icHJlc2VydmUiPjxnPjxnIHhtbG5zPSJodHRwOi8vd3d3LnczLm9yZy8yMDAwL3N2ZyI+PHBhdGggZD0ibTMzNy4wMzQgNDIwLjc5NmMuODM1LjEzOSAxLjY2NS4yMDcgMi40ODQuMjA3IDcuMiAwIDEzLjU1NS01LjIgMTQuNzc4LTEyLjUzN2wxNS05MGMxLjM2Mi04LjE3MS00LjE1OC0xNS45LTEyLjMzLTE3LjI2Mi04LjE3Mi0xLjM2Ni0xNS45IDQuMTU4LTE3LjI2MiAxMi4zM2wtMTUgOTBjLTEuMzYyIDguMTcyIDQuMTU4IDE1LjkwMSAxMi4zMyAxNy4yNjJ6IiBmaWxsPSIjMDAwMDAwIiBkYXRhLW9yaWdpbmFsPSIjMDAwMDAwIiBzdHlsZT0iIj48L3BhdGg+PHBhdGggZD0ibTE1OC43MDQgNDA4LjQ2NmMxLjIyMyA3LjMzNyA3LjU3NyAxMi41MzcgMTQuNzc4IDEyLjUzNy44MTkgMCAxLjY0OS0uMDY3IDIuNDg0LS4yMDcgOC4xNzItMS4zNjIgMTMuNjkyLTkuMDkgMTIuMzMtMTcuMjYybC0xNS05MGMtMS4zNjItOC4xNzItOS4wODktMTMuNjkxLTE3LjI2Mi0xMi4zMy04LjE3MiAxLjM2Mi0xMy42OTIgOS4wOS0xMi4zMyAxNy4yNjJ6IiBmaWxsPSIjMDAwMDAwIiBkYXRhLW9yaWdpbmFsPSIjMDAwMDAwIiBzdHlsZT0iIj48L3BhdGg+PHBhdGggZD0ibTQ5NyAxODFoLTUyLjc5MWwtMTE1LjQ5Ni0xNDQuMzdjLTUuMTc0LTYuNDY3LTE0LjYxMy03LjUxOC0yMS4wODMtMi4zNDItNi40NjkgNS4xNzUtNy41MTggMTQuNjE0LTIuMzQyIDIxLjA4M2wxMDAuNTAzIDEyNS42MjloLTI5OS41ODJsMTAwLjUwNC0xMjUuNjI5YzUuMTc1LTYuNDY5IDQuMTI2LTE1LjkwOS0yLjM0Mi0yMS4wODMtNi40Ny01LjE3Ni0xNS45MDktNC4xMjYtMjEuMDgzIDIuMzQybC0xMTUuNDk3IDE0NC4zN2gtNTIuNzkxYy04LjI4NCAwLTE1IDYuNzE2LTE1IDE1djYwYzAgOC4yODQgNi43MTYgMTUgMTUgMTVoMTguNjg2bDU2Ljg5MiAxOTkuMTIxYzEuODM5IDYuNDQgNy43MjUgMTAuODc5IDE0LjQyMiAxMC44NzloMzAyYzYuNjk3IDAgMTIuNTgzLTQuNDM5IDE0LjQyMy0xMC44NzlsNTYuODkxLTE5OS4xMjFoMTguNjg2YzguMjg0IDAgMTUtNi43MTYgMTUtMTV2LTYwYzAtOC4yODQtNi43MTYtMTUtMTUtMTV6bS0xMDEuMzE0IDI3MGgtMjc5LjM3MmwtNTEuNDI4LTE4MGgzODIuMjI5em04Ni4zMTQtMjEwYy01MS4zODUgMC00MDMuMzIgMC00NTIgMHYtMzBoNDUyeiIgZmlsbD0iIzAwMDAwMCIgZGF0YS1vcmlnaW5hbD0iIzAwMDAwMCIgc3R5bGU9IiI+PC9wYXRoPjxwYXRoIGQ9Im0yNTYgNDIxYzguMjg0IDAgMTUtNi43MTYgMTUtMTV2LTkwYzAtOC4yODQtNi43MTYtMTUtMTUtMTVzLTE1IDYuNzE2LTE1IDE1djkwYzAgOC4yODUgNi43MTYgMTUgMTUgMTV6IiBmaWxsPSIjMDAwMDAwIiBkYXRhLW9yaWdpbmFsPSIjMDAwMDAwIiBzdHlsZT0iIj48L3BhdGg+PC9nPjwvZz48L3N2Zz4=" />
    </div>
</div> 
<hr>
<footer class="d-none d-lg-block ">
    <div class="footer-div d-flex justify-content-center">
        
        <ul class="footer-ul">
            <li> <h6> <span class="span-color-h">CS CENTER</span></h6></li>
            <li>전화번호</li>
            <li><span class="span-color rounded">상담시간</span> AM 10:00 ~ PM 17:00</li>
            <li><span class="span-color rounded">점심시간</span> PM 12:00 ~ PM 14:00</li>
            <li>토요일 일요일 공휴일 휴무</li>
            <li> E-mail : kisen@google.com</li>
        </ul>
    
    
        <ul class="footer-ul">
            <li><h6> <span class="span-color-h">회사소개</span></h6></li>
            <li> <a href="${pageContext.request.contextPath}/about/aboutus.do"> 회사소개</a></li>
            <li> <a href="${pageContext.request.contextPath}/about/location.do"> 오시는길</a></li>
            <li> <a href="${pageContext.request.contextPath}/notice"> 공지사항</a></li>
        </ul>
        
        <ul class="footer-ul">
            <li><h6> <span class="span-color-h">반품주소</span></h6></li>
            <li>  서울특별시 강남구 테헤란로10길 9 그랑프리 빌딩</li>
            <li> 반드시 지정택배사를 이용해 주세요.</li>
        </ul>
    </div>
    <hr>
    <div class="footer-div d-flex justify-content-center">
        <ul class="footer-introduce">
            <li> <span>회사명</span> KISEN  <span>대표전화</span> 0000-0000</li>
            <li> <span> 사업장주소</span> 서울특별시 강남구 테헤란로10길 9 그랑프리 빌딩</li>
            <li> <span>개인정보관리책임자</span>  KISEN(kisen@google.com)</li>
            <li> <span>쇼핑몰의 모든 제작물의 저작권은 </span> KISEN <span> 에 있으며, 무단복제나 도용은 저작권법(97조5항)에 의해 금지되어 있습니다.</span></li>
            <li>&lt;Copyright 2017. <strong>KI-SEN</strong>. All rights reserved.&gt; hosting by AWS</li>
        </ul>
    </div>

</footer>

<script src="${pageContext.request.contextPath}/resources/js/sideBanner.js"></script>
</body>
</html>