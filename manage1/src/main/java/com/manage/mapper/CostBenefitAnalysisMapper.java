package com.manage.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.manage.vo.BusinessPlanVO;
import com.manage.vo.CostBenefitAnalysisVO;

public interface CostBenefitAnalysisMapper {

	public List<BusinessPlanVO> getCBAnalysis(String oppId);

	public CostBenefitAnalysisVO CBAnalysisDtl(String oppId);

	public int CBAnalysisRegi(CostBenefitAnalysisVO c);

	public List<CostBenefitAnalysisVO> getCBAnalysisPageList(@Param("search") String search, @Param("amount") int amount, @Param("startRow") int startRow);

	public int getCBAnalysisPageCount(String search);

	public List<CostBenefitAnalysisVO> getCBAnalysisList();

}
