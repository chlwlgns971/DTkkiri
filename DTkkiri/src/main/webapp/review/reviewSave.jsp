<%@page import="kr.or.ddit.dtkkiri.vo.ReviewVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

    
    <%
    
    int res = (Integer) request.getAttribute("result");
    
    ReviewVO vo = (ReviewVO) request.getAttribute("Rvo");
    
    if(res>0){
    %>
    
    {
    
    "flag" : "성공",
    "num" : "<%= vo.getRv_rnum() %>"
    }
    
    <%
    }else{
    %>
    
    {
    "flag" : "실패",
    "num" : "0"
    }
    
    <%
    }
    %>