package com.ycar.driver.client.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping("/faq")
public class BoardController {
	
	@RequestMapping(method = RequestMethod.GET)
	public String board() {
		return "faq/list";
	}
}
