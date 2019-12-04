package com.manage.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import com.manage.service.CostBenefitAnalysisService;
import com.manage.vo.BusinessPlanVO;
import com.manage.vo.CostBenefitAnalysisVO;

import lombok.Setter;

@Controller
public class CostBenefitAnalysisController {

	@Setter(onMethod_ = @Autowired)
	private CostBenefitAnalysisService costBenefitAnalysisService;
	
	@GetMapping("/cbAnalysis")
	public String CBAnalysis(String oppId, Model model) {
		System.out.println("<< 손익 분석 작성 >>\n");
		
		List<BusinessPlanVO> list = costBenefitAnalysisService.getCBAnalysis(oppId);
		
		model.addAttribute("list", list);
		
		return "costBenefitAnalysis/costBenefitAnalysis";
	}
	
	@GetMapping("/costBenefitAnalysisRegi")
	public String costBenefitAnalysisRegi(String oppId, Model model, HttpSession session) {
		System.out.println("<< costBenefitAnalysisRegi >>");
		
		CostBenefitAnalysisVO list = costBenefitAnalysisService.CBAnalysisDtl(oppId);
		
		model.addAttribute("data", list);
		
		return "costBenefitAnalysis/costBenefitAnalysisRegi";
	}
	
	@PostMapping("/costBenefitAnalysisRegi")
	public ResponseEntity<String> costBenefitAnalysisRegi(String oppId, CostBenefitAnalysisVO c, Model model){
		System.out.println("<< costBenefitAnalysisRegi, POST >>\n");
		
		HttpHeaders headers = new HttpHeaders();
		
		costBenefitAnalysisService.CBAnalysisRegi(c);
		
		//글 수정 성공 이후 글목록으로 리다이렉트
	    headers.add("Location", "/cbAnalysis");
		return new ResponseEntity<String>(headers, HttpStatus.FOUND);
	}
	
	@GetMapping("/cbAnalysisList")
	public String getCBAnalysisList(Model model) {
		System.out.println("<< 손익분석 목록 >\n");

		
		return "costBenefitAnalysis/costBenefitAnalysisList";
	}
}
