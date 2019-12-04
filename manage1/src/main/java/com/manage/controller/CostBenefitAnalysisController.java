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
	
	@GetMapping("/cbAnalysis")
	public String CBAnalysis(Model model) {
		System.out.println("<< 손익 분석 작성 >>\n");
		
		return "costBenefitAnalysis/costBenefitAnalysis";
	}
	
	@GetMapping("/cbAnalysisList")
	public String getCBAnalysisList(String oppId, Model model) {
		System.out.println("<< 손익분석 목록 >n");
		
		List<CostBenefitAnalysisVO> list = costBenefitAnalysisService.getCBAnalysis(oppId);
		
		model.addAttribute("list", list);
		
		return "costBenefitAnalysis/costBenefitAnalysisList";
	}
}
