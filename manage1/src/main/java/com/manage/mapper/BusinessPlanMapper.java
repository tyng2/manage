package com.manage.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.manage.vo.BusinessPlanVO;

public interface BusinessPlanMapper {
	
	public int insertBusinessPlan(BusinessPlanVO businessPlanVO);
	
	public List<BusinessPlanVO> getBusinessPlanByUserNum(String userNum);
	
	public BusinessPlanVO getLastData();
	
	public List<BusinessPlanVO> getBusinessPlanPeriod(@Param("department") String department, @Param("sort1") String sort1, @Param("month1") String month1, @Param("month2") String month2);

	public BusinessPlanVO businessPlanDtl(String oppId);

	public int businessPlanUpdate(BusinessPlanVO list);
	
	public List<Integer> getYearBusinessPlan();
	
	public String getLastExpectedYear(int year);

	public String getLastExpectedMonth(int year);
	
}
