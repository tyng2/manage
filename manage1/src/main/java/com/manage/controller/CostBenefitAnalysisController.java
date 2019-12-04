package com.manage.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.manage.service.CostBenefitAnalysisService;
import com.manage.vo.CostBenefitAnalysisVO;

import lombok.Setter;

@Controller
public class CostBenefitAnalysisController {

	@Setter(onMethod_ = @Autowired)
	private CostBenefitAnalysisService costBenefitAnalysisService;
	
	@GetMapping("/costBenefitAnalysis")
	public String getCBAnalysis(String oppId, Model model) {
		System.out.println("<< 손익분석 목록 >>");
		
		List<CostBenefitAnalysisVO> list = costBenefitAnalysisService.getCBAnalysis(oppId);
		
		model.addAttribute("list", list);
		
		return "costBenefitAnalysis/costBenefitAnalysis";
	}
}
