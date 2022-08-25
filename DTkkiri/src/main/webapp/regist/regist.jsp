<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
  <script src="https://cdn.jsdelivr.net/npm/jquery@3.6.0/dist/jquery.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>

<script>
$(function(){
	
	// ----아이디 (데이터 유효성 검사)-----------------
	 $('#uid').on('keyup', function(){
		idvalue = $(this).val().trim();
		
		idreg = /^[a-z][a-zA-Z0-9]{3,20}$/ 
		
		// test() - [정규식 검사] 맞으면 true, 틀리면 false를 반환한다.
		if(idreg.test(idvalue)){
			$(this).css('border', '3px solid green');
		}else{
			$(this).css('border', '3px solid red');
			return;
		}
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
	
	// -----이메일 (데이터 유효성 검사)------------------
	$('#umail').on('keyup', function(){
		mailvalue = $(this).val().trim();
		
		mailreg = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/
		
		if(mailreg.test(mailvalue)){
				$(this).css('border', '3px solid green');// 맞으면 테두리가 녹색으로
		}else{
				$(this).css('border', '3px solid red');// 틀리면 테두리가 붉은색으로
				return;
		}
	})
	

	// ------ 아이디 중복 검사 --------------------------
		idcheckNum = 0;
	
	$('#idcheck').on('click', function(){
		
		idvalue = $('#uid').val().trim();
		
		if(idvalue.length < 1){
			alert("id를 입력하세요");
			return false; // 밑으로 내려가지 못하도록 false 해주기
		}
		
		console.log(idvalue);
		$.ajax({
			url : '/DTkkiri/idCheck.do',
			type : 'get',
			data : { "id" : idvalue },
			success : function(res){

				if(res.num == 1){
					$('#idspan').text(res.flag).css('color', 'red');
					$('#uid').val("");
					idcheckNum = 0;
					return;
				}else{
					$('#idspan').text(res.flag).css('color', 'blue');
					idcheckNum = 1;
				}
			},
			error : function(xhr){
				alert("상태 : " + xhr.status);
			},
			dataType : 'json'
		})
	})

	// ----- 메일 중복 검사 --------------------
	
	mailcheckNum = 0;
	
	$('#mailcheck').on('click', function(){
		
		mailvalue = $('#umail').val().trim();
		
		if(mailvalue.length < 1){
			alert("이메일주소를 입력하세요");
			return false; // 밑으로 내려가지 못하도록 false 해주기
		}
		
		console.log(mailvalue);
		$.ajax({
			url : '/DTkkiri/mailCheck.do',
			type : 'get',
			data : { "mail" : mailvalue },
			success : function(res){

				if(res.num == 1){
					$('#mailspan').text(res.flag).css('color', 'red');
					mailcheckNum = 0;
					$('#umail').val("");
					
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
			data : {"email" : $('#umail').val().trim()},
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
	
	//---- 이메일 인증번호 보내기 ----------------------------------
	mailsubmitNum = 0;
	
	$('#mailconfirm').on('click', function(){
	//$(document).on('click', 'tr', function(){
		$('#umailconfirm').show();
		$('#mailconfirm2').show();
		
		
			$.ajax({
				url : '/DTkkiri/mailConfirm.do',
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
	
	//------------------------------------------------------
	// ★ 회원가입 진행 -------------------------------------------
	
	$('form').on('submit', function(e){
	
		
		e.preventDefault();
		
		// 담임선생님과 호실번호 매칭 ------------------------------
		switch($('#uroomnum').val()){
		
		case '304':
			if($('#uteacher').val() == '송찬중'){ // 8월 수료반 (8월 수료 끝나면 수정 작업 필요)
				console.log('선생님 이름 일치');
			}else{
				console.log('선생님 이름 불일치');
				alert("호실 번호와 선생님 성함이 일치하지 않습니다. 다시 확인해주시길 바랍니다.");
				return false;
				
			}
			break;
		case '305':
			if($('#uteacher').val() == '송중호'){ // 내년 3월 수료반
				console.log('선생님 이름 일치');
			}else{
				console.log('선생님 이름 불일치');
				alert("호실 번호와 선생님 성함이 일치하지 않습니다. 다시 확인해주시길 바랍니다.");
				return false;
				
			}
			break;
		case '306':
			if($('#uteacher').val() == '이성엽'){ // 9월 수료반
				console.log('선생님 이름 일치');
			}else{
				console.log('선생님 이름 불일치');
				alert("호실 번호와 선생님 성함이 일치하지 않습니다. 다시 확인해주시길 바랍니다.");
				return false;
				
			}
			break;
		case '401':
			if($('#uteacher').val() == '김형민'){ // 11월 수료반
				console.log('선생님 이름 일치');
			}else{
				console.log('선생님 이름 불일치');
				alert("호실 번호와 선생님 성함이 일치하지 않습니다. 다시 확인해주시길 바랍니다.");
				return false;
				
			}
			break;
		case 402:
			if($('#uteacher').val() == '하재관'){ // 내년 1월 수료반
				console.log('선생님 이름 일치');
			}else{
				console.log('선생님 이름 불일치');
				alert("호실 번호와 선생님 성함이 일치하지 않습니다. 다시 확인해주시길 바랍니다.");
				return false;
				
			}
			break;
		case '403':
			if($('#uteacher').val() == '배미숙'){ // 12월 수료!
				console.log('선생님 이름 일치');
			}else{
				console.log('선생님 이름 불일치');
				alert("호실 번호와 선생님 성함이 일치하지 않습니다. 다시 확인해주시길 바랍니다.");
				return false;
				
			}
			break;
		case '404':
			if($('#uteacher').val() == '이철희'){ // 내년 2월 수료반
				console.log('선생님 이름 일치');
			}else{
				console.log('선생님 이름 불일치');
				alert("호실 번호와 선생님 성함이 일치하지 않습니다. 다시 확인해주시길 바랍니다.");
				return false;
				
			}
			break;
		case '405':
			if($('#uteacher').val() == '최희연'){ // 현재 공석 
				console.log('선생님 이름 일치');
			}else{
				console.log('선생님 이름 불일치');
				alert("호실 번호와 선생님 성함이 일치하지 않습니다. 다시 확인해주시길 바랍니다.");
				return false;
				
			}
			break;
		case '406':
			if($('#uteacher').val() == '박성룡'){ // 10월 수료반
				console.log('선생님 이름 일치');
			}else{
				console.log('선생님 이름 불일치');
				alert("호실 번호와 선생님 성함이 일치하지 않습니다. 다시 확인해주시길 바랍니다.");
				return false;
				
			}
			break;
		default:
			return false;
		
		}
		
		//이메일 인증번호 재확인 ------------------------------
		if(keyNum!=$('#umailconfirm').val()){
			console.log("이메일 인증번호 재확인[submit] : " + keyNum!=$('#umailconfirm').val());
		 	alert('이메일 인증번호가 일치하지 않습니다.');
			return false;
		}
		
		
		//아이디 유효성 재검사 ------------------------------
		
		
		idreg = /^[a-z][a-zA-Z0-9]{3,20}$/ 
		
		
		if(!idreg.test($('#uid').val().trim())){
			return false;
		}
		
		
		
		//--비밀번호 유효성 검사 재검사-------------------------------
		
		
		pwdreg = /^(?=.*[A-Za-z])(?=.*\d)(?=.*[@$!%*#?&])[A-Za-z\d@$!%*#?&]{8,20}$/
		
		if(!pwdreg.test($('#pwd').val().trim())){
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
	
	// -----이메일 유효성 재검사------------------
		
		mailreg = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/
		
		if(!mailreg.test($('#umail').val().trim())){
			alert('이메일을 올바른 형식으로 작성해주시길 바랍니다.');
			return false;
		}
	

	// ------ 아이디 중복 검사 --------------------------

	if(idcheckNum == 0){
		alert('아이디 중복확인이 필요합니다.');
		return false;
	}

	//---------------------------------------
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
	
	
		
	// json 객체 (SUBMIT) ----------------------------------------
	 datas = {
				"id" : $('#uid').val(),
				"name" : $('#uname').val(),
				"pwd" : $('#pwd').val(),
				"mail" : $('#umail').val(),
				"bir" : $('#ubir').val(),
				"roomNum" : $('#uroomnum').val(),
				"teacher" : $('#uteacher').val(),
				"gender" : $('input[type=radio][name=mem_gen]:checked').val()
	 } 
	 console.log(datas);
		
		
	 $.ajax({
			url : '/DTkkiri/insertRegistMem.do',
			data : datas,
			type : 'post', // 비밀번호도 다 들어있으니까
			success : function(res){
				alert(res.flag);
				window.location.reload();
				//document.forms['registFrom'].reset();
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
<style>
	#umailconfirm{
		display : none;
		margin : 2px;
		width : 150px;
	}
	#mailconfirm2{
		display : none;
	}

</style>
</head>
<body>

		<div class="container" style="font-size: 20px; ">			
		  <form  class="needs-validation" onsubmit="return false" name="registFrom"> <!-- was-validation -->
		    <div class="form-group">
		      <label for="uid">아이디 </label>
		      <input type="button" id="idcheck" value = "중복 검사" class="btn btn-warning" >
		      <input type="text" class="form-control" id="uid" placeholder="아이디를 입력하세요 (최소 3자리 ~ 최대 20자리)" name="mem_id" required>
		      <!--  required는 무조건 작성해야한다는 의미 .. name은 무조건 mem_id -->

		      <span id="idspan"></span>
		      
		      <div class="valid-feedback">Valid.</div>
		      <div class="invalid-feedback">Please fill out this field.</div>
		    </div>
		    
		    <div class="form-group">
		      <label for="uname">이름 </label>
		      <input type="text" class="form-control" id="uname" placeholder="이름을 입력하세요" name="mem_name" required>
		      <div class="valid-feedback">Valid.</div>
		      <div class="invalid-feedback">Please fill out this field.</div>
		    </div>
		    <div class="form-group">
		      <label for="pwd">비밀번호 </label>
		      <input type="password" class="form-control" id="pwd" placeholder="비밀번호를 입력하세요 (영문자, 숫자,특수문자 포함 최소 8자리 이상)" name="mem_pass" required>
		      <div class="valid-feedback">Valid.</div>
		      <div class="invalid-feedback">Please fill out this field.</div>
		    </div>
		    <div class="form-group">
		      <label for="pwd2">비밀번호 재확인 </label>
		      <input type="password" class="form-control" id="pwd2" placeholder="비밀번호를 다시 입력하세요" name="mem_pass2" required>
		      <div class="valid-feedback">Valid.</div>
		      <div class="invalid-feedback">Please fill out this field.</div>
		    </div>
		    <div class="form-group">
		      <label for="umail">이메일 </label>
		      <input type="button" value="중복 확인" id="mailcheck" class="btn btn-warning">
		      <input type="button" value="메일 인증" id="mailconfirm" class="btn btn-warning">
		      <input type="text" class="form-control" id="umail" placeholder="이메일을 입력하세요" name="mem_mail" required>
		      <input type="text" class="form-control" id="umailconfirm" placeholder="인증번호 입력" name="mem_mail2" required>
		      <input type="button" value="확인" id="mailconfirm2" class="btn btn-warning">
		      <span id="mailspan"></span>
		      <div class="valid-feedback">Valid.</div>
		      <div class="invalid-feedback">Please fill out this field.</div>
		    </div>
		    <div class="form-group">
		      <label for="ubir">생년월일 </label>
		      <input type="date" class="form-control" id="ubir" name="mem_bir" required>
		      <div class="valid-feedback">Valid.</div>
		      <div class="invalid-feedback">Please fill out this field.</div>
		    </div>
		    <div class="form-group">
		      <label for="ugen">성별 </label>
		      남 <input type="radio" class="ugen" name="mem_gen" value="M" checked>
		      여 <input type="radio" class="ugen" name="mem_gen" value="F">
		      <div class="valid-feedback">Valid.</div>
		      <div class="invalid-feedback">Please fill out this field.</div>
		    </div>
		 	<div class="form-group">
		      <label for="uroomnum">호실 번호</label>
		      <input type="text" class="form-control" id="uroomnum" placeholder="호실 번호를 입력하세요" name="mem_room" required>
		      <div class="valid-feedback">Valid.</div>
		      <div class="invalid-feedback">Please fill out this field.</div>
		    </div>
		    <div class="form-group">
		      <label for="uteacher">담임선생님 성함</label>
		      <input type="text" class="form-control" id="uteacher" placeholder="담임 선생님 성함을 입력하세요 (선생님 호칭 제외)" name="mem_tname" required>
		      <div class="valid-feedback">Valid.</div>
		      <div class="invalid-feedback">Please fill out this field.</div>
		    </div>

		    <button type="submit" class="btn btn-warning">Submit</button>
		    <button type="button" class="btn btn-warning" onclick="location.href='/DTkkiri/loginPage/loginPage.jsp' ">돌아가기</button>
		    <span id="joinsub"></span>
		  </form>
		</div>
		
  <!-- The Modal -->
  <div class="modal fade" id="myModal">
    <div class="modal-dialog modal-lg">
      <div class="modal-content">
      
        <!-- Modal Header -->
        <div class="modal-header">
          <h4 class="modal-title">주소 검색하기</h4>
          <button type="button" class="close" data-dismiss="modal">&times;</button>
        </div>
        
        <!-- Modal body -->
        <div class="modal-body">
          	<div class="box">
				<h3>동 입력</h3>
				<input type="text" id="dong">
				<input type="button" value="확인" id="bdong" >
				<div id="result1"></div>	
			</div>
        </div>
        
        <!-- Modal footer -->
        <div class="modal-footer">
          <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
        </div>
        
      </div>
    </div>
  </div>

</body>
</html>