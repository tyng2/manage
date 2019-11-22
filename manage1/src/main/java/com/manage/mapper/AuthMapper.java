package com.manage.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.manage.vo.AuthVO;

public interface AuthMapper {
	
	public int insertAuth(@Param("userId") String userId, @Param("auth") String auth);

	public List<AuthVO> getAuthListByUserId(String userId);
}
