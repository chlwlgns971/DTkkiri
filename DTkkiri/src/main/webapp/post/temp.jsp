<%@page import="kr.or.ddit.dtkkiri.member.service.MemberServiceImpl"%>
<%@page import="kr.or.ddit.dtkkiri.member.service.MemberService"%>
<%@page import="kr.or.ddit.dtkkiri.vo.MemberVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
 <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
  <script src="https://cdn.jsdelivr.net/npm/jquery@3.6.0/dist/jquery.slim.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
  <style>
  .card{
  	float: right;
  	width: 300px;
  	height: 500px;
  	margin-right: 5%;
  	margin-top: 5%;
  }
  </style>
</head>
<body>

	<div class="container">
	  <h2>게시판..</h2>
	  <ul class="nav nav-tabs">
	    <li class="nav-item">
	      <a class="nav-link active" href="#">공지사항</a>
	    </li>
	    <li class="nav-item">
	      <a class="nav-link active" href="#">신고게시판</a>
	    </li>
	    <li class="nav-item">
	      <a class="nav-link active" href="#">건의게시판</a>
	    </li>
	    <li class="nav-item">
	      <a class="nav-link active" href="#">자유게시판</a>
	    </li>
	    <li class="nav-item dropdown">
	      <a class="nav-link dropdown-toggle" data-toggle="dropdown" href="#">기수별게시판</a>
	      <div class="dropdown-menu">
	        <a class="dropdown-item" href="#">304</a>
	        <a class="dropdown-item" href="#">305</a>
	        <a class="dropdown-item" href="#">306</a>
	        <a class="dropdown-item" href="#">401</a>
	        <a class="dropdown-item" href="#">402</a>
	        <a class="dropdown-item" href="#">403</a>
	        <a class="dropdown-item" href="#">404</a>
	        <a class="dropdown-item" href="#">405</a>
	        <a class="dropdown-item" href="#">406</a>
	        </div>
	    </li>
	    <li class="nav-item dropdown">
	      <a class="nav-link dropdown-toggle" data-toggle="dropdown" href="#">질문게시판</a>
	      <div class="dropdown-menu">
	        <a class="dropdown-item" href="#">JAVA</a>
	        <a class="dropdown-item" href="#">ORACLE</a>
	        <a class="dropdown-item" href="#">frontEnd</a>
	        <a class="dropdown-item" href="#">JSP</a>
	        <a class="dropdown-item" href="#">Python</a>
	        <a class="dropdown-item" href="#">기타</a></div>
	    </li>
	
	    <li class="nav-item dropdown">
	      <a class="nav-link dropdown-toggle" data-toggle="dropdown" href="#">편의사항</a>
	      <div class="dropdown-menu">
	        <a class="dropdown-item" href="#">맛집게시판</a>
	        <a class="dropdown-item" href="#">자료실</a>
	        <a class="dropdown-item" href="#">DDIT홈페이지</a>
	        <a class="dropdown-item" href="#">회의실예약</a>
	        <a class="dropdown-item" href="#">출석부요청</a>
	        </div>
	    </li>
	  </ul>
	</div>

    <div class="card" id="card">
	    <%  
	    	//로그인한 회원의 정보가져오기
	    	MemberVO memVo =(MemberVO)session.getAttribute("member"); 
	       
	        if(memVo.getMem_gen().equals("F")){
	    %>		
			    <img src="../images/avatar.jpg" class="card-img-top" alt="...">
	    
	    <%
	    	}else{
	    %>		
	    		<img src="../images/avatarMale.png" class="card-img-top" alt="...">
	    <%
	    	}
	    %>
    
	
	       <div class="card-body">
			    <h5 class="card-title">Card title</h5>
			    <p class="card-text">
			    	  <% 
			             
			    	     String id = memVo.getMem_id();
			    	     String name = memVo.getMem_name();
			    	     String email = memVo.getMem_mail();
			  
			   
			           %>
			           
			           이름 : <%= name  %>
			           아이디 : <%= id %>
			           이메일 : <%= email %>
			   
			    </p>
			    <a href="#" class="btn btn-primary">Go somewhere</a>
	  	</div>
</div>

</body>

</html>
    