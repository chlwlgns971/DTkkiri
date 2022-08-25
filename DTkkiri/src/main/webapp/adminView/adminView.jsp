<%@page import="kr.or.ddit.dtkkiri.vo.MemberVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
    <meta name="description" content="" />
    <meta name="author" content="" />
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
	<link rel="https://maxcdn.bootstrapcdn.com/font-awesome/4.6.3/css/font-awesome.min.css">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
    <title>관리자 페이지</title>
    <link href="/DTkkiri/css/styles.css" rel="stylesheet" />
    <link href="/DTkkiri/css/adminView.css" rel="stylesheet"/>
<style type="text/css">
.id{
    cursor: pointer;
}
@font-face {
    font-family: 'yg-jalnan';
    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_four@1.2/JalnanOTF00.woff') format('woff');
    font-weight: normal;
    font-style: normal;
}
        </style>
    <script src="https://use.fontawesome.com/releases/v6.1.0/js/all.js" crossorigin="anonymous"></script>
    <script src="../js/board.js"></script>
   
</head>
<body>

	<nav class="sb-topnav navbar navbar-expand bg-ddit"> <!-- navbar-dark bg-dark -->
	    <!-- Navbar Brand-->
	    <a href="<%=request.getContextPath() %>/main/main.jsp">
	    	<img id="logo" src="/DTkkiri/images/Ver3.1.png"  alt="DT끼리logo" >
	    </a>
	    <!-- class="navbar-brand ps-3" -->
	    <!-- Sidebar Toggle-->
	    <button class="btn btn-link btn-sm order-1 order-lg-0 me-4 me-lg-0" id="sidebarToggle" href="#!"><i class="fas fa-bars"></i></button>
        <!-- Navbar Search-->
        <form class="d-none d-md-inline-block form-inline ms-auto me-0 me-md-3 my-2 my-md-0">
	        <div class="input-group"></div>
	    </form>                     
	    <!-- 아바타카드 나오게하고 안에 버튼으로 마이페이지 이동할 수 있게 하기 -->
	   	    <ul class="navbar-nav ms-auto ms-md-0 me-3 me-lg-4">
	        <li class="nav-item dropdown">
	            <a class="nav-link dropdown-toggle" id="navbarDropdown" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false"><i class="fas fa-user fa-fw"></i></a>
	            <ul id="ulBox" class="dropdown-menu dropdown-menu-end" aria-labelledby="navbarDropdown" style="border-radius:20px;   background-color: rgba(255,255,255,1);"> 

						    <%  
						    	//로그인한 회원의 정보가져오기
						    	MemberVO memVo =(MemberVO)session.getAttribute("member"); 
  								//여자 + 학생
						        if(memVo.getMem_gen().equals("F") && memVo.getMem_pid().equals("STUDENT")){
						    %>		
								    <img src="<%=request.getContextPath() %>/images/femalIcon.png" alt="studentF" style="margin-bottom:50px;">
						    
						    <%  //남자 + 학생
						    	}else if(memVo.getMem_gen().equals("M") && memVo.getMem_pid().equals("STUDENT")){
						    %>		
						    		<img src="<%=request.getContextPath() %>/images/poorBackMan.png" alt="studentM" style="margin-bottom:50px;">
                            <%  //메인어드민
						    	}else if(memVo.getMem_pid().equals("MAINADMIN")){   
						    %>		
								    <img src="<%=request.getContextPath() %>/images/mainAdmin.png" alt="mainAdmin">
				            <%  //서브어드님 (현재 여자 반장으로만 설정!)
						    	}else if(memVo.getMem_pid().equals("SUBADMIN")){
						    %>
						    		<img src="<%=request.getContextPath() %>/images/guja.png" alt="SUBADMIN" >
						    <%		
						    	}
					    	     String id = memVo.getMem_id();
					    	     String name = memVo.getMem_name();
					    	     String fname = name.substring(1,3);
					    	     String email = memVo.getMem_mail();
					    	     String pid = memVo.getMem_pid();
					    	     int room = memVo.getMem_room();
					    	     String bir = memVo.getMem_bir();
					    	     String bday = bir.substring(5, 10);
				            %>
						           
						    <h5 class="card-title mainCardTitle" style="font-family: yg-jalnan; text-align:center" ><%= name  %></h5> 
						    <p class="card-text mainCardText"  id="<%= id%>" style="font-family: yg-jalnan" >  
						           
						           Id:      <%= id %>  
						           <br>
						           Email:    <%= email %>
						           <br>
						           Birthday:  <%= bday %>
						           <br>
						           My room:  <%= room %>
						           <br>
						           <%
						           if(pid.equals("STUDENT")){
						           %>
						              Position: 학생
						           <%
						           }else if(pid.equals("MAINADMIN")){
						           %>
						              Position: 메인관리자
						           <%	   
						           }else{
						           %>
						              Position: 서브관리자
						           <%   
						           }
						           %>
						           
							<script>
								$(function(){
									$('#out').on('click', function(){
										if (!confirm("회원탈퇴를 하시겠습니까?")) {
									        // 취소(아니오) 버튼 클릭 시 이벤트
									        return;
									    } else {
									        // 확인(예) 버튼 클릭 시 이벤트
									        $.ajax({
									        	url : '/DTkkiri/deleteMember.do',
									        	data : { "id" : '<%= id %>' },
									        	type : 'post',
									        	success : function(res){
									        		alert(res.flag);
									        		location.href='/DTkkiri/loginPage/loginPage.jsp';
									        	},
									        	error : function(xhr){
									        		alert("상태 : " + xhr.status);
									        	},
									        	dataType : 'json'
									        })
									    }
									})			
								})
							</script>
							
						    <br>
						    <br>
						    <a href="<%=request.getContextPath() %>/memberUpdate/memUpdate.jsp" class="btn btn-warning">내정보수정</a>
						    
						
						    <%
						    	if(pid.equals("STUDENT")){
						    %>
                            <a href="" class="btn btn-warning"  style="display: none;">회원관리</a>
                            <%
						    	}else if(pid.equals("MAINADMIN")){
                            %>
                            <a href="<%=request.getContextPath() %>/adminView/adminView.jsp" class="btn btn-warning" >회원관리</a>
                            <%
						    	}else if(pid.equals("SUBADMIN")){
                            %>
                            <a href="<%=request.getContextPath() %>/subAdminView.jsp" class="btn btn-warning" >회원관리</a>                            	
                            <%
						    	}
                            %>
						    <a href="<%=request.getContextPath() %>/sessionLogout.do" class="btn btn-warning">로그아웃</a>
						    <a href="#" class="btn btn-warning" id="out">회원탈퇴</a>
						    </p> 
					  	</div>
	            </ul>
	        </li>
	    </ul>
	</nav>
    <div id="layoutSidenav">	
        <div id="layoutSidenav_nav">
            <nav class="sb-sidenav accordion sb-sidenav-dark" id="sidenavAccordion">
                <div class="sb-sidenav-menu">
                    <div class="nav">
                        <div class="sb-sidenav-menu-heading">info</div>
                        <a class="nav-link" href="<%=request.getContextPath() %>/main/board.jsp?post_bcode=bab">
                            <div class="sb-nav-link-icon"><i class="fa-solid fa-bullhorn"></i></div>
                            공지사항
                        </a>
                        <a class="nav-link" href="<%=request.getContextPath() %>/main/board.jsp?post_bcode=bsg">
                            <div class="sb-nav-link-icon"><i class="fa-solid fa-head-side-cough"></i></div>
                            건의사항
                        </a>
                        <div class="sb-sidenav-menu-heading">게시판</div>
                        <a class="nav-link" href="<%=request.getContextPath() %>/main/board.jsp?post_bcode=bfb">
                            <div class="sb-nav-link-icon"><i class="fa-solid fa-cat"></i></div>
                            자유
                        </a>
                        <a class="nav-link collapsed" href="#" data-bs-toggle="collapse" data-bs-target="#collapseLayouts" aria-expanded="false" aria-controls="collapseLayouts">
                            <div class="sb-nav-link-icon"><i class="fa-solid fa-person-shelter"></i></div>
                            기수별
                            <div class="sb-sidenav-collapse-arrow"><i class="fas fa-angle-down"></i></div>
                        </a>
                        <div class="collapse" id="collapseLayouts" aria-labelledby="headingOne" data-bs-parent="#sidenavAccordion">
                            <nav class="sb-sidenav-menu-nested nav">
                                <a class="nav-link" href="<%=request.getContextPath() %>/main/board.jsp?post_bcode=304">304</a>
                                <a class="nav-link" href="<%=request.getContextPath() %>/main/board.jsp?post_bcode=305">305</a>
                                <a class="nav-link" href="<%=request.getContextPath() %>/main/board.jsp?post_bcode=306">306</a>
                                <a class="nav-link" href="<%=request.getContextPath() %>/main/board.jsp?post_bcode=401">401</a>
                                <a class="nav-link" href="<%=request.getContextPath() %>/main/board.jsp?post_bcode=402">402</a>
                                <a class="nav-link" href="<%=request.getContextPath() %>/main/board.jsp?post_bcode=403">403</a>
                                <a class="nav-link" href="<%=request.getContextPath() %>/main/board.jsp?post_bcode=404">404</a>
                                <a class="nav-link" href="<%=request.getContextPath() %>/main/board.jsp?post_bcode=405">405</a>
                                <a class="nav-link" href="<%=request.getContextPath() %>/main/board.jsp?post_bcode=406">406</a>
                            </nav>
                        </div>
                        <a class="nav-link" href="<%=request.getContextPath() %>/main/board.jsp?post_bcode=bqb">
                            <div class="sb-nav-link-icon"><i class="fas fa-book-open"></i></div>
                            질문
                        </a>
                        <a class="nav-link collapsed" href="#" data-bs-toggle="collapse" data-bs-target="#collapsePages" aria-expanded="false" aria-controls="collapsePages">
                            <div class="sb-nav-link-icon"><i class="fa-solid fa-hand-holding-heart"></i></div>
                            편의사항
                            <div class="sb-sidenav-collapse-arrow"><i class="fas fa-angle-down"></i></div>
                        </a>
                        <div class="collapse" id="collapsePages" aria-labelledby="headingTwo" data-bs-parent="#sidenavAccordion">
                            <nav class="sb-sidenav-menu-nested nav accordion" id="sidenavAccordionPages">
                            	<a class="nav-link" href="<%=request.getContextPath() %>/main/restaurantFrame.jsp">맛집</a>
                                <a class="nav-link" href="<%=request.getContextPath() %>/main/board.jsp?post_bcode=info">정보</a>
                                <a class="nav-link" href="<%=request.getContextPath() %>/main/board.jsp?post_bcode=lib">자료실</a>
                                <a class="nav-link" href="https://www.ddit.or.kr/attendance/write" target="_blank">출석부요청</a>
                                <a class="nav-link" href="https://www.ddit.or.kr/room" target="_blank">회의실예약</a>
                            </nav>
                        </div>
                    </div>
                </div>
                <div>
					<jsp:include page="../weather/weathermain.jsp" flush="true"/>
                </div> 
            </nav>
        </div>
        <div id="layoutSidenav_content">
            <main>
	          <div class="main">
	          	 	<script>
	    
	</script>
	<!-- 검색 -->
	<form class="container">
		<!-- 검색조건 -->
		<div class="container">
			<p class="">
				<h3 style="font-family:'yg-jalnan' !important;"><img src="../images/search.png">&nbsp;검색 조건</h3>
			</p>
			<label for="" class="sr-only"></label>
			<select class="form-control select2-multi" id="multi-select2" >
				<optgroup label="검색분류">
					<option value="mem_id">ID</option>
					<option value="mem_name">이름</option>
					<option value="mem_room">교실</option>
					<option value="mem_pid">권한</option>
					<option value="mem_dus">탈퇴여부</option>
				</optgroup>
			</select> 
			<input id='searchWord' class="form-control" type="search" placeholder="검색어를 입력하세요" >
		</div>
					


	
	<!-- 검색버튼 -->
	<div class="modal-footer">
		<button type="button" id="Search" class="btn btn-warning" >검색</button>
		<button type="reset" class="btn btn-warning">초기화</button>
	</div>
	</form>

	
