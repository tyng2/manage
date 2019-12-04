package com.manage.service;

import java.util.List;

import com.manage.vo.BusinessPlanVO;
import com.manage.vo.CostBenefitAnalysisVO;

public interface CostBenefitAnalysisService {

	public List<BusinessPlanVO> getCBAnalysis(String oppId);

	public CostBenefitAnalysisVO CBAnalysisDtl(String oppId);

	public int CBAnalysisRegi(CostBenefitAnalysisVO c);

}
