package com.manage.comm;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletResponse;

import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;

public class Common {
	
	
	public static ResponseEntity<String> alertMsg(String msg) {
		ResponseEntity<String> responseEntity = null;
		HttpHeaders headers = new HttpHeaders();
		headers.add("Content-Type", "text/html; charset=UTF-8");
		
		responseEntity = new ResponseEntity<String>(msg, headers, HttpStatus.OK);
		return responseEntity;
	}
	
	public static void script(HttpServletResponse response, String script) {
		response.setContentType("text/html; charset=UTF-8");
		try {
			PrintWriter out = response.getWriter();
			out.println("<script>");
			out.println(script);
			out.println("</script>");
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

}
