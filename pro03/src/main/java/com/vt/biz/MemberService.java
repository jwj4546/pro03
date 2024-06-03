package com.vt.biz;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.vt.domain.Member;
import com.vt.per.MemberMapper;

@Service
public class MemberService implements MemberBiz {

	@Autowired
	private MemberMapper memberDAO;

	@Override
	public List<Member> getMemberList() {
		return memberDAO.getMemberList();
	}

	@Override
	public Member getMember(String id) {
		return memberDAO.getMember(id);
	}

	@Override
	public int memberCount() {
		return memberDAO.memberCount();
	}

	@Override
	public void insMember(Member member) {
		memberDAO.insMember(member);
	}

	@Override
	public void changePw(Member member) {
		memberDAO.changePw(member);
	}

	@Override
	public void changeInfo(Member member) {
		memberDAO.changeInfo(member);
	}

	@Override
	public void changePoint(Member member) {
		memberDAO.changePoint(member);
	}

	@Override
	public void delMember(String id) {
		memberDAO.delMember(id);
	} 
	
}
