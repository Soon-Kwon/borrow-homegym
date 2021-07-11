<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>

	<!--Header -->
   <%@ include file="/WEB-INF/views/includes/header.jsp" %>

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

    <!-- Start Event Details -->
	<div class="event-details section" id="hg-list-section" style="padding-top: 60px;">
		<c:choose>
			<c:when test="${empty list}">
				<div class="container">
					<div class="row">
						<div class="col-lg-8 col-12" style="float: none; margin: 0 auto; text-align:center">
							<h3>검색 결과가 없습니다.<br> 우리동네 홈짐을 등록해보세요!🏠</h3>
							<br><br>
							<form class="d-flex search-form" action="homegymListView.do"
								method="get">
								<input class="form-control me-2" type="search" name="keyword"
									placeholder="동네 이름을 검색해보세요!" aria-label="Search">
								<button class="btn btn-outline-success" type="submit">
									<i class="lni lni-search-alt"></i>
								</button>
							</form>
							<br>
							<sec:authorize access="isAuthenticated()">
							<div class="write" style="text-align: center;">
								<button class="btn btn-primary" type="button" id="writeBtn"
									onclick="location.href='/homegym/registerView.do${pageMaker.cri.getListLink() }'">
									홈짐 등록하기</button>
							</div>
							</sec:authorize>
							<sec:authorize access="isAnonymous()">
							<div class="write" style="text-align: center;">
								<button href="#myModal" data-toggle="modal" data-target="#myModal" class="btn btn-primary" type="button" id="writeBtn">
									홈짐 등록하기</button>
							</div>
							</sec:authorize>
						</div>
					</div>
				</div>
				<br><br><br><br><br>
			</c:when>
			<c:otherwise>
				<div class="container">
					<div class="row">
						<div class="col-lg-8 col-12">
							<!-- Start Event Details Content -->
							<div id="map" style="width: 100%; height: 650px;"></div>
							<div class="details-content">
								<!--  맵 나오는 곳 -->
							</div>
							
							<sec:authorize access="isAuthenticated()">
							<div class="write" style="text-align: center;  margin-top: 30px;">
								<button class="btn btn-primary" type="button" id="writeBtn"
									onclick="location.href='/homegym/registerView.do${pageMaker.cri.getListLink() }'">
									홈짐 등록하기</button>
							</div>
							</sec:authorize>
							<sec:authorize access="isAnonymous()">
							<div class="write" style="text-align: center;  margin-top: 30px;">
								<button href="#myModal" data-toggle="modal" data-target="#myModal" class="btn btn-primary" type="button" id="writeBtn">
									홈짐 등록하기</button>
							</div>
							</sec:authorize>
							
						</div>
						<!-- End Event Details Content -->
						<!-- Start Event Details Sidebar -->
						<div class="col-lg-4 col-12">
							<div class="event-sidebar">
								<!-- Start Single Widget -->
								<div class="single-widget other-event-wedget">
									<h3 class="sidebar-widget-title" style="margin-bottom: 0px; ">
										플레이스🏠</h3>
									<div style="margin: 30px 0px;"></div>
									<ul class="other-event">
										<c:forEach items="${list }" var="board">
											<li class="single-event">
												<div class="thumbnail">
													<a href='<c:out value="${board.h_id}"/>' class="image move"><img
														src='/display.do?fileName=${board.uploadPath }${board.uuid }_${board.fileName }'
														alt="Event Image"></a>
												</div>
												<div class="info">
													<span class="date"><i class="lni lni-apartment"></i>${board.nickName }님의
														홈짐</span>
													<h6 class="title">
														<a class='move' href='<c:out value="${board.h_id}"/>'><c:out
																value="${board.h_title}" /></a>
													</h6>
													<c:choose>
														<c:when test="${board.avg_score == null}">
														<p style="font-size: 11px; padding-top: 10px">⭐️ 리뷰가 없습니다</p>
														</c:when>
														<c:otherwise>	
														<p style="font-size: 11px; padding-top: 10px">⭐ ${board.avg_score }</p>
														</c:otherwise>
													</c:choose>
													<span style="font-size: 11px; padding-top: 10px">${board.h_addr}</span>
												</div>
											</li>

										</c:forEach>
									</ul>
								</div>
								<div class="row">
									<div class="col-12">
										<!-- Pagination -->
										<div class="pagination center" style="margin: 0px;">
											<ul class="pagination-list">
												<c:if test="${pageMaker.prev }">
													<li class="paginate_button previous"><a
														href="${pageMaker.startPage -1 }">이전</a></li>
												</c:if>

												<c:forEach var="num" begin="${pageMaker.startPage }"
													end="${pageMaker.endPage }">
													<li
														class="paginate_button ${pageMaker.cri.pageNum == num ? "active" : "" }">
														<a href="${num }">${num }</a>
													</li>
												</c:forEach>

												<c:if test="${pageMaker.next }">
													<li class="paginate_button next"><a
														href="${pageMaker.endPage + 1 }">다음</a>
												</c:if>
											</ul>
											<!-- 페이지 번호 클릭했을 때 전송되는 form -->
											<form id="actionForm" action="/homegym/homegymListView.do"
												method="get">
												<input type='hidden' name='pageNum'
													value='${pageMaker.cri.pageNum }'> <input
													type='hidden' name='amount'
													value='${pageMaker.cri.amount }'> <input
													type='hidden' name='keyword'
													value='${pageMaker.cri.keyword }'>
											</form>
										</div>
										<!--/ End Pagination -->
									</div>
								</div>
								<!-- End Single Widget -->
							</div>
						</div>
						<!-- End Event Details Sidebar -->
					</div>
				</div>
			</c:otherwise>
		</c:choose>
	</div>

	<!-- Start Event Details -->
	<!-- 비로그인시 이동 Modal -->
	<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
	  <div class="modal-dialog" role="document">
	    <div class="modal-content">
	      <div class="modal-header">
	        <h5 class="modal-title" id="exampleModalLabel">서비스 안내</h5>
	        <!-- <button type="button" class="close" data-dismiss="modal" aria-label="Close">
	          <span aria-hidden="true">&times;</span>
	        </button> -->
	      </div>
	      <div class="modal-body" style="font-size: 15px; text-align: center";>
	        해당 서비스는 <b>로그인 후</b> 사용 가능합니다. <br>
	        비회원인 경우 <b>회원가입</b>을 먼저 진행해주세요!
	      </div>
	      <div class="modal-footer justify-content-center">
	        <button type="button" style="width: 80px;" class="btn btn-secondary" onclick="goLoginpage()" data-dismiss="modal">로그인</button>
	        <button type="button" style="border: none; width: 80px; background-color:#5c6dbd; color:white;" class="btn btn-primary1" data-dismiss="modal">창닫기</button>
	      </div>
	    </div>
	  </div>
	</div>

    <!-- Start Footer Area -->
    <footer class="footer style2">
        <!-- Start Footer Bottom -->
        <div class="footer-bottom" >
            <div class="container">
                <div class="inner">
                    <div class="row">
                        <div class="col-md-6" style="text-align: start;  ">
                            <div class="logo">
                                <br><br>
                                <a href="main_index.html"><img src="/resources/assets/images/logo/로고1.png" alt="Logo"></a>
                            </div>
                        </div>
                        <div class="col-md-6" style="text-align: end; ">
                            <p>
                                <br>
                                <a href="/user/faq.do"> 자주묻는 질문</a>
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
    <script src="/resources/assets/js/wow.min.js"></script>
    <script src="/resources/assets/js/tiny-slider.js"></script>
    <script src="/resources/assets/js/glightbox.min.js"></script>
    <script src="/resources/assets/js/main.js"></script>
     <!-- 모달 -->
    <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css"></script>
    <script type="text/javascript" src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"></script>
    <script type="text/javascript" src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.bundle.min.js"></script>
    <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    
    <!-- jquery -->    
    <script src="https://code.jquery.com/jquery-3.6.0.js" integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk=" crossorigin="anonymous"></script>
    
    <!-- 페이징 관련 자바스크립트 -->
    <script>
		$(document).ready(function(){
			
			// 페이지 버튼 클릭했을 때 이동
			var actionForm = $("#actionForm");
			
			$(".paginate_button a").on("click", function(e){
				
				e.preventDefault();
				
				actionForm.find("input[name='pageNum']").val($(this).attr("href"));
				actionForm.submit();
			});
			
			// 제목 클릭시 해당 글로 이동하는 form
			$(".move").on("click", function(e){
				
				e.preventDefault();
				
				actionForm.append("<input type='hidden' name='hId' value='" 
						+ $(this).attr("href") + "'>");
				actionForm.attr("action", "/homegym/homegymDetailView.do");
				actionForm.submit();
			});
		
		});
    </script>
    
    <!-- ========================= 카카오 지도 ========================= -->

    <script type="text/javascript"
        src="//dapi.kakao.com/v2/maps/sdk.js?appkey=e9acd85a01adaa0b260e4eb08bf997e9"></script>
    <script>
	   	var mapContainer = document.getElementById('map'), // 지도를 표시할 div  
	    mapOption = { 
	        center: new kakao.maps.LatLng('<c:out value="${list[0]['h_locate_Y']}"/>',
	        		'<c:out value="${list[0]['h_locate_X']}"/>'), // 지도의 중심좌표
	        level: 3 // 지도의 확대 레벨
	    };
	
		var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다
		
		
		// 마커를 표시할 위치와 title 객체 배열입니다
		
		var list = new Array();
		var positions = new Array();
		
		// 컨트롤러에서 넘어온 list 값을 ${list}로 호출하고 forEach문을 통해 
		// 자바스크립트 객체인 list로 넘겨준다. 
		<c:forEach items="${listAll}" var="item1">
			list.push(${item1});
		</c:forEach>
		
		for(var i = 0; i < list.length; i++) {
			var temp = {
					title : list[i]['h_title'],
					content: '<div style="text-align: center;">' + list[i]['h_title'] +'</div>',
			        latlng: new kakao.maps.LatLng(list[i]['h_locate_Y'],
			        		list[i]['h_locate_X']),
			        no: list[i]['h_id'],
			        thumbnail: '<div><img style="width:150px; height:100px;" src="/display.do?fileName=' + list[i]['uploadPath'] + '/' + list[i]['uuid'] + '_' + list[i]['fileName'] + '" alt="Event Image"></a></div>'
			}
			
			positions.push(temp);
		}
		// 마커를 표시할 위치와 title 객체 배열입니다 
	    /* var positions = [
	    {
	        title: '<c:out value="${list[0]['h_title']}"/>', 
	        content: '<div style="text-align: center;"><c:out value="${list[0]['h_title']}"/></div>',
	        latlng: new kakao.maps.LatLng('<c:out value="${list[0]['h_locate_Y']}"/>',
	        		'<c:out value="${list[0]['h_locate_X']}"/>'),
	        no: <c:out value="${list[0]['h_id']}"/> + "",
	        thumbnail: '<div><img style="width:150px; height:100px;" src="/display.do?fileName=${list[0]['uploadPath'] }/${list[0]['uuid']}_${list[0]['fileName']}" alt="Event Image"></a></div>'
	    },
	    {
	    	title: '<c:out value="${list[1]['h_title']}"/>', 
	        content: '<div style="text-align: center;"><c:out value="${list[1]['h_title']}"/></div>',
	        latlng: new kakao.maps.LatLng('<c:out value="${list[1]['h_locate_Y']}"/>',
		        		'<c:out value="${list[1]['h_locate_X']}"/>'),
    	    no: <c:out value="${list[1]['h_id']}"/> + "",
    	    thumbnail: '<div><img style="width:150px; height:100px;" src="/display.do?fileName=${list[1]['uploadPath'] }/${list[1]['uuid']}_${list[1]['fileName']}" alt="Event Image"></a></div>'
	    },
	    {
    	    title: '<c:out value="${list[2]['h_title']}"/>',
	        content: '<div style="text-align: center;"><c:out value="${list[2]['h_title']}"/></div>',
	        latlng: new kakao.maps.LatLng('<c:out value="${list[2]['h_locate_Y']}"/>',
		        		'<c:out value="${list[2]['h_locate_X']}"/>'),
        	no: <c:out value="${list[2]['h_id']}"/> + "",
        	thumbnail: '<div><img style="width:150px; height:100px;" src="/display.do?fileName=${list[2]['uploadPath'] }/${list[2]['uuid']}_${list[2]['fileName']}" alt="Event Image"></a></div>'
	    },
	    {
    	    title: '<c:out value="${list[3]['h_title']}"/>', 
	        content: '<div style="text-align: center;"><c:out value="${list[3]['h_title']}"/></div>',
	        latlng: new kakao.maps.LatLng('<c:out value="${list[3]['h_locate_Y']}"/>',
		        		'<c:out value="${list[3]['h_locate_X']}"/>'),
	      	no: <c:out value="${list[3]['h_id']}"/> + "",
	      	thumbnail: '<div><img style="width:150px; height:100px;" src="/display.do?fileName=${list[3]['uploadPath'] }/${list[3]['uuid']}_${list[3]['fileName']}" alt="Event Image"></a></div>'  
	    } 
	]; */
		
		// 마커 이미지의 이미지 주소입니다
		var imageSrc = "/resources/assets/images/logo/logo.png"; 
		    
		for (var i = 0; i < positions.length; i ++) {
		    
		    // 마커 이미지의 이미지 크기 입니다
		    var imageSize = new kakao.maps.Size(45, 60); 
		    
		    // 마커 이미지를 생성합니다    
		    var markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize); 
		    
		    // 마커를 생성합니다
		    var marker = new kakao.maps.Marker({
		        map: map, // 마커를 표시할 지도
		        position: positions[i].latlng, // 마커를 표시할 위치
		        title : positions[i].title, // 마커의 타이틀, 마커에 마우스를 올리면 타이틀이 표시됩니다
		        image : markerImage // 마커 이미지 
		    });
		    
		    // 마커에 표시할 인포윈도우를 생성합니다 
		    var infowindow = new kakao.maps.InfoWindow({
		      	
		        content: positions[i].content + positions[i].thumbnail // 인포윈도우에 표시할 제목 + 사진
		    });
		    
		    var index = positions[i].no;
		    
		    kakao.maps.event.addListener(marker, 'mouseover', makeOverListener(map, marker, infowindow));
		    kakao.maps.event.addListener(marker, 'mouseout', makeOutListener(infowindow));
		    kakao.maps.event.addListener(marker, 'click', clickListener(index));
			}
		
		// 인포윈도우를 표시하는 클로저를 만드는 함수입니다 
		function makeOverListener(map, marker, infowindow) {
		    return function() {
		        infowindow.open(map, marker);
		    };
		}

		// 인포윈도우를 닫는 클로저를 만드는 함수입니다 
		function makeOutListener(infowindow) {
		    return function() {
		        infowindow.close();
		    };
		}
    	
		// 인포윈도우 클릭시 해당 게시글로 이동
		function clickListener(index) {
		    return function() {
		    	location.href="/homegym/homegymDetailView.do?hId=" + index
		 	};
		}
		
		 /* 로그인 페이지 이동 */
	    function goLoginpage() {
	    	self.location = "/user/loginpage";
	    }
	    /* 모달 숨기기 */
	    function missModal(){
			$("#loginModal").hide();
		}
    </script>
</body>
</html>