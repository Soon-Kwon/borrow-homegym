package com.homegym.biz.message;

import java.util.Date;

import lombok.Data;

@Data
public class MessageVO {

    private int msgNo; // no
    private int msgRoomNo;  // 채팅방 번호
    private String recvId; // FK, 받는 사람
    private String sendId; // FK, 보내는 사람 
    private String msgContent; 
    private Date msgSendTime; 
    private Date msgReadTime; 
    private int msgChk; // msg읽음여부 
    
    private String curId ; // 현재 사용자 아이디 

    // 현재 사용자의 메세지 상대 아이디 
    private String otherId;

    // 현재 사용자의 메세지 상대 profile
    private String image;

    // 안읽은 메세지 갯수
    private int unread;
    

}