<%@page import="kr.or.ddit.dtkkiri.vo.MemberVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>DT끼리</title>
<link href="https://fonts.googleapis.com/css?family=Roboto" rel="stylesheet">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script> 
<style>
	 body {
        height: 100vh;
        width: 100vw; 
        background-image: url('../images/지훈컨펌.jpg');
        background-repeat : no-repeat;
        background-size : cover;
        font-family: 'Roboto', sans-serif;
        background-color: #FEEBB6;
        
      } 
	.form-control {
        font-size: 16px;
		background: #f2f2f2;
		box-shadow: none !important;
		border-color: transparent;
	} 
	.form-control:focus {
		border-color: #d3d3d3;
	}
    .form-control, .btn {        
        border-radius: 2px;
    }
	.login-form {
		float: right;
		width: 380px;
		margin-top: 9%;
		margin-right: 10%;
		
	}
	.login-form h2 {		
        margin: 0;
		padding: 30px 0;
        font-size: 34px;
    }
	.login-form .avatar {
		background-image: url('../images/로그인.png');
        background-repeat : no-repeat;
        background-size : cover;
		margin-left:13% ;
		margin-bottom: 5%;
		width: 250px;
		height: 80px;
		z-index: 9;
		padding: 15px;
	}
 	.login-form .avatar img {
		width: 100%;
	} 
    .login-form form {
		color: #7a7a7a;
		border-radius: 10px;
    	margin-bottom: 15px;
        background: #fff;
        box-shadow: 0px 2px 2px rgba(0, 0, 0, 0.3);
        padding: 30px;		
      
    }	
    .login-form .btn {
        font-weight: bold;
		background: #ffcd4a;
		border: none;
		margin-bottom: 20px;
    }
	.login-form .btn:hover, .login-form .btn:focus {
		background: #fd6f22;
        outline: none !important;
	}
	.login-form a {
		color: #fd6f22;
	}	
	.login-form form a {
		color: #fd6f22;
	}
	.login-form a:hover, .login-form form a:hover {
		text-decoration: underline;
	}
	.hint-text {
		color: #999;
		text-align: center;
	}
	.form-footer {
    	padding-bottom: 15px;
		text-align: center;
    }  
   
</style>
</head>
		
<body> 
		<%
			MemberVO memVo = (MemberVO)request.getAttribute("loginMember");
			
		%>
		<%
			if(memVo==null|| memVo.getMem_dus().equals("Y")){ //로그인이 안되었을 때...			  
		%>
		
	<div class="login-form">
		<h2 class="text-center"></h2>
	    <form action="<%=request.getContextPath() %>/sessionLogin.do" method="post">
			<div class="avatar">
				<img src="" >
			</div>           
	        <div class="form-group">
	        	<input type="text" id="userId" class="form-control input-lg" name="username" placeholder="Id" required="required">
	        </div>
			<div class="form-group">
	            <input type="password" id="password" class="form-control input-lg" name="password" placeholder="Password" required="required">
	        </div>        
	        <div class="form-group">
	            <button type="submit" class="btn btn-primary btn-lg btn-block login-btn">Sign in</button>
	        </div>
	        
	        <!-- 모달 부트스트랩 -->
		    <p class="hint-text"><a href="#" data-remote="../regist/regist.jsp" 
					data-toggle="modal" data-target="#myModal" >Create an account </a></p>
				
				<!-- The Modal -->
	 			<div class="modal" id="myModal">
				  <div class="modal-dialog">
				    <div class="modal-content">
				
				      Modal Header
				     <div class="modal-header">
				        <h4 class="modal-title">Modal Heading</h4>
				        <button type="button" class="close" data-dismiss="modal">&times;</button>
				      </div>
				
				      Modal body
				      <div class="modal-body">
				        Modal body..
				      </div>
				
				      Modal footer
				      <div class="modal-footer">
				        <button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
				      </div> 
				
				    </div>
				  </div>
				</div> 
			
		    <!-- 모달 부트스트랩 끝-->
			
			
			<!-- 모달 부트스트랩  -->
	 		<p class="hint-text"><a href="#" data-remote="../findPage/find.jsp" 
				data-toggle="modal" data-target="#myModal">Forgot Your Id/Password? </a></p>
			
				<div class="modal" id="myModal">
				  <div class="modal-dialog">
				    <div class="modal-content">
				
				      Modal Header
    				  <div class="modal-header">
				        <h4 class="modal-title">Modal Heading</h4>
				        <button type="button" class="close" data-dismiss="modal">&times;</button>
				      </div>
				
				      Modal body
				      <div class="modal-body">
				        Modal body..
				      </div>
				
				      Modal footer
				      <div class="modal-footer">
				        <button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
				      </div> 
				
				    </div>
				  </div>
				</div>
			 
		    <!-- 모달 부트스트랩 끝-->
	     </form>     
	</div>
		<%
			}else{ //로그인 성공했을 때

				response.sendRedirect("main/main.jsp"); 
	
			}
		%>
		
		
		<!-- Call register.jsp Script -->
<script>
//모달 회원가입/ 비번찾기 jsp 이동
		$('#theModal').on('show.bs.modal', function(e) {
	
			var button = $(e.relatedTarget);
			var modal = $(this);
			
			modal.find('.modal-body').load(button.data("remote"));
	
		});

</script>


		

</body>
</html>