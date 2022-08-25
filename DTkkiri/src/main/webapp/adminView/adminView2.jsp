		<%@page import="java.util.List"%>
<%@page import="kr.or.ddit.dtkkiri.vo.MemberVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
//서블릿에서 저장한 공유데이타 꺼내기 
   List<MemberVO> vo = (List<MemberVO>)request.getAttribute("mvoView");


%>

[
  <%
    for(int i=0; i<vo.size(); i++){
    	MemberVO  nvo = vo.get(i);
    	if(i > 0) out.print(",");
  %>  	
  
    	{
    	
    	  "mId"   	:  "<%= nvo.getMem_id() %>",
    	  "mBir"    :  "<%= nvo.getMem_bir().substring(0, 10) %>",
    	  "mName"   :  "<%= nvo.getMem_name() %>",
    	  "mWar"   	:  "<%= nvo.getMem_war() %>",
   		  "mTName"  :  "<%= nvo.getMem_tname() %>",
    	  "mRoom"   :  "<%= nvo.getMem_room() %>",
    	  "mMail"   :  "<%= nvo.getMem_mail() %>",
    	  "mPid"    :  "<%= nvo.getMem_pid() %>",
    	  "mGen"    :  "<%= nvo.getMem_gen() %>",
    	  "mPass"   :  "<%= nvo.getMem_pass() %>",
    	  "mDus"   :  "<%= nvo.getMem_dus() %>"
    	  
     	}
   
  <%	
    }
  %>
]