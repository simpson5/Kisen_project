<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<jsp:include page="/WEB-INF/views/common/header.jsp"></jsp:include>
    
 
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css" rel="stylesheet">
  <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
  <script src="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
  <link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.css" rel="stylesheet">
  <script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.js"></script>
    <title>reviewForm</title>
    <style>
        *{
            margin: 0;
            padding: 0;
        }
        #logo{
            height: 50px;;
        }
        ul li{
            list-style: none;
        }
        .searchList li{
            float: left;
            margin: 0.5rem;
            padding: 0.3rem 0.7rem;
        }
        .searchList{
            margin-bottom: 0;
        }
        #name{
            font-size: 25px;
            color: black;
            font-weight: bolder;
        }
        #search_img{
            height: 23px;
        }
        .box{
            margin-top: 0;
            height: 45px;
            background-color: #C8A9C8;
        }
        .search-ul{
            margin-right: 5rem;
            height: 29px;
            list-style: none;
        }
        .search-ul li{
            height: 80%;
            margin: 0.5rem 1rem 0 1rem;
        }       
        .search-ul li a{
            padding-top: 0.3rem;
            margin-top:  1rem;
        }
        a{
            color: black;
        }
        .navbar{
            float: none;
            margin: 0 auto;
            padding: 0.5rem 1rem ;
        }
        header{
            text-align: center;
        }
            /* position:absolute;
            left:50%;
            transform: translateX(-50%); */
        .main-navbar form{
            margin: 0 1rem 0 3.5rem; 
        }
        .main-navbar{   
            padding: 0.5rem 1rem ;
        }
        .divide{
            height: 80%;
            margin: 0.5rem 0.5rem 0 0.5rem;
        }
        .menu-ul{
            width: 100%;
            height: 100%;
            margin-bottom: 0;
        }

        footer{
            height: 200px;
        }
        .footer-introduce{
            width: 908px;

        }
        .footer-introduce li span{
            color: gray;
        }
        .footer-ul{
            margin: 1rem 2.5rem ;
            width: 250px;
        }
        .span-color{
            background-color: #39516A;
            color: whitesmoke;
            padding:   0 0.5rem ;
        }
        .span-color-h{
            background-color: #39516A;
            color: whitesmoke;
            padding:   0.1rem 0.5rem ;
            margin-bottom: 2rem;
        }
        header hr {
            margin: 0;
            border: 0;
            border-top: 1px solid rgba(0,0,0,.1);
        }
        .memu-div{
            width: 100%;
        }
        
        .btn-outline-warning {
    color:  #9033b5;
    background-color: transparent;
    background-image: none;
    border-color:  #9033b5;
 
}


.btn-outline-warning:hover{
    color:  white;
    background-color: #c7a2e0;
    background-image: none;
    border-color:  #c7a2e0;
}
    </style>

</head>
<body>
 
    
    <section>




<div class="form-group">
		<label for="title">title:</label> 
		<input type="text" class="form-control" placeholder="title" id="title" name="title">
	</div>
	<div class="form-group">
		<label for="content">content:</label>
		<textarea class="form-control" rows="5" id="summernote" name="content" style="width:100%"></textarea>
	</div>
 
 
   <div class="col-2" id="edit">
		      <div class="py-2">
		      	<button type="button" class="btn btn-outline-warning">글쓰기등록</button>
		      	
		      </div>
		      
	<script>
	$(document).ready(function() {
		//여기 아래 부분
		$('#summernote').summernote({
			  height: 300,                 // 에디터 높이
			  minHeight: null,             // 최소 높이
			  maxHeight: null,             // 최대 높이
			  focus: true,                  // 에디터 로딩후 포커스를 맞출지 여부
			  lang: "ko-KR",					// 한글 설정
			  placeholder: '최대 2048자까지 쓸 수 있습니다'	//placeholder 설정
	          
		});
	});
  </script>
  </div>
  </body>
  </section>
 

</html>
<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>
	