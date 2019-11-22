package com.manage.security.domain;

import java.util.Collection;

import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.userdetails.User;

import com.manage.vo.UserVO;

import lombok.Getter;

@Getter
public class CustomUser extends User {
    private UserVO user;

    public CustomUser(String username, String password, 
            Collection<? extends GrantedAuthority> authorities,
            UserVO user) {
        super(username, password, authorities);
        
        this.user = user;
    }
}
