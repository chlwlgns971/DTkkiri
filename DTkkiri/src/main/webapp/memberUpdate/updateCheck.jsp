<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

    <%
   	int check = (int) request.getAttribute("updateCheck");
   
	if (check ==1){
    
    %>
    
	    {
    		"flag" : "회원정보 수정에 성공하였습니다."
    
    
   		 }
    
    
    <%
    
 		}else{
 			
    %>
    
    {
    	"flag" : "회원정보 수정에 실패하였습니다."
    
    }

	<%
	
 		}
	%>