package com.manage.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.manage.mapper.CostBenefitAnalysisMapper;
import com.manage.vo.CostBenefitAnalysisVO;

import lombok.Setter;

@Service
public class CostBenefitAnalysisServiceImpl implements CostBenefitAnalysisService {

	@Setter(onMethod_ = @Autowired)
	private CostBenefitAnalysisMapper costBenefitAnalysisMapper;

	@Override
	public List<CostBenefitAnalysisVO> getCBAnalysis(String oppId) {
		List<CostBenefitAnalysisVO> list = costBenefitAnalysisMapper.getCBAnalysis(oppId);
		
		return list;
	}
}
