package com.vt.per;

import java.util.List;
import java.util.Map;

import com.vt.domain.Chat;

public interface ChatDAO {

	//List<Map<String, Object>> selectchatList(int roomNo, int startNo);
	
	List<Chat> selectchatList(Map<String, Object> map);
	
	List<Chat> selectFirstChatList(int roomNo);
	
	int insertChat(Chat chat);
}