<script>
$(function(){
		
	var code="brp";	
	//신고게시판
	reportPostList(1,code);
					
	// prev버튼 클릭 이벤트
	$(document).on('click', '.prev', function() {
		//	alert( $('.plist a').first().text());
		currentPage = parseInt($('.plist a').first().text().trim()) - 1;
		reportPostList(currentPage,code,option,keyword);

	})
	// next버튼 클릭 이벤트
	$(document).on('click', '.next', function() {
		//	 alert( $('.plist a').last().text());
		currentPage = parseInt($('.plist a').last().text().trim()) + 1;
		reportPostList(currentPage,code,option,keyword);
	})
	// 페이지번호 이벤트
	$(document).on('click', '.plist a', function() {
		currentPage = $(this).text().trim();
		reportPostList(currentPage,code,option,keyword);
	})
	//제목에 대한 이벤트
	$(document).on('click', '.title', function() {
		name = $(this).attr('name')
		num = $(this).attr('idx')
		
		if(name=="title"){
			location.href = "/DTkkiri/showPost.do?postNum=" + num;
	    }
	})
	//---------------- 회원 탈퇴처리 -----------------------------
	 $(document).on('click', '#out', function(){
		
		// 현재 클릭된 Row(<tr>)
	        var id = $(this).parents('tr').find('td:eq(0)').text();//$(this).parents('tr').find('td')[0];
	        var tr = $(this).parents('tr');
	        var war = $(this).parents('tr').find('td:eq(3)').text();
	        
			if (!confirm("해당 회원의 회원탈퇴를 진행할까요?")) {
			        // 취소(아니오) 버튼 클릭 시 이벤트
			        return;
			    } else {
			        // 확인(예) 버튼 클릭 시 이벤트
			        $.ajax({
			        	url : '/DTkkiri/deleteMember.do',
			        	data : { "id" : id },
			        	type : 'post',
			        	success : function(res){
			        		alert(res.flag);
			        		tr.remove();
			        	},
			        	error : function(xhr){
			        		alert("상태 : " + xhr.status);
			        	},
			        	dataType : 'json'
			        })
			    }
		})			

		//---------------- 회원 경고처리 (경고횟수 증가) -----------------------------
	 $(document).on('click', '#up', function(){
	    var id = $(this).parents('tr').find('td:eq(0)').text();
	    var email = $(this).parents('tr').find('td:eq(7)').text(); // 블랙리스트 추가시 사용할거
	    var tableWar = $(this).parents('tr').find('td:eq(3)')
	    
	    $.ajax({
	    	url : '/DTkkiri/plusWarning.do',
	    	data : {"id" : id, "email" : email},
	    	type : 'get',
	    	success : function(res){
		        tableWar.text(res.warNum);
		        //location.reload();
		        //$("#info2").load(location.href + " #info2");
		        
		        $.ajax({
					 url : '/DTkkiri/blacklistView.do',
					 type : 'post',
					 success : function(res){
								code = '<table class="table border table-hover bg-white">';
								code +='	<thead>';
								code +='		<tr role="row">';
								code +='				<!-- title head -->';
								code +='				<th>이메일</th>';
								code +='				<th>날짜</th>';
								code +='				<th>사유</th>';
								code +='			</tr>';
								code +='		</thead>';
								code +='		<tbody>';
	
						 
						 	$.each(res, function(i,v){
							 	code += "			<td>" + v.email +"</td>";
							 	code += "			<td>" + v.date + "</td>";
							 	code += "			<td>" + v.cont + "</td>";
								code +='			</tr>';
								code +='		</div>';
							 })
								code +='	</tbody>';
								code +='</table>';
						 
						// $('#info2').html(code);
						 $('#anw2').html(code);
						 
						 
					 },
					 error : function(xhr){
						 alert("상태 : " + xhr.status);
					 },
					 dataType : 'json'
					 
				 })
	    	},
	    	error : function(xhr){
	    		alert("상태 : " + xhr.status)	
	    	},
	    	dataType : 'json'
	    })
	    
	 })
	 	//---------------- 회원 경고처리 (경고횟수 감소) -----------------------------
	 $(document).on('click', '#down', function(){
		var id = $(this).parents('tr').find('td:eq(0)').text();
	    var email = $(this).parents('tr').find('td:eq(7)').text(); // 블랙리스트 제거시 사용할거
	    var tableWar = $(this).parents('tr').find('td:eq(3)')
	    
	    $.ajax({
	    	url : '/DTkkiri/minusWarning.do',
	    	data : {"id" : id, "email" : email},
	    	type : 'get',
	    	success : function(res){
		        tableWar.text(res.warNum);
		        //location.reload();
		        //$("#info2").load(location.href + " #info2");
		        
		        $.ajax({
					 url : '/DTkkiri/blacklistView.do',
					 type : 'post',
					 success : function(res){
						code+= '<table class="table border table-hover bg-white">';
						code +='	<thead>';
						code +='		<tr role="row">';
						code +='				<!-- title head -->';
						code +='				<th>이메일</th>';
						code +='				<th>날짜</th>';
						code +='				<th>사유</th>';
						code +='			</tr>';
						code +='		</thead>';
						code +='		<tbody>';
						
					 	$.each(res, function(i,v){
						 	code += "			<td>" + v.email +"</td>";
						 	code += "			<td>" + v.date + "</td>";
						 	code += "			<td>" + v.cont + "</td>";
							code +='			</tr>';
							code +='		</div>';
						 })
						code +='	</tbody>';
						code +='</table>';
						 
						// $('#info2').html(code);
						 $('#anw2').html(code);	 
					 },
					 error : function(xhr){
						 alert("상태 : " + xhr.status);
					 },
					 dataType : 'json'
					 
				 })
		        
	    	},
	    	error : function(xhr){
	    		alert("상태 : " + xhr.status)	
	    	},
	    	dataType : 'json'
	    })
	 })
		 
		//-------------- 회원 목록 출력 ---------------------------------------------	
	  $.ajax({
		 url : '/DTkkiri/adminView.do',
		 type : 'post',
		 success : function(res){
					code += '<table class="table border table-hover bg-white">';
					code +='	<thead>';
					code +='		<tr role="row">';
					code +='				<!-- title head -->';
					code +='				<th>ID</th>';
					code +='				<th>Name</th>';
					code +='				<th>성별</th>';
					code +='				<th>경고횟수</th>';
					code +='				<th>강의실</th>';
					code +='				<th>담임</th>';
					code +='				<th>생일</th>';
					code +='				<th>Email</th>';
					code +='				<th>권한</th>';
					code +='				<th></th>';
					code +='				<th>비밀번호</th>';
					code +='				<th>탈퇴여부</th>';
					code +='			</tr>';
					code +='		</thead>';
					code +='		<tbody>';

			 
			 	$.each(res, function(i,v){
				 	code += "		<tr><td>" + v.mId + "</td>";
				 	code += "			<td name='tableid'>" + v.mName + "</td>";
				 	code += "			<td>" + v.mGen + "</td>";
				 	code += "			<td>" + v.mWar + "</td>";
				 	code += "			<td>" + v.mRoom + "</td>";
				 	code += "			<td>" + v.mTName + " 선생님" +"</td>";
				 	code += "			<td>" + v.mBir + "</td>";
				 	code += "			<td>" + v.mMail + "</td>";
				 	code += "			<td>" + v.mPid + "</td>";
					code +='			<td>';
					code +='				<div class="dropdown show">';
					code +='					<button class="btn btn-sm dropdown-toggle more-vertical" type="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"';
					code +='						<span class="text-muted sr-only">Action</span>';
					code +='					</button>';
					code +='					<div class="dropdown-menu dropdown-menu-right">';
					code +='							<a class="dropdown-item" id="out" href="#" value="회원탈퇴">회원탈퇴</a>';
					code +='							<a class="dropdown-item" id="up" href="#"  value="경고증가">경고횟수 증가</a>';
					code +='							<a class="dropdown-item" id="down" href="#" value="경고감소">경고횟수 감소</a>';
					code +='						<td>' + v.mPass + '</td>';
					code +='						<td>' + v.mDus + '</td>';
					code +='					</div>';
					code +='				</div>';
					code +='			</td>';
					code +='			</tr>';
					code +='		</div>';
				 })
					code +='	</tbody>';
					code +='</table>';
			 
			// $('#info1').html(code);
			 $('#anw1').html(code);
			 
			 
			 
		 },
		 error : function(xhr){
			 alert("상태 : " + xhr.status);
		 },
		 dataType : 'json'
		 
	 })
	 
	 	// -----회원검색 --------------------------
	 $('#Search').on('click', function(){
		
		let keyword = $('#multi-select2').val();
		let word	= $('#searchWord').val();
		console.log(keyword + word);
		$.ajax({
			 url : '/DTkkiri/AdminSerch.do',
			 data : {"keyword" : keyword, "word" : word},
			 type : 'post',
			 success : function(res){
						code = '<table class="table border table-hover bg-white">';
						code +='	<thead>';
						code +='		<tr role="row">';
						code +='				<!-- title head -->';
						code +='				<th>ID</th>';
						code +='				<th>Name</th>';
						code +='				<th>성별</th>';
						code +='				<th>경고횟수</th>';
						code +='				<th>강의실</th>';
						code +='				<th>담임</th>';
						code +='				<th>생일</th>';
						code +='				<th>Email</th>';
						code +='				<th>권한</th>';
						code +='				<th></th>';
						code +='				<th>비밀번호</th>';
						code +='				<th>탈퇴여부</th>';
						code +='			</tr>';
						code +='		</thead>';
						code +='		<tbody>';

				 
				 	$.each(res, function(i,v){
					 	code += "		<tr><td>" + v.mId + "</td>";
					 	code += "			<td name='tableid'>" + v.mName + "</td>";
					 	code += "			<td>" + v.mGen + "</td>";
					 	code += "			<td>" + v.mWar + "</td>";
					 	code += "			<td>" + v.mRoom + "</td>";
					 	code += "			<td>" + v.mTName + " 선생님" +"</td>";
					 	code += "			<td>" + v.mBir + "</td>";
					 	code += "			<td>" + v.mMail + "</td>";
					 	code += "			<td>" + v.mPid + "</td>";
						code +='			<td>';
						code +='				<div class="dropdown show">';
						code +='					<button class="btn btn-sm dropdown-toggle more-vertical" type="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"';
						code +='						<span class="text-muted sr-only">Action</span>';
						code +='					</button>';
						code +='					<div class="dropdown-menu dropdown-menu-right">';
						code +='						<a class="dropdown-item" id="out" href="#" value="회원탈퇴">회원탈퇴</a>';
						code +='						<a class="dropdown-item" id="up" href="#"  value="경고증가">경고횟수 증가</a>';
						code +='						<a class="dropdown-item" id="down" href="#" value="경고감소">경고횟수 감소</a>';
						code +='						<td>' + v.mPass + '</td>';
						code +='						<td>' + v.mDus + '</td>';
						code +='					</div>';
						code +='				</div>';
						code +='			</td>';
						code +='			</tr>';
						code +='		</div>';
					 })
						code +='	</tbody>';
						code +='</table>';
				 
				 //$('#info1').html(code);
				 $('#anw1').html(code);
				 
				 
				 
			 },
			 error : function(xhr){
				 alert("상태 : " + xhr.status);
			 },
			 dataType : 'json'
			 
		 })
	})
	 
	//------ 블랙리스트 출력
	$.ajax({
		 url : '/DTkkiri/blacklistView.do',
		 type : 'post',
		 success : function(res){
			 		//code='<div class="container">';
					code = '<table class="table border table-hover bg-white">';
					code +='	<thead>';
					code +='		<tr role="row">';
					code +='				<!-- title head -->';
					code +='				<th>이메일</th>';
					code +='				<th>날짜</th>';
					code +='				<th>사유</th>';
					code +='			</tr>';
					code +='		</thead>';
					code +='		<tbody>';

			 
			 	$.each(res, function(i,v){
				 	code += "			<td>" + v.email +"</td>";
				 	code += "			<td>" + v.date + "</td>";
				 	code += "			<td>" + v.cont + "</td>";
					code +='			</tr>';
					code +='		</div>';
				 })
					code +='	</tbody>';
					code +='</table>';
					code +='</div>';
			 
			// $('#info2').html(code);
			 $('#anw2').html(code);
			 
			 
			 
		 },
		 error : function(xhr){
			 alert("상태 : " + xhr.status);
		 },
		 dataType : 'json'
		 
	 })
	
	 $(".que").click(function() {
		   $(this).next(".anw").stop().slideToggle(300);
		  $(this).toggleClass('on').siblings().removeClass('on');
		  $(this).next(".anw").siblings(".anw").slideUp(300); // 1개씩 펼치기
		});	
});
		

