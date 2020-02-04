package com.manage.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.manage.mapper.CostBenefitAnalysisMapper;
import com.manage.vo.BusinessPlanVO;
import com.manage.vo.CostBenefitAnalysisVO;

import lombok.Setter;

@Service
public class CostBenefitAnalysisServiceImpl implements CostBenefitAnalysisService {

	@Setter(onMethod_ = @Autowired)
	private CostBenefitAnalysisMapper costBenefitAnalysisMapper;

	@Override
	public List<BusinessPlanVO> getCBAnalysis(String search, int amount, int startRow) {
		List<BusinessPlanVO> list = costBenefitAnalysisMapper.getCBAnalysis(search, amount, startRow);
		
		return list;
	}

	@Override
	public CostBenefitAnalysisVO CBAnalysisDtl(String oppId) {
		CostBenefitAnalysisVO cb = costBenefitAnalysisMapper.CBAnalysisDtl(oppId);
		
		System.out.println("oppId : " + oppId);
		
		return cb;
	}

	@Override
	public int CBAnalysisRegi(CostBenefitAnalysisVO c) {
		
		
		
		return costBenefitAnalysisMapper.CBAnalysisRegi(c);
	}

	@Override
	public List<CostBenefitAnalysisVO> getCBAnalysisList(String search, int amount, int startRow) {
		
		return costBenefitAnalysisMapper.getCBAnalysisList(search, amount, startRow);
	}

	@Override
	public CostBenefitAnalysisVO CBAnalysisListDtl(String oppId) {		
		CostBenefitAnalysisVO cba = costBenefitAnalysisMapper.CBAnalysisListDtl(oppId);
		return cba;
	}

	@Override
	public int CBAnalysisUpdate(CostBenefitAnalysisVO c) {
		
		return costBenefitAnalysisMapper.CBAnalysisUpdate(c);
	}

}
