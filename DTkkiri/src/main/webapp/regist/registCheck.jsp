<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

    <%
    	int check = (int) request.getAttribute("RegistCheck");
    
 		if (check ==1){
    
    %>
    
	    {
    		"flag" : "회원가입에 성공하였습니다."
    
    
   		 }
    
    
    <%
    
 		}else{
 			
    %>
    
    {
    	"flag" : "회원가입에 실패하였습니다."
    
    }

	<%
	
 		}
	%>
	    