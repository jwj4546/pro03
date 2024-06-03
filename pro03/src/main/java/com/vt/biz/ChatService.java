package com.vt.biz;

import java.util.List;
import java.util.Map;

import com.vt.domain.Chat;

public interface ChatService {

	List<Chat> selectchatList(Map<String, Object> map);
	
	List<Chat> selectFirstChatList(int roomNo);
	
	int insertChat(Chat chat);
}
