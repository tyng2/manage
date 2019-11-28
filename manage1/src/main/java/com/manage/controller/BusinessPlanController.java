package com.manage.controller;

import java.security.Principal;
import java.util.ArrayList;
import java.util.Collection;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import com.manage.mapper.AuthMapper;
import com.manage.mapper.BusinessPlanMapper;
import com.manage.service.BusinessPlanSevice;
import com.manage.service.paging.IPagingService;
import com.manage.service.paging.PagingBean;
import com.manage.vo.BusinessPlanVO;

import lombok.Setter;

@Controller
public class BusinessPlanController {
	
	@Setter(onMethod_ = @Autowired)
	private BCryptPasswordEncoder passwordEncoder;
	
	@Setter(onMethod_ = @Autowired)
	private BusinessPlanSevice businessPlanService;
	
	@Setter(onMethod_ = @Autowired)
	private BusinessPlanMapper businessPlanMapper;
	
	@Setter(onMethod_ = @Autowired)
	private AuthMapper authMapper;
	
	@Setter(onMethod_ = @Autowired)
	private IPagingService iPagingService;
	
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
	
//GET 방식으로 businessPlanList 주소 접근 시 예산 작성 목록 표시
	@GetMapping("/businessPlanList")
	public String getBusinessPlanByUserNum(Model model) { 
		System.out.println("<< businessPlanList >>\n");
		
		
//		로그인 한 아이디의 권한 가져오기
		List<String> roleNames = new ArrayList<>();
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
        Collection<GrantedAuthority> collection 
            = (Collection<GrantedAuthority>) auth.getAuthorities();
        
        for (GrantedAuthority authority : collection) {
            roleNames.add(authority.getAuthority());
        }
        System.out.println("권한 : " + roleNames);
        String roleName = roleName(roleNames);
        
        if ("마케팅".equals(roleName) || "이사".equals(roleName)) {
        	model.addAttribute("select", roleName);
        }
        

		List<BusinessPlanVO> list = businessPlanService.getBusinessPlanByUserNum(null);
		List<Integer> listYear = businessPlanMapper.getYearBusinessPlan();
		System.out.println("listYear : " + listYear);
		
		model.addAttribute("list", list);
		model.addAttribute("listYear", listYear);

		return "businessPlanList";
	}
	 
	 @GetMapping("/businessPlanDtl")
	 public String businessPlanDtl(String oppId, Model model) {
		 System.out.println("<<businessPlanDtl>>");
		 
		 List<BusinessPlanVO> list = businessPlanService.businessPlanDtl(oppId);
		  
		 model.addAttribute("list", list);
		 
		 return "businessPlanDtl";
	 }
	 
	@PostMapping("/bpReport")
	public String businessPlanReport(String year, String team, Principal principal, Model model) {
		System.out.println("<< businessPlan Report, " + year + ", " + team + " >>\n");

		if (principal == null) {
			return "";
		}

//		로그인 한 아이디의 권한 가져오기
		List<String> roleNames = new ArrayList<>();
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		Collection<GrantedAuthority> collection = (Collection<GrantedAuthority>) auth.getAuthorities();

		for (GrantedAuthority authority : collection) {
			roleNames.add(authority.getAuthority());
		}
		System.out.println("권한 : " + roleNames);
		System.out.println("year : " + year);

		String depName = roleName(roleNames);
		System.out.println("String " + depName);
		if ("마케팅".equals(depName) || "이사".equals(depName)) {
			depName = team;
        }
    	model.addAttribute("depName", depName);
    	
		System.out.println("getBPPeriodService : " + depName + " " + year);
		// 1분기의 영업 계획 내용 (부서, 구분, 연도, 분기) < 구분 : (1. 물품, 2. 유지보수, 3. 개발) >
		List<BusinessPlanVO> list11 = businessPlanService.getBusinessPlanPeriodService(depName, 1, year, 1);
		List<BusinessPlanVO> list12 = businessPlanService.getBusinessPlanPeriodService(depName, 2, year, 1);
		List<BusinessPlanVO> list13 = businessPlanService.getBusinessPlanPeriodService(depName, 3, year, 1);
		// 2분기의 영업 계획 내용 (1. 물품, 2. 유지보수, 3. 개발)
		List<BusinessPlanVO> list21 = businessPlanService.getBusinessPlanPeriodService(depName, 1, year, 2);
		List<BusinessPlanVO> list22 = businessPlanService.getBusinessPlanPeriodService(depName, 2, year, 2);
		List<BusinessPlanVO> list23 = businessPlanService.getBusinessPlanPeriodService(depName, 3, year, 2);
		// 3분기의 영업 계획 내용 (1. 물품, 2. 유지보수, 3. 개발)
		List<BusinessPlanVO> list31 = businessPlanService.getBusinessPlanPeriodService(depName, 1, year, 3);
		List<BusinessPlanVO> list32 = businessPlanService.getBusinessPlanPeriodService(depName, 2, year, 3);
		List<BusinessPlanVO> list33 = businessPlanService.getBusinessPlanPeriodService(depName, 3, year, 3);
		// 4분기의 영업 계획 내용 (1. 물품, 2. 유지보수, 3. 개발)
		List<BusinessPlanVO> list41 = businessPlanService.getBusinessPlanPeriodService(depName, 1, year, 4);
		List<BusinessPlanVO> list42 = businessPlanService.getBusinessPlanPeriodService(depName, 2, year, 4);
		List<BusinessPlanVO> list43 = businessPlanService.getBusinessPlanPeriodService(depName, 3, year, 4);

		Map<String, Integer> map = new HashMap<>();
		map.put("bp11", calcExpectedSales(list11));
		map.put("bp12", calcExpectedSales(list12));
		map.put("bp13", calcExpectedSales(list13));
		map.put("bp21", calcExpectedSales(list21));
		map.put("bp22", calcExpectedSales(list22));
		map.put("bp23", calcExpectedSales(list23));
		map.put("bp31", calcExpectedSales(list31));
		map.put("bp32", calcExpectedSales(list32));
		map.put("bp33", calcExpectedSales(list33));
		map.put("bp41", calcExpectedSales(list41));
		map.put("bp42", calcExpectedSales(list42));
		map.put("bp43", calcExpectedSales(list43));

		year = year.substring(0, 4);
		model.addAttribute("year", year);

		String yr = businessPlanMapper.getLastExpectedYearANDMonth(depName, "y", Integer.parseInt(year));
		String month = businessPlanMapper.getLastExpectedYearANDMonth(depName, "m", Integer.parseInt(year));
		System.out.println("year, month : " + year + ", " +month);

		

		model.addAttribute("bp", map);
		model.addAttribute("yr", yr);
		model.addAttribute("month", month);

		return "businessPlanReport";
	}

	public int calcExpectedSales(List<BusinessPlanVO> list) {
		int expectedSales = 0; // 예상매출액

		for (BusinessPlanVO bp : list) {
			expectedSales += bp.getExpectedSales();
		}

		return expectedSales;
	}

	public String roleName(List<String> list) {
		String depName = null;
		if (list.get(0).equals("ROLE_SALES1") || list.get(0).equals("ROLE_DIRECTOR1")) {
			depName = "영업 1팀";
		} else if (list.get(0).equals("ROLE_SALES2") || list.get(0).equals("ROLE_DIRECTOR2")) {
			depName = "영업 2팀";
		} else if (list.get(0).equals("ROLE_MARKETING")) {
			depName = "마케팅";
		} else if (list.get(0).equals("ROLE_CEO")) {
			depName = "이사";
		}

		System.out.println(depName);
		return depName;
	}

}
