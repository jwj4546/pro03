package com.vt.domain;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Product {
	private int pno;
	private String category;
	private String pname;
	private String com;
	private int price;
	private String img;
	private String img2;
	private String img3;
}
