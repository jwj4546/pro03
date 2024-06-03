package com.vt.ctrl;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.maven.shared.utils.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.google.gson.JsonObject;
import com.vt.biz.ReviewBiz;
import com.vt.biz.ReviewService;
import com.vt.domain.Member;
import com.vt.domain.Review;

@Controller
@RequestMapping("/review/")
public class ReviewController {

	@Autowired
	private ReviewBiz reviewService;
	
	@Autowired
	private ReviewService memberService;
	
	//@Autowired
	//private Review Service productService;
	
	@RequestMapping("list.do")
	public String getReviewList(Model model) {
		model.addAttribute("list", reviewService.getReviewList());
		return "review/list";
	}
	
	@RequestMapping("detail.do")
	public String getReview(@RequestParam("no") int no, Model model) {
		model.addAttribute("review", reviewService.getReview(no));
		return "review.get";
	}
	
	@GetMapping("insert.do")
	public String insReview(Review review, Model model) {
		return "review/insert";
	}
	
	@PostMapping("insertPro.do")
	public String insReviewPro(Review review, HttpSession session, Model model) {
		Member member = new Member();
		String id = (String) session.getAttribute("sid");
		review.setMember(member);
		reviewService.insReview(review);
		return "redirect:list.do";
	}
	
	@GetMapping("update.do")
	public String upReview(@RequestParam("no") int no, Model model) {
		model.addAttribute("review", reviewService.getReview(no));
		return "review/edit";
	}
	
	@PostMapping("updatePro.do")
	public String upReviewPro(@RequestAttribute("review") Review review, Model model) {
		reviewService.upReview(review);
		return "redirect:list.do";
	}
	
	@RequestMapping("delReview.do")
	public String delReview(@RequestParam("no") int no, Model model) {
		reviewService.delReview(no);
		return "redirect:list.do";
	}
	
	@PostMapping("fileupload.do")
	@ResponseBody
	public String fileUpload(HttpServletRequest req, HttpServletResponse resp, MultipartHttpServletRequest multiFile) throws Exception {
		JsonObject json = new JsonObject();
		PrintWriter printWriter = null;
		OutputStream out = null;
		MultipartFile file = multiFile.getFile("upload");
		if(file != null) {
			if(file.getSize() > 0 && StringUtils.isNotBlank(file.getName())) {
				if(file.getContentType().toLowerCase().startsWith("images/")) {
					try {
						String fileName = file.getName();
						byte[] bytes = file.getBytes();
						String uploadPath = req.getServletContext().getRealPath("/img");
						File uploadFile = new File(uploadPath);
						if(!uploadFile.exists()) {
							uploadFile.mkdirs();
						}
						fileName = UUID.randomUUID().toString();
						uploadPath = uploadPath + "/" + fileName;
						out = new FileOutputStream(new File(uploadPath));
			out.write(bytes);
			
			printWriter = resp.getWriter();
			resp.setContentType("text/html");
			String fileUrl = req.getContextPath() + "/images/" + fileName;
			
			// json 데이터로 등록
            // {"uploaded" : 1, "fileName" : "test.jpg", "url" : "/images/test.jpg"}
            // 이런 형태로 리턴이 나가야함.
			json.addProperty("uploaded", 1);
			json.addProperty("fileName", fileName);
			json.addProperty("url", fileUrl);
			
			printWriter.println(json);
					} catch(IOException e) {
						e.printStackTrace();
					} finally {
						if(out != null) {
							out.close();
						}
						if(printWriter != null) {
							printWriter.close();
						}
					}
				}
			}
		}
		return null;
	}
}
