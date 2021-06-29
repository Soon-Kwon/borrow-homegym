<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%
 	String memberId = session.getAttribute("memberId").toString();
 %>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

 <script src="https://code.jquery.com/jquery-latest.min.js"></script>
<html class="no-js" lang="ko">

<head>
    <meta charset="utf-8" />
    <meta http-equiv="x-ua-compatible" content="ie=edge" />
    <title>빌려줘! 홈짐 - 내정보 수정</title>
    <meta name="description" content="" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <link rel="shortcut icon" type="image/x-icon" href="assets/images/logo/logo.png" />
    <!-- Place favicon.ico in the root directory -->

    <!-- Web Font -->
    <link
        href="https://fonts.googleapis.com/css2?family=Poppins:ital,wght@0,100;0,200;0,300;0,400;0,500;0,600;0,700;0,800;0,900;1,100;1,200;1,300;1,400;1,500;1,600;1,700;1,800;1,900&display=swap"
        rel="stylesheet">

    <!-- ========================= CSS here ========================= -->
    <link rel="stylesheet" href="/resources/assets/css/bootstrap.min.css" />
    <link rel="stylesheet" href="/resources/assets/css/LineIcons.2.0.css" />
    <link rel="stylesheet" href="/resources/assets/css/animate.css" />
    <link rel="stylesheet" href="/resources/assets/css/tiny-slider.css" />
    <link rel="stylesheet" href="/resources/assets/css/glightbox.min.css" />
    <link rel="stylesheet" href="/resources/assets/css/main.css" />
    <script src="https://code.jquery.com/jquery-3.6.0.js" integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk="
    crossorigin="anonymous"></script>
<style>
/* 프로필 사진 */

#uploadBtn{
	position: absolute;
    left: 200px;
    width: 80px;
}

#delImg{
    margin-left:270px;
}
#editImgBtn{
    position: absolute;
    width: 45px;
    left: 300px;
    top: 115px;
}
}
.userphoto_menu label { 
	display: inline-block; 
	padding: .5em .75em; 
	color: #999;
	font-size: inherit;
	line-height: normal; 
	vertical-align: middle; 
	background-color: #fdfdfd;
	cursor: pointer; 
	border: 1px solid #ebebeb;
	border-bottom-color: #e2e2e2;
	border-radius: .25em;
 } 

.userphoto_menu input[type="file"] { 
/* 파일 필드 숨기기 */ 
position: absolute;
	 width: 1px; 
	 height: 1px;
	  padding: 0;
	   margin: -1px; 
	   overflow: hidden; 
	   clip:rect(0,0,0,0);
	    border: 0; 
}



.img {
  vertical-align: middle;
}

.img-img-thumbnail {
  display: inline-block;
  max-width: 100%;
  height: auto;
  padding: 4px;
  line-height: 1.42857143;
  background-color: #fff;
  transition: all .2s ease-in-out;
}

.img-circle {
  border-radius: 50%;
}

.btn-primary {
  background-color: #2f3e83;
  border-color: #2f3e83;
  color: #fff;
  margin-bottom: 50px;
}

.btn-primary:hover,
.btn-primary:focus {
  border-color: #5c6dbd;
  background-color: #5c6dbd;
  color: #fff;
}

#zip_codeBtn{
	background-color: #5F87E1;
    color: white;
    }
    
#updateBtn{
    height: 50px;
    width: 100px;
    margin-right: 10px;
}

#deleteBtn{
	height: 50px;
    width: 100px;
}


</style>

<!-- 프로필 사진 업로드 -->
<script>
$(document).ready(function () {
    var readURL = function (input) {
        if (input.files && input.files[0]) {
            var reader = new FileReader();
            reader.onload = function (e) {
                $('.avatar').attr('src', e.target.result);
            }
            reader.readAsDataURL(input.files[0]);
        }
    }
    $(".file-upload").on('change', function () {
        readURL(this);
    });
    
});
/*  $("#imgFile").change(function(){
	 readURL(this);
 });  */
 
 function delImg(){
	 $("#img_section").removeAttr("src");
 }
 

   
