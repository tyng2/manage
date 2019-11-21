package com.manage.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.manage.mapper.UserMapper;
import com.manage.vo.UserVO;

import lombok.Setter;

@Service
public class UserServiceImpl implements UserService {

	@Setter(onMethod_ = @Autowired)
	private UserMapper userMapper;

	@Override
	public int insert(UserVO userVO) {
		System.out.println("\n" + userVO + "\n");
		return userMapper.insert(userVO);
	}
	
	
}
