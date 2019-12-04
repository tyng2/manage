package com.manage.mapper;

import java.util.List;

import com.manage.vo.BusinessPlanVO;
import com.manage.vo.CostBenefitAnalysisVO;

public interface CostBenefitAnalysisMapper {

	public List<BusinessPlanVO> getCBAnalysis(String oppId);

	public CostBenefitAnalysisVO CBAnalysisDtl(String oppId);

	public int CBAnalysisRegi(CostBenefitAnalysisVO c);

}
