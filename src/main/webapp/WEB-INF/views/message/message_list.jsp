<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<%--  ajax이용한 메세지 list처리(왼쪽 영역) --%>
<c:forEach var="tmp" items="${list}">
	

	<div class="chat_list_box${tmp.msgRoomNo} chat_list_box">
		<div type="button" class="chat_list" msgRoomNo="${tmp.msgRoomNo }"
			otherId="${tmp.otherId }">
			<%-- active-chat --%>
			<div class="chat_people">
				<div class="chat_img">
					<a href="#"> <%-- 이미지가 없으면 기본 이미지로 --%> <%-- 이미지 있으면 해당 이미지로 --%>
						<c:if test="${tmp.image ne null}">
							<img src="${tmp.image}" alt="보낸사람 프로필"
								class='img_circle'>
						</c:if> <!-- 프로필 누르면 해당 유저의 상세정보(프로필보기 가능하게끔) --> <%-- <a href="other_profile.do?other_nick=${tmp.otherId }"> --%>
						<c:if test="${tmp.image eq null}">
								<img src="/resources/assets/images/mypage/basicImg.png" alt="보낸사람 프로필"
								class='img_circle'>
							
						</c:if>
					</a>
				</div>
				<div class="chat_ib">
					<h5>${tmp.nickname }

						<span class="chat_date"> <fmt:formatDate
								pattern="MM-dd HH:mm" value="${tmp.msgSendTime }" />
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
</c:forEach>