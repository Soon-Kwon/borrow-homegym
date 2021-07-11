<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<!DOCTYPE html>
<html class="no-js" lang="zxx">

<head>

<style>

.checkColor {
	background-color: #9ea9d8;
	border-color: #9ea9d8;
	color: white;
}

.btn-outline-secondary:hover {
	color: #6c757d;
	background-color: #ededf2;
	border-color: #ededf2;
	border-radius:10px;
}

.btn-outline-secondary {
	border-color: #dadae3;
}

/*인트로*/
.intro {
	background-image: url("/resources/assets/images/gym/trainer.jpg");
	background-size: cover;
	background-position: center;
	background-repeat: no-repeat;
	position: relative;
	padding: 200px 0 80px 0;
	z-index: 2;
	overflow: hidden;
	text-align: center;
}

.intro.overlay::before {
	background-color: #ffffff;
	opacity: 0.1;
	z-index: -1;
}

.intro .intro-content {
	position: relative;
	float: none;
	padding: 0px;
}

.intro .intro-content .page-title {
	font-size: 30px;
	margin-bottom: 5px;
	color: #fff;
}

.intro .intro-content p {
	font-size: 14px;
	margin: 15px 0px 0px;
	color: #fff;
}

/* 해시태그CSS */
* {
	margin: 0;
	padding: 0;
	list-style: none;
}

ul {
	padding: 16px 0;
}

ul li {
	display: inline-block;
	margin: 0 5px;
	font-size: 14px;
	letter-spacing: -.5px;
}

form {
	padding-top: 16px;
}

ul li.tag-item {
	padding: 10px 20px;
	background-color: #5c6dbd;
	color: white;
	border-radius: 30px;
}

.tag-item:hover {
	background-color: #d5d5db;
	color: #fff;
}

.del-btn {
	font-size: 12px;
	font-weight: bold;
	cursor: pointer;
	margin-left: 8px;
}

/* 파일업로드 css  */
.uploadResult {
	width: 100%;
	background-color: white;
}

.uploadResult ul {
	display: flex;
	flex-flow: row;
	justify-content: center;
	align-items: center;
}

.uploadResult ul li {
	list-style: none;
	padding: 10px;
}

.uploadResult ul li img {
	width: 80px;
	heigh: 80px;
}

.uploadResult .btn {
	padding: 1px;
	margin: 0px;
	border-radius: .90erm;
	color: black;
	background-color: white;
	border-color: white;
	border: 0px;
}


</style>

</head>

