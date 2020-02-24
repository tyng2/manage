package com.manage.service;

import java.util.Calendar;
import java.util.HashMap;
import java.util.List;

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
		System.out.println("lastOppId : " + lastOppid);
		
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
		System.out.println("\nuserNum : " + userNum + "\n");
		List<BusinessPlanVO> list = businessPlanMapper.getBusinessPlanByUserNum(userNum);
		
		return list;
	}

	@Override
	public BusinessPlanVO businessPlanDtl(String oppId) {
		BusinessPlanVO bp = businessPlanMapper.businessPlanDtl(oppId);
		
		return bp;
	}

	@Override
	public boolean businessPlanUpdate(BusinessPlanVO b) {
		boolean isSuccess = false;
	        
		BusinessPlanVO bp = businessPlanMapper.businessPlanDtl(b.getOppId());
	        
			if (b.getUserNum().equals(bp.getUserNum())) {
	        	businessPlanMapper.businessPlanUpdate(b);
	            isSuccess = true;
	        } else {
	            isSuccess = false;
	        }
		return isSuccess;
	}

	@Override
	public boolean businessPlanDel(String oppId, String userNum) {
		boolean isSuccess = false;
        
		BusinessPlanVO bp = businessPlanMapper.businessPlanDtl(oppId);
        
        if(userNum.equals(bp.getUserNum())) {
        	businessPlanMapper.businessPlanDel(oppId);
            isSuccess = true;
        } else {
            isSuccess = false;
        }
        
        return isSuccess;
	}

	@Override
	public List<BusinessPlanVO> getBusinessPlanPeriodService(String roleName, int sort1, String year, int quarter) {
//		year = year.substring(0, 4);
		StringBuilder month1 = new StringBuilder();
		StringBuilder month2 = new StringBuilder();
		month1.append(year).append("-");
		month2.append(month1.toString());
//		quarter : 1. 1분기, 2. 2분기, 3. 3분기, 4. 4분기, 0. 해당 연도 모두
		switch (quarter) {
		case 1:
			month1.append("01-01");
			month2.append("03-31");
			break;
		case 2:
			month1.append("04-01");
			month2.append("06-30");
			break;
		case 3:
			month1.append("07-01");
			month2.append("09-30");
			break;
		case 4:
			month1.append("10-01");
			month2.append("12-31");
			break;
		case 0:
			month1.append("01-01");
			month2.append("12-31");
			break;
		default:
			break;
		}
		
		System.out.println(roleName);
		System.out.println(sort1);
		System.out.println(month1.toString());
		System.out.println(month2.toString());
		List<BusinessPlanVO> list = businessPlanMapper.getBusinessPlanPeriod(roleName, sort1 + "", month1.toString(), month2.toString());
		System.out.println("Impl list : " + list.size() + "개");
		
		for (BusinessPlanVO bp : list) {
			System.out.println(bp);
		}
		
		return list;
	}

	@Override
	public int getBusinessPlanListCnt() {
		int cnt = businessPlanMapper.getBusinessPlanListCnt();
		return cnt;
	}

	@Override
	public List<BusinessPlanVO> getBusinessPlanList(String startCnt, String endCnt) {
		List<BusinessPlanVO> list2 = businessPlanMapper.getBusinessPlanList(startCnt, endCnt);
		return list2;
	}

	@Override
	public List<BusinessPlanVO> getBusinessPlanPageList(String search, String department, String userNum, int amount, int startRow) {
		return businessPlanMapper.getBusinessPlanPageList(search, department, userNum, amount, startRow);
	}

	
	

}
