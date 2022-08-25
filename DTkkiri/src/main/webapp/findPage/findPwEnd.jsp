<%@page import="kr.or.ddit.dtkkiri.vo.MemberVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>비밀번호 찾기</title>
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
  <script src="https://cdn.jsdelivr.net/npm/jquery@3.6.0/dist/jquerys.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
</head>


	<style type="text/css">
		.pngresize{
			width: auto; height: auto;
    		max-width: 200px;
    		max-height: 200px;
		}	
		.pngresize2{
			width: auto; height: auto;
    		max-width: 500px;
    		max-height: 850px;
		}	
		
		body{
			background-color: #FEEBB6;
		}
	</style>
	
	
<body>
	<%
   //서블릿에서 저장된 데이터 꺼내기

   String vo = (String)request.getAttribute("getpass");
   if (vo != null) {
   %>
   <div class="container">
      <form class="needs-validation">
      		<br>
      		<img src="images/비밀번호찾기.png" class="pngresize">
      		<br>
      		<br>
      		<br>
      		<br>
      		<img src="images/인증하신....png" class="pngresize2">
      		<br>
      		<br>
      		<br>
            <button type="button" class="btn btn-primary" 
            	onclick="location.href='/DTkkiri/loginPage/loginPage.jsp'">로그인화면으로 돌아가기</button>
      </form>
   </div>
         <%
         } else {
         %>
   <script>
      alert("정보없음");
      history.back();
   </script>
   <%
   }
   %>
   
   
</body>
</html>