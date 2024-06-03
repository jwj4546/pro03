package com.vt.per;

import java.util.List;

import com.vt.domain.Notice;

public interface NoticeMapper {
	public int getTotalCount();
	List<Notice> getNoticeList();
	public Notice getNotice(int no);
	public void insNotice(Notice notice);
	public void upNotice(Notice notice);
	public void hitsCount(int no);
	public void delNotice(int no);
}
