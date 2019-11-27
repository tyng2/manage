package com.manage.service;

import java.util.Calendar;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.manage.mapper.BusinessPlanMapper;
import com.manage.vo.BusinessPlanVO;

import lombok.Setter;

@Service
public class BusinessPlanServiceImpl implements BusinessPlanSevice {

	@Setter(onMethod_ = @Autowired)
	private BusinessPlanMapper businessPlanMapper;

	@Override
	public int insertBusinessPlan(BusinessPlanVO businessPlanVO) {
		System.out.println("<< business, POST >>\n");
		System.out.println("\n" + businessPlanVO + "\n");

		
		/* 새 영업계획에 사용될 OppId 구하는 과정 */
		String lastOppid = businessPlanMapper.getLastData().getOppId();
		
		Calendar cal = Calendar.getInstance();
		
		StringBuffer newOppId = new StringBuffer();
		newOppId.append("O").append(cal.get(Calendar.YEAR));
		
		int num = 1;
		if (lastOppid != null) {
			num = Integer.parseInt(lastOppid.substring(7)) + 1;
		}
		
		if (num < 10) {
			newOppId.append("000");
		} else if (num < 100) {
			newOppId.append("00");
		} else if (num < 1000) {
			newOppId.append("0");
		}
		newOppId.append(num);
		/* 새 영업계획에 사용될 OppId 구하는 과정 */
			
		
		System.out.println(newOppId.toString());
		businessPlanVO.setOppId(newOppId.toString());
		
		return businessPlanMapper.insertBusinessPlan(businessPlanVO);
	}

	@Override
	public List<BusinessPlanVO> getBusinessPlanByUserNum(String userNum) {
		System.out.println("\n" + userNum + "\n");
		List<BusinessPlanVO> list = businessPlanMapper.getBusinessPlanByUserNum(userNum);
		
		return list;
	}

	@Override
	public List<BusinessPlanVO> businessPlanDtl(String oppId) {
		List<BusinessPlanVO> list = businessPlanMapper.businessPlanDtl(oppId);
		
		return list;
	}

	@Override
	public Map<String, String> getLastExpectedYearANDMonth(int year) {
		
		String yr = businessPlanMapper.getLastExpectedYear(year);
		String month = businessPlanMapper.getLastExpectedMonth(year);
		
		Map<String, String> map = new HashMap<String, String>();
		map.put("yr", yr);
		map.put("month", month);
		return map;
	}

	
	

}
