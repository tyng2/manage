package com.manage.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.manage.vo.BusinessPlanVO;
import com.manage.vo.CostBenefitAnalysisVO;

public interface CostBenefitAnalysisMapper {

	public List<CostBenefitAnalysisVO> getCBAnalysis(@Param("search") String search, @Param("amount") int amount, @Param("startRow") int startRow);

	public CostBenefitAnalysisVO CBAnalysisDtl(String oppId);

	public int CBAnalysisRegi(CostBenefitAnalysisVO c);

	public int getCBAnalysisPageCount(String search);

	public List<CostBenefitAnalysisVO> getCBAnalysisList(@Param("search") String search, @Param("amount") int amount, @Param("startRow") int startRow);

	public CostBenefitAnalysisVO CBAnalysisListDtl(String oppId);

	public int CBAnalysisUpdate(CostBenefitAnalysisVO c);

}
