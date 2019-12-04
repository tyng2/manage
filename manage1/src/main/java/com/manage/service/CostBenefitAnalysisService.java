package com.manage.service;

import java.util.List;

import com.manage.vo.CostBenefitAnalysisVO;

public interface CostBenefitAnalysisService {

	List<CostBenefitAnalysisVO> getCBAnalysis(String oppId);

}
