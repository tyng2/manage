package com.manage.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.manage.mapper.CostBenefitAnalysisMapper;
import com.manage.service.CostBenefitAnalysisService;
import com.manage.vo.BusinessPlanVO;
import com.manage.vo.CostBenefitAnalysisVO;

import lombok.Setter;

@Controller
public class CostBenefitAnalysisController {

	@Setter(onMethod_ = @Autowired)
	private CostBenefitAnalysisService costBenefitAnalysisService;
	
	@Setter(onMethod_ = @Autowired)
	private CostBenefitAnalysisMapper costBenefitAnalysisMapper;
	
	@GetMapping("/cbAnalysis")
	public String CBAnalysis(String oppId, Model model, @RequestParam(defaultValue = "1") int pageNum, @RequestParam(required = false) String search) {
		System.out.println("<< 손익 분석 작성 >>\n");
		
		int amount = 5; // 한 페이지 당 보여줄 글 갯수
        int startRow = (pageNum - 1) * amount; // 시작 행 번호
		
		List<BusinessPlanVO> list = costBenefitAnalysisService.getCBAnalysis(search, amount, startRow);
		
		int allRowCount = 0; // 전체 행 갯수
        allRowCount = costBenefitAnalysisMapper.getCBAnalysisPageCount(search);
        
        int maxPage = allRowCount / amount + (allRowCount % amount == 0 ? 0 : 1);
        
        int pageBlockSize = 5; // 한 페이지블록 당 페이지 갯수
        
        int startPage = ((pageNum/pageBlockSize) - (pageNum%pageBlockSize==0 ? 1 : 0)) * pageBlockSize + 1;
        
        int endPage = startPage + pageBlockSize - 1;
        if (endPage > maxPage) { // 마지막 블록에서 끝 페이지 번호 구하기
            endPage = maxPage;
        }
        
        Map<String, Integer> page = new HashMap<>();
        page.put("startPage", startPage);
        page.put("endPage", endPage);
        page.put("pageBlockSize", pageBlockSize);
        page.put("maxPage", maxPage);
        page.put("allRowCount", allRowCount);
        page.put("pageNum", pageNum);
        
		model.addAttribute("list", list);
		model.addAttribute("page", page);
		
		return "costBenefitAnalysis/costBenefitAnalysis";
	}

	
// 손익분석 작성
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
		System.out.println("oppId :" + oppId + "\n");
		
		HttpHeaders headers = new HttpHeaders();
		
		costBenefitAnalysisService.CBAnalysisRegi(c);
		
		//글 수정 성공 이후 글목록으로 리다이렉트
	    headers.add("Location", "/cbAnalysis");
		return new ResponseEntity<String>(headers, HttpStatus.FOUND);
	}

	
// 손익분석 목록	
	@GetMapping("/cbAnalysisList")
	public String getCBAnalysisList(String userNum, Model model, @RequestParam(defaultValue = "1") int pageNum, @RequestParam(required = false) String search) {
		System.out.println("<< 손익 분석 목록 >>\n");

		int amount = 5; // 한 페이지 당 보여줄 글 갯수
        int startRow = (pageNum - 1) * amount; // 시작 행 번호
		
		List<CostBenefitAnalysisVO> list = costBenefitAnalysisService.getCBAnalysisList(search, amount, startRow);
		
		int allRowCount = 0; // 전체 행 갯수
        allRowCount = costBenefitAnalysisMapper.getCBAnalysisPageCount(search);
        
        int maxPage = allRowCount / amount + (allRowCount % amount == 0 ? 0 : 1);
        
        int pageBlockSize = 5; // 한 페이지블록 당 페이지 갯수
        
        int startPage = ((pageNum/pageBlockSize) - (pageNum%pageBlockSize==0 ? 1 : 0)) * pageBlockSize + 1;
        
        int endPage = startPage + pageBlockSize - 1;
        if (endPage > maxPage) { // 마지막 블록에서 끝 페이지 번호 구하기
            endPage = maxPage;
        }
        
        Map<String, Integer> page = new HashMap<>();
        page.put("startPage", startPage);
        page.put("endPage", endPage);
        page.put("pageBlockSize", pageBlockSize);
        page.put("maxPage", maxPage);
        page.put("allRowCount", allRowCount);
        page.put("pageNum", pageNum);
		
		model.addAttribute("list", list);
		model.addAttribute("page", page);
		
		return "costBenefitAnalysis/costBenefitAnalysisList";
	}

	
// 손익분석 업데이트	
	@GetMapping("/costBenefitAnalysisUpdate")
	public String costBenefitAnalysisUpdate(String oppId, Model model, HttpSession session) {

		CostBenefitAnalysisVO list = costBenefitAnalysisService.CBAnalysisListDtl(oppId);
		
		model.addAttribute("data", list);
		
		return "costBenefitAnalysis/costBenefitAnalysisUpdate";
	}
	
	
	@PostMapping("/costBenefitAnalysisUpdate")
	public ResponseEntity<String> costBenefitAnalysisUpdate(CostBenefitAnalysisVO c, Model model) {
		System.out.println("<< cbAnalysisList Update, POST >>\n");
		
		HttpHeaders headers = new HttpHeaders();
		
		costBenefitAnalysisService.CBAnalysisUpdate(c);
		
		headers.add("Location", "/cbAnalysisList");
		return new ResponseEntity<String>(headers, HttpStatus.FOUND);
	}
	
}
