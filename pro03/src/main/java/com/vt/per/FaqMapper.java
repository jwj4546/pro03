package com.vt.per;


import java.util.List;


import com.vt.domain.Faq;


// mapper의 namespace와 일치해야함 e.g. com.vt.dao.FaqDAO
public interface FaqMapper {
	public int getTotalCount();
	public List<Faq> getFaqList();
	public Faq getFaq(int no);
	public void insFaq(Faq faq);
	public void upFaq(Faq faq);
	public void hitsCount(int no);
	public void delFaq(int no);
}
