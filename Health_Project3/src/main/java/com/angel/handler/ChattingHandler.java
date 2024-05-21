package com.angel.handler;

import java.util.ArrayList;
import java.util.List;

import javax.websocket.OnClose;
import javax.websocket.OnOpen;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

import com.angel.model.MemberVO;

import lombok.extern.log4j.Log4j;

@Log4j
public class ChattingHandler extends TextWebSocketHandler{

	@Autowired(required = false)
	private List<WebSocketSession> sessionList = new ArrayList<WebSocketSession>();
	
	@Override
	public void afterConnectionEstablished(WebSocketSession session) throws Exception {
		
		System.out.println("#ChattingHandler, afterConnectionEstablished");
		
		sessionList.add(session);
		
		
		
	}
	
	@Override
	protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {
		
		System.out.println("#ChattingHandler, handleMessage");
		System.out.println(session.getAttributes().get("member") + ": " + message);
		MemberVO member=(MemberVO) session.getAttributes().get("member");
		System.out.println(message);
		for(WebSocketSession s : sessionList) {
			s.sendMessage(new TextMessage(member.getMemberName()+":" + message.getPayload()));
		}
	}
	

	@Override
	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
		
		MemberVO member=(MemberVO) session.getAttributes().get("member");
		System.out.println("#ChattingHandler, afterConnectionClosed");

		
		 
		sessionList.remove(session);
		
		
	}
}