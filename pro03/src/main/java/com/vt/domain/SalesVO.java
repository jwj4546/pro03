package com.vt.domain;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class SalesVO {
	private int sno;
	private int pno;
	private int amount;
	private int tot;
	private String id;
	private String paymethod;
	private String paynum;
	private String addr;
	private String tel;
	private String delcom;
	private String deltel;
	private String delno;
	private String delstatus;
	private String st;
	private String resdate;
	private String gtid;
	private String rname;
	private String name;
	private String pname;
	private String category;
	private String com;
	private String img;
	private String img2;
	private String img3;
}
