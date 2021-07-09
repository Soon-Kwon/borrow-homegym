package com.homegym.biz.message;

import java.util.Date;

import lombok.Data;

@Data
public class MessageVO {
	/*DB저장*/
    private int msgNo; // no
    private int msgRoomNo;  // 채팅방 번호
    private String recvId; // FK, 받는 사람
    private String sendId; // FK, 보내는 사람 
    private String msgContent; 
    private Date msgSendTime; 
    private Date msgReadTime; 
    private int msgChk; // msg읽음여부 
    
    /*DB저장X*/
    // 현재 사용자 아이디
    private String curId ;
    // 대화한 리스트의 상대방닉네임
    private String nickname;
    // 현재 사용자의 메세지 상대 아이디 
    private String otherId;
    // 찾은 아이디의 닉네임
    private String findNickname;
    // 현재 사용자의 메세지 상대 profile
    private String image;
    // 안읽은 메세지 갯수
    private int unread;
    
    
    

}