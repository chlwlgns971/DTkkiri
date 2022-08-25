<%@page import="kr.or.ddit.dtkkiri.vo.MemberVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
	  <!-- Theme Made By www.w3schools.com - No Copyright -->
	  <title>DTkkiri Community</title>
	  <meta charset="utf-8">
	  <meta name="viewport" content="width=device-width, initial-scale=1">
	  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
	  <link href="https://fonts.googleapis.com/css?family=Montserrat" rel="stylesheet">
	 
	  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
	  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
	  
	  <!-- 캘린더 -->
	 <!--  <link href='../css/fullcalendar.css' rel='stylesheet' /> -->
	  <!-- 캘린더 -->
	<!--     <script src='../js/fullcalendar.js'></script>
	    <script>
	
	      document.addEventListener('DOMContentLoaded', function() {
	        var calendarEl = document.getElementById('calendar');
	        var calendar = new FullCalendar.Calendar(calendarEl, {
	          initialView: 'dayGridMonth',
	          googleCalendarApiKey: 'AIzaSyDW61cUpMje4uJLv927INfTjoPGibfZLek',
	          events: {
	            googleCalendarId: 'ko.south_korea#holiday@group.v.calendar.google.com',
	            className: 'gcal-event' // an option!
	          },
	          eventClick : function(info){
	        	  info.jsEvent.stopPropagation();
	        	  info.jsEvent.preventDefault();
	          },
	        });
	        calendar.render();
	      }); 
	
	    </script> -->
	    
	  
	  <style>
	  body {
	    background-image: url('../images/background.jpg')!important;
	    font: 20px Montserrat, sans-serif;
	    line-height: 1.8;
	    color: #f5f6f7;
	  }
	  p {font-size: 16px;}
	  .margin {margin-bottom: 45px;}
	  .bg-1 { 
	     
	      background-repeat : no-repeat;
	      background-size : cover;
	      
	  }
	  .bg-2 { 
	    background-color:#0B243B; 
	    color: #fff;
	  }
	
	  .container-fluid {
	    padding-top: 70px;
	    padding-bottom: 70px;
	  }

	  
	  .navbar-nav  li a:hover {
	    color: #1abc9c !important;
	  }
	  
	.js-clock{
		height: 50vh;
	}
	  .js-toDoList{
	  	list-style:none;
	  }
	
	#time{
		font-size: 200px;
	}
	
	  </style>
	</head>
	<body>
	

		<!--Main Container -->
		<div class="container-fluid bg-1 text-center">    
			<div class="collapse navbar-collapse" id="myNavbar">
		      <ul class="nav navbar-nav navbar-right">
		        <li><a href="../main/main.jsp">자유</a></li>
		        <li><a href="#">기수별</a></li>
		        <li><a href="#">DT라운지</a></li>
		        <li><a href="../memberUpdate/memUpdate.jsp">정보변경</a></li>
		        <li><a href="../loginPage/loginPage.jsp">로그아웃-로그인페이지로 이동</a></li>
		      </ul>
		    </div>
		  <!-- 시계 -->  
		   <div class="js-clock">
			   <!-- <h3 id="date">2022-08-16</h3>  -->
			   <h1 id="time">0000</h1>
		    </div>
	    
		  <!-- 누구님 반갑습니다! -->
    	  <div>
		    <%  MemberVO memVo= (MemberVO)session.getAttribute("member"); %>
		    <h3> Hey, <%= memVo.getMem_name() %>! </h3>
		  </div> 
		  <!-- todoList -->
		  <form class="js-toDoForm">
            <input type="text" placeholder="오늘 할 일!"/>
          </form>
          <ul class="js-toDoList"></ul>
		</div>
		

	</body>
	<script type="text/javascript" src="../js/clock.js"></script>
	<script type="text/javascript" src="../js/todoList.js"></script>
	<jsp:include page="../weather/weathermain.jsp" flush="true"/>

</html>