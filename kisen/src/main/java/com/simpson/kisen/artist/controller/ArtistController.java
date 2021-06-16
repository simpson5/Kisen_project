package com.simpson.kisen.artist.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/artist")
public class ArtistController {
	
	@GetMapping("/artistInfo")
	public void artistInfo() {}
}
