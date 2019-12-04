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
	public List<BusinessPlanVO> getCBAnalysis(String oppId) {
		List<BusinessPlanVO> list = costBenefitAnalysisMapper.getCBAnalysis(oppId);
		
		return list;
	}

	@Override
	public CostBenefitAnalysisVO CBAnalysisDtl(String oppId) {
		CostBenefitAnalysisVO cb = costBenefitAnalysisMapper.CBAnalysisDtl(oppId);
		
		return cb;
	}

	@Override
	public int CBAnalysisRegi(CostBenefitAnalysisVO c) {
		return costBenefitAnalysisMapper.CBAnalysisRegi(c);
	}
}
