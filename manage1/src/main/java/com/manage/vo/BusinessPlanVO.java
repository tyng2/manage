package com.manage.vo;

import java.sql.Timestamp;
import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

import lombok.Data;

@Data
public class BusinessPlanVO {
	private String OppId, projectName, userNum, endUser, customer, note, customerName, customerPhone, customerEmail;
	private int sort1, sort2, expectedSales, expectedPurchase, expectedProfit, state;
	
	@DateTimeFormat(pattern = "yyyy-MM")
	private Date expectedSalesMonth;
	
	private Timestamp regDate;
	

}
