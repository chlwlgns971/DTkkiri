<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
<title>DT끼리</title>
<script src="../js/board.js"></script>
<style type="text/css">
	#pagelist {
		margin-left: 45%;
	}
	table{
		text-align: center;
	}
	.title:hover{
		cursor: pointer;
	}
</style>
<script type="text/javascript">
	$(function(){
		var code=document.getElementById("code").value;
		alert(code);
		listPageServer(1,code);
		
		// prev버튼 클릭 이벤트
		$(document).on('click', '.prev', function() {
			//	alert( $('.plist a').first().text());
			currentPage = parseInt($('.plist a').first().text().trim()) - 1;
			listPageServer(currentPage);

		})
		// next버튼 클릭 이벤트
		$(document).on('click', '.next', function() {
			//	 alert( $('.plist a').last().text());
			currentPage = parseInt($('.plist a').last().text().trim()) + 1;
			listPageServer(currentPage);
		})
		// 페이지번호 이벤트
		$(document).on('click', '.plist a', function() {
			//alert( $(this).text());
			currentPage = $(this).text().trim();
			listPageServer(currentPage);
		})
		//제목에 대한 이벤트
		$(document).on('click', '.title', function() {
			name = $(this).attr('name')
			num = $(this).attr('idx')
			
			if(name=="title"){
				location.href = "/DTkkiri/showPost.do?postNum=" + num;
		    }
		})
	})
</script>
</head>
<body>
	<%
		String code=request.getParameter("post_bcode");
	%>
	<div class="box"></div>
	<br>
	<br>
	<div id="pagelist"></div>
	<div class="container">
			<button type="button" id="writeBtn" class="btn btn-primary" style="float:right;margin:auto auto 50px 0" onclick="location.href='<%=request.getContextPath() %>/post/writePost.jsp'">글쓰기</button>	
		<input type="hidden" id="code" value="<%=code %>">
	</div>
</body>
</html>