package com.manage.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.manage.vo.BusinessPlanVO;

public interface BusinessPlanMapper {
	
	public int insertBusinessPlan(BusinessPlanVO businessPlanVO);
	
	public List<BusinessPlanVO> getBusinessPlanByUserNum(String userNum);
	
	public String getLastOppid();
	
	public List<BusinessPlanVO> getBusinessPlanPeriod(@Param("userNum") String userNum, @Param("month1") String month1, @Param("month2") String month2);
	
	
}
