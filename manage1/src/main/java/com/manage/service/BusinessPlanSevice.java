package com.manage.service;

import java.util.List;

import com.manage.vo.BusinessPlanVO;

public interface BusinessPlanSevice {
	
	public int insertBusinessPlan(BusinessPlanVO businessPlanVO);

	public List<BusinessPlanVO> getBusinessPlanByUserNum(String UserNum);

	public List<BusinessPlanVO> businessPlanDtl(String oppId);
	
	public List<BusinessPlanVO> getBusinessPlanPeriodService(String roleName, int sort1, String year, int quarter);
	
}
