<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

    <%
    int check = (int) request.getAttribute("check");
    
    if(check >0){
    
    %>
    
    	{
    		"num" : "1",
    		"flag" : "블랙리스트에 해당되기 때문에 재가입이 불가능합니다."
    	}
    
    <%
    }else{
    %>
    
    	{
			"num" : "0",
			"flag" : ""
    	}
    
    <%
    }
    %>
