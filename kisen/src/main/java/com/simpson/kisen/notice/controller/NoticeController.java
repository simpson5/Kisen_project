package com.simpson.kisen.notice.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.simpson.kisen.admin.model.vo.SlideImg;
import com.simpson.kisen.agency.controller.AgencyController_Artist;
import com.simpson.kisen.agency.model.service.AgencyService;
import com.simpson.kisen.idol.model.vo.Idol;
import com.simpson.kisen.notice.model.service.NoticeService;
import com.simpson.kisen.notice.model.vo.Notice;
import com.simpson.kisen.notice.model.vo.NoticeExt;
import com.simpson.kisen.product.model.vo.ProductImgExt;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
public class NoticeController {
	@Autowired
	private NoticeService noticeService;
	
	
	@GetMapping("/notice")
	public String notice(Model model) {
		List<Notice> noticeList = noticeService.selectNoticeList();

		model.addAttribute("noticeList", noticeList);
		return "notice/notice";
	}
	
	
	@GetMapping("/notice/detail/{noticeNo}")
	public String noticeDetail(@PathVariable(name="noticeNo") String no, Model model) {
		int noticeNo = Integer.parseInt(no);
		
		NoticeExt notice = noticeService.selectNotice(noticeNo);
		//counting
		int result = noticeService.updateNoticeReadCnt(noticeNo);
		
		//다음글 이전글?
		
		model.addAttribute("notice", notice);
		return "notice/detailNotice";
	}
	
	@GetMapping("/notice/searchNotice")
	public String searchProduct(
			@RequestParam(name="search",required = false) String search,
			Model model
		){

		log.info("search@search= {}",search);	//null

		List<Notice> noticeList = noticeService.selectSearchNoticeList(search);
		log.info("noticeList@search= {}",noticeList);	//null

		model.addAttribute("noticeList", noticeList);
		return "notice/notice";

	}
}
