<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

   <%
    
    int res = (Integer) request.getAttribute("checkDel"); // 삭제여부확인
    int rnum = (Integer) request.getAttribute("rnum"); //게시글 번호
    
    
    if(res>0){
    %>
    
    {
    "num" : "<%= rnum %>",
    "flag" : "성공"
    }
    
    <%
    }else{
    %>
    
    {
    "num" : "0",
    "flag" : "실패"
    }
    
    <%
    }
    %>