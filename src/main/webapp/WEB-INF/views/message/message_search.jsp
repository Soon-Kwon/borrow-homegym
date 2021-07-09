<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<%--  ajax이용한 찾은 id list처리 --%>
<c:forEach var="tmp" items="${list}">
	<div class="chat_list_box${tmp.msgRoomNo} chat_list_box">
		<div type="button" class="chat_list" msgRoomNo="${tmp.msgRoomNo }"
			otherId="${tmp.otherId }">
			<%-- active-chat --%>
			<div class="chat_people">
				<div class="chat_img">
					<a href="#"> 
					<%-- 이미지가 없으면 기본 이미지로 --%>
						
						<%-- 이미지 있으면 해당 이미지로 --%>
						<c:if test="${tmp.image ne null}">
							<!-- <i class="far fa-user"></i> -->
							<img src="${tmp.image}" alt="보낸사람 프로필" class='img_circle'>
						</c:if> 
						<!-- 프로필 누르면 해당 유저의 상세정보(프로필보기 가능하게끔) --> 
						<%-- <a href="other_profile.do?other_nick=${tmp.otherId }"> --%>
						<c:if test="${tmp.image eq null}">
							<img src="https://ptetutorials.com/images/user-profile.png"
								alt="sunil">
							<%-- <img src="./upload/profile/${tmp.profile }" alt="보낸사람 프로필" class='img_circle'> --%>
						</c:if> 
					</a>
				</div>
			</div>
		</div>
	</div>
</c:forEach>