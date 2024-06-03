package com.vt.biz;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.vt.domain.Faq;
import com.vt.per.FaqMapper;

@Service
public class FaqService implements FaqBiz{
	
	@Autowired
	private FaqMapper faqDAO;

	@Override
	public int getTotalCount() {
		return faqDAO.getTotalCount();
	}

	@Override
	public List<Faq> getFaqList() {
		return faqDAO.getFaqList();
	}

	@Override
	public Faq getFaq(int no) {
		return faqDAO.getFaq(no);
	}

	@Override
	public void insFaq(Faq faq) {
		faqDAO.insFaq(faq);
	}

	@Override
	public void upFaq(Faq faq) {
		faqDAO.upFaq(faq);
	}

	@Override
	public void hitsCount(int no) {
		faqDAO.hitsCount(no);
	}

	@Override
	public void delFaq(int no) {
		faqDAO.delFaq(no);
	}
	
}
