package com.manage.service;

import com.manage.vo.UserVO;

public interface UserService {
	
	public int insert(UserVO userVO);
	
	public UserVO getUserById(String userId);

}
