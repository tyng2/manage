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

	public int businessPlanUpdate(BusinessPlanVO b);
	
	public void businessPlanDel(String oppId);
	
	public List<Integer> getYearBusinessPlan();
	
//	yearOrMonth 값이 "y" 이면 년, "m" 이면 월을 출력
	public String getLastExpectedYearANDMonth(@Param("department") String department, @Param("yearOrMonth") String yearOrMonth, @Param("year") int year);

	public int getBusinessPlanListCnt();

	public List<BusinessPlanVO> getBusinessPlanList(@Param("startCnt") String startCnt, @Param("endCnt") String endCnt);	
	
	
	public List<BusinessPlanVO> getBusinessPlanPageList(@Param("search") String search, @Param("department") String department, @Param("userNum") String userNum, @Param("amount") int amount, @Param("startRow") int startRow);
	
	public int getBusinessPlanPageCount(@Param("search") String search, @Param("department") String department, @Param("userNum") String userNum);
	
}
