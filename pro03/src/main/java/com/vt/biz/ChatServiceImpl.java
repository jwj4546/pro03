package com.vt.biz;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.vt.domain.Chat;
import com.vt.per.ChatDAO;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
public class ChatServiceImpl implements ChatService {
	
	@Autowired
	private ChatDAO chatDAO;

	@Override
	public List<Chat> selectchatList(Map<String, Object> map) {
		List<Chat> list = chatDAO.selectchatList(map);
		return list;
	}

	@Override
	public List<Chat> selectFirstChatList(int roomNo) {
		return chatDAO.selectFirstChatList(roomNo);
	}

	@Override
	public int insertChat(Chat chat) {
		return chatDAO.insertChat(chat);
	}
	
}
