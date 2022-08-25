<%@page import="kr.or.ddit.dtkkiri.vo.ReminderVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

    <%
    List<ReminderVO> list = (List<ReminderVO>) request.getAttribute("list");
    
    %>
    
    [
    
    <%
    	for(int i=0; i<list.size();i++){
			ReminderVO vo = list.get(i);    		
  
			if(i>0) out.print(", ");
    %>
    
    {
    
    	"cont" : "<%=vo.getRmd_cont() %>",
    	"num" : "<%= vo.getRmd_num() %>"
    }
    
    <%
    	}
    %>
    
    ]