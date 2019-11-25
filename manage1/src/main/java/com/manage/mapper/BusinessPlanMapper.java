package com.manage.mapper;

import java.util.List;

import com.manage.vo.BusinessPlanVO;

public interface BusinessPlanMapper {
	
	public int insertBusinessPlan(BusinessPlanVO businessPlanVO);
	
	public List<BusinessPlanVO> getBusinessPlanByUserNum(String userNum);
	
	public String getLastOppid();
}
