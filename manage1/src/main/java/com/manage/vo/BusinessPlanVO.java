package com.manage.vo;

import java.sql.Timestamp;

import lombok.Data;

@Data
public class BusinessPlanVO {
	private String OppId, projectName, userNum, endUser, customer, note;
	private int sort1, sort2, expectedSales, expectedPurchase, expectedProfit, expectedSalesMonth, state;
	
	private Timestamp regDate;
	

}
