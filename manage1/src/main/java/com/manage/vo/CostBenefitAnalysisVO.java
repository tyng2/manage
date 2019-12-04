package com.manage.vo;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

import lombok.Data;

@Data
public class CostBenefitAnalysisVO {

	private String oppId, projectName, userNum, endUser, customer, autoExtension;
	private int version, profitSort, expectedSales, expectedPurchase, expectProfit, exchangeRate;
	
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date contractDate, expiredDate;
	
}
