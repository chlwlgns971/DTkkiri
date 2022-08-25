<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>아이디 / 비밀번호 찾기</title>
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
  <script src="https://cdn.jsdelivr.net/npm/jquery@3.6.0/dist/jquerys.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
  
	<script>
	$(function(){
			
		
		//---- 이메일 인증번호 보내기 ----------------------------------
		mailsubmitNum = 0;
		
		$('#findPass').on('click', function(){
			
			
				$.ajax({
					url : '/DTkkiri/mailConfirm_Pass.do',
					data : { "email" : $('#umail').val() },
					type : 'get',
					success : function(res){
						
						$.each(res, function(i,v){
							result = v.flag ;	
							keyNum = v.key;
							
							// 형제값으로 해서 가져오기
							})
							
						alert(result);
						console.log(keyNum);
						mailsubmitNum = 1;
						
						
					}, 
					error : function(xhr){
						alert("상태 : " + xhr.status)
					},
					dataType : 'json'
				})
				
		})
		
			//---이메일 인증 번호 확인----------------------
		
		$(document).on('click', '#mailconfirm2', function(){
			num = $('#umailconfirm').val();
			
			if(keyNum==num){
				alert('인증완료');
				
				
			}else{
				alert('인증실패');
				$('#umailconfirm').val("");
				return;
			}
		})
		
		//------------이메일인증 검증----------------------
		$('form').on('submit', function(){
	
		
		// event.preventDefault();
		
		
		//이메일 인증번호 재확인 ------------------------------
		if(keyNum!=$('#umailconfirm').val()){
			console.log("이메일 인증번호 재확인[submit] : " + keyNum!=$('#umailconfirm').val());
		 	alert('이메일 인증번호가 일치하지 않습니다.');
			return false;
		}
		
		})
		
		
		
	})
	
	
	</script>
	
	
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
	
	
</head>
<body>
	<div class="container" style="font-size: 20px;" >
	<br>
		<img src="../images/아이디찾기.png" class="pngresize">
		<form action="/DTkkiri/findId.do" method = "post">
				<br>
			<div class="form-group">
				<label for="name">이름</label>
				<input type="text" class="form-control" id="uname" placeholder="Enter User Name" name="name">
			</div>
			
			<div class="form-group">
				<label for="email">이메일</label>
				<input type="text" class="form-control" id="mail" placeholder="Enter User Email" name="email">
			</div>
			
			<input type="submit" class="btn btn-primary" value="아이디찾기">
			<button type="button" class="btn btn-primary" onclick="location.href='/DTkkiri/loginPage/loginPage.jsp' ">돌아가기</button>
			
		</form>
			<br>
			<br>
			<br>

	
		<img src="../images/비밀번호찾기.png" class="pngresize">
		<form action="/DTkkiri/findPassword.do" method = "post">
		
				<br>
			<div class="form-group">
				<label for="userId">아이디</label>
				<input type="text" class="form-control" id="userId" placeholder="Enter User ID" name="name">
			</div>
			
			<div class="form-group">
				<label for="email">이메일</label>
				<input type="text" class="form-control" id="umail" placeholder="Enter User Email" name="email">
				<input type="button" value="전송" id="findPass" class="btn btn-primary" >
				<br>
				<br>
				<label>인증번호 입력</label>
				<input type="text" class="form-control" id="umailconfirm" placeholder="인증번호 입력" name="mem_mail2" required>
				<input type="button" value="인증" id="mailconfirm2" class="btn btn-primary">
				<br>
				<br>
				<input type="submit" value="비밀번호찾기" class="btn btn-primary">
				<button type="button" class="btn btn-primary" 
						onclick="location.href='/DTkkiri/loginPage/loginPage.jsp' ">돌아가기</button>
			</div>
		</form>
	</div>

</body>
</html>