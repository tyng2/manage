package com.manage.service;

import java.util.List;
import java.util.Map;

import com.manage.vo.BusinessPlanVO;

public interface BusinessPlanSevice {
	
	public int insertBusinessPlan(BusinessPlanVO businessPlanVO);

	public List<BusinessPlanVO> getBusinessPlanByUserNum(String UserNum);

	public List<BusinessPlanVO> businessPlanDtl(String oppId);
	
	public Map<String, String> getLastExpectedYearANDMonth(int year);

}
