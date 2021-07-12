<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec"%>

<!DOCTYPE html>
<html class="no-js" lang="zxx">

<head>
<style>
.box{
margin-top:15px;
height:auto; 
overflow:hidden; 
text-overflow: ellipsis;
/* white-space: nowrap; */
display:-webkit-box; 
-webkit-line-clamp: 5; 
-webkit-box-orient: vertical; 
}
pre{
border:none;
white-space: pre-wrap; 
scroll:no;

}


</style>

<script src="https://code.jquery.com/jquery-3.6.0.js" integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk=" crossorigin="anonymous"></script>
<!-- 페이징 관련 자바스크립트 -->
<script>
   $(document).ready(function() {

      // 페이지 버튼 클릭했을 때 이동
      var actionForm = $("#actionForm");

      $(".paginate_button a").on("click", function(e) {

         e.preventDefault();

         actionForm.find("input[name='pageNum']").val($(this).attr("href"));
         actionForm.submit();
      });

      // 제목 클릭시 해당 글로 이동하는 form
      $(".move").on("click",function(e) {

         e.preventDefault();

         actionForm.append("<input type='hidden' name='hId' value='" + $(this).attr("href") +"'>");
         actionForm.attr("action", "/trainer/tbDetail.do");
         actionForm.submit();
      });

   });
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
            <span></span> <span></span>
         </div>
      </div>
   </div>
   <!-- /End Preloader -->

   <!--Header -->
   <%@ include file="/WEB-INF/views/includes/header.jsp"%>

   <!-- Start Breadcrumbs -->
   <div class="breadcrumbs overlay">
      <div class="container">
         <div class="row align-items-center"></div>
         <div class="col-lg-8 offset-lg-2 col-md-12 col-12"></div>
         <div class="breadcrumbs-content">
            <h1 class="page-title">트레이너 둘러보기</h1>
            <p>여러분의 건강과 식단을 책임져 줄 트레이너! 여러분이 선택하세요!</p>
         </div>
      </div>
   </div>
   <!-- End Breadcrumbs -->

   <!-- Start Events Area-->
   <section class="courses section grid-page">
      <div class="container">
      <!--글 검색 창  -->
         <form class="d-flex search-form" action="/trainer/tbListSearch.do" method="get">
            <input class="form-control me-2" type="search" placeholder="동네로 검색 GOGO! " name="searchKeyword" aria-label="Search" style="width: 40%; margin-left:80%;">
            <input type='hidden' name='pageNum' value='${pageMaker.cri.pageNum }'> 
            <input type='hidden' name='amount' value='${pageMaker.cri.amount }'>
            <input type='hidden' name='serchKeyword' value='${trBord.searchKeyword }'>
            
            <button class="btn btn-outline-success" type="submit">
               <i class="lni lni-search-alt"></i>
            </button>
         </form>
         <!-- 글 리스트 나오는 구역 -->
         <div class="row">
            <c:choose>
               <c:when test="${not empty trainerBoardList }">
                  <c:forEach items="${trainerBoardList}" var="trBoard">
                     <div class="col-lg-4 col-md-6 col-12">
                        <!-- Start Single Course -->
                        <div class="single-course wow fadeInUp" data-wow-delay=".2s">
                           <div class="course-image" style="width: 100%; ">
                              <a href="tbDetail.do?tno=${trBoard.tno}" style="width: 100%; "> 
                                 <img src="/resources/imgUpload/${trBoard.tbImg}" style="height:400px;">
                              </a>
                           </div>
                           <div class="content" style="height:190px;">
                              <h5>${trBoard.tbTitle}</h5>
                              <pre><p class="box" style="font-family: 'Roboto', sans-serif; font-size:15px;">${trBoard.tbContent}</p></pre>
                           </div>
                        </div>
                     </div>
                  </c:forEach>
                  <!-- 글 작성하러 가기 버튼 (최하단) -->

                     <sec:authorize access="isAuthenticated()">
                     <div class="button" style="margin-top: 40px; text-align: center">
                        <a href="tbWrite.do" class="btn" style="border-radius:5px;" >글쓰기 </a>
                     </div>
                     </sec:authorize>
                     <sec:authorize access="isAnonymous()">
                     <div class="button" style="margin-top: 40px; text-align: center">
                        <a href="#myModal" data-toggle="modal" data-target="#myModal" class="btn" style="border-radius:5px;" >글쓰기 </a>
                     </div>
                     </sec:authorize>     
               </c:when>
               
               <c:otherwise>
                  <p style="text-align:center; margin-top:120px;">아직 해당 지역에는 등록된 트레이너가 없습니다!</p>      
               </c:otherwise>
            </c:choose>
         </div>
         <!-- 페이징 시작  -->
         <div class="row">
            <div class="col-12">
<<<<<<< HEAD
               <div class="pagination center">
=======
               <div class="pagination center" style="margin-top:30px;">
>>>>>>> 165f62f64cbda43cf251b2a31e5a733c0f2ad943
                  <ul class="pagination-list">
                     <c:if test="${pageMaker.prev }">
                        <li class="paginate_button previous"><a
                           href="${pageMaker.startPage -1 }">이전</a></li>
                     </c:if>
                     <c:forEach var="num" begin="${pageMaker.startPage }"
                        end="${pageMaker.endPage }">
                        <li class="paginate_button ${pageMaker.cri.pageNum == num ? "active" : "" }">
                           <a href="${num }">${num }</a>
                        </li>
                     </c:forEach>
                     <c:if test="${pageMaker.next }">
                        <li class="paginate_button next"><a
                           href="${pageMaker.endPage + 1 }">다음</a>
                     </c:if>
                  </ul>
                  
                  <!-- 페이지 번호 클릭했을 때 전송되는 form -->
                  <form id="actionForm" action="/trainer/tbList.do" method="get">
                     <input type='hidden' name='pageNum' value='${pageMaker.cri.pageNum }'> 
                     <input type='hidden' name='amount' value='${pageMaker.cri.amount }'>
                     <input type='hidden' name='searchKeyword' value='${trBoard.searchKeyword }'/> 
                  </form>
               </div>
               <!--/ End Pagination -->
            </div>
            
             
         
         <!-- 비로그인시 이동 Modal -->
         <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
           <div class="modal-dialog" role="document">
                   <div class="modal-content">
                        <div class="modal-header">
                          <h5 class="modal-title" id="exampleModalLabel">서비스 안내</h5>
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
         </div>
      </div>
   </section>
<!-- 본문 Area 끝-->


<!-- Footer Area  -->
   <footer class="footer style2">
      <!-- Start Footer Bottom -->
      <div class="footer-bottom">
         <div class="container">
            <div class="inner">
               <div class="row">
                  <div class="col-md-6" style="text-align: start;">
                     <div class="logo">
                        <br> <br> <a href="main_index.html"><img
                           src="/resources/assets/images/logo/로고1.png" alt="Logo"></a>
                     </div>
                  </div>
                  <div class="col-md-6" style="text-align: end;">
                     <p>
                        <br> <a href="/user/faq.do"> 자주묻는 질문</a> <br> 
                        서울특별시 서초구 강남대로 459 (서초동, 백암빌딩) 403호<br> 
                        (주) 빌려줘홈짐 | 문의 02-123-1234 | 사업자등록번호 123-12-12345 
                        <br> © 2021. All Rights Reserved.
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


   <script>
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