<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

    
       <%
    	String check = (String) request.getAttribute("tempKey");
    
  	 	 %>
    [
	    {
	    	"key" : "<%=check %>" ,
    		"flag" : "인증메일이 전송되었습니다."
    		 
    
   		 }
    
    ]
 	    
 	     
 	     
 