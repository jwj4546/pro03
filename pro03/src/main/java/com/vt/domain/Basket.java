package com.vt.domain;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Basket {
	private int bno;
	private Member member;
	private int pno;
	private int amount;
	private String remark;
	private Product product;
}
