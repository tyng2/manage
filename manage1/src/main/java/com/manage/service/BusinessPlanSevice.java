package com.manage.service;

import java.util.List;

import com.manage.vo.BusinessPlanVO;

public interface BusinessPlanSevice {
	
	public int insertBusinessPlan(BusinessPlanVO businessPlanVO);

	public List<BusinessPlanVO> getBusinessPlanByUserNum(String UserNum);

//	public HashMap<String, String> getBusinessPlanByUserNum(HashMap<String, String> params) throws Throwable;
}
