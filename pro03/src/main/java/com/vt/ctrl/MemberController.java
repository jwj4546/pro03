package com.vt.ctrl;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.vt.biz.MemberBiz;
import com.vt.domain.Member;

@Controller
@RequestMapping("/member/")
public class MemberController {
	
	@Autowired
	public MemberBiz memberService;
	
	@Autowired
	private BCryptPasswordEncoder pwdEncoder;
	
	@Autowired
	private HttpSession session;
	
	@GetMapping("term.do")
	public String agree(Model model, RedirectAttributes rttr) {
		rttr.addAttribute("msg", "회원 약관에 동의하시기 바랍니다.");
		return "member/term";
	}
	
	@GetMapping("join.do")
	public String join(Model model, @ModelAttribute("member") Member member) {
		model.addAttribute("member", member);
		return "member/join";
	}
	
	@PostMapping("idCheck.do")
	public void idCheck(HttpServletRequest request, HttpServletResponse response, Model model) throws IOException {
		String id = request.getParameter("id");
		Member cus = memberService.getMember(id);
		boolean result;
		if(cus!=null) {
			result = false;
		} else {
			result = true;
		}
		JSONObject json = new JSONObject();
		json.put("result", result);
		PrintWriter out = response.getWriter();
		out.println(json.toString());
	}
	
	@PostMapping("joinPro.do")
	public String joinPro(HttpServletRequest request, Model model, RedirectAttributes rttr) {
		Member member = new Member();
		member.setId(request.getParameter("id"));
		member.setPw(pwdEncoder.encode(request.getParameter("pw")));
		member.setName(request.getParameter("name"));
		member.setEmail(request.getParameter("email"));
		member.setTel(request.getParameter("tel"));
		member.setAddr1(request.getParameter("addr1"));
		member.setAddr2(request.getParameter("addr2"));
		member.setPostcode(request.getParameter("postcode"));
		memberService.insMember(member);
		model.addAttribute("msg", "회원가입을 축하합니다.");
		return "redirect:/";
	}
	
	@GetMapping("login.do")
	public String login(Model model) {
		return "member/login";
	}
	
	@PostMapping("loginPro.do")
	public String loginPro(@RequestParam("id") String id, @RequestParam("pw") String pw, Model model, RedirectAttributes rttr) {
		session.invalidate();
		Member cus = memberService.getMember(id);
		if(cus==null) {
			rttr.addFlashAttribute("msg", "존재하지 않는 사용자입니다.");
			return "redirect:login.do";
		}
		boolean loginSuccess = pwdEncoder.matches(pw, cus.getPw());
		if(loginSuccess) {
			session.setAttribute("cus", cus);
			session.setAttribute("sid", id);
			session.setAttribute("spw", pw);
			model.addAttribute("msg", "로그인 성공");
			return "redirect:/";
		} else {
			return "redirect:login.do";
		}
	}
	
	@GetMapping("logout.do")
	public String logout(Model model, RedirectAttributes rttr) {
		session.invalidate();
		model.addAttribute("msg", "로그아웃 하였습니다.");
		return "redirect:/";
	}
	
	@GetMapping("myInfo.do")
	public String myInfo(Model model) {
		return "member/myInfo";
	}
	
	@GetMapping("myUpdate.do")
	public String myUpdate(Model model) {
		return "member/myUpdate";
	}
	
	@PostMapping("myUpdatePro.do")
	public String myUpdatePro(HttpServletRequest request, Model model, RedirectAttributes rttr) {
		Member member = new Member();
		member.setId(request.getParameter("id"));
		member.setPw(pwdEncoder.encode(request.getParameter("pw")));
		member.setName(request.getParameter("name"));
		member.setEmail(request.getParameter("email"));
		member.setTel(request.getParameter("tel"));
		member.setAddr1(request.getParameter("addr1"));
		member.setAddr2(request.getParameter("addr2"));
		member.setPostcode(request.getParameter("postcode"));
		memberService.changeInfo(member);
		model.addAttribute("msg", "회원 정보가 변경되었습니다.");
		session.invalidate();
		return "redirect:/";
	}
	
	@GetMapping("memberDelete.do")
	public String memberDelete(@RequestParam("id") String id, Model model) {
		memberService.delMember(id);
		session.invalidate();
		return "redirect:/";
	}
}
