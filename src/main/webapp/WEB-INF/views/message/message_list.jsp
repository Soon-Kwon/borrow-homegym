<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="today" value="<%=new java.util.Date()%>" />

<!-- =========================리뷰 처리 js============================ -->
	<script src="/resources/assets/js/review.js"></script>

<c:if test="${fn:length(list)==0}">						
	<h6 style="text-align:center; margin-top: 40px;">
		대화중인 채팅방이 없습니다.<br><br>
		홈짐 호스트 / 트레이너를 찾아<br>
		대화를 시작해보세요😊😀😂
	</h6>
	
</c:if>

<%--  ajax이용한 메세지 list처리(왼쪽 영역) --%>
<c:forEach var="tmp" items="${list}">
	<div class="chat_list_box${tmp.msgRoomNo} chat_list_box">
		<div type="button" class="chat_list" msgRoomNo="${tmp.msgRoomNo }"
			otherId="${tmp.otherId }">
			<%-- active-chat --%>
			<div class="chat_people">
				<div class="chat_img">
					<a href="#"> 
					<%-- 이미지가 없으면 기본 이미지로, 이미지 있으면 해당 이미지로 --%>
						<c:if test="${tmp.image ne null}">
							<img src="${tmp.image}" alt="보낸사람 프로필"
								class='img_circle'>
						</c:if> 
						<%--  프로필 누르면 해당 유저의 상세정보(프로필보기 가능하게끔) --%>
						<c:if test="${tmp.image eq null}">
								<img src="/resources/assets/images/mypage/basicImg.png" alt="보낸사람 프로필"
								class='img_circle'>
						</c:if>
					</a>
				</div>
				
				<div class="chat_ib" >
					<h5>${tmp.nickname }
					<span id="chattitle${tmp.msgRoomNo }"></span>
						<span class="chat_date">
							<script>
								$(document).ready(function(){
									$('#chattitle${tmp.msgRoomNo }').text(displayTime(${tmp.msgSendTime.getTime() }));
								})
							</script>
						</span>
					</h5>
					<div class="row">
						<div class="col-10">
							<p>${tmp.msgContent }</p>
						</div>
						<%-- 만약 현재사용자가 안읽은 메세지 갯수가 0보다 클때만 badge를 표시한다. --%>
						<c:if test="${tmp.unread > 0 }">
							<div class="col-2 unread${tmp.msgRoomNo }">
								<span class="badge bg-danger">${tmp.unread }</span>
							</div>
						</c:if>
					</div>
				</div>
			</div>
		</div>
	</div>
	<script>
	
		function displayTime(timeValue){
		
		var today = new Date();
		var gap = today.getTime() - timeValue; // 24시간 안에 쓴 글인지 확인
		
		var dateObj = new Date(timeValue);
		var str = "";
		
		if(gap < (1000 * 60 * 60 * 24)){
			
			var hh = dateObj.getHours();
			var mi = dateObj.getMinutes();
			//var ss = dateObj.getSeconds(); // 초 단위는 안보여주기
			
			return [(hh > 9 ? '' : '0') + hh, ':', (mi > 9 ? '' : '0') + mi].join('');
				//':', (ss > 9 ? '' : '0')+ ss].join('');
		}else {
			var yy = dateObj.getFullYear();
			var mm = dateObj.getMonth() + 1; // getMonth()는 0이 1월을 의미
			var dd = dateObj.getDate();
			
			return [(mm > 9 ? '' : '0') + mm, '/', (dd > 9 ? '' : '0') + dd].join('');
		}
	};
	</script>
</c:forEach>

