package com.manage.security;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;

import com.manage.mapper.AuthMapper;
import com.manage.mapper.UserMapper;
import com.manage.security.domain.CustomUser;
import com.manage.vo.AuthVO;
import com.manage.vo.UserVO;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Log4j
public class CustomUserDetailsService implements UserDetailsService {
    
    @Setter(onMethod_ = @Autowired)
    private UserMapper userMapper;
    
    @Setter(onMethod_ = @Autowired)
    private AuthMapper authMapper;
    
    // 로그인하면 loadUserByUsername() 메소드 자동호출.
    // 로그인 아이디가 username 입력 파라미터로 전달.
    @Override
    public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
        // 스프링 시큐리티에서 username은 아이디를 가리킴
        log.warn("username : " + username);
        
        UserVO userVO = userMapper.getUserById(username);
        
        if (userVO == null) {
        	System.out.println("로그인 오류");
        	return null;
        }
        
        List<AuthVO> authList = authMapper.getAuthListByUserId(username);
        userVO.setAuthList(authList);
        
        log.warn("userVO : " + userVO);
        
        String id = userVO.getUserId();
        String password = userVO.getPassword();
//        List<AuthVO> authList = member.getAuthList();
        
        List<SimpleGrantedAuthority> list = new ArrayList<>();
        
        for (AuthVO auth : authList) {
            list.add(new SimpleGrantedAuthority(auth.getAuth()));
        }
        
        // principal
        CustomUser customUser = new CustomUser(id, password, list, userVO);
        return customUser;
    }

}
