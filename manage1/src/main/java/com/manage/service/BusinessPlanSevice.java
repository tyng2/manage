package com.manage.service;

import java.util.HashMap;
import java.util.List;

import com.manage.vo.BusinessPlanVO;

public interface BusinessPlanSevice {
	
	public int insertBusinessPlan(BusinessPlanVO businessPlanVO);

	public List<BusinessPlanVO> getBusinessPlanByUserNum(String oppId);

	public BusinessPlanVO businessPlanDtl(String oppId);

	public boolean businessPlanUpdate(BusinessPlanVO b);

	public List<BusinessPlanVO> getBusinessPlanPeriodService(String roleName, int sort1, String year, int quarter);

	public boolean businessPlanDel(String oppId, String userNum);

	public int getBusinessPlanListCnt(HashMap<String, String> params);

	public List<HashMap<String, String>> getBusinessPlanList(HashMap<String, String> params);
	
}
