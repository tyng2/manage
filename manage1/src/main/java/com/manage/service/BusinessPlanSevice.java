package com.manage.service;

import java.util.List;

import com.manage.vo.BusinessPlanVO;

public interface BusinessPlanSevice {
	
	public int insertBusinessPlan(BusinessPlanVO businessPlanVO);

	public List<BusinessPlanVO> getBusinessPlanByUserNum(String userNum);

	public BusinessPlanVO businessPlanDtl(String oppId);

	public boolean businessPlanUpdate(BusinessPlanVO b);

	public List<BusinessPlanVO> getBusinessPlanPeriodService(String roleName, int sort1, String year, int quarter);

	public boolean businessPlanDel(String oppId, String userNum);

	public int getBusinessPlanListCnt();

	public List<BusinessPlanVO> getBusinessPlanList(String startCnt, String endCnt);
	
	
	public List<BusinessPlanVO> getBusinessPlanPageList(String search, String department, String userNum, int amount, int startRow);
}
