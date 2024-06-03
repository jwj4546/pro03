package com.vt.biz;

import java.util.List;

import com.vt.domain.Faq;

public interface FaqBiz {
	public int getTotalCount();
	public List<Faq> getFaqList();
	public Faq getFaq(int no);
	public void insFaq(Faq faq);
	public void upFaq(Faq faq);
	public void hitsCount(int no);
	public void delFaq(int no);
}
