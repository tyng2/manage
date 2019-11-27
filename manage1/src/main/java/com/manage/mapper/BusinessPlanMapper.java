package com.manage.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.manage.vo.BusinessPlanVO;

public interface BusinessPlanMapper {
	
	public int insertBusinessPlan(BusinessPlanVO businessPlanVO);
	
	public List<BusinessPlanVO> getBusinessPlanByUserNum(String userNum);
	
	public String getLastOppid();
	
	public List<BusinessPlanVO> getBusinessPlanPeriod(@Param("sort1") String sort1, @Param("month1") String month1, @Param("month2") String month2);

	public List<BusinessPlanVO> businessPlanDtl(String oppId);
	
	public List<Integer> getYearBusinessPlan();
	
	
}
