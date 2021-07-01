<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<!DOCTYPE html>
<html class="no-js" lang="zxx">

<head>
<meta charset="utf-8" />
<meta http-equiv="x-ua-compatible" content="ie=edge" />
<title>빌려줘! 홈짐 - 트레이너 작성</title>
<meta name="description" content="" />
<meta name="viewport" content="width=device-width, initial-scale=1" />
<link rel="shortcut icon" type="image/x-icon"
	href="/resources/assets/images/logo/logo.png" />

<!-- Place favicon.ico in the root directory -->

<!-- Web Font -->
<link
	href="https://fonts.googleapis.com/css2?family=Poppins:ital,wght@0,100;0,200;0,300;0,400;0,500;0,600;0,700;0,800;0,900;1,100;1,200;1,300;1,400;1,500;1,600;1,700;1,800;1,900&display=swap"
	rel="stylesheet">

<!-- ========================= CSS here ========================= -->

<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
<link rel="stylesheet" href="/resources/assets/css/bootstrap.min.css" />
<link rel="stylesheet" href="/resources/assets/css/LineIcons.2.0.css" />
<link rel="stylesheet" href="/resources/assets/css/animate.css" />
<link rel="stylesheet" href="/resources/assets/css/tiny-slider.css" />
<link rel="stylesheet" href="/resources/assets/css/glightbox.min.css" />
<link rel="stylesheet" href="/resources/assets/css/main.css" />

<script src="https://code.jquery.com/jquery-3.3.1.min.js"
	integrity="sha256-FgpCb/KJQlLNfOu91ta32o/NMZzltwRo8QtmkMRdAu8="
	crossorigin="anonymous"></script>
<script src="https://code.jquery.com/jquery-1.12.4.js"
	integrity="sha256-Qw82+bXyGq6MydymqBxNPYTaUXXq7c8v3CwiYwLLNXU="
	crossorigin="anonymous"></script>

<style>
p {
	margin: 10px 5px;
}

.checkColor {
	background-color: #9ea9d8;
	border-color: #9ea9d8;
	color: white;
}

