<%@page import="kr.or.ddit.dtkkiri.vo.PostVO"%>
<%@page import="kr.or.ddit.dtkkiri.vo.PageVO"%>
<%@page import="com.google.gson.JsonElement"%>
<%@page import="com.google.gson.JsonObject"%>
<%@page import="com.google.gson.Gson"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%    
     //서블릿에서 저장된 데이터 꺼내기
    
    List<PostVO> list = (List<PostVO>) request.getAttribute("list");
	PageVO vo = (PageVO)request.getAttribute("pvo");
	
	
	JsonObject obj = new JsonObject();
	obj.addProperty("tpage", vo.getTotalpage());
	obj.addProperty("spage", vo.getStartPage());
	obj.addProperty("epage", vo.getEndPage());
	
   
	Gson gson = new Gson();
  //  String slist = gson.toJson(list);   [{} {} {}]이 형태일때는 이거...
  //  out.print(slist);
  //  out.flush(); 
  
    JsonElement slist = gson.toJsonTree(list);
  	obj.add("lists", slist);
  	
  	out.print(obj);
  	out.flush(); 
  
   
   
    
%>