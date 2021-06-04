package com.campfire.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.campfire.domain.Criteria;
import com.campfire.domain.PageDTO;
import com.campfire.domain.ReviewBoardVO;
import com.campfire.service.ReviewBoardService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

/** 
 * 캠핑리뷰 컨트롤
 */
@Controller
@AllArgsConstructor
@RequestMapping("/review/*")
@Log4j
public class ReviewController {
	
	private ReviewBoardService service; 
	
	@GetMapping(value = "/reviewList")
	public void reviewList(Criteria cri, Model model) { 
		log.info("model........" + model);
		log.info("cri .... : " + cri);
		model.addAttribute("list", service.getList(cri));
		model.addAttribute("pageMaker", new PageDTO(cri, service.getTotal(cri)));
	}
	
	@GetMapping(value = "/reviewWrite")
	public void reviewWrite() {}
	
	
	@GetMapping(value="/reviewView")
	public void reviewView(@RequestParam("bno") Long bno, @ModelAttribute("cri") Criteria cri, HttpServletRequest req, Model model) {
		log.info("reviewView....." + bno);
		log.info("reviewView....." + cri);
		HttpSession session = req.getSession();
		String userId = (String)session.getAttribute("sessionId");
		if(userId == null) {
			model.addAttribute("userLike", false);
		}else {
			model.addAttribute("userLike", service.checkLike(bno, userId));
		}
		model.addAttribute("review", service.view(bno));
	}
	
}
