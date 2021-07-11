<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html class="no-js" lang="zxx">

<head>
    
    <script src="https://code.jquery.com/jquery-3.4.1.js" integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU=" crossorigin="anonymous">
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

    <!--Header -->
   <%@ include file="/WEB-INF/views/includes/header.jsp" %>
   
    <!-- start Registration section -->
    <section class="login section">
        <div class="container">
            <div class="row">
                <div class="col-lg-6 offset-lg-3 col-md-8 offset-md-2 col-12">
                    <div class="form-head">
                        <h4 class="title">회원 가입</h4>
                        <form id="join_form" method="post" action="/user/join" accept-charset="UTF-8">
                            <div class="form-group">
                                <label>아이디</label>
                                <input type="text" class="margin-5px-bottom"  id="memberId" name="memberId" placeholder="이메일 형식 입력(ex.user@gmail.com)" style= "width:80%">
                                <button type="button" id="idChk" class="btnjo" onclick="idCheck();">중복 확인</button>
                                <div id="idCheck" style="margin-top:5px;"></div>
                            </div>
                            <div class="form-group">
                                <label>닉네임</label>
                                <input class="margin-5px-bottom" type="text" id="nickname" name="nickname" placeholder="닉네임 입력" style="width:80%">
                                <button type="button" id="nickChk" class="btnjo" onclick="nickCheck();">중복 확인</button>
                                <div id="nickCheck" style="margin-top:5px;"></div>
                            </div>
                            <div class="form-group">
                                <label>비밀번호</label>
                                <input class="margin-5px-bottom" type="password" id="password" name="password" placeholder="비밀번호 입력" style="width:80%">
                                <div id="pwCheck" style="margin-top:5px;"></div>
                            </div>
                            <div class="form-group">
                                <label>비밀번호 확인</label>
                                <input class="margin-5px-bottom" type="password" id="passwordCheck" name="passwordCheck" placeholder="비밀번호 재입력" style="width:80%">
                            	<div id="checkNotice" style="margin-top:5px;"></div>
                            </div>
                            <div class="form-group">
                                <label>이름</label>
                                <input class="margin-5px-bottom" type="text" id="name" name="name" placeholder="이름 입력" style="width:80%">
                            </div>
                            <div class="form-group">
                                <label>전화번호</label>
                                <input class="margin-5px-bottom phone" type="text" id="phone" name="phone" placeholder="'-' 빼고 숫자만 입력" style="width:80%" maxlength="13">
                            </div>
                          
                            <div class="form-group">
                                <label>생년월일</label>
                                <input class="margin-5px-bottom" type="text" id="birth" name="birth" placeholder="생년월일 6자리 입력(ex.910101) " style="width:80%" maxlength="6">
                            </div>
                            <div class="form-group">
                                <label>주소</label>
                                <input class="margin-5px-bottom" type="text" id="zipCode" name="zipCode" placeholder="우편번호" style="width:80%" readonly="readonly">
                                <button type="button" id="zip_codeBtn" class="btnjo" onclick="execPostCode();"><i class="fa fa-search"></i>우편번호</button>                            
                            </div>
                            <div class="form-group">
                                <input class="margin-5px-bottom" type="text" id="address" name="address" placeholder="도로명 주소" style="width:80%" readonly="readonly">
                            </div>                                             
                            
                            <div class="gender">
                                <label>성별</label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                <label><input type="radio" id="gender1" name="gender" value="남성" checked="checked" onclick="doOpenCheck(this);" > 남성</label>&nbsp;&nbsp;&nbsp;&nbsp;
                                <label><input type="radio" id="gender2" name="gender" value="여성" onclick="doOpenCheck(this);" > 여성</label>
                            </div>

                            <div class="button">
                                <button type="submit" class="btn" id="join_button">회원가입</button>
                            </div>
                            <p class="outer-link">아이디가 있으신가요?&nbsp;&nbsp; <a href="/user/login">로그인</a></p>
                            <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- End Registration section -->

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
    <script type="text/javascript"></script>
    
    <script>
    
    /* 성별 체크박스 하나만 선택하게 하기 */
    /* function doOpenCheck(chk){
        var obj = document.getElementsByName("gender");
        for(var i=0; i<obj.length; i++){
            if(obj[i] != chk){
                obj[i].checked = false;
            }
        }
    } */
   
	/* 비밀번호 동일한지 체크 */
   $(function(){
	    $('#password').keyup(function(){
	      $('#checkNotice').html('');
	    });

	    $('#passwordCheck').keyup(function(){
	        if($('#password').val() != $('#passwordCheck').val()){
	          $('#checkNotice').text('비밀번호 불일치');
	          $('#checkNotice').attr('style', 'color: red');
	        } else{
	          $('#checkNotice').text('비밀번호 일치');
	          $('#checkNotice').attr('style', 'color: green');
	        }

	    });
	});
	
	/* 아이디 중복 체크 */
	var checked_id = '';
	function idCheck() {
		var token = $("meta[name='_csrf']").attr("content");
		var header = $("meta[name='_csrf_header']").attr("content");
		var memberId = $('#memberId').val();
		
		if(memberId.search(/\s/) != -1) {
			alert("아이디에는 공백이 들어갈 수 없습니다.");
		} else {
			if(memberId.trim().length != 0) {
				$.ajax ({
					type: 'POST',
					url: '/user/idCheck',
					data: memberId,
					dataType:'text',
					contentType: "application/json; charset=UTF-8",
					/*데이터를 전송하기 전에 헤더에 csrf값을 설정한다*/
					beforeSend : function(xhr){
						xhr.setRequestHeader(header, token);
		            },
					success: function(data) {
						if(data == 'OK') {
							$("#idCheck").text('사용가능한 아이디입니다.');
							$("#idCheck").attr("style","color: green");
							checked_id = 1;
						} else {
							$("#idCheck").text('중복된 아이디가 존재합니다.');
							$("#idCheck").attr("style","color: red");
							checked_id = 0;
						}
					},
					error: function(e) {
						console.log(e);
					}
				});
			} else {
				alert("아이디를 입력해주세요.");
			}
		}
	}
	
	/* 닉네임 중복 체크 */
	var checked_nick = '';
	function nickCheck() {
		console.log("진입");
		var token = $("meta[name='_csrf']").attr("content");
		var header = $("meta[name='_csrf_header']").attr("content");
		var nickname = $('#nickname').val();
		
		if(nickname.search(/\s/) != -1) {
			alert("닉네임에는 공백이 들어갈 수 없습니다.");
		} else {
			if(nickname.trim().length != 0) {
				$.ajax ({
					type: 'POST',
					url: '/user/nickCheck',
					data: nickname,
					dataType: 'text',
					contentType: "application/json; charset=UTF-8",
					/*데이터를 전송하기 전에 헤더에 csrf값을 설정한다*/
					beforeSend : function(xhr){
						xhr.setRequestHeader(header, token);
		            },
					success: function(data) {
						if(data == 'OK') {
							$("#nickCheck").text('사용가능한 닉네임입니다.');
							$("#nickCheck").attr("style","color: green");
							checked_nick = 1;
						} else {
							$("#nickCheck").text('중복된 닉네임이 존재합니다.');
							$("#nickCheck").attr("style","color: red");
							checked_nick = 0;
						}
					},
					error: function(e) {
						console.log(e);
					}
				});
			} else {
				alert("닉네임을 입력해주세요.");
			}
		}
	}
    
 	/* 이메일 형식 체크 */
	function email_check( memberId ) {    
	    var regex=/([\w-\.]+)@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.)|(([\w-]+\.)+))([a-zA-Z]{2,4}|[0-9]{1,3})(\]?)$/;
	    return (memberId != '' && memberId != 'undefined' && regex.test(memberId)); 
	}

	$("input[name=memberId]").blur(function(){
	  var memberId = $(this).val();
	  if( memberId == '' || memberId == 'undefined') return;
	  if(! email_check(memberId) ) {
	  	$("#idCheck").text('이메일 형식으로 적어주세요');
	    $(this).focus();
	    return false;
	  }else {
		$("#idCheck").text('');
	  }
	});
  	
	/* 비밀번호 형식 체크 */	
	function password_check(password) {    
			   // 원하는 특수문자 추가 제거		
		var regex= /^(?=.*[a-zA-Z])(?=.*[!@#$%^*+=-])(?=.*[0-9]).{8,16}$/;
	    if(!regex.test(password)){
			return false;
	    } else {
	    	return true;
	   	}
	}
		
	$("input[name=password]").blur(function(){
		var password = $('#password').val();
		if( password == '' || password == 'undefined') return;
			console.log(password);
		if(! password_check(password) ) {
			$("#pwCheck").text('영문+숫자+특수기호 8자리 이상으로 구성해주세요');
			$(this).focus();
		}else {
			$("#pwCheck").text('');
		}  
	});
	
	
	/* 전화번호 형식 체크 */
   
   	$(document).on("keyup", ".phone", function() { 
      	$(this).val( $(this).val().replace(/[^0-9]/g, "").replace(/(^02|^0505|^1[0-9]{3}|^0[0-9]{2})([0-9]+)?([0-9]{4})$/,"$1-$2-$3").replace("—", "-") ); 
  	 	});
	
	/* NULL 체크 */
	$(document).ready(function() {
				
				$("#join_button").click(function() {
					
					 if ($('#memberId').val() == '') {
				            alert("아이디를 입력해주세요");
				            $('#memberId').focus();
				            return false;
				     } else if ($('#nickname').val() == '') {
				            alert("닉네임를 입력해주세요");
				            $('#nickname').focus();
				            return false;
				     } else if($('#password').val() == ''){
							$('#password').focus();
							alert('패스워드를 입력해주세요');
							return false;
				     } else if($('#name').val() == ''){
							$('#name').focus();
							alert('이름을 입력해주세요');
							return false;
				     } else if ($('#phone').val() == '') {
				            alert("전화번호를 입력해주세요");
				            $('#phone').focus();
				            return false;
				     } else if($('#birth').val() == ''){
							$('#birth').focus();
							alert('생년월일을 입력해주세요');
							return false;
				     } else if ($('#zipCode').val() == '') {
				            alert("주소를 입력해주세요");
				            $('#zipCode').focus();
				            return false;
				     } else  if(checked_id==''){
				    	 	alert('아이디 중복 체크를 해주세요');
							$('#memberId').focus();
				            return false;
				     }else if(checked_id==0){
				    	 	alert('아이디 중복 확인을 해주세요');
							$('#memberId').focus();
				            return false;
				     }else  if(checked_nick==''){
				    	 	alert('닉네임 중복체크를 해주세요');
							$('#nickname').focus();
				            return false;
				     }else if(checked_nick==0){
				    	 	alert('닉네임 중복 확인을 해주세요');
							$('#nickname').focus();
				            return false;

				    	 if (!($('#gender1').is(":checked")) || !($('#gender2').is(":checked"))) {
							alert("성별을 체크해주세요");
						
						} else {
							alert("회원가입이 완료되었습니다. 로그인을 진행해주세요!");
							$("#join_form").attr("action", "/user/join");
							$("#join_form").submit();
						}
				     }
				});
			});
	
	
	        
	</script>
    
</body>

</html>