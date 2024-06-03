package com.vt.per;

import java.util.List;


import com.vt.domain.Qna;

public interface QnaMapper {
	public int getTotalCount();
	public List<Qna> getQnaList();
	public Qna getQna(int no);
	public void insQuestion(Qna qna);
	public void upParno(int no);
	public void insAnswer(Qna qna);
	public void upQna(Qna qna);
	public void hitsCount(int no);
	public void delQna(int no);
}
