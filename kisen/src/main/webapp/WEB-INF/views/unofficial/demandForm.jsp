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
      <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.8.0/css/bootstrap-datepicker.css">
<script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.8.0/js/bootstrap-datepicker.js" charset = "UTF-8"></script>
<link
rel="stylesheet"
href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css"
/>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>


    <!-- include libraries(jQuery, bootstrap) -->
<link href="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.css" rel="stylesheet">
<script src="http://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.js"></script> 
<script src="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.js"></script> 
<!-- include summernote css/js-->
<link href="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.11/summernote-bs4.css" rel="stylesheet">
<script src="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.11/summernote-bs4.js"></script>
<!-- include summernote-ko-KR -->
<script src="/resources/js/summernote-ko-KR.js"></script>
    
    <title>demandForm</title>
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



 <script>
        
$(function() {
        fn_default_datepicker();
});
        
function fn_default_datepicker()
{
    var start = $( "#datepicker_start" ).datepicker({
        dateFormat: 'yy-mm-dd' //Input Display Format 변경
        ,showOtherMonths: true //빈 공간에 현재월의 앞뒤월의 날짜를 표시
        ,showMonthAfterYear:true //년도 먼저 나오고, 뒤에 월 표시
        ,changeYear: true //콤보박스에서 년 선택 가능
        ,changeMonth: true //콤보박스에서 월 선택 가능                
        //,showOn: "both" //button:버튼을 표시하고,버튼을 눌러야만 달력 표시 ^ both:버튼을 표시하고,버튼을 누르거나 input을 클릭하면 달력 표시
        //,buttonImage: "http://jqueryui.com/resources/demos/datepicker/images/calendar.gif" //버튼 이미지 경로
        //,buttonImageOnly: true //기본 버튼의 회색 부분을 없애고, 이미지만 보이게 함
        ,buttonText: "선택" //버튼에 마우스 갖다 댔을 때 표시되는 텍스트                
        ,yearSuffix: "년" //달력의 년도 부분 뒤에 붙는 텍스트
        ,monthNamesShort: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'] //달력의 월 부분 텍스트
        ,monthNames: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'] //달력의 월 부분 Tooltip 텍스트
        ,dayNamesMin: ['일','월','화','수','목','금','토'] //달력의 요일 부분 텍스트
        ,dayNames: ['일요일','월요일','화요일','수요일','목요일','금요일','토요일'] //달력의 요일 부분 Tooltip 텍스트
        ,minDate: "-6M" //최소 선택일자(-1D:하루전, -1M:한달전, -1Y:일년전)
        ,maxDate: "0M" //최대 선택일자(+1D:하루후, -1M:한달후, -1Y:일년후)                
    });
        
    var end = $( "#datepicker_end" ).datepicker({
        dateFormat: 'yy-mm-dd' //Input Display Format 변경
        ,showOtherMonths: true //빈 공간에 현재월의 앞뒤월의 날짜를 표시
        ,showMonthAfterYear:true //년도 먼저 나오고, 뒤에 월 표시
        ,changeYear: true //콤보박스에서 년 선택 가능
        ,changeMonth: true //콤보박스에서 월 선택 가능                
        //,showOn: "both" //button:버튼을 표시하고,버튼을 눌러야만 달력 표시 ^ both:버튼을 표시하고,버튼을 누르거나 input을 클릭하면 달력 표시  
        //,buttonImage: "http://jqueryui.com/resources/demos/datepicker/images/calendar.gif" //버튼 이미지 경로
        //,buttonImageOnly: true //기본 버튼의 회색 부분을 없애고, 이미지만 보이게 함
        ,buttonText: "선택" //버튼에 마우스 갖다 댔을 때 표시되는 텍스트                
        ,yearSuffix: "년" //달력의 년도 부분 뒤에 붙는 텍스트
        ,monthNamesShort: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'] //달력의 월 부분 텍스트
        ,monthNames: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'] //달력의 월 부분 Tooltip 텍스트
        ,dayNamesMin: ['일','월','화','수','목','금','토'] //달력의 요일 부분 텍스트
        ,dayNames: ['일요일','월요일','화요일','수요일','목요일','금요일','토요일'] //달력의 요일 부분 Tooltip 텍스트
     //   ,minDate: "-6M" //최소 선택일자(-1D:하루전, -1M:한달전, -1Y:일년전)
     //   ,maxDate: "0M" //최대 선택일자(+1D:하루후, -1M:한달후, -1Y:일년후)
           ,defaultDate: "+1w"
      });
    
    //초기값을 오늘 날짜로 설정
   // $('#datepicker_start').datepicker('setDate', '-7D'); //(-1D:하루전, -1M:한달전, -1Y:일년전), (+1D:하루후, -1M:한달후, -1Y:일년후)
   // $('#datepicker_end').datepicker('setDate', 'today'); //(-1D:하루전, -1M:한달전, -1Y:일년전), (+1D:하루후, -1M:한달후, -1Y:일년후)
}
 
function getDate( element ) {
    var date;
    var dateFormat = "yy-mm-dd";
    try {
      date = $.datepicker.parseDate( dateFormat, element.value );
    } catch( error ) {
      date = null;
    }
    return date;
 }
 
    </script>

</head>
<body>
    
   
    
    <section>

<form>
  <div class="form-group">
    <label for="title">폼제목</label>
    <input type="text" class="form-control" placeholder="폼제목을 입력하세요">
    
  </div>
  <div class="form-group">
    <label for="date">수요조사 기간</label>
    </div>

   <div class="ui-grid-b">
        <div class="ui-block-a">
            <label>시작일</label>
        </div>
         <div class="ui-grid-b">
        <div class="ui-block-a">
            <input type="text" id="datepicker_start" readonly="readonly">
        </div>
        <div class="ui-block-b">
            <label>마지막일</label>
        </div>
        <div class="ui-block-c">
        </div>
    </div>
   
        <div class="ui-block-b">
            <input type="text" id="datepicker_end" readonly="readonly">
        </div>
        <div class="ui-block-c">
            <button id="date_search">초기화</button>
        </div>
    </div>
    <script>
 
    
$(document).ready(function(){
    
    $("#datepicker_start").on("click",function(){
        
    });
 
     $("#datepicker_start").on("change",function(e){
         var end = $( "#datepicker_end" ).datepicker( "option", "minDate", getDate( e.target ) );
     });
     
     $("#datepicker_end").on("change",function(e){
         
     });
     
     $("#date_search").on("click",function(){
         var start = $("#datepicker_start").val();
         var end = $("#datepicker_end").val();
     });    
});
 
</script>

 
  <br />
  <br />
  
 <div class="form-group">
		<label for="content">상세설명</label>
		<textarea class="form-control" rows="5" id="summernote" name="content"></textarea>
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
</head>


	 <div class="form-group">
    <label for="productname">상품명</label>
     <input type="text" class="form-control" placeholder="상품명을 입력하세요">
  
  </div>
   <div class="form-group">
    <label for="price">가격</label>
    <input type="text" class="form-control" placeholder="가격을 입력하세요">
  </div>
  <input class="btn btn-default" type="submit" value="+상품추가">
   <div class="form-group">
    <label for="addquestion">(선택)추가질문</label>
    <input type="text" class="form-control" placeholder="추가질문을 받으시려면 작성하세요">
  </div>
  
    <div class="col-2" id="edit">
		      
		      <div class="py-2">
		      	<button type="submit" class="btn btn-outline-warning" onclick="goWrite(this.form)">폼만들기</button>
		      </div>
		      
	
		
	
 
 
  
  
  
  

</form>

</section>


</body>
</html>
<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>
	