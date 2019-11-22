package com.manage.vo;

import lombok.Data;

@Data
public class BusinessPlanningVO {
	private String OppId, projectName, userName, endUser, customer, note;
	private int sort1, sort2, expectedSales, expectedPurchase, expectedProfit, expectedSalesMonth, state;
	

}
