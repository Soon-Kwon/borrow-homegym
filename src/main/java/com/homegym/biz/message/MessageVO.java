package com.homegym.biz.message;

import java.util.Date;

import lombok.Data;

@Data
public class MessageVO {

    private int msgNo; // no
    private int msgRoomNo;  // 채팅방 번호, room
    private String recvId; // FK, 받는 사람, recv_nick
    private String sendId; // FK, 보내는 사람, send_nick 
    private String msgContent; // content
    private Date msgSendTime; // send_time
    private Date msgReadTime; // read_time
    private int msgChk; // msg읽음여부, read_chk 
    
    private String curId ; // 현재 사용자 아이디 nick

    // 현재 사용자의 메세지 상대 아이디 other_nick
    private String otherId;

    // 현재 사용자의 메세지 상대 profile
    private String image;


    // 안읽은 메세지 갯수
    private int unread;

}