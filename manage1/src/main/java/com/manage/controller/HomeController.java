package com.manage.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.manage.mapper.AuthMapper;
import com.manage.service.UserService;

import lombok.Setter;

@Controller
public class HomeController {

	@Setter(onMethod_ = @Autowired)
	private BCryptPasswordEncoder passwordEncoder;
	
	@Setter(onMethod_ = @Autowired)
	private UserService userService;
	
	@Setter(onMethod_ = @Autowired)
	private AuthMapper authMapper;
	
	@GetMapping("/")
	public String main(String error, Model model) {
		System.out.println("<< login >>\n");
		
		if (error != null) {
			model.addAttribute("error", "아이디나 비밀번호가 맞지 않습니다.");
		}
		
		return "login";
	}
	
	@GetMapping("/main")
	public String main(Model model) {
		String auth = BusinessPlanController.getAuthUser().get(0);
		model.addAttribute("auth", auth);
		System.out.println("auth : " + auth);
		
		System.out.println("ROLE_SALES1".equals(auth));
		return "main";
	}
	
//	GET 방식으로 addUser 주소 접근 시 addUser.jsp 페이지로 이동
	@GetMapping("/addUser")
	public String addUser(Model model) {
		System.out.println("<< addUser >>\n");
		
		return "user/addUser";
	}
	
	
////	GET 방식으로 login 주소 접근 시 login.jsp 페이지로 이동
//	@GetMapping("/login")
//	public String login(String error, Model model) {
//		System.out.println("<< login >>\n");
//		
//		if (error != null) {
//			model.addAttribute("error", "아이디나 비밀번호가 맞지 않습니다.");
//		}
//		
//		return "login";
//	}
	

	
	
}