<body>

	<!-- Preloader -->
	<div class="preloader">
		<div class="preloader-inner">
			<div class="preloader-icon">
				<span></span> <span></span>
			</div>
		</div>
	</div>
	<!-- /End Preloader -->

	 <!--Header -->
   <%@ include file="/WEB-INF/views/includes/header.jsp" %>

	<!-- Start Breadcrumbs -->
	<div class="intro overlay">
		<div class="container">
			<div class="row align-items-center">
				<div class="col-lg-8 offset-lg-2 col-md-12 col-12">
					<div class="intro-content">
						<h1 class="page-title">트레이너 등록하기</h1>
						<p>트레이너로 등록해볼까요?</p>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- Start Features Area -->
	<section id="contact-us" class="contact-us section">
		 <div class="container"> 
			<!-- <div class="row"> -->
				<div class="col-lg-8 col-12" style="float: none; margin: 0 auto;" >
					<div class="form-main">
						<form class="form" id="submitForm" method="post" action="tbWrite.do">
						<input type="hidden" name="memberId" value="${member_memberId}">
						<input type="hidden" name="name" value="${member_name}">
						<input type="hidden" name="image" value="${member_image}">
							<!-- <div class="row"> -->
								<h2 class="title" style="margin-left:50px;">
									<span>지금 바로 등록하세요!</span>🏋🏼‍♂️트레이너 게시판
								</h2>
								<div class="col-10" style="margin-left:50px; margin-top:20px;">
									<div class="form-group">
										<label style="font-size: 18px; color:#323232"><b>제목</b></label>
										<input name="tbTitle" type="text" placeholder="예) 확찐자 맞춤 트레이닝 "
											required="required" style="border-radius:3px;">
									</div>
								</div>

								<div class="col-11" >
									<div class="form-group message" style="margin-left:50px;">
									<label style="font-size: 18px; color:#323232"><b>트레이너 소개</b></label>
										<textarea name="tbContent"  placeholder="자격증/ 수상경력 등 자기 소개를 입력해주세요. (최소 입력 80자)" 
										 style="border-radius:3px;" ></textarea>
									<!-- 	<div id="test_cnt">(0 / 200)</div> -->
									</div>
								</div>

								<div class="col-11">
									<div class="form-group message" style="margin-left:50px;">
									<label style="font-size: 18px; color:#323232"><b>프로그램 소개</b></label>
										<textarea name="tbProgram" placeholder="프로그램에 대해 소개해주세요." style="border-radius:3px;"></textarea>
									</div>
								</div>
								<!-- 스케줄 (시간)-->
								<div class="time">
									<div class="form-group" style="margin-left:50px;" >
										<label style="font-size: 18px; color:#323232"><b>트레이너 스케줄</b></label>
										 <strong>평일 (월~토)</strong>
										<div>
											<input class="timepicker" style="width: 44%;" id="time1" name="dayTimes" style="border-radius:3px;"> 
											<strong> ~ </strong> 
											<input class="timepicker" style="width: 44%;" id="time1" name="dayTimef" style="border-radius:3px;">
										</div>
									</div>
								</div>
								<div class="time">
									<div class="form-group" style="margin-left:50px;">
										<strong>일요일</strong>
										<div>
											<input class="timepicker" style="width: 44%;" name="sunTimes" style="border-radius:3px;">
											<strong> ~ </strong> 
											<input class="timepicker" style="width: 44%;" name="sunTimef" style="border-radius:3px;">
										</div>
									</div>
								</div>
								
								<!--활동 지역 해시태그 -->
								<div class="tr_hashTag_area" style="margin-left:50px; margin-top:15px;">
									<label style="font-size: 18px; color:#323232"><b>활동지역</b></label>
									<p>
										📢 입력 후 <strong style="color: darkblue">엔터 또는 스페이스바</strong>로
										등록해주세요.
									</p>
									<div class="form-group">
										<input type="hidden" value="" name="tag" id="rdTag" />
									</div>
									<ul id="tag-list"></ul>									
									<div class="form-group">
										<input type="text" id="tag" size="7" placeholder="Ex)종로구"
											style="width: 300px; margin-top: 5px; border-radius:3px;" />
									</div>
								</div>

								<!--활동 범위 체크박스 -->
								<div class="tr_options">
									<div class="btn-group-toggle" data-toggle="buttons" style="margin-left:50px;">
										<label style="font-size: 18px; color:#323232"><b>활동 범위를 체크해주세요.</b></label>
										<br>
										
										<label class="btn btn-outline-secondary" style="margin-top:10px;">
											<input type="checkbox" id="check" name="tbActivChk1" value="홈짐방문" >
											<p style="width:69px;">홈짐 방문</p>
										</label> 
										<label class="btn btn-outline-secondary" style="margin-top:10px;">
											<input type="checkbox" id="check" name="tbActivChk2" value="헬스장" >
											<p style="width:69px;">헬스장</p>
										</label> 
										<label class="btn btn-outline-secondary" style="margin-top:10px;">
											<input type="checkbox" id="check" name="tbActivChk3" value="홈짐보유" >
											<p style="width:69px;">홈짐보유</p>
										</label>
										
									</div>
								</div>

								<!-- 사진 업로드 -->
								<div class="col-lg-11" style="margin-left:50px;">
									<div class="form-group">
									<br>
										<label style="font-size: 18px; color:#323232"><b>대표 사진🏋️‍♂‍</b></label>
									</div>
										<div class="uploadShowMain">
										</div>
											
										<input type="file" name="tbImg" accept="image/*" style="margin-bottom: 30px;">
									<div class="form-group">
										<label style="font-size: 18px; color:#323232"><b>자기소개 사진🏋️‍♂‍</b></label>
										<p style="font-size: 13px; margin-left: 5px;">(최대 3장 업로드가능)</p>
									</div>
									<div class="uploadDiv">
										<input type='file' name='uploadFile' multiple>
										<!-- <input type='file' id='img_upload' name='uploadFile' multiple > -->
									</div>
									<div class="uploadResult">
										<ul>

										</ul>
									</div>
								</div>
								<div class="col-12">
									<div class="form-group button" style="text-align: center; margin-bottom:0px; margin-top:40px;">
										<button type="button" onclick="	validate(80);" class="btn" style="background-color: #3428A5; border-radius:10px; width: 90px;">등록</button>
									</div>
								</div>
							<!-- </div> --> <!-- ROW -->
							<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
						</form>
					</div>
				<!-- </div> -->  <!-- ROW -->
			 </div>
		</div>
	</section>
	<!-- /End Features Area -->

	<!-- Start Footer Area -->
	<footer class="footer style2">
		<!-- Start Footer Bottom -->
		<div class="footer-bottom">
			<div class="container">
				<div class="inner">
					<div class="row">
						<div class="col-md-6" style="text-align: start;">
							<div class="logo">
								<br> <br> <a href="index.html"><img
									src="/resources/assets/images/logo/로고1.png" alt="Logo"></a>
							</div>
						</div>
						<div class="col-md-6" style="text-align: end;">
							<p>
								<br> <a href="faq.html"> 자주묻는 질문</a> <br> 서울특별시 서초구
								강남대로 459 (서초동, 백암빌딩) 403호<br> (주) 빌려줘홈짐 | 문의 02-123-1234 |
								사업자등록번호 123-12-12345 <br>© 2021. All Rights Reserved.
							</p>

						</div>
					</div>
				</div>
			</div>
		</div>
	</footer>
	<!--/ End Footer Area -->

	<!-- ========================= scroll-top ========================= -->
	<a href="#" class="scroll-top btn-hover"> <i
		class="lni lni-chevron-up"></i>
	</a>
	
	<script src="https://code.jquery.com/jquery-1.12.4.js" integrity="sha256-Qw82+bXyGq6MydymqBxNPYTaUXXq7c8v3CwiYwLLNXU=" crossorigin="anonymous"></script>
	<!-- 시간 (30분 단위) -->
	<script>
    	/* 타임피커 이용한 시간 출력조정*/
    	$(document).ready(function(){
    		$('.timepicker').timepicker({
    		    timeFormat: 'HH:mm',
    		    interval: 30,			//30분 단위
    		    minTime: '6',    		// 최소 시작 시간
    		    maxTime: '22:00',		// 마지막 시
    		    defaultTime: '9',		// 아무런 값이 없을 때 나오는 시
    		    startTime: '06:00',		// 시작 시
    		    dynamic: false,
    		    dropdown: true,
    		    scrollbar: true
    		});
    	});
    </script>
    
    <script>
    
   /* 글자 수 최소 입력 체크 */
 function  validate(minlength) {

	 var len = $("textarea[name='tbContent']").val().length; 
	 
	 //만약, 해당하는 tbContent의 입력 글자가 80자 미만이면,
	 if (len < minlength) { 
		 // 최소입력 글자가 부족함을 알림 
         alert(minlength + '자 이상 으로 입력해야 합니다' ) ;
      	// 알림 후  해당하는 입력 필드로 포커스를 이동
         $("textarea[name='tbContent']").focus();
         return false;
        
     }	 
	 
	 // 최소 입력 글자를 넘기면 save() 실행
	 save();
   }
    </script>
	
	<!--해시태그-->
	<script>
	$(document).ready(function() {
	
		//해시태그
		var tag = {};
		var counter = 0;
	
		// 태그를 추가한다.
		function addTag(value) {
			tag[counter] = value; // 태그를 Object 안에 추가
			counter++; //  삭제를 위한 del-btn 의 고유 id 
		}
	
		//  tag 안에 있는 값을 array type 으로 만들어서 넘긴다.
		function marginTag() {
			return Object.values(tag).filter(function(word) {
				return word !== "";
			});
		}
	
		// 서버에 넘기기
		$("#tag-form").on("submit", function(e) {
			var value = marginTag(); // return array
			$("#rdTag").val(value);
			$(this).submit();
		});

	$("#tag").on("keypress",function(e) {
		var self = $(this);

		// input 에 focus 되있을 때 엔터 및 스페이스바 입력시 구동
		if (e.key === "Enter" || e.keyCode == 32) {

			if ($(".tag-item").length == 3) {

				alert('최대 입력 개수는 3개입니다.');

			} else {

				var tagValue = self.val();

				// 해시태그 값 없으면 x
				if (tagValue !== "") {

					var result = Object.values(tag).filter(function(word) {
						return word === tagValue;
					});
					
					// 태그 중복 검사
					if (result.length == 0) {
						$("#tag-list").append(
										"<li class='tag-item'>" + tagValue + "<span class='del-btn' idx='" + counter + "'>x</span></li>");
						$("#tag-list").append(
										"<input name=tagList type=hidden value=" + tagValue + ">");
						/*  $("#tag-list").append("<li class='tag-item'>" + tagValue + "<span class='del-btn' idx='" + counter + "'>x</span></li>"); */
						addTag(tagValue);
					} else {
						alert("이미 입력한 해시태그입니다.");
					}
				}
				e.preventDefault();
			}
		}
	});

	// 해시 태그 삭제 버튼 
	$(document).on("click", ".del-btn", function(e) {
		var index = $(this).attr("idx");
		tag[index] = "";
		$(this).parent().remove();
	});

	// 활동 범위 체크 박스
	$("input[id=check]:checkbox").click(function() {
		//$("input[name=tr_options]:checkbox").click(function () {
		//this.checked = true; //checked 처리
		if ($(this).is(":checked")) {
			$(this).parent().addClass("checkColor");
		} else {
			$(this).parent().removeClass("checkColor");
		}
	});
});

