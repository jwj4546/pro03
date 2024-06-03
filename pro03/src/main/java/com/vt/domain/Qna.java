package com.vt.domain;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Qna {
	private int no;
	private int qlevel;
	private int parno;
	private String title;
	private String content;
	private int hits;
	private String resdate;
	private Member member;
}
