package com.vt.domain;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Notice {
	private int no;
	private String title;
	private String content;
	private String id;
	private int hits;
	private String resdate;
	
}