.btn-outline-secondary:hover {
	color: #6c757d;
	background-color: #ededf2;
	border-color: #ededf2;
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
</style>
<!--해시태그-->
<style>
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
</style>
<!--//해시태그 끝-->

<!--해시태그-->
<script>
	$(document)
			.ready(
					function() {

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

						$("#tag")
								.on(
										"keypress",
										function(e) {
											var self = $(this);

											// input 에 focus 되있을 때 엔터 및 스페이스바 입력시 구동
											if (e.key === "Enter"
													|| e.keyCode == 32) {

												if ($(".tag-item").size() == 3) {

													alert('최대 입력 개수는 3개입니다.');

												} else {

													var tagValue = self.val();

													// 해시태그 값 없으면 x
													if (tagValue !== "") {

														var result = Object
																.values(tag)
																.filter(
																		function(
																				word) {
																			return word === tagValue;
																		})

														// 태그 중복 검사
														if (result.length == 0) {
															$("#tag-list")
																	.append(
																			"<li class='tag-item'>"
																					+ tagValue
																					+ "<span class='del-btn' idx='" + counter + "'>x</span></li>");
															$("#tag-list")
																	.append(
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

						// 삭제 버튼 
						$(document).on("click", ".del-btn", function(e) {
							var index = $(this).attr("idx");
							tag[index] = "";
							$(this).parent().remove();
						});

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
	
	
	<!-- 이미지 업로드  -->
<script>
	var chkArray = new Array();
	$(document).ready(function() {

		// 체크박스 색 조정
		$("input[name=homegym_options]").click(function() {
			//this.checked = true; //checked 처리
			if ($(this).is(":checked")) {
				$(this).parent().addClass("checkColor");
				chkArray.push(this.value);
			} else {
				$(this).parent().removeClass("checkColor");
				for (var i = 0; i < chkArray.length; i++) {
					if (chkArray[i] == this.value) {
						chkArray.splice(i, 1);
						i--;
					}
				}
			}
		});

		var regex = new RegExp("(.*?)\.(exe|sh|zip|alz)$");
		var maxSize = 5242880;

		function checkExtension(fileName, fileSize) {

			if (fileSize >= maxSize) {
				alert("파일 사이즈 초과");
				return false;
			}

			if (regex.test(fileName)) {
				alert("해당 종류의 파일은 업로드할 수 없습니다.");
				return false;
			}

			return true;
		}

		$("input[type='file']").change(function(e) {
			
			var token = $("meta[name='_csrf']").attr("content");
			var header = $("meta[name='_csrf_header']").attr("content");
			var formData = new FormData();

			var inputFile = $("input[name='uploadFile']");

			var files = inputFile[0].files;

			for (var i = 0; i < files.length; i++) {

				if (!checkExtension(files[i].name, files[i].size)) {
					return false;
				}

				formData.append("uploadFile", files[i]);

			}

			$.ajax({
				url : '/uploadAjaxAction.do',
				processData : false,
				contentType : false,
				data : formData,
				type : 'POST',
				dataType : 'json',
				/*데이터를 전송하기 전에 헤더에 csrf값을 설정한다*/
				beforeSend : function(xhr){
					xhr.setRequestHeader(header, token);
	            },
				success : function(result) {
					
					alert("업로드 성공");
					console.log(result);
					showUploadResult(result); // 업로드 결과 처리 함수 (섬네일 등)
				},
				error : function(error) {
					console.log(error);
				}
			});
		});

		// x를 누르면 업로드된 파일 삭제
		$(".uploadResult").on("click", "button", function(e) {

			console.log("delete file");
			var token = $("meta[name='_csrf']").attr("content");
			var header = $("meta[name='_csrf_header']").attr("content");
			var targetFile = $(this).data("file");
			var type = $(this).data("type");

			var targetLi = $(this).closest("li");

			$.ajax({
				url : '/deleteFile.do',
				data : {
					fileName : targetFile,
					type : type
				},
				dataType : 'text',
				type : 'POST',
				/*데이터를 전송하기 전에 헤더에 csrf값을 설정한다*/
				beforeSend : function(xhr){
					xhr.setRequestHeader(header, token);
	            },
				success : function(result) {
					alert(result);
					targetLi.remove();
				}
			});
		});
	});
</script>
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
			<div class="row">
				<div class="col-lg-13 col-md-12 col-12">
					<div class="form-main">
						<form class="form" method="post" action="tbWriter.do">
							<div class="row">
								<h3 class="title">
									<span>지금 바로 등록하세요!</span>🏋🏼‍♂️트레이너 게시판
								</h3>
								<div class="col-lg-6 col-12">
									<div class="form-group">
										<label style="font-size: 20px;">제목</label> <input
											name="tbTitle" type="text" placeholder="예) 확찐자 맞춤 트레이닝 "
											required="required">
									</div>
								</div>

								<div class="col-12">
									<div class="form-group message">
										<label style="font-size: 20px;">트레이너 소개</label>
										<textarea name="tbContent"
											placeholder="자격증/ 수상경력 등 자기 소개를 입력해주세요. "></textarea>
									</div>
								</div>

								<div class="col-12">
									<div class="form-group message">
										<label style="font-size: 20px;">프로그램 소개</label>
										<textarea name="tbProgram" placeholder="프로그램에 대해 소개해주세요."></textarea>
									</div>
								</div>
								<!-- 스케줄 (시간)-->
								<div class="time">
									<div class="form-group">
										<label style="font-size: 20px;">트레이너 스케줄</label> <strong>평일
											(월~토)</strong>
										<div>
											<input type="time" style="width: 300px;" id="time1"
												name="dayTimes"> <strong> ~ </strong> <input
												type="time" style="width: 300px;" id="time1" name="dayTimef">
										</div>
									</div>
								</div>
								<div class="time">
									<div class="form-group">
										<strong>일요일</strong>
										<div>
											<input type="time" style="width: 300px;" name="sunTimes">
											<strong> ~ </strong> <input type="time" style="width: 300px;"
												name="sunTimef">
										</div>
									</div>
								</div>


								<!--활동 지역 해시태그 -->
								<div class="tr_hashTag_area">
									<p>
										<strong>활동지역</strong>
									</p>
									<p>
										📢입력 후 <strong style="color: darkblue">엔터 또는 스페이스바</strong>로
										등록해주세요.
									</p>
									<div class="form-group">
										<input type="hidden" value="" name="tag" id="rdTag" />
									</div>

									<ul id="tag-list"></ul>

									<div class="form-group">
										<input type="text" id="tag" size="7" placeholder="Ex)종로구"
											style="width: 300px;" />
									</div>
								</div>

								<!--활동 범위 체크박스 -->
								<div class="tr_options">
									<div class="btn-group-toggle" data-toggle="buttons">
										<p>
											<strong>활동 범위를 체크해주세요.</strong>
										</p>
										<label class="btn btn-outline-secondary"
											style="margin: 5px 10px 5px 0px; padding: 0px 15px 0px 15px;">
											<input type="checkbox" id="check" name="tbActivChk1"
											value="홈짐방문">
											<p>홈짐방문</p>
										</label> <label class="btn btn-outline-secondary"
											style="margin: 5px 10px 5px 0px; padding: 0px 15px 0px 15px;">
											<input type="checkbox" id="check" name="tbActivChk2"
											value="헬스장">
											<p>헬스장</p>
										</label> <label class="btn btn-outline-secondary"
											style="margin: 5px 10px 5px 0px; padding: 0px 15px 0px 15px;">
											<input type="checkbox" id="check" name="tbActivChk3"
											value="홈짐보유">
											<p>홈짐보유</p>
										</label>

									</div>
								</div>

								<!-- 사진 업로드 -->
								<div class="col-lg-6 col-12">
									<div class="form-group">
										<label style="font-size: 20px;">대표사진 등록</label>
									</div>
									<div>
										<input type="file" id="img_upload" name="tbImg"
											accept="image/*" style="margin-bottom: 30px;">
										<div id="image_container"></div>
									</div>
									<div class="form-group">
										<label style="font-size: 20px;">자기 소개사진 등록
											<p>(최대 3장 업로드 가능)</p>
										</label>
									</div>
									<!-- 자기소개 사진업로드 -->
									<div>
										<input type="file" id="img_upload" multiple="multiple"
											name="upLoadFile" accept="image/*"
											style="margin-bottom: 30px;">
										<button id="uploadBtn">사진 올리기</button>
										<!-- 											name="tbPhoto1" accept="image/*" style="margin-bottom: 30px;"> -->
										<%-- 	<a href="resources/upload/${filename}">${photo1}</a><br> --%>
										<div id="image_container"></div>
									</div>
								</div>


								<div class="col-12">
									<div class="form-group button" style="text-align: center;">
										<button type="submit" class="btn"
											style="background-color: #3428A5; width: 110px;">등록</button>
									</div>
								</div>
							</div>
							<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
						</form>
					</div>
				</div>
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


	<!-- ========================= JS here ========================= -->
	<script src="/resources/assets/js/bootstrap.min.js"></script>
	<script src="/resources/assets/js/count-up.min.js"></script>
	<script src="/resources/assets/js/wow.min.js"></script>
	<script src="/resources/assets/js/tiny-slider.js"></script>
	<script src="/resources/assets/js/glightbox.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/assets/js/main.js"></script>


</body>

</html>