package com.vt.domain;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Faq {
	private int no;
	private String category;
	private String title;
	private String content;
	private Member member;
	private int hits;
	private String resdate;
}