</script>
	<!-- 검색 결과창 -->
	<div id="info1">
		
	</div>
	
	<div id="info2">
		
	</div>
	<!-- <div class="box"></div>   -->
	<br><br>
	<!-- 게시글 페이지 -->
	<!-- <div id="pagelist"></div> -->
	<br><br>  
		
	<!-- 아코디언 -->
	<div id="Accordion_wrap">
     <div class="que" id="que1">
      <span><h3 style="font-family: yg-jalnan !important;"><img src="/DTkkiri/images/사람.png">&nbsp;회원 목록</h3></span>
       <div class="arrow-wrap">
         <span class="arrow-top"></span>
        <span class="arrow-bottom"></span>
       </div>
      
     </div>
     <div class="anw" id="anw1">
     </div>
      <div class="que" id="que2">
      <span><h3 style="font-family: yg-jalnan !important;"><img src="/DTkkiri/images/금지.png">&nbsp;블랙리스트 목록</h3></span>
     </div>
     <div class="anw" id="anw2">
     </div>
      <div class="que" id="que3"> 
      <span><h3 style="font-family: yg-jalnan !important;"><img src="/DTkkiri/images/경고.png">&nbsp;신고리스트 목록</h3></span>
     </div>
     <div class="anw" id="anw3">
     	<div class="box">
 	    	<div id="id="pagelist"></div>
 	    </div>
     </div>
</div>		
		
		
            </main>
           <footer class="py-4 bg-light mt-auto" style="margin-top:5%">
                <div class="container-fluid px-4">
                    <div class="d-flex align-items-center justify-content-between small">
                        <div class="text-muted">Copyright &copy; 오류없겠조.. 2022</div>
                        <div>
                            <a href="#">Privacy Policy</a>
                            &middot;
                            <a href="#">Terms &amp; Conditions</a>
                        </div>
                    </div>
                </div>
            </footer> 
        </div>
    </div>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
    <script src="../js/scripts.js"></script>
    <script>
		$(document).ready(function(){
		  $('[data-toggle="tooltip"]').tooltip();   
		});
	</script>
	

</body>
</html>