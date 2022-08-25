<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

    
        
    <%
    int check = (int) request.getAttribute("userMail");
    
    
    if(check > 0){
    
    %>
    
    	{
    		"num" : "1",
    		"flag" : "사용이 불가능한 이메일입니다."
    
   		}
    
    
    <%
    } else {
    %>
    
    	{
    		"num" : "0",
    		"flag" : "사용 가능한 이메일입니다."
    	}
    
    <%
    }
    %>