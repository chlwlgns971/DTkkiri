<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="kr.or.ddit.dtkkiri.vo.MemberVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원정보수정</title>
	<link href="https://fonts.googleapis.com/css?family=Roboto" rel="stylesheet">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script> 
  
	<%
	MemberVO m = (MemberVO)session.getAttribute("member");
	
	String userId = m.getMem_id();//업데이트 할 기준
	
	String pass = m.getMem_pass();
	String name = m.getMem_name();
	String email = m.getMem_mail();
	String ubir = m.getMem_bir();
	
	
	SimpleDateFormat format = new SimpleDateFormat("yyyy-mm-dd");
	
	//String값에서 date 형식으로 변환해주기
	Date date = format.parse(ubir);
	
	//date로 받아온 값을 String 출력을 위해 변환
	ubir = format.format(date);
	
	%>
	
	
	
	<script>
	$(function(){
		
		$('#passChange').on('click', function(){
			$('#pwd').show();
			$('#pwd2').show();
			$('#pwdn').show();
			$('#pwdn2').show();
		})
		//----비밀번호 (데이터 유효성 검사)-----------------
			$('#pwd').on('keyup', function(){
				pwdvalue = $(this).val().trim();
				
				pwdreg = /^(?=.*[A-Za-z])(?=.*\d)(?=.*[@$!%*#?&])[A-Za-z\d@$!%*#?&]{8,20}$/
				
				if(pwdreg.test(pwdvalue)){
					$(this).css('border', '3px solid green');
				}else{
					$(this).css('border', '3px solid red');
					return;
				}
				
			})
			
			// ----비밀번호 재확인 ---------------------------
			$('#pwd2').on('keyup', function (){
				var pwdvalue = $('#pwd').val();
				var pwdvalue2 = $('#pwd2').val();
				
				//pwdvalue2 = $(this).val().trim();
				
				if (pwdvalue != pwdvalue2 ){
					$('#pwd2').css('border', '3px solid red');
				}else{
					$('#pwd2').css('border', '3px solid green');
					
					return;
				}
			})
			
			
		//--이메일(데이터 유효성)----
		$('#mail2').on('keyup', function(){
			mailvalue = $(this).val().trim();
			mailreg = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/
				
			// test() - [정규식 검사] 맞으면 true, 틀리면 false를 반환한다.
			if(mailreg.test(mailvalue)){
				$(this).css('border', '3px solid green');
			}else{
				$(this).css('border', '3px solid red');
				return;
			}
		})
		
		// ----- 메일 중복 검사 --------------------
	
		mailcheckNum = 0;
		
		$('#mailcheck').on('click', function(){
			
			mailvalue = $('#mail2').val().trim();
			
			if(mailvalue.length < 1){
				alert("이메일주소를 입력하세요");
				return false; // 밑으로 내려가지 못하도록 false 해주기
			}
			
			console.log(mailvalue);
			$.ajax({
				url : '/DTkkiri/mailCheck.do',
				type : 'get',
				data : { "mail2" : mailvalue },
				success : function(res){
	
					if(res.num == 1){
						$('#mailspan').text(res.flag).css('color', 'red');
						mailcheckNum = 0;
						$('#mail2').val("");
						
						return;
					}else{
						$('#mailspan').text(res.flag).css('color', 'blue');
						mailcheckNum = 1;
					}
				},
				error : function(xhr){
					alert("상태 : " + xhr.status);
				},
				dataType : 'json'
			})
		
			// 블랙리스트 조회 ----------------------------
			$.ajax({
				url : '/DTkkiri/selectBlacklist.do',
				data : {"email" : $('#mail').val().trim()},
				type : 'post',
				success : function(res){
					BlackCode =res.num;
				},
				error : function(xhr){
					alert("상태 : " + xhr.status);
				},
				dataType : 'json'
			})
		
		})
		
		//---- 메일 변경 하기 클릭 했을 때-------
		$('#mailchange').on('click', function(){
			$('#mail2').show();
			$('#mailcheck').show();
			
			})
		$('#mailcheck').on('click', function(){
			$('#mailconfirm').show();
		})
		
		//---- 이메일 인증번호 보내기 ----------------------------------
		mailsubmitNum = 0;
		
		$('#mailconfirm').on('click', function(){
		//$(document).on('click', 'tr', function(){
			$('#umailconfirm').show();
			$('#mailconfirm2').show();
			
			
				$.ajax({
					url : '/DTkkiri/mailConfirm.do',
					data : { "email" : $('#mail2').val() },
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
		
		//---이메일 인증 재확인--------------------------
	
		$('form').on('submit', function(e){
		
			
			e.preventDefault();
			
			if($('#mail').val().trim() != "<%= email %>" ){
			
			
				//이메일 인증번호 재확인 ------------------------------
				if(keyNum!=$('#umailconfirm').val()){
					console.log("이메일 인증번호 재확인[submit] : " + keyNum!=$('#umailconfirm').val());
				 	alert('이메일 인증번호가 일치하지 않습니다.');
					return false;
				}	
				
				// -----이메일 유효성 재검사------------------
				
				mailreg = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/
				
				if(!mailreg.test($('#mail2').val().trim())){
					alert('이메일을 올바른 형식으로 작성해주시길 바랍니다.');
					return false;
				}
				
				
				// ----- 메일 중복 검사 --------------------
				
				if(mailcheckNum == 0){
					alert('이메일 중복확인이 필요합니다.');
					return false;
				}
				//--------블랙리스트 재검사
				if(BlackCode !=0){
					alert("블랙리스트에 해당되기 때문에 재가입이 불가능합니다.");
					return false;
				}
				
			}
			
			//----기존 비밀번호 확인 ----------------------------------
			if($('#pass').val() != "<%=pass%>" ){
				console.log($('#pass').val() != "<%=pass%>");
				alert('기존 비밀번호가 일치하지 않습니다.');
			
				return false;
			}
				
			//--비밀번호 유효성 검사 재검사-------------------------------
			if($('#pwd').val().trim() != null ){
				console.log($('#pwd').val().trim() != null );
				
				pwdreg = /^(?=.*[A-Za-z])(?=.*\d)(?=.*[@$!%*#?&])[A-Za-z\d@$!%*#?&]{8,20}$/
				
				if(!pwdreg.test($('#pwd').val().trim())){
					console.log(pwdreg.test($('#pwd').val().trim()));
					alert('특수문자, 영문자, 숫자를 포함한 최소 8자리 이상의 비밀번호가 필요합니다.');
					return false;
				}
				
				// ----비밀번호 재확인 재검사---------------------------
				var pwdvalue = $('#pwd').val();
				var pwdvalue2 = $('#pwd2').val();
				
				
				if (pwdvalue != pwdvalue2 ){
					$('#pwd2').css('border', '3px solid red');
					return false;
					
				}
				
				
			}
			
			
			
			// json 객체 (SUBMIT) ----------------------------------------
			 datas = {

						"name" : $('#name').val(),
						"mail" : $('#mail').val(),
						"mail2" : $('#mail2').val(),
						"bir" : $('#barth').val(),
						"pwd" : $('#pwd').val(),
						"pass" : $('#pass').val()
			} 
			 console.log(datas);
				
				
			 $.ajax({
					url : '/DTkkiri/changeName.do',
					data : datas,
					type : 'post', // 비밀번호도 다 들어있으니까
					success : function(res){
						alert(res.flag);
						location.href = '../loginPage/loginPage.jsp'
					},
					error : function(xhr){
						alert("상태 : " + xhr.status);
					},
					dataType : 'json'
				})
			
				
				
			})
			
				// submit 종료
			
		
		
	})
	
	
	</script>
	
	
	<style type="text/css">
		
		.pngresize{
			width: auto; height: auto;
    		max-width: 200px;
    		max-height: 200px;
    		display: block;
			margin-left : auto;
			margin-right : auto;
		}	
		
		body{
			background-color: white;
		}
		
 		#umailconfirm, #mailconfirm2,  #mailcheck, #mailconfirm, #mail2{
			display : none;
		 } 
		 
		 
		#pwd, #pwd2, #pwdn, #pwdn2, #pass{
			display : none;
		}
		form {
			border : 4px solid #ffc107;
			padding : 13px;
		}
		.btn-warning{
			background : #ffc107;
			color : black;
		}
		.btnSet{
			text-align : center;
		}
		@font-face {
		    font-family: 'yg-jalnan';
		    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_four@1.2/JalnanOTF00.woff') format('woff');
		    font-weight: normal;
		    font-style: normal;
		}
		.btn-warning{
			margin-top : 3px;
			margin-bottom : 3px;
		}
	</style>

	
</head>
<body>
	<div class="container">
	<br>
		<img src="../images/회원정보변경.png" class="pngresize">
		<br><br>
		<form action="/DTkkiri/changeName.do" method = "post">
		
			<!-- 이름변경 -->
			<div class="form-group">
				<label for="name" style="font-family: yg-jalnan">이름</label> &nbsp;
				<input type="text" class="form-control" id="name" 
						placeholder="기존 이름" name="newName" value="<%=name %>">
			</div>
			<br>
			
			<!-- 이메일변경 -->
			<div class="form-group">
				<label for="email" style="font-family: yg-jalnan">이메일</label>
				<input type="text" class="form-control" id="mail" placeholder="기존 이메일" name="old_Mail" value="<%=email %>">
		        <input type="button" value="이메일 변경하기" id="mailchange" class="btn btn-warning" style="font-family: yg-jalnan">
		        <br><br>
				<input type="text" class="form-control" id="mail2" placeholder="변경할 이메일" name="mem_mail2" >
		        <input type="button" value="중복 확인" id="mailcheck" class="btn btn-warning" style="font-family: yg-jalnan">
		      	<input type="button" value="메일 인증" id="mailconfirm" class="btn btn-warning" style="font-family: yg-jalnan">
		      	<input type="text" class="form-control" id="umailconfirm" placeholder="인증번호 입력" name="mem_mail2_check" >
		      	<input type="button" value="확인" id="mailconfirm2" class="btn btn-warning" style="font-family: yg-jalnan">
		      	<span id="mailspan"></span>
			</div>
			<br>
			
			<!-- 비밀번호변경 -->
			<div class="form-group">
				<label for="pass" style="font-family: yg-jalnan">비밀번호</label>
				<br>
		        <input type="button" value="비밀번호 변경하기" id="passChange" class="btn btn-warning" style="font-family: yg-jalnan">
			      <input type="password" class="form-control" id="pass" placeholder="기존 비밀번호" name="mem_pass" value="<%=pass%>">
				<br><br>
				<div class="form-group">
			      <label for="pwd" id="pwdn">비밀번호 변경</label>
			      <input type="password" class="form-control" id="pwd" placeholder="변경할 비밀번호를 입력하세요 (영문자, 숫자,특수문자 포함 최소 8자리 이상)" name="mem_pass2" value="<%=pass%>">
			    </div>
			    <div class="form-group">
			      <label for="pwd2" id="pwdn2">비밀번호 재확인 </label>
			      <input type="password" class="form-control" id="pwd2" placeholder="변경한 비밀번호를 다시 입력하세요" name="mem_pass2_check" value="<%=pass%>">
			    </div>
			</div>
			<br>
			
			
			<!-- 생년월일변경 -->
			<div class="form-group">
				<label for="ubir" style="font-family: yg-jalnan">생일</label>
				<input type="date" class="form-control" id="barth" placeholder="Enter New User Barthday" name="mem_bir" value="<%=ubir %>">
			</div>
			<br><br>
			<div class="btnSet">
			<input type="submit" class="btn btn-warning" value="수정하기" style="font-family: yg-jalnan">&nbsp;&nbsp;
			<input type="button" class="btn btn-warning" value="탈퇴하기" style="font-family: yg-jalnan">&nbsp;&nbsp;
			<button type="button" class="btn btn-warning" onclick="location.href='/DTkkiri/main/main.jsp' " style="font-family: yg-jalnan">돌아가기</button>
			</div>
		</form>
			
			
	</div>

</body>
</html>