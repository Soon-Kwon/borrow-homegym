<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>

	<!DOCTYPE html>
	<html class="no-js" lang="zxx">
	<head>
	
		<style>
			.intro {
				background-image: url("/resources/assets/images/gym/homegym-image-01.jpg");
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

			/* 체크박스 */
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

			/* 폰트 */
			.font-general {
				color: black;
				font-size: 20px;
			}
			
			.uploadResult{
				width:100%;
				background-color: white;
			}
			
			.uploadResult ul{
				display: flex;
				flex-flow: row;
				justify-content: center;
				align-items: center;
			}
			
			.uploadResult ul li{
				list-style: none;
				padding: 10px;
			}
			
			.uploadResult ul li img{
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
		<!-- 다음 주소 api & 지도 api-->
		<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
		<script
			src="//dapi.kakao.com/v2/maps/sdk.js?appkey=e9acd85a01adaa0b260e4eb08bf997e9&libraries=services"></script>
		<!-- 제이쿼리 -->
		<script src="https://code.jquery.com/jquery-3.6.0.js"
			integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk=" crossorigin="anonymous"></script>
		
	</head>

	<body>
		<!--[if lte IE 9]>
      <p class="browserupgrade">
        You are using an <strong>outdated</strong> browser. Please
        <a href="https://browsehappy.com/">upgrade your browser</a> to improve
        your experience and security.
      </p>
    <![endif]-->
    <script>
			var chkArray = new Array();
			$(document).ready(function () {
				
				
				// 스프링 시큐리티 csrf 토큰 
				var token = $("meta[name='_csrf']").attr("content");
				var header = $("meta[name='_csrf_header']").attr("content");
				
				// 체크박스 색 조정
				$("input[name=homegym_options]").click(function () {
					//this.checked = true; //checked 처리
					if ($(this).is(":checked")) {
						$(this).parent().addClass("checkColor");
						chkArray.push(this.value);
					} else {
						$(this).parent().removeClass("checkColor");
						for(var i = 0; i < chkArray.length; i++) {
							if(chkArray[i] == this.value) {
								chkArray.splice(i, 1);
								i--;
							}
						}
					}				
				});
				
				// 파일 업로드
				var regex = new RegExp("(.*?)\.(exe|sh|zip|alz)$");
				var maxSize = 5242880;
				
				function checkExtension(fileName, fileSize){
					
					if(fileSize >= maxSize){
						alert("파일 사이즈 초과");
						return false;
					}
					
					if(regex.test(fileName)){
						alert("해당 종류의 파일은 업로드할 수 없습니다.");
						return false;
					}
				
					return true;
				}
				
				// (수정하려는 양식에 원래 업로드된 글정보 보여주기)
				
				var hid = '<c:out value="${board.HId}"/>';
				
				// hid값을 활용하여 첨부파일 리스트를 보여주는 ajax를 호출하고, 데이터에 hid 값을 넣어서 보내준다.  
				$.getJSON("/homegym/getAttachList.do?hId=" + hid, {hid: hid}, function(arr){
					
					var str = "";
					
					$(arr).each(function(i, attach){
						
						// 이미지 타입일때 
						if(attach.fileType){
							
							var fileCallPath = encodeURIComponent(attach.uploadPath + "/s_" 
									+ attach.uuid + "_" + attach.fileName);
							str += "<li data-path='" + attach.uploadPath + "'";
							str += " data-uuid='" + attach.uuid + "' data-filename='" + attach.fileName
									+ "'data-type='" + attach.fileType + "'";
							str += "><div>";
							str +="<span> " + attach.fileName + "</span>";
							str +="<button type='button' data-file=\'" + fileCallPath 
							+ "\'data-type='image' class='btn btn-warning btn-circle'>"
							+ "<i class='lni lni-cross-circle'></i></button><br>";
							str += "<img src='/display.do?fileName=" + fileCallPath + "'>" ;
							str += "</div>";
							str += "</li>";
						}else{ // 파일일 때 
							var fileCallPath = encodeURIComponent(attach.uploadPath + "/" + attach.uuid
									+ "_" + attach.fileName);
							var fileLink = fileCallPath.replace(new RegExp(/\\/g), "/");
							
							str += "<li data-path='" + attach.uploadPath + "'";
							str += " data-uuid='" + attach.uuid + "' data-filename='" + attach.fileName
									+ "'data-type='" + attach.fileType + "'";
							str += "><div>";
							str +="<span> " + attach.fileName + "<span>";
							str +="<button type='button' data-file=\'" + fileCallPath 
							+ "\'data-type='file' class='btn btn-warning btn-circle'>"
							+ "<i class='lni lni-cross-circle'></i></button><br>";
							str += "<img src='/assets/images/common/attach.png'></a>";
							str += "</div>";
							str += "</li>";
						}
					});
					
					$(".uploadResult ul").html(str);
				});
				
				// 수정시 업로드한 파일 보여주기
				$("input[type='file']").change(function(e){
					
					var token = $("meta[name='_csrf']").attr("content");
					var header = $("meta[name='_csrf_header']").attr("content");
					var formData = new FormData();
					
					var inputFile = $("input[name='uploadFile']");
					
					var files = inputFile[0].files;
					
					for(var i = 0; i < files.length; i++ ){
						
						if(!checkExtension(files[i].name, files[i].size)){
							return false;
						}
					
						formData.append("uploadFile", files[i]);
				
					}
					
					$.ajax({
						url: '/uploadAjaxAction.do',
						processData: false,
						contentType: false,
						data: formData,
						/* beforeSend: function(xhr){
							xhr.setRequestHeader(csrfHeaderName, csrfTokenValue);
						}, */
						type: 'POST',
						dataType: 'json',
						/*데이터를 전송하기 전에 헤더에 csrf값을 설정한다*/
						beforeSend : function(xhr){
							xhr.setRequestHeader(header, token);
			            },
						success: function(result){
							console.log(result);
							showUploadResult(result); // 업로드 결과 처리 함수 (섬네일 등)
						}, 
						error: function(error){
							console.log(error);
						}
					});
				});
				
				// (기존 글쓰기랑 달라진점 주의*) x를 누르면 업로드된 파일 자체가 아니라 화면에서만 사라지게 한다.
				// 또한 서버에 존재하는 사진을 직접 삭제하는 것이 아니기 때문에 원래 사진을 삭제하고 수정하면 
				// 서버에 남아있게 된다. 이에 대한 처리는 추후에.
				$(".uploadResult").on("click", "button", function(e){
					
					console.log("delete file");
					
					/* var targetFile = $(this).data("file");
					var type = $(this).data("type"); */
					
					if(confirm("사진을 삭제하시겠습니까?")){
					var targetLi = $(this).closest("li");
					targetLi.remove();
					}
			/* 		서버에서는 나중에 삭제
					$.ajax({
						url: '/deleteFile.do',
						data: {fileName: targetFile, type: type},
						dataType: 'text',
						beforeSend: function(xhr){
							xhr.setRequestHeader(csrfHeaderName, csrfTokenValue);
						},
						type: 'POST',
						success: function(result){
							alert(result);
							targetLi.remove();
						}
					}); */
				});
			});
		
		
		</script>

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
							<h1 class="page-title">내 홈짐 수정하기</h1>
							<p>등록하신 홈짐의 정보를 수정해 볼까요?</p>
						</div>
					</div>
				</div>
			</div>
		</div>
		<!-- End Breadcrumbs -->

		<section id="contact-us" class="contact-us section">
			<div class="container">
				<div class="row">
					<div class="col-lg-12 col-md-12 col-12">
						<div class="form-main">
							<h3 class="title">
								<span>변경사항이 있으신가요? 내 홈짐의 정보를 수정해보세요!</span>홈짐수정 게시판
							</h3>
							<form id="submitForm" class="form">
							<input type="hidden" name="hId" value='${board.HId }'>
								<div class="row">
									<div class="col-lg-12 col-12">
										<div class="form-group">
											<label>글제목</label> <input name="hTitle" type="text" id="title" placeholder="${board.HTitle }"
												required="required">
										</div>
									</div>

									<div class="col-lg-6 col-10">
										<div class="form-group">
											<label>주소</label> <input type="text" id="sample5_address"
												class="form-control" name="hAddr" placeholder="새로 등록해 주세요" required="true"
												readonly="readonly" />
										</div>
										<input type="hidden" id="x-coordinate" name="hLocateX" />
										<input type="hidden" id="y-coordinate" name="hLocateY" />
									</div>
									<div class="col-lg-2 col-2">
										<input type="button" onclick="sample5_execDaumPostcode()"
											class="btn btn-warning" style="margin-top: 28px; padding: .80rem .100rem;"
											value="주소 검색"> <br>
									</div>
									<div id="map" style="width: 300px; height: 300px; margin-top: 10px; display: none">
									</div>
									<p></p>
									<div class="row">
										<div class="col-lg-4 col-11">
											<div class="form-group">
												<label>가격 책정</label><input type="text" id="price" class="form-control"
													name="hPrice" placeholder="${board.HPrice }" required="true" />
											</div>
										</div>
										<div class="col-lg-1 col-1 font-general" style="margin-top: 39px;">원</div>
									</div>
										<div class="row">
										<div class="col-lg-4 col-11">
											<div class="form-group">
												<label>임시아이디</label><input type="text" name="memberId" class="form-control"
													placeholder="아이디" required="true" />
											</div>
										</div>
									</div>
									<!-- 사용 가능 날짜 설정 (기능 추가시 사용) 
									<div class="row">
										<div class="col-lg-3 col-12">
											<div class="form-group">
												<label>예약가능날짜</label>
												<input type='date' id="now_date" name='today' />
											</div>
										</div>
										<div class="col-lg-3 col-12">
											<div class="form-group">
												<label>시작 시간 : </label>
												<input type='time' />
											</div>
										</div>
										<div class="col-lg-3 col-12">
											<div class="form-group">
												<label>종료 시간 : </label>
												<input type='time' /><br>
											</div>
										</div>
										<div class="col-lg-2 col-12" style="justify-content: center;">
											<button type="button" class="btn btn-warning btnAdd"
												style="margin-top: 1.6rem; padding: .80rem .100rem;"
												onclick="add_item()">추가하기</button>
										</div>
									</div>
									<div id="append-form" style="display:none">
										<div class="row">
											<div class="col-lg-3 col-12">
												<div class="form-group">
													<label>예약가능날짜</label>
													<input type='date' id="now_date" name='today' />
												</div>
											</div>
											<div class="col-lg-3 col-12">
												<div class="form-group">
													<label>시작 시간 : </label>
													<input type='time' />
												</div>
											</div>
											<div class="col-lg-3 col-12">
												<div class="form-group">
													<label>종료 시간 : </label>
													<input type='time' /><br>
												</div>
											</div>
											<div class="col-lg-2 col-12">
												<button type="button" class="btn btn-warning btnAdd"
													style="margin-top: 28px; padding: .80rem .100rem;"
													onclick="remove_item(this)">삭제하기</button>
											</div>
										</div>
									</div>
									
									
									추가 공간
									<div class="row" id="field">
									</div>
									-->
									<div class="row home_options" style="margin-bottom: 18px;">
										<div class="btn-group-toggle" data-toggle="buttons">
											<p>
												<labal style="color:black; font-size: 13px;">사용 가능한 시설을 체크해주세요</label>
											</p>
											<label class="btn btn-outline-secondary"
												style="margin: 5px 10px 5px 0px; padding: 0px 15px 0px 15px;">
												<input type="checkbox" id='homegym_op' name='homegym_options' value='주차가능' >
												<p>주차가능</p>
											</label>
											<label class="btn btn-outline-secondary"
												style="margin: 5px 10px 5px 0px; padding: 0px 15px 0px 15px;">
												<input type="checkbox" id='homegym_op' name='homegym_options' value='와이파이가능'> 
												<p>와이파이가능</p>
											</label>
											<label class="btn btn-outline-secondary"
												style="margin: 5px 10px 5px 0px; padding: 0px 15px 0px 15px;">
												<input type="checkbox" id='homegym_op' name='homegym_options' value='샤워가능'>
												<p>샤워가능</p>
											</label>
											<label class="btn btn-outline-secondary"
												style="margin: 5px 10px 5px 0px; padding: 0px 15px 0px 15px;">
												<input type="checkbox" id='homegym_op' name='homegym_options' value='정수기보유'>
												<p>정수기보유</p>
											</label>
											<label class="btn btn-outline-secondary"
												style="margin: 5px 10px 5px 0px; padding: 0px 15px 0px 15px;">
												<input type="checkbox" id='homegym_op' name='homegym_options' value='에어컨보유'>
												<p>에어컨보유</p>
											</label>
											<input type="hidden" name="hHashtag" id="hashtag" value=""/>
										</div>
									</div>

									<div class="col-lg-12 col-12">
										<div class="form-group">
											<label style="margin-top:10px;">이미지 첨부</label>
										</div>
										<div class="uploadDiv">
											<input type='file' id='img_upload' name='uploadFile' multiple 
											style="margin-bottom: 30px;">
										</div>
										<div class="uploadResult">
											<ul>
											
											</ul>
										</div>
									</div>
									<div class="col-12">
										<div class="form-group message">
											<label>글 내용</label>
											<textarea name="hContent" placeholder="${board.HContent }"></textarea>
										</div>
									</div>
									<div class="col-12">
										<div class="form-group button" style="text-align: right;">
											<button class="btn" type="button" onclick="update();">게시물 수정</button>
											<button class="btn" type="button" onclick="remove();" style="color:white; 
											background-color:red; border-color:red;">게시물 삭제</button>
										</div>
									</div>
								</div>
							</form>
						</div>
					</div>

				</div>
			</div> 	
		</section>
		<!--/ End Contact Area -->
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
									<a href="main_index.html"><img src="/resources/assets/images/logo/로고1.png" alt="Logo"></a>
								</div>
							</div>
							<div class="col-md-6" style="text-align: end;">
								<p>
									<br>
									<a href="faq.html"> 자주묻는 질문</a>
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

		<!-- 주소api 스크립트-->
		<script>
			var mapContainer = document.getElementById('map'), // 지도를 표시할 div
				mapOption = {
					center: new daum.maps.LatLng(37.537187, 127.005476), // 지도의 중심좌표
					level: 5 // 지도의 확대 레벨
				};

			//지도를 미리 생성
			var map = new daum.maps.Map(mapContainer, mapOption);
			//주소-좌표 변환 객체를 생성
			var geocoder = new daum.maps.services.Geocoder();
			//마커를 미리 생성
			var marker = new daum.maps.Marker({
				position: new daum.maps.LatLng(37.537187, 127.005476),
				map: map
			});


			function sample5_execDaumPostcode() {
				new daum.Postcode({
					oncomplete: function (data) {
						var addr = data.address; // 최종 주소 변수

						// 주소 정보를 해당 필드에 넣는다.
						document.getElementById("sample5_address").value = addr;
						// 주소로 상세 정보를 검색
						geocoder.addressSearch(data.address, function (results, status) {
							// 정상적으로 검색이 완료됐으면
							if (status === daum.maps.services.Status.OK) {

								var result = results[0]; //첫번째 결과의 값을 활용

								// 해당 주소에 대한 좌표를 받아서
								var coords = new daum.maps.LatLng(result.y, result.x);

								var x = coords.La;
								var y = coords.Ma;

								document.getElementById("x-coordinate").value = x;
								document.getElementById("y-coordinate").value = y;
								
								// 지도를 보여준다.
								mapContainer.style.display = "block";
								map.relayout();
								// 지도 중심을 변경한다.
								map.setCenter(coords);
								// 마커를 결과값으로 받은 위치로 옮긴다.
								marker.setPosition(coords)
							}
						});
					}
				}).open();
			}
		</script>
		
		<script>
		
		// 글 수정시 실행되는 update	()함수
		function update(){
			// 해쉬태그 데이터 베이스 저장
			var hashTag = '';
			for(var i = 0; i < chkArray.length; i++) {
				hashTag += chkArray[i];
				if(i < chkArray.length - 1) {
					hashTag += ', ';
				}
			}
			
			$('#hashtag').val(hashTag);
			
			if($('#price').val() == '' || $('#title').val() == ''){
				alert("필수 내용들을 적어주세요");
				return;
			}
			
			// 첨부파일 hidden으로 값 넘겨주기
			
			var str = "";
			
			$(".uploadResult ul li").each(function(i, obj){
				
				var token = $("meta[name='_csrf']").attr("content");
				var header = $("meta[name='_csrf_header']").attr("content");
				var jobj = $(obj);
				
				console.dir(jobj);
				
				str += "<input type='hidden' name='attachList[" + i + "].fileName' value ='" 
						+ jobj.data("filename") +"'>";
				str += "<input type='hidden' name='attachList[" + i + "].uuid' value ='" 
						+ jobj.data("uuid") +"'>";
				str += "<input type='hidden' name='attachList[" + i + "].uploadPath' value ='" 
						+ jobj.data("path") +"'>";
				str += "<input type='hidden' name='attachList[" + i + "].fileType' value ='" 
						+ jobj.data("type") +"'>";
			});
			
			if(str == null || str == ""){
				alert("최소 한 장 이상의 사진을 올려주세요!");
				return;
			}
			
			var formObj = $("#submitForm");
			
			formObj.append(str);
						
			var data = formObj.serialize();
				
			$.ajax({
				type: 'POST',
				url: 'homegymModify.do',
				dataType: 'text',
				data: data,
				/*데이터를 전송하기 전에 헤더에 csrf값을 설정한다*/
				beforeSend : function(xhr){
					xhr.setRequestHeader(header, token);
	            },
				success: function(data) {
					alert(data);
					if(data == 'OK') {
						alert('글 수정에 성공하였습니다.');
						window.location.replace("/homegym/homegymDetailView.do?hId=" + <c:out value='${board.HId}'/>);
					}
				},
				error: function(e, data) {
					alert(data);
					console.log(e);
				}
			});
		}
		
		// 삭제하기
		
		function remove(){
			
			var token = $("meta[name='_csrf']").attr("content");
			var header = $("meta[name='_csrf_header']").attr("content");
			var hId = ${board.HId};
			
			if(confirm("이 게시글을 정말로 삭제하시겠습니까?")){
				$.ajax({
					type: 'POST',
					url: 'homegymRemove.do',
					dataType: 'text',
					/*데이터를 전송하기 전에 헤더에 csrf값을 설정한다*/
					beforeSend : function(xhr){
						xhr.setRequestHeader(header, token);
		            },
					data: {hId: hId},
					success: function(data){
						alert('글 삭제에 성공하였습니다.');
						window.location.replace("/homegym/homegymListView.do${cri.getListLink() }");
					},
					error: function(e, data){
						alert(data);
						console.log(e);
					}
				});
			}
			
		}
		// 업로드 결과 처리 함수
		function showUploadResult(uploadResultArr){
			
			if(!uploadResultArr || uploadResultArr.length == 0){ return;}
			
			var uploadUL = $(".uploadResult ul");
			
			var str = "";
			
			$(uploadResultArr).each(function(i, obj){
				
				//image type
				if(obj.fileType){
					
					var fileCallPath = encodeURIComponent(obj.uploadPath + "/s_" 
							+ obj.uuid + "_" + obj.fileName);
					str += "<li data-path='" + obj.uploadPath + "'";
					str += " data-uuid='" + obj.uuid + "' data-filename='" + obj.fileName
							+ "'data-type='" + obj.fileType + "'";
					str += "><div>";
					str +="<span> " + obj.fileName + "</span>";
					str +="<button type='button' data-file=\'" + fileCallPath 
					+ "\'data-type='image' class='btn btn-warning btn-circle'>"
					+ "<i class='lni lni-cross-circle'></i></button><br>";
					str += "<img src='/display.do?fileName=" + fileCallPath + "'>" ;
					str += "</div>";
					str += "</li>";
				}else{
					var fileCallPath = encodeURIComponent(obj.uploadPath + "/" + obj.uuid
							+ "_" + obj.fileName);
					var fileLink = fileCallPath.replace(new RegExp(/\\/g), "/");
					
					str += "<li data-path='" + obj.uploadPath + "'";
					str += " data-uuid='" + obj.uuid + "' data-filename='" + obj.fileName
							+ "'data-type='" + obj.fileType + "'";
					str += "><div>";
					str +="<span> " + obj.fileName + "<span>";
					str +="<button type='button' data-file=\'" + fileCallPath 
					+ "\'data-type='file' class='btn btn-warning btn-circle'>"
					+ "<i class='lni lni-cross-circle'></i></button><br>";
					str += "<img src='/assets/images/common/attach.png'></a>";
					str += "</div>";
					str += "</li>";
				}
			});
			
			uploadUL.append(str);
		}
	
		</script>

		<!-- ========================= scroll-top ========================= -->
		<a href="#" class="scroll-top btn-hover"> <i class="lni lni-chevron-up"></i>
		</a>

		<!-- ========================= JS here ========================= -->
		<script src="/resources/assets/js/bootstrap.min.js"></script>
		<script src="/resources/assets/js/count-up.min.js"></script>
		<script src="/resources/assets/js/wow.min.js"></script>
		<script src="/resources/assets/js/tiny-slider.js"></script>
		<script src="/resources/assets/js/glightbox.min.js"></script>
		<script src="/resources/assets/js/main.js"></script>
	</body>

</html>