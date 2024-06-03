package com.vt.ctrl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.vt.biz.FaqBiz;
import com.vt.biz.MemberService;

@Controller
@RequestMapping("/faq/")
public class FaqController {
	
	@Autowired
	private FaqBiz faqService;
	
	@Autowired
	private MemberService memberService;
}
