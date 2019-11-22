package com.manage.vo;

import java.util.List;

import lombok.Data;

@Data
public class UserVO {
	private String userId, password, userNum, name, position, department;
	
	private List<AuthVO> authList;
}
