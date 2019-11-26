package com.manage.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import com.manage.mapper.BusinessPlanMapper;
import com.manage.service.BusinessPlanSevice;
import com.manage.vo.BusinessPlanVO;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
public class BusinessPlanController {
	
	@Setter(onMethod_ = @Autowired)
	private BCryptPasswordEncoder passwordEncoder;
	
	@Setter(onMethod_ = @Autowired)
	private BusinessPlanSevice businessPlanService;
	
	@Setter(onMethod_ = @Autowired)
	private BusinessPlanMapper businessPlanMapper;
	
//	POST 방식으로 businessPlan 주소 접근 시 예산 작성 처리
	@PostMapping("/businessPlan")
	public ResponseEntity<String> addUser(BusinessPlanVO businessPlanVO, Model model) {
		System.out.println("<< businessPlan, POST >>\n");
		
		businessPlanService.insertBusinessPlan(businessPlanVO);
		
		HttpHeaders headers = new HttpHeaders();
		headers.add("Content-Type", "text/html; charset=UTF-8");
		
		StringBuilder sb = new StringBuilder();
		sb.append("<script>");
		sb.append("alert('입력이 완료되었습니다.');");
		sb.append("location.href = '/';");
		sb.append("</script>");

		ResponseEntity<String> responseEntity = new ResponseEntity<String>(sb.toString(), headers, HttpStatus.OK);

		return responseEntity;
	}
	
	@GetMapping("businessPlanList")
	public String getBusinessPlanByUserNum(Model model) {
		System.out.println("<< businessPlanList >>\n");
		
		return "businessPlanList";
	}
	

}
