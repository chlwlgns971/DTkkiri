<%@page import="kr.or.ddit.dtkkiri.vo.ReviewVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


	<%
	List<ReviewVO> list = (List<ReviewVO>) request.getAttribute("list");
	
	int check = (Integer) request.getAttribute("avgRate");
	
	%>
	
[
	<%
	
	for (int i=0; i<list.size();i++){
		ReviewVO vo = list.get(i);
	
	if(i>0) out.print(", ");
	 %>
	 
	 
	 {
	 	"id" : "<%= vo.getRv_mem_id() %>",
	 	"rate" : "<%= vo.getRv_rate() %>",
	 	"cont" : "<%= vo.getRv_cont() %>",
	 	"date" : "<%= vo.getRv_date() %>",
	 	"num" : "<%= vo.getRv_num() %>",
	 	"resNum" : "<%= vo.getRv_rnum() %>"

	 
	 
	 }
	 
	 
	 <%
	}
	 %>
	 
]	