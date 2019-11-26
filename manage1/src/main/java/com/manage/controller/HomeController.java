package com.manage.controller;

import java.text.DateFormat;
import java.util.Date;
import java.util.Locale;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.manage.mapper.AuthMapper;
import com.manage.service.UserService;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
public class HomeController {

	@Setter(onMethod_ = @Autowired)
	private BCryptPasswordEncoder passwordEncoder;
	
	@Setter(onMethod_ = @Autowired)
	private UserService userService;
	
	@Setter(onMethod_ = @Autowired)
	private AuthMapper authMapper;
	
	@GetMapping("/")
	public String main(Locale locale, Model model) {
		System.out.println("<< home >>\n");
		
		return "home";
	}
	
//	GET 방식으로 addUser 주소 접근 시 addUser.jsp 페이지로 이동
	@GetMapping("/addUser")
	public String addUser(Model model) {
		System.out.println("<< addUser >>\n");
		
		return "addUser";
	}
	
	
//	GET 방식으로 login 주소 접근 시 login.jsp 페이지로 이동
	@GetMapping("/login")
	public String login(String error, Model model) {
		System.out.println("<< login >>\n");
		
		if (error != null) {
			model.addAttribute("error", "아이디나 비밀번호가 맞지 않습니다.");
		}
		
		return "login";
	}
	
//	GET 방식으로 businessPlan 주소 접근 시 businessPlan.jsp 페이지로 이동
	@GetMapping("/businessPlan")
	public String addBusnessplan(Model model) {
		System.out.println("<< businessPlan >>\n");
		
		return "businessPlan";
	}
	
	
}
