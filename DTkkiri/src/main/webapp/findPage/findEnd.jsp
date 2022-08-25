<%@page import="kr.or.ddit.dtkkiri.vo.MemberVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE >
<html>
<head>
<meta charset="UTF-8">
<title>아이디 찾기</title>
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
		
		body{
			background-color: #FEEBB6;
		}
	</style>
	
	
<body>

	<%
	//서블릿에서 저장된 데이터 꺼내기

	String vo = (String)request.getAttribute("getid");
	if (vo != null) {
	%>
	
	<div class="container">
		<br>
		<img src="images/아이디찾기.png" class="pngresize">
		<div>
		<br>
		<br>
			<label for="uid">아이디</label><br>
			<table>
				<tr>
					<td><%=vo%></td>
				</tr>
			</table><br>
		<button type="button" class="btn btn-primary" 
			onclick="location.href='/DTkkiri/loginPage/loginPage.jsp'">돌아가기</button>
		</div>
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