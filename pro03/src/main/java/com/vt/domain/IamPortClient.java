package com.vt.domain;

import java.util.Date;

import org.apache.commons.lang3.RandomStringUtils;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
 public class IamPortClient { 
	 public final static String CODE = "imp33642125"; 
	 public final static String KEY = "8006731832536307"; 
	 public final static String SECRET = "Rzaw0rU4BFImk2cqDjAGXcGywGGgAzLfy16909OPBxtvdxzEe1zzWonqmoQwdbiJN45sSaGqTXc1BMJs"; 
	 
	 private String randChar;
	 
	 public IamPortClient() {
		 Date date = new Date();
		 this.randChar = date +RandomStringUtils.randomAlphanumeric(12);
	 }
}
 