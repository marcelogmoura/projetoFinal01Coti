package com.mgmoura.controllers;

import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class SobreController {
	
	@RequestMapping(value="/sobre")
	public ModelAndView sobre(HttpServletResponse response) {
		
		ModelAndView modelAndView = new ModelAndView("sobre");
		
		return modelAndView;
	}

}
