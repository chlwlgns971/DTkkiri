<%@page import="kr.or.ddit.dtkkiri.vo.BlacklistVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
//서블릿에서 저장한 공유데이타 꺼내기 
   List<BlacklistVO> vo = (List<BlacklistVO>)request.getAttribute("blacklist");


%>

[
  <%
    for(int i=0; i<vo.size(); i++){
    	BlacklistVO  nvo = vo.get(i);
    	if(i > 0) out.print(",");
  %>  	
  
    	{
    	
    	  "email"    :  "<%= nvo.getBkl_mail() %>",
    	  "cont"    :  "<%= nvo.getBkl_rsn() %>",
    	  "date"   :  "<%= nvo.getBkl_date() %>"
    	  
     	}
   
  <%	
    }
  %>
]