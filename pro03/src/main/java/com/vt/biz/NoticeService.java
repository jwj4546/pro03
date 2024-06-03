package com.vt.biz;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.vt.domain.Notice;
import com.vt.per.NoticeMapper;

@Service
public class NoticeService implements NoticeBiz {
	@Autowired
	private NoticeMapper noticeDAO;

	@Override
	public int getTotalCount() {
		return noticeDAO.getTotalCount();
	}

	@Override
	public List<Notice> getNoticeList() {
		return noticeDAO.getNoticeList();
	}
	@Transactional
	@Override
	public Notice getNotice(int no) {
		noticeDAO.hitsCount(no);
		return noticeDAO.getNotice(no);
	}

	@Override
	public Notice selNotice(int no) {
		return noticeDAO.getNotice(no);
	}

	@Override
	public void insNotice(Notice notice) {
		noticeDAO.insNotice(notice);
	}

	@Override
	public void upNotice(Notice notice) {
		noticeDAO.upNotice(notice);
	}

	@Override
	public void countUpCnt(int no) {
		noticeDAO.hitsCount(no);
	}

	@Override
	public void delNotice(int no) {
		noticeDAO.delNotice(no);
	}
	
}
