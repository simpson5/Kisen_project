  <%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<jsp:include page="/WEB-INF/views/common/header.jsp"></jsp:include>
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
    <script type="text/javascript">




var goods_cnt = 1;
var goods_name=new Array();
var goods_price=new Array();
var all_price = 0;
var all_cnt = 0;
function goods_change(n,price,qunt){
	document.getElementById("goods_cnt"+n).value = Number(qunt);
	price_change();
	
}
function price_change(){
	
	all_cnt = 0;
all_cnt += Number(document.getElementById('goods_cnt1').value);all_cnt += Number(document.getElementById('goods_cnt2').value);all_cnt += Number(document.getElementById('goods_cnt3').value);all_cnt += Number(document.getElementById('goods_cnt4').value);all_cnt += Number(document.getElementById('goods_cnt5').value);all_cnt += Number(document.getElementById('goods_cnt6').value);all_cnt += Number(document.getElementById('goods_cnt7').value);all_cnt += Number(document.getElementById('goods_cnt8').value);	
	

}



function email_check() {		
	var email = document.getElementById("email").value;
	var exptext = /^[A-Za-z0-9_\.\-]+@[A-Za-z0-9\-]+\.[A-Za-z0-9\-]+/;

	if(exptext.test(email)==false){
		//이메일 형식이 알파벳+숫자@알파벳+숫자.알파벳+숫자 형식이 아닐경우			
//		alert("이메일형식이 올바르지 않습니다.");
		return false;
	}
	else return true;

}

function form_insert(){
	if(all_cnt==0){
		alert("구매할 의향이 있는 상품의 개수를 선택해주세요.");
	}
	else if(document.getElementById("email").value==""){
		alert("이메일을 입력해주세요.");
	}
	else if(!email_check()){
		alert("이메일형식이 올바르지 않습니다.");
	}
		else if(document.getElementById('phone').value=='') alert('이 폼에서는 연락처(휴대폰)를 필수로 입력받고있습니다. 휴대폰번호를 입력해주세요!'); 		else{

//		if(confirm("수요조사에 참여하시겠습니까?")){
			$('#viewLoading').show();
				document.getElementById("demand_form").submit();

		
		
	}
}
</script>

<div id="router-view">







<div class="masthead" style="background:#656060">
         빈티지 다꾸,탑꾸 스티커 수요조사</div>

<form id="demand_form" enctype="multipart/form-data" method="POST" action="demand_form_goods_process.php">
<input type="hidden" name="form_idx" value="21831">


<section id="main_content">

		






		<div class="container form_container">
		<div class="row">
			<div class="col-lg-12 text-center">
				
				<div class="row">
					<div class="col-lg-12">
												<div id="contents_detail" style="padding:3px;width:100%;color: #495057;background-color: #fff;background-clip: padding-box;border: 1px solid #ced4da;border-radius: .25rem;transition: border-color .15s ease-in-out,box-shadow .15s ease-in-out;">

																				빈티지 풍경 스티커수요조사합​​​​니다&nbsp;<br>
참여인원 각색당 10명이상일시 공구 시작합니다​​​​​<br>
개당 50장씩 색별로 들어가있는 세트제품입니다​​​​&nbsp;<br>
개당 3000원입니다 &nbsp;&nbsp;<br>
순서대로 빨강-파랑-초록-갈색-흰색-보라-하늘-노랑색입니다<br>
&nbsp;
<p><img alt="C07A306F-1FA8-4BC3-ADA1-B2CEA573B6C5.jpeg" src="http://witchformimg.cafe24.com/ckeditor/20210609162327_db0ec2b8972fc004a9fdbf605ef0fa4a.jpeg"></p>

<p><img alt="6A717841-95B1-4099-A391-939FAE0401B2.jpeg" src="http://witchformimg.cafe24.com/ckeditor/20210609162327_24b916c2a61261e3322747aceacd5c57.jpeg"></p>

<p><img alt="59555804-7CE3-4DE3-9793-D532D26C0724.jpeg" src="http://witchformimg.cafe24.com/ckeditor/20210609162327_224084cd846850faaa477997bfb00125.jpeg"></p>

<p><img alt="A791CCA6-E862-45A5-8597-190D58DF84FE.jpeg" src="http://witchformimg.cafe24.com/ckeditor/20210609162327_157e706f77dab8f83454df0db5b67d0b.jpeg"></p>

<p><img alt="858587AE-FD8B-411E-A7C9-B91470B77910.jpeg" src="http://witchformimg.cafe24.com/ckeditor/20210609162327_d768bf2200c190980b67857566efd6cc.jpeg"></p>

