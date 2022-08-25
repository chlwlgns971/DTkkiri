<%@page import="com.google.gson.JsonElement"%>
<%@page import="com.google.gson.Gson"%>
<%@page import="com.google.gson.JsonObject"%>
<%@page import="kr.or.ddit.dtkkiri.vo.ResPageVO"%>
<%@page import="kr.or.ddit.dtkkiri.vo.RestaurantVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


	<%
	List<RestaurantVO> list = (List<RestaurantVO>) request.getAttribute("list");
	ResPageVO vo = (ResPageVO)request.getAttribute("pvo");
	
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
