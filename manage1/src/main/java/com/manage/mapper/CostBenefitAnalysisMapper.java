package com.manage.mapper;

import java.util.List;

import com.manage.vo.CostBenefitAnalysisVO;

public interface CostBenefitAnalysisMapper {

	List<CostBenefitAnalysisVO> getCBAnalysis(String oppId);

}
