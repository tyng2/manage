package com.manage.security;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.security.access.AccessDeniedException;
import org.springframework.security.web.access.AccessDeniedHandler;

import lombok.extern.log4j.Log4j;

@Log4j
public class CustomAccessDeniedHandler implements AccessDeniedHandler {

    @Override
    public void handle(HttpServletRequest request, HttpServletResponse response, AccessDeniedException accessDeniedException) throws IOException, ServletException {
        
    	String ajaxHeader = request.getHeader("X-Ajax-call");
    	
    	if ("true".equals(ajaxHeader)) {
    		System.out.println("ajax 접근 : " + ajaxHeader);
    		return;
    	}
    	
    	log.error("Access Denied Handler");
        log.error("Redirect....");
        
        response.sendRedirect("/accessError");
    }

}
