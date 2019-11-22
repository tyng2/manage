package com.manage.controller;

import java.text.DateFormat;
import java.util.Date;
import java.util.Locale;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import com.manage.mapper.AuthMapper;
import com.manage.service.UserService;
import com.manage.vo.UserVO;

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
	public ResponseEntity<String> addUser(UserVO userVO, Model model) {
		System.out.println("<< addUser, POST >>\n");
		System.out.println("addUserPOST : " + userVO);
		
		String encodedPassword = passwordEncoder.encode(userVO.getPassword());
		userVO.setPassword(encodedPassword);
		log.info(userVO);
		
		userService.insert(userVO);
		
		
		StringBuffer auth = new StringBuffer();
		auth.append("ROLE_");
		
		if ("대표 이사".equals(userVO.getPosition())) {
			auth.append("CEO");
		} else if ("영업 1팀".equals(userVO.getDepartment())) {
			
			if ("상무".equals(userVO.getPosition())) {
				auth.append("DIRECTOR1");
			} else {
				auth.append("SALES1");
			}
			
		} else if ("영업 2팀".equals(userVO.getDepartment())) {
			
			if ("상무".equals(userVO.getPosition())) {
				auth.append("DIRECTOR2");
			} else {
				auth.append("SALES2");
			}
		} else if ("마케팅".equals(userVO.getDepartment())) {
			auth.append("MARKETING");
			
		} else {
			auth.append("NOTHING");
		}
		
		authMapper.insertAuth(userVO.getUserId(), auth.toString());
		log.info(auth.toString());
		
		HttpHeaders headers = new HttpHeaders();
		headers.add("Content-Type", "text/html; charset=UTF-8");
		
		StringBuilder sb = new StringBuilder();
		sb.append("<script>");
		sb.append("alert('가입이 완료되었습니다.');");
		sb.append("location.href = '/';");
		sb.append("</script>");

		ResponseEntity<String> responseEntity = new ResponseEntity<String>(sb.toString(), headers, HttpStatus.OK);

		return responseEntity;
	}
	
	@GetMapping("/login")
	public String login(Model model) {
		System.out.println("<< login >>\n");
		
		return "login";
	}
	
	
	
}
