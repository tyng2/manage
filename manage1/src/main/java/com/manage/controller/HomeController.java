package com.manage.controller;

import java.text.DateFormat;
import java.util.Date;
import java.util.Locale;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import com.manage.service.UserService;
import com.manage.vo.UserVO;

import lombok.Setter;

@Controller
public class HomeController {
	
	@Setter(onMethod_ = @Autowired)
	private UserService userService;
	
	@GetMapping("/")
	public String main(Locale locale, Model model) {
		System.out.println("<< home >>\n");
		
		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
		
		String formattedDate = dateFormat.format(date);
		
		model.addAttribute("serverTime", formattedDate );
		return "home";
	}
	
	@GetMapping("/addUser")
	public String addUser(Model model) {
		System.out.println("<< addUser >>\n");
		
		return "addUser";
	}
	
	@PostMapping("/addUser")
	public String addUser(UserVO userVO, Model model) {
		System.out.println("<< addUser, POST >>\n");
		
		userService.insert(userVO);
		
		return "home";
	}
	
}
