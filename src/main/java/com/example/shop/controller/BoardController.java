package com.example.shop.controller;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
public class BoardController {

	@Value("${api.server.url}")
	private String apiServer;


	@GetMapping("/inquiry")
	public String inquiry() {
		return "inquiry";
	}

	@GetMapping("/inquiry_detail/{id}")
	public String injuiryDetail(@PathVariable Long id,Model model){
		log.info("=====id=={}",id);
		model.addAttribute("idx",id);
		return "inquiry_detail";
	}
	@GetMapping("/create")
	public String inquiry_Create () {
		
		return "inquiry_create";
	}
}