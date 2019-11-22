package com.manage.mapper;

import com.manage.vo.UserVO;

public interface UserMapper {
	
	public int insert(UserVO userVO);

	public UserVO getUserById(String userId);
}
