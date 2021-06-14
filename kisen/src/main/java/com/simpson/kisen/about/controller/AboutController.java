package com.simpson.kisen.about.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
@RequestMapping("/about")
public class AboutController {
	@GetMapping("/aboutus")
	public void about() {}
	
	@GetMapping("/location")
	public void location() {}
}
