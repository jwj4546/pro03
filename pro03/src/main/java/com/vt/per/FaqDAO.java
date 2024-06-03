package com.vt.per;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.vt.domain.Faq;

@Repository
public class FaqDAO implements FaqMapper {
	
	@Autowired
	private SqlSession sqlSession;

	@Override
	public int getTotalCount() {
		return sqlSession.selectOne("faq.getTotalCount");
	}

	@Override
	public List<Faq> getFaqList() {
		return sqlSession.selectList("faq.getFaqList");
	}

	@Override
	public Faq getFaq(int no) {
		return sqlSession.selectOne("faq.getFaq", no);
	}

	@Override
	public void insFaq(Faq faq) {
		sqlSession.insert("faq.insFaq", faq);
	}

	@Override
	public void upFaq(Faq faq) {
		sqlSession.update("faq.upFa"
				+ "q", faq);
	}

	@Override
	public void hitsCount(int no) {
		sqlSession.update("faq.hisCount", no);
	}

	@Override
	public void delFaq(int no) {
		sqlSession.delete("faq.delFaq", no);
	}
}
