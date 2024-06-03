package com.vt.domain;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Review {
	private int no;
	private Product product;
	private String title;
	private String content;
	private Member member;
	private int hits;
	private String resdate;
}