</script>

	<!-- ========================= JS here ========================= -->
	<script src="/resources/assets/js/bootstrap.min.js"></script>
	<script src="/resources/assets/js/count-up.min.js"></script>
	<script src="/resources/assets/js/wow.min.js"></script>
	<script src="/resources/assets/js/tiny-slider.js"></script>
	<script src="/resources/assets/js/glightbox.min.js"></script>
	<script src="/resources/assets/js/main.js"></script>
	<script src="/resources/assets/js/upload_file.js"></script>
			<!-- JQuery Timepicker -->
	<script src="/resources/assets/js/jquery.timepicker.min.js"></script>
	
	<!-- file upload start-->
	<!-- <script src='http://jquery-multifile-plugin.googlecode.com/svn/trunk/jquery.form.js' type="text/javascript" language="javascript"></script>
	<script src='http://jquery-multifile-plugin.googlecode.com/svn/trunk/jquery.MetaData.js' type="text/javascript" language="javascript"></script>
	<script src='http://jquery-multifile-plugin.googlecode.com/svn/trunk/jquery.MultiFile.js' type="text/javascript" language="javascript"></script>
	<script src='http://jquery-multifile-plugin.googlecode.com/svn/trunk/jquery.blockUI.js' type="text/javascript" language="javascript"></script>  -->
	<!-- file upload end-->

</body>

</html>