</script>
<!-- 회원 정보 수정 ajax -->
<script>
 
/* ajax를 통한 비밀번호 수정처리 */


function deleteInfo() {

	var data = {memberId : $('input[name=memberId]').val(),
				password : $('input[name=password]').val()
			};
    if($('#password').val() == '') {
        alert("탈퇴시 현재 비밀번호를 입력해주세요.");
    }else {
        $.ajax({
            type:'POST',
            data: JSON.stringify(data),
            url:"/user/mypage/delete.do",
            dataType: "json",
            contentType: "application/json",
            success : function(data) {   
            	if(data.resultCode=="Success"){
            		alert(data.resultMessage);
                    location.href="/index.jsp";	
            	}else{
            		alert(data.resultMessage);
            	}
            	
            },
            error: function(jqXHR, textStatus, errorThrown) {
                alert("ERROR : " + textStatus + " : " + errorThrown);
            }        
        })
    }
    
}

function updateInfo() {

	var data = {memberId : $('input[name=memberId]').val(),
				password : $('input[name=password]').val(),
				newPassword : $('input[name=newPassword]').val(),
				rePassword : $('input[name=rePassword]').val(),
				nickName : $('input[name=nickName]').val(),
				phone : $('input[name=phone]').val(),
				zipCode : $('input[name=zipCode]').val(),
				address : $('input[name=address]').val()
		}
	
	 var pw = $("#newPassword").val();
	 var num = pw.search(/[0-9]/g);
	 var eng = pw.search(/[a-z]/ig);
	 var spe = pw.search(/[`~!@@#$%^&*|₩₩₩'₩";:₩/?]/gi);
	 var phone = /^\d{3}-\d{3,4}-\d{4}$/;


	console.log(JSON.stringify(data));
	
	 if($('#phone').val() == '')  {
	        alert("전화번호를 입력해주세요");
	        $('#phone').focus();
	        return false;
	    }  
    if($('#password').val() == '')  {
        alert("정보 수정시 현재 비밀번호 입력은 필수입니다.");
        $('#password').focus();
        return false;
    }    
    if($('#newPassword').val() !=''){
	   	 if(pw.length < 8 || pw.length > 15){
	   	  alert("8자리 ~ 15자리 이내로 입력해주세요.");
	   	  return false;
	   	 }else if(pw.search(/\s/) != -1){
	   	  alert("비밀번호는 공백 없이 입력해주세요.");
	   	  return false;
	   	 }else if( (num < 0 && eng < 0) || (eng < 0 && spe < 0) || (spe < 0 && num < 0) ){
	   	  alert("영문,숫자, 특수문자 중 2가지 이상을 혼합하여 입력해주세요.");
	   	  return false;
	   	
	   	 }else if($('#newPassword').val() != $('#rePassword').val() ) {
    		alert("새 비밀번호가 서로 일치 하지 않습니다. 다시 입력해주세요");
    		$('#newPassword').val('');
    		$('#rePassword').val('');
    		$('#rePassword').focus();
			return false;

    	}
    }

    $.ajax({
        type:'POST',
        accept : "application/json",
        data: JSON.stringify(data),
        url:"/user/mypage/userImgDelete.do",
        dataType: "json",
        contentType : "application/json; charset:UTF-8",
        success : function(json) {   
        	if(json.resultCode=="Success"){
        		alert(json.resultMessage);
				
        	}else{
        		alert(json.resultMessage);
        	}
        },
        error: function(e) {
            //alert("ERROR : " + textStatus + " : " + errorThrown);
            console.log(e);
        }        
    })
       
}
$("#uploadBtn").click(function(e) {
	e.preventDefault();
	
	var userImg = $("#userImg"). val();
	
	if(userImg == null || userImg ==""){
		alert("업로드할 사진이 없습니다. 사진을 등록해주세요.");
	}else{
		$('#uploadBtn').submit();
	}
	
});

	function delImg(){

		
	    $.ajax({
	        type:'POST',
	        accept : "application/json",
	        data: JSON.stringify(data),
	        url:"/user/mypage/update.do",
	        dataType: "json",
	        contentType : "application/json; charset:UTF-8",
	        success : function(json) {   
	        	if(json.resultCode=="Success"){
	        		alert(json.resultMessage);
					
	        	}else{
	        		alert(json.resultMessage);
	        	}
	        },
	        error: function(e) {
	            //alert("ERROR : " + textStatus + " : " + errorThrown);
	            console.log(e);
	        }        
	    })
	}
</script>

<!-- 다음 우편번호 API -->
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script src="/resources/js/addressapi.js"></script>

<script>
function execPostCode() {
         new daum.Postcode({
             oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.
 
                // 도로명 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var fullRoadAddr = data.roadAddress; // 도로명 주소 변수
                var extraRoadAddr = ''; // 도로명 조합형 주소 변수
 
                // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                    extraRoadAddr += data.bname;
                }
                // 건물명이 있고, 공동주택일 경우 추가한다.
                if(data.buildingName !== '' && data.apartment === 'Y'){
                   extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                }
                // 도로명, 지번 조합형 주소가 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                if(extraRoadAddr !== ''){
                    extraRoadAddr = ' (' + extraRoadAddr + ')';
                }
                // 도로명, 지번 주소의 유무에 따라 해당 조합형 주소를 추가한다.
                if(fullRoadAddr !== ''){
                    fullRoadAddr += extraRoadAddr;
                }
 
                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                console.log(data.zonecode);
                console.log(fullRoadAddr);
                
                
                $("[name=zipCode]").val(data.zonecode);
                $("[name=address]").val(fullRoadAddr);
                
            	
             // 우편번호와 주소 정보를 해당 필드에 넣는다.
             document.getElementById('sample3_postcode').value = data.zonecode; //5자리 새우편번호 사용
             document.getElementById('sample3_address').value = fullAddr;
            }
         }).open();
     }
</script>

</head>

<body>
    <!--[if lte IE 9]>
      <p class="browserupgrade">
        You are using an <strong>outdated</strong> browser. Please
        <a href="https://browsehappy.com/">upgrade your browser</a> to improve
        your experience and security.
      </p>
    <![endif]-->

    <!-- Preloader -->
    <div class="preloader">
        <div class="preloader-inner">
            <div class="preloader-icon">
                <span></span>
                <span></span>
            </div>
        </div>
    </div>
    <!-- /End Preloader -->

      <!-- Start Header Area -->
    <header class="header style2 navbar-area">
        <div class="container">
            <div class="row align-items-center">
                <div class="col-lg-12">
                <div class="nav-inner">
                    <nav class="navbar navbar-expand-lg">
                        <a class="navbar-brand" href="/index.jsp">
                            <img src="/resources/assets/images/logo/로고2.png" alt="logo">
                        </a>
                        <button class="navbar-toggler mobile-menu-btn" type="button" data-bs-toggle="collapse"
                            data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent"
                            aria-expanded="false" aria-label="Toggle navigation">
                            <span class="toggler-icon"></span>
                            <span class="toggler-icon"></span>
                            <span class="toggler-icon"></span>
                        </button>
                        <form class="d-flex search-form">
                            <input class="form-control me-2" type="search" placeholder="동네 이름을 검색해보세요!"
                                aria-label="Search">
                            <button class="btn btn-outline-success" type="submit"><i
                                    class="lni lni-search-alt"></i></button>
                        </form>
                        <div class="collapse navbar-collapse sub-menu-bar" id="navbarSupportedContent">
                            <ul id="nav" class="navbar-nav ms-auto">
                                <li class="nav-item" style="margin-right: 100px;"><a href="/homegym/hg_list.do"><h5>홈짐</h5></a></li>
                                <li class="nav-item" style="margin-right: 120px;"><a href="/trainer/tr_list.do"><h5>트레이너</h5></a></li>
                                <a class="circle-image" href="mp_main.do">
                                    <img src="https://via.placeholder.com/300x300" alt="logo">
                                </a>
                                <li class="nav-item"><a href="mp_main.do"><h5>${member.name} 님</h5></a></li>
                                
                            </ul>
                        </div> <!-- navbar collapse -->
                    </nav> <!-- navbar -->
                </div>
                </div>
            </div> <!-- row -->
        </div> <!-- container -->
    </header>
    <!-- End Header Area -->

    <!-- Start Breadcrumbs -->
    <div class="breadcrumbs overlay">
        <div class="container">
            <div class="row align-items-center">
                <div class="col-lg-8 offset-lg-2 col-md-12 col-12">
                    <div class="breadcrumbs-content">
                        <h1 class="page-title">마이페이지</h1>
                    </div>
                    
                </div>
            </div>
        </div>
    </div>
    <!-- End Breadcrumbs -->

       <!-- Course Details Section Start -->
    <div class="course-details section">
        <div class="container">
            <div class="row">
               <!-- Start Course Sidebar -->
                <div class="col-lg-3 col-8">
                    <div class="course-sidebar">
                        
                        <div class="sidebar-widget other-course-wedget">
                            <h3 class="sidebar-widget-title"><a href="profile.do">마이페이지</a></h3>
                            <div class="sidebar-widget-content">
                                <ul class="sidebar-widget-course">
                                    <li class="single-course">
                                        <div class="info">
                                            <h6 class="title"><a href="profile_update.do">내 정보수정</a></h6>
                                        </div>
                                    </li>
                                    <li class="single-course">
                                        <div class="info">
                                            <h6 class="title"><a
                                                    href="myactiv">나의 활동내역</a></h6>
                                        </div>
                                    </li>
                                    <li class="single-course">
                                        <div class="info">
                                            <h6 class="title"><a href="mywrite.do">글 관리</a></h6>
                                        </div>
                                    </li>
                                </ul>
                            </div>
                        </div>
                        <div class="sidebar-widget">
                            <h3 class="sidebar-widget-title">검색해보세요</h3>
                            <div class="sidebar-widget-content">
                                <div class="sidebar-widget-search">
                                    <form action="#">
                                        <input type="text" placeholder="Search...">
                                        <button><i class="lni lni-search-alt"></i></button>
                                    </form>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- End Course Sidebar -->


                <!-- Course Details Wrapper Start -->
                <div class="col-lg-6 col-12">

                    <!-- Start Features Area -->
                    <section class="features style2">
                        <div class="container-fluid" style="padding-bottom: 80px;">
                            <div class="single-head">
                                <div class="row" style="position: relative; right: 80px;">
                                    <div class="col-lg-15 " style="margin-left: 280px;">
                                        <!-- Start Single Feature -->
                                      
                                      
                            		<div class="single-feature" style="padding: 20px">
                            			<c:if test="${empty member.imagePath}">
				                        	<div id="userphoto"><img src="${pageContext.request.contextPath}/resources/assets/images/mypage/basicImg.png" class="avatar img-circle img-thumbnail" id="profile" style="margin-left: 190px;"></div>
				                    	</c:if>
				                    	<c:if test="${not empty member.imagePath}">
				                    		<div id="userphoto"><img src="${member.imagePath}" id="profile"  class="avatar img-circle img-thumbnail" name="image" style="margin-left: 190px; width: 140px; height: 150px;"></div>
				                    	</c:if>
                            		
                            		
                            		<!-- 프로필이미지  -->
                             <form id="profileform" action="/user/mypage/userImgUpload.do" enctype="multipart/form-data" method="post" autocomplete="off">
	                        <div id="userphoto_menu" style="margin-top: 10px; margin-bottom: -20px;">
	                        	<input name="memberId" type="hidden" value="silverbi99@naver.com"/>
	                             <label class="file"  for="userImg"><img src="/resources/assets/images/mypage/editImgBtn.png" id="editImgBtn"></label> 
	                            <input type="file" name="file"  id="userImg" class="text-center center-block file-upload" id="userImg" style="margin-left: 150px; display:none;" > 
	                            
	                            <button class="btn btn-outline-secondary" id="uploadBtn" onclick="imgUpload()" >업로드</button>
	                            <button class="btn btn-outline-secondary" onclick="delImg()" id="delImg" type="button">삭제</button>
	                            
	                        </div>
	                       
	                        
                        </form>
                       
                     
                                     
                                     <!-- 폼 전송 -->      
                   						 <form name="memberUpdate" id="memberUpdate" action="/user/mypage/update.do" method="post">
                                                <div class="form-group">
                                                    <div class="col-xs-6">
                                                        <label for="userId">
                                                            <br>
                                                            <h6>아이디</h6>
                                                        </label>
                                                        <input name="memberId" readonly class="form-control" 
                                                            value="${member.memberId}">
                                                            
                                                    </div>
                                                </div>
                                                <br>
                                                <div class="form-group">
                                                    <div class="col-xs-6">
                                                        <label for="password">
                                                            <h6>현재 비밀번호</h6>
                                                        </label>
                                                        <input type="password" class="form-control" id="password" name="password" 
                                                            placeholder="현재 비밀번호" title="현재 비밀번호입력은 필수입니다." >
                                                    </div>
                                                    <div>${msg}</div>
                                                </div>
                                                <br>
                                                 <div class="form-group">
                                                    <div class="col-xs-6">
                                                        <label for="new_password">
                                                            <h6>새 비밀번호</h6>
                                                        </label>
                                                        <input type="password" class="form-control" name="newPassword"
                                                            id="newPassword" placeholder="새 비밀번호" title="새 비밀번호를 입력해주세요.">
                                                    </div>
                                                </div>
                                                <br>
                                                
                                                
                                                <div class="form-group">
                                                    <div class="col-xs-6">
                                                        <label for="re_password">
                                                            <h6>새 비밀번호 재확인</h6>
                                                        </label>
                                                        <input type="password" class="form-control" name="rePassword"
                                                            id="rePassword" placeholder="새 비밀번호 재확인"
                                                            title="새 비밀번호 재입력해주세요.">
                                                    </div>
                                                </div> 
                                                <br>
                                               
                                                <div class="form-group">
                                                    <div class="col-xs-6">
                                                        <label for="username">
                                                            <h6>이름</h6>
                                                        </label>
                                                        <input name="name" readonly class="form-control" 
                                                             value="${member.name}">
                                                           
                                                    </div>
                                                </div>
                                                <br>
                                                <div class="form-group">
                                                    <div class="col-xs-6">
                                                        <label for="birth">
                                                            <h6>생년월일</h6>
                                                        </label>
                                                        <input name="birth" readonly class="form-control"  
                                                            value="${member.birth}">
                                                    </div>
                                                </div>
                                                <br>
                                                <div class="form-group">
                                                    <div class="col-xs-6">
                                                        <label for="nickname">
                                                            <h6>닉네임</h6>
                                                        </label>
                                                        <input type="text" class="form-control" name="nickName"
                                                         value="${member.nickName}">
                                                    </div>
                                                </div>
                                                <br>
                                                
                                               
                                                <div class="form-group">
                                                    <div class="col-xs-6">
                                                        <label for="phone">
                                                            <h6>연락처</h6>
                                                        </label>
                                                        <input type="text" class="form-control" name="phone" 
                                                            value="${member.phone} " title="enter your phone.">
                                                    </div>
                                                </div>
                                                <br>
                                               <!--  <div class="form-group">
                                                    <div class="col-xs-6">
                                                        <label for="adress">
                                                            <h6>주소</h6>
                                                        </label>
                                                        <p>
                                                            <input type="text" class="zip_code" id="zipNo" readonly style="width:70%; height: 30px; border: 1px solid #ced4da; border-radius: .25rem;" >
                                                            <button type="button" class="zip_code_btn"
                                                                onclick="javascript:goPopup();" style="height: 28px;
                                                                width: 20%;">우편번호</button>
                                                            <br><br><br>
                                                            <br>
                                                            <input type="text" placeholder="나머지 주소를 입력해 주세요" id="addrDetail" style="width: 70%;height: 30px; border: 1px solid #ced4da; border-radius: .25rem;">
                                                        </p>
                                                    </div>
                                                </div> -->
                                                
                                                <div class="form-group">  
                                                <h6>주소</h6>                 
													<input class="form-control" style="width: 30%; display: inline;  margin-bottom: 5px;" name="zipCode" value="${member.zipCode}" type="text" readonly="readonly" >
													    <button type="button" id="zip_codeBtn" class="btn btn-default" onclick="execPostCode();"><i class="fa fa-search"></i> 우편번호 찾기</button>                               
													</div>
													<div class="form-group">
													    <input class="form-control" style="top: 5px;" placeholder="도로명 주소" name="address" value="${member.address}" type="text" readonly="readonly" />
													</div>
													<!--<div class="form-group">
													    <input class="form-control" placeholder="상세주소" name="addr3" id="addr3" type="text"  />
												</div> -->
                                                
                                                <br>
                                    
                                        <div class="form-group">
                                            <div class="submit_btn" style="margin-left: 160px; margin-top: 30px;">
                                                <input type="button" id="updateBtn" value="수정하기" onclick="updateInfo();" class="btn btn-block btn-primary" >
                                                <input type="button" id="deleteBtn" value="탈퇴하기" onclick="deleteInfo();" class="btn btn-block btn-primary" > 
                                            </div>
                                        </div>
                                        </form>
                                    </div>
                                    <!-- End Single Feature -->
                                </div>
                            </div>
                        </div>
                </div>
              </form>
            
                </section>
                <!-- /End Features Area -->


               
            <!-- End Course Details Wrapper -->

        </div>
    </div>
    </div>
    <!-- Course Details Section End -->

    <!-- Start Footer Area -->
    <footer class="footer style2">
        <!-- Start Footer Bottom -->
        <div class="footer-bottom">
            <div class="container">
                <div class="inner">
                    <div class="row">
                        <div class="col-md-6" style="text-align: start;">
                            <div class="logo">
                                <br><br>
                                <a href="main_index.html"><img src="../assets/images/logo/로고1.png" alt="Logo"></a>
                            </div>
                        </div>
                        <div class="col-md-6" style="text-align: end;">
                            <p>
                                <br>
                                <a href="others/faq.jsp"> 자주묻는 질문</a>
                                
                                <br>
                                서울특별시 서초구 강남대로 459 (서초동, 백암빌딩) 403호<br>
                                (주) 빌려줘홈짐 | 문의 02-123-1234 | 사업자등록번호 123-12-12345
                                <br>© 2021. All Rights Reserved.
                            </p>

                        </div>
                    </div>
                </div>
            </div>
        </div>
    </footer>
    <!--/ End Footer Area -->

    <!-- ========================= scroll-top ========================= -->
    <a href="#" class="scroll-top btn-hover">
        <i class="lni lni-chevron-up"></i>
    </a>

    <!-- ========================= JS here ========================= -->
    <script src="/resources/assets/js/bootstrap.min.js"></script>
    <script src="/resources/assets/js/count-up.min.js"></script>
    <script src="/resources./assets/js/wow.min.js"></script>
    <script src="/resources/assets/js/tiny-slider.js"></script>
    <script src="/resources/assets/js/glightbox.min.js"></script>
    <script src="/resources/assets/js/main.js"></script>
    

</body>
</html>