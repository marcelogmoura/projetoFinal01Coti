package com.mgmoura.controllers;

import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class DashboardController {
	
	@RequestMapping(value="/dashboard")
	public ModelAndView test(HttpServletResponse response) {
		
		ModelAndView modelAndView = new ModelAndView("dashboard");
		
		return modelAndView;
	}

}