<p><img alt="858190B9-2804-42DF-B275-13FF70CBD7B6.jpeg" src="http://witchformimg.cafe24.com/ckeditor/20210609162327_d03294bb1024acca3cc7fb70cd8dd3ae.jpeg"></p>

<p><img alt="1A28B416-3EA3-44E3-9ACB-296AB4D8D22B.jpeg" src="http://witchformimg.cafe24.com/ckeditor/20210609162327_c25788da3d0fcf2c0e174018fec45812.jpeg"></p>

<p><img alt="766E2199-207E-42CD-A1A5-578AB286C162.jpeg" src="http://witchformimg.cafe24.com/ckeditor/20210609162327_d7255a09ba4145a9b5c16d7488bb4243.jpeg"></p>
						
						






<style>
		.zzim_btn { height: 32px;margin: auto;padding: 8px 12px 8px 8px;border-radius: 4px;border: solid 1px #dbdbdb;background-color: #fbfbfb;line-height:16px;display:inline-block;cursor:pointer;float:left;}
		.zzim_btn span{font-size:12px;font-weight:normal;color:#565560;padding-left:8px;display:inline-block; }
		.zzim_btn_on { height: 32px;margin: auto;padding: 8px 12px 8px 8px;border-radius: 4px;background-color: #ff6666;line-height:16px;display:inline-block;cursor:pointer;float:left; }
		.zzim_btn_on span {font-size:12px;font-weight:normal;color:#fff;padding-left:8px;display:inline-block; }


		.btn_share {height: 32px;margin: auto;padding: 8px 12px 8px 8px;border-radius: 4px;border: solid 1px #dbdbdb;background-color: #fbfbfb;line-height:16px;display:inline-block;cursor:pointer;float:left;margin-left:8px;font-size:12px;}
		.zzim_btn span{font-size:12px;font-weight:normal;color:#565560;padding-left:8px;display:inline-block; }


		.sns_wrap { position: absolute;padding: 16px 46px 16px 16px;box-shadow: 0 15px 30px 0 rgb(0 0 0 / 30%);z-index: 1;background-color: #fff;display: none; width: 296px;margin: 0 auto;left: 50%; margin-top: 40px;display:none;border-radius: 8px;}
		.sns_wrap.on { display: block;}
		.sns_wrap ul { display: flex;}
		.sns_wrap li a { display: inline-block; width: 40px; height: 40px;  box-sizing: border-box;}
		.sns_wrap li a .hidden { overflow: hidden; position: absolute; width: 1px; height: 1px; margin: -1px !important; clip: rect(0 0 0 0);}	
		.sns_wrap li + li { margin-left: 16px;}

		.sns_wrap li.twitter {background: url(../images/ico_twitter.png) no-repeat center;background-size: 40px 40px;}
		.sns_wrap li.facebook {background: url(../images/ico_facebook.png) no-repeat center;background-size: 40px 40px;}
		.sns_wrap li.blog {background: url(../images/ico_blog.png) no-repeat center;background-size: 40px 40px;}
		.sns_wrap li.kakao {background: url(../images/ico_kakao.png) no-repeat center;background-size: 40px 40px;}
		.sns_wrap li.share {background: url(../images/ico_url_copy.png) no-repeat center;background-size: 40px 40px;}

		.sns_wrap li.twitter:hover{background: url(../images/ico_twitter_on.png) no-repeat center;background-size: 40px 40px;}
		.sns_wrap li.twitter:active{background: url(../images/ico_twitter_on.png) no-repeat center;background-size: 40px 40px;}

		.sns_wrap li.facebook:hover{background: url(../images/ico_facebook_on.png) no-repeat center;background-size: 40px 40px;}
		.sns_wrap li.facebook:active{background: url(../images/ico_facebook_on.png) no-repeat center;background-size: 40px 40px;}

		.sns_wrap li.blog:hover{background: url(../images/ico_blog_on.png) no-repeat center;background-size: 40px 40px;}
		.sns_wrap li.blog:active{background: url(../images/ico_blog_on.png) no-repeat center;background-size: 40px 40px;}

		.sns_wrap li.kakao:hover{background: url(../images/ico_kakao_on.png) no-repeat center;background-size: 40px 40px;}
		.sns_wrap li.kakao:active{background: url(../images/ico_kakao_on.png) no-repeat center;background-size: 40px 40px;}

		.sns_wrap li.share:hover{background: url(../images/ico_share_on.png) no-repeat center;background-size: 40px 40px;}
		.sns_wrap li.share:active{background: url(../images/ico_share_on.png) no-repeat center;background-size: 40px 40px;}

	</style>

		
	<div style="border-radius: 8px;background-color: #fbfbfb;width: 95%;margin: 0 auto;text-align:center;padding:20px;margin-top:16px;margin-bottom:16px;">
		<div style="display:inline-block;">

		<div id="zzim_btn" class="zzim_btn" style="" onclick="ajax_zzim_form('demand','21831','1','in_form','2')">
			<img src="/images/form_heart.png" style="display:inline-block;">
			<span id="zzim_cnt" style="">찜 2개</span>
		</div>

		

		
				</div>
	</div>
	



						</div>
					</div>
				</div>

				<div class="row" style="padding-top:5px;">
					<div class="col-md-12" style="font-size:15px;font-weight:700;text-align:left;padding:5px 15px;">
						- 수요조사 기간
					</div>
				</div>
				<div class="row" style="padding-top:5px;">
					
					<div class="col-md-12" style="font-size:15px;text-align:left;">
						2021-06-09 ~ 2021-06-30					</div>
					
					
				</div>

				<div class="row" style="padding-top:5px;">
					<div class="col-md-5" style="font-size:15px;font-weight:700;text-align:left;padding:5px 15px;">
						- 상품 선택 <span style="color:#ff0000;">＊</span>
					</div>
				</div>
				<div class="row" style="padding-top:5px;">
					
					<div class="col-md-12" style="font-size:15px;">
						
								<div style="width:100%;text-align:left;font-weight:400;font-size:15px;padding:5px 10px;">
									<div style="">상품 1. 빨강 (3000원/1개)</div>
									<div style="font-weight:700;text-align:right;"><input type="number" id="49217_number" name="49217_number" value="0" style="border:1px solid #000;padding:3px;font-size:15px;width:10%;" min="0" inputmode="numeric" pattern="[0-9]*" onchange="goods_change(1,3000,this.value);">개
									<input type="hidden" id="goods_cnt1" value="0" style="border:1px solid #000;padding:3px;font-size:15px;width:50%;">		
									</div>
								</div>
							
								<div style="width:100%;text-align:left;font-weight:400;font-size:15px;padding:5px 10px;">
									<div style="">상품 2. 파랑 (3000원/1개)</div>
									<div style="font-weight:700;text-align:right;"><input type="number" id="49218_number" name="49218_number" value="0" style="border:1px solid #000;padding:3px;font-size:15px;width:10%;" min="0" inputmode="numeric" pattern="[0-9]*" onchange="goods_change(2,3000,this.value);">개
									<input type="hidden" id="goods_cnt2" value="0" style="border:1px solid #000;padding:3px;font-size:15px;width:50%;">		
									</div>
								</div>
							
								<div style="width:100%;text-align:left;font-weight:400;font-size:15px;padding:5px 10px;">
									<div style="">상품 3. 초록 (3000원/1개)</div>
									<div style="font-weight:700;text-align:right;"><input type="number" id="49219_number" name="49219_number" value="0" style="border:1px solid #000;padding:3px;font-size:15px;width:10%;" min="0" inputmode="numeric" pattern="[0-9]*" onchange="goods_change(3,3000,this.value);">개
									<input type="hidden" id="goods_cnt3" value="0" style="border:1px solid #000;padding:3px;font-size:15px;width:50%;">		
									</div>
								</div>
							
								<div style="width:100%;text-align:left;font-weight:400;font-size:15px;padding:5px 10px;">
									<div style="">상품 4. 갈색 (3000원/1개)</div>
									<div style="font-weight:700;text-align:right;"><input type="number" id="49220_number" name="49220_number" value="0" style="border:1px solid #000;padding:3px;font-size:15px;width:10%;" min="0" inputmode="numeric" pattern="[0-9]*" onchange="goods_change(4,3000,this.value);">개
									<input type="hidden" id="goods_cnt4" value="0" style="border:1px solid #000;padding:3px;font-size:15px;width:50%;">		
									</div>
								</div>
							
								<div style="width:100%;text-align:left;font-weight:400;font-size:15px;padding:5px 10px;">
									<div style="">상품 5. 흰색 (3000원/1개)</div>
									<div style="font-weight:700;text-align:right;"><input type="number" id="49221_number" name="49221_number" value="0" style="border:1px solid #000;padding:3px;font-size:15px;width:10%;" min="0" inputmode="numeric" pattern="[0-9]*" onchange="goods_change(5,3000,this.value);">개
									<input type="hidden" id="goods_cnt5" value="0" style="border:1px solid #000;padding:3px;font-size:15px;width:50%;">		
									</div>
								</div>
							
								<div style="width:100%;text-align:left;font-weight:400;font-size:15px;padding:5px 10px;">
									<div style="">상품 6. 보라 (3000원/1개)</div>
									<div style="font-weight:700;text-align:right;"><input type="number" id="49222_number" name="49222_number" value="0" style="border:1px solid #000;padding:3px;font-size:15px;width:10%;" min="0" inputmode="numeric" pattern="[0-9]*" onchange="goods_change(6,3000,this.value);">개
									<input type="hidden" id="goods_cnt6" value="0" style="border:1px solid #000;padding:3px;font-size:15px;width:50%;">		
									</div>
								</div>
							
								<div style="width:100%;text-align:left;font-weight:400;font-size:15px;padding:5px 10px;">
									<div style="">상품 7. 하늘 (3000원/1개)</div>
									<div style="font-weight:700;text-align:right;"><input type="number" id="49223_number" name="49223_number" value="0" style="border:1px solid #000;padding:3px;font-size:15px;width:10%;" min="0" inputmode="numeric" pattern="[0-9]*" onchange="goods_change(7,3000,this.value);">개
									<input type="hidden" id="goods_cnt7" value="0" style="border:1px solid #000;padding:3px;font-size:15px;width:50%;">		
									</div>
								</div>
							
								<div style="width:100%;text-align:left;font-weight:400;font-size:15px;padding:5px 10px;">
									<div style="">상품 8. 노랑 (3000원/1개)</div>
									<div style="font-weight:700;text-align:right;"><input type="number" id="49224_number" name="49224_number" value="0" style="border:1px solid #000;padding:3px;font-size:15px;width:10%;" min="0" inputmode="numeric" pattern="[0-9]*" onchange="goods_change(8,3000,this.value);">개
									<input type="hidden" id="goods_cnt8" value="0" style="border:1px solid #000;padding:3px;font-size:15px;width:50%;">		
									</div>
								</div>
												</div>
					
					
				</div>

				

				<div class="row" style="padding-top:5px;">
					<div class="col-md-12" style="font-size:15px;font-weight:700;text-align:left;padding:5px 15px;">
						- 알림 받을 곳 (E-mail) <span style="color:#ff0000;">＊</span>
					</div>
				</div>
				<div class="row">
				
					<div class="col-lg-12">
						<div class="form-group">
							<input class="form-control" type="text" id="email" name="email" value="" placeholder="이메일주소">
						</div>
					</div>
					
				</div>
				
				<div class="row" style="padding-top:5px;">
					<div class="col-md-12" style="font-size:15px;font-weight:700;text-align:left;padding:5px 15px;">
						- 트위터 계정
						(선택)					</div>
				</div>
				<div class="row">
				
					<div class="col-lg-12">
						<div class="form-group">
							<input class="form-control" type="text" id="twitter" name="twitter" value="" placeholder="트위터계정 아이디 (ex: @witchform)">
						</div>
					</div>
					
				</div>
				<div class="row" style="padding-top:5px;">
					<div class="col-md-12" style="font-size:15px;font-weight:700;text-align:left;padding:5px 15px;">
						- 연락처(휴대폰)
						(필수) <span style="color:#ff0000;">＊</span>					</div>
				</div>
				<div class="row">
				
					<div class="col-lg-12">
						<div class="form-group">
							<input class="form-control" type="text" id="phone" name="phone" value="" placeholder="폰번호">
						</div>
					</div>
					
				</div>

				
				<div class="row" style="padding-top:5px;">
					<div class="col-md-12" style="font-size:15px;font-weight:700;text-align:left;padding:5px 15px;">
						- 추가로 질문있으시면 질문해주세요!(추가질문) 
(선택)					</div>
				</div>
				<div class="row">
				
					<div class="col-lg-12">
						<div class="form-group">
							<textarea class="form-control" name="answer1" id="answer1" placeholder="질문에 대한 답을 작성해주세요." rows="5" cols="100" style="width:100%; height:100px; "></textarea>
						</div>
					</div>
					
				</div>
								<div class="row">
					<div class="content">
						<div class="content_main" style="padding: 0 15px;">
											
						
							<div class="content_item" style="border:0px;margin-top:10px;background-color: #f26656;border-color: #f0513e;color:#fff;padding: 20px 50px 20px 50px;cursor:pointer" onclick="form_insert();">
								<div style="width:100%;text-align:center;font-size:20px;font-weight:700;">
									제출
								</div>
								
								
							</div>

												</div>



					</div>
				</div>



			</div>
		</div>
	</div>







    

</body>
</html>

<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>
	
	
	
	
