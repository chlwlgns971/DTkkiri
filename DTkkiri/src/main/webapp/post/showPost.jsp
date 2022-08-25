<%@page import="kr.or.ddit.dtkkiri.vo.ReplyVO"%>
<%@page import="kr.or.ddit.dtkkiri.vo.AtfileVO"%>
<%@page import="java.util.List"%>
<%@page import="kr.or.ddit.dtkkiri.vo.PostVO"%>
<%@page import="kr.or.ddit.dtkkiri.vo.AuthorityVO"%>
<%@page import="kr.or.ddit.dtkkiri.vo.MemberVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<%
	PostVO pvo=(PostVO)request.getAttribute("postVo");
	//권한 세션 가져오기
	AuthorityVO avo=(AuthorityVO)session.getAttribute(pvo.getPost_bcode());
	//로그인한 회원의 정보가져오기
	MemberVO memVo =(MemberVO)session.getAttribute("member");
	List<AtfileVO> imageList=(List<AtfileVO>)request.getAttribute("imageList");	
	List<AtfileVO> fileList=(List<AtfileVO>)request.getAttribute("fileList");	
	List<ReplyVO> replyList=(List<ReplyVO>)request.getAttribute("reply");
%>
	<meta charset="UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
    <meta name="description" content="" />
    <meta name="author" content="" />
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
      <title>Static Navigation - SB Admin</title>
       <link href="/DTkkiri/css/styles.css" rel="stylesheet" />
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
			
			#hrStyle{
						background : #fd9f28;
						height: 10px;
			}	
			#hrStyle1{
						background : #fd9f28;
						height: 10px;
			}	
        </style>
        <script src="https://use.fontawesome.com/releases/v6.1.0/js/all.js" crossorigin="anonymous"></script>
        <script src="../js/board.js"></script>
        <style type="text/css">
			.main{
				width: 1100px;
				margin:0px auto;
				margin-top:5%;
			}
			#mainContent{
				border: 3px solid lightgray;
				padding: 15px;
			}
			.postPlace{
				border: 3px solid lightgray;
			}
			.content{
				
				overflow: auto;
			}
			img{
				display:block;
				max-width: 1080px;
				max-height: 720px;
				margin: 0px auto;
			}
			.material-symbols-outlined {
		  		font-variation-settings:
		  		'FILL' 0,
		 		'wght' 400,
		 		'GRAD' 0,
		  		'opsz' 48
			}
			#likeBox{
				margin-left:45%;
			}
			#like{
				width: 50px;
				height: 50px;
				border: 0px solid #FD9F28;
				border-radius: 30%;
				background-image: url('images/좋아요3.png');
				background-size: contain;
			}
			#likeLabel{
				font-size: 0.7ex;
			}
			.replyUpdateBtn{
				background-color: white;
				border: 0px;
				border-radius: 20%;
				font-size: 0.6em;
			}
			.replyUpdateBtn:hover {
				border: 3px solid #FFCD4A;
			}
			.replyDeleteBtn{
				background-color: white;
				border: 0px;
				border-radius: 20%;
				font-size: 0.6em;
			}
			.replyDeleteBtn:hover {
				border: 3px solid #FFCD4A;
			}
			#report:hover{
				cursor: pointer;
			}
		</style>
		<script type="text/javascript">
			$(function(){
				$(document).on('click', '#like', function(){
					
					postNum = '<%=pvo.getPost_num()%>';
					console.log(postNum);
					$.ajax({
						url: '/DTkkiri/updateRecNum.do',
						type: 'get',
						data: {"postNum": postNum }, //pvo.getPost_num 가져와야함 (hidden태그 요소 활용하기)
						success: function(res) {
							code = '좋아요: '+ res.recNum;
							
							$('#likeLabel').html(code);
						},
						error: function(xhr) {
							alert("상태 : " + xhr.status);
						},
						dataType: 'json'
					})
				})
				//권한 가져오기
				var createAur='<%=avo.getAur_create()%>';
				var deleteAur='<%=avo.getAur_delete()%>';
				var updateAur='<%=avo.getAur_update()%>';
				var classNum='<%=memVo.getMem_room()%>';
				var code='<%=pvo.getPost_bcode()%>';
				
				//댓글등록 버튼 이벤트
				$(document).on('click','#rpySubmit',function(){
					if((createAur=='Y')||(createAur=='S' && classNum==code)){
						var content= document.getElementById("content").value;
						postNum='<%=pvo.getPost_num()%>'
						$.ajax({
							url: '/DTkkiri/registReply.do',
							type: 'post',
							data: {"postNum":'<%=pvo.getPost_num()%>',"postCont":content, "id":'<%=memVo.getMem_id()%>'},
							success: function(res) {
								code="";
								$.each(res, function(i,v){
									//변수 i는 index값, 변수 v는 데이터값이 저장된다.
									code+='<div class="media border p-3">';
							    	code+='<img src="/DTkkiri/images/프로필.png" alt="John Doe" class="mr-3 mt-3 rounded-circle" style="width:60px;">';
							    	code+='	<div class="media-body">';
							    	code+='  	<h4><a id="report" idx="'+v.rpy_id+'">'+v.rpy_id+'</a></h4>';
								    code+='		<small><i>Posted on '+v.rpy_date+'</i></small>';
								    code+='  	<p>'+v.rpy_cont+'</p>'; 
								    code+='		<button type="button" value="'+v.rpy_num+'" name="'+v.rpy_id+'" class="replyUpdateBtn">수정</button>';
								   	code+='		<button type="button" value="'+v.rpy_num+'" name="'+v.rpy_id+'" class="replyDeleteBtn">삭제</button>';
							    	code+='	</div>';
							    	code+='	<div class="media p-3" id="'+v.rpy_num+'"></div>';
							  		code+='</div>';
								});
								$('#replyPlace').html(code);
								$('#content').val('');
							},
							error: function(xhr) {
								alert("상태 : " + xhr.status);
							},
							dataType: 'json'
						})
					}
					else alert("권한이 없습니다.");
					
				})
				//댓글 삭제버튼 클릭 이벤트
				$(document).on('click','.replyDeleteBtn',function(){
					var rpy_num=$(this).attr('value');
					var rpy_id=$(this).attr('name');
					var mem_pid='<%=memVo.getMem_pid()%>';
					var mem_id='<%=memVo.getMem_id()%>';
					if((deleteAur=='Y')||(deleteAur=='S' && mem_pid=='SUBADMIN') || (rpy_id==mem_id)){
						$.ajax({
							url: '/DTkkiri/deleteReply.do',
							type: 'post',
							data: {"replyNum":rpy_num, "postNum":'<%=pvo.getPost_num()%>'},
							success: function(res) {
								code="";
								$.each(res, function(i,v){
									//변수 i는 index값, 변수 v는 데이터값이 저장된다.
									code+='<div class="media border p-3">';
							    	code+='<img src="/DTkkiri/images/프로필.png" alt="John Doe" class="mr-3 mt-3 rounded-circle" style="width:60px;">';
							    	code+='	<div class="media-body">';
							    	code+='  	<h4><a id="report" idx="'+v.rpy_id+'">'+v.rpy_id+'</a></h4>';
								    code+='		<small><i>Posted on '+v.rpy_date+'</i></small>';
								    code+='  	<p>'+v.rpy_cont+'</p>'; 
								    code+='		<button type="button" value="'+v.rpy_num+'" name="'+v.rpy_id+'" class="replyUpdateBtn">수정</button>';
								   	code+='		<button type="button" value="'+v.rpy_num+'" name="'+v.rpy_id+'" class="replyDeleteBtn">삭제</button>';
							    	code+='	</div>';
							    	code+='	<div class="media p-3" id="'+v.rpy_num+'"></div>';
							  		code+='</div>';
								});
								$('#replyPlace').html(code);
								$('#content').val('');
							},
							error: function(xhr) {
								alert("상태 : " + xhr.status);
							},
							dataType: 'json'
						})
					}
					else{
						alert("권한이 없습니다.")
					}
				})
				//댓글 수정버튼 클릭 이벤트(수정창 display)
				$(document).on('click','.replyUpdateBtn',function(){
					var rpy_num=$(this).attr('value');
					var rpy_id=$(this).attr('name');
					var mem_pid='<%=memVo.getMem_pid()%>';
					var mem_id='<%=memVo.getMem_id()%>';
					if((updateAur=='Y')||(updateAur=='S' && mem_pid=='SUBADMIN') || (rpy_id==mem_id)){
						code='<div class="form-group">';
						code+='	<label for="title">댓글:</label> ';
						code+='<textarea class="form-control" rows="3" cols="" placeholder="내용을 입력하세요." id="updateContent"></textarea>';
						code+='<button type="button" id="rpyUpdate" value="'+rpy_num+'" name="'+rpy_id+'" class="btn btn-primary" style="float:right;">수정</button>';
						code+='</div>';
						$('#'+rpy_num).html(code);
					}
					else alert("권한이 없습니다.");
				})
				//실제 댓글수정 이벤트
				$(document).on('click','#rpyUpdate',function(){
					var rpy_num=$(this).attr('value');
					var rpy_id=$(this).attr('name');	
					var content= document.getElementById("updateContent").value;
					postNum='<%=pvo.getPost_num()%>'
					$.ajax({
						url: '/DTkkiri/updateReply.do',
						type: 'post',
						data: {"rpyNum":rpy_num, "postCont":content, "postNum":'<%=pvo.getPost_num()%>'},
						success: function(res) {
							code="";
							$.each(res, function(i,v){
								//변수 i는 index값, 변수 v는 데이터값이 저장된다.
								code+='<div class="media border p-3">';
						    	code+='<img src="/DTkkiri/images/프로필.png" alt="John Doe" class="mr-3 mt-3 rounded-circle" style="width:60px;">';
						    	code+='	<div class="media-body">';
							    code+='  	<h4><a id="report" idx="'+v.rpy_id+'">'+v.rpy_id+'</a></h4>';
							    code+='		<small><i>Posted on '+v.rpy_date+'</i></small>';
							    code+='  	<p>'+v.rpy_cont+'</p>'; 
							    code+='		<button type="button" value="'+v.rpy_num+'" name="'+v.rpy_id+'" class="replyUpdateBtn">수정</button>';
							   	code+='		<button type="button" value="'+v.rpy_num+'" name="'+v.rpy_id+'" class="replyDeleteBtn">삭제</button>';
						    	code+='	</div>';
						    	code+='	<div class="media p-3" id="'+v.rpy_num+'"></div>';
						  		code+='</div>';
							});
							$('#replyPlace').html(code);
							$('#updateContent').val('');
						},
						error: function(xhr) {
							alert("상태 : " + xhr.status);
						},
						dataType: 'json'
					})
				})
				//게시글 삭제버튼 클릭 이벤트
				$(document).on('click','#postDelete',function(){
					var post_id='<%=pvo.getPost_id()%>';
					var mem_pid='<%=memVo.getMem_pid()%>';
					var mem_id='<%=memVo.getMem_id()%>';
					var postNum='<%=pvo.getPost_num()%>';
					var boardCode='<%=pvo.getPost_bcode()%>';
					if((deleteAur=='Y')||(deleteAur=='S' && mem_pid=='SUBADMIN') || (post_id==mem_id)){
						location.href = "/DTkkiri/deletePost.do?postNum=" + postNum+"&BoardCode="+boardCode;
					}
					else alert("권한이 없습니다.");
				})
				//게시글 수정버튼 클릭 이벤트
				$(document).on('click','#postUpdate',function(){
					var post_id='<%=pvo.getPost_id()%>';
					var mem_pid='<%=memVo.getMem_pid()%>';
					var mem_id='<%=memVo.getMem_id()%>';
					var postNum='<%=pvo.getPost_num()%>';
					var boardCode='<%=pvo.getPost_bcode()%>';
					if((updateAur=='Y')||(updateAur=='S' && mem_pid=='SUBADMIN') || (post_id==mem_id)){
						location.href="<%=request.getContextPath() %>/post/updatePost.jsp?post_num="+postNum+"&post_bcode="+boardCode;
					}
					else alert("권한이 없습니다.");
				})
				//돌아가기 버튼 클릭 이벤트
				$(document).on('click','#prev',function(){
					location.href="<%=request.getContextPath() %>/main/board.jsp?post_bcode="+code;
				})
				//아이디에 대한 이벤트
				$(document).on('click', '#report', function() {
					reportId=$(this).attr('idx');
					reportCode="brp";
					if(reportId=='admin'){
						alert('권한이 없습니다.');
					}
					else slocation.href="<%=request.getContextPath() %>/post/writePost.jsp?post_bcode="+reportCode+"&reportId="+reportId+"&thisBcode="+code;
				})
			})
		</script>
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
						    	}else if(memVo.getMem_pid().equals("SUBADMIN") && memVo.getMem_gen().equals("F")){
						    %>
						    		<img src="<%=request.getContextPath() %>/images/guja.png" alt="SUBADMIN" >
						    		
						    <%	
						    	}else if(memVo.getMem_pid().equals("SUBADMIN") && memVo.getMem_gen().equals("M")){ 	
						    %>	
						    	  <img src="<%=request.getContextPath() %>/images/avatar-3680134_960_720.webp" alt="SUBADMIN" >
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
		<!-- Post content-->
        <article>
            <!-- Post header-->
            <header class="mb-4">
                <!-- Post title-->
                <h1 class="fw-bolder mb-1" style="font-family: yg-jalnan"><%=pvo.getPost_tit() %></h1>
                <hr id="hrStyle">
                <!-- Post meta content-->
                <div class="text-muted fst-italic mb-2">Posted on <%=pvo.getPost_date() %> by <%=pvo.getPost_id() %></div>
                <!-- Post categories-->
                <div class="badge bg-secondary text-decoration-none link-light">조회수 <%=pvo.getPost_view_num() %></div>
            </header>
            <!-- Preview image figure-->
            <figure class="mb-4">
           	<%
           	if(imageList!=null){
				for(AtfileVO fvo : imageList){
			%>
				<img class="img-fluid rounded" src="<%=request.getContextPath() %>/images/imageSrcView.do?fileName=<%=fvo.getAtfile_sv_name() %>">
			<%
				}
           	}
			%>
            </figure>
            <!-- Post content-->
            <section class="mb-5">
                <p class="fs-5 mb-4"><%=pvo.getPost_cont() %></p>
            </section>
        </article>
        <br><br>
		<div class="content" id="mainContent">
		<%
			for(AtfileVO fvo : fileList){
			%>
				<a href="<%=request.getContextPath()%>/fileDownload.do?fileName=<%=fvo.getAtfile_sv_name()%>"><%=fvo.getAtfile_og_name() %></a><br>
			<%
			}
		%>
		</div>
		<br>
		<div id="likeBox">
			<button id="like" type="button"></button><br>
			<label id="likeLabel">좋아요:<%=pvo.getPost_rec_num() %></label>
		</div>
		<button type="button" id="postDelete" class="btn btn-warning btn-sm" style="float:right;" style="font-family: yg-jalnan">삭제</button>
		<button type="button" id="postUpdate" class="btn btn-warning btn-sm" style="float:right; margin-right: 7px;" style="font-family: yg-jalnan">수정</button>
		<button type="button" id="prev" class="btn btn-warning btn-sm" style="float:left; margin-right: 7px;">돌아가기</button>
		<br><br>
		<div class="reply">
			<div id="replyPlace">
				<%
				for(ReplyVO rvo : replyList){
				%>
				<div class="media border p-3">
			    	<img src="/DTkkiri/images/프로필.png" alt="John Doe" class="mr-3 mt-3 rounded-circle" style="width:60px;">
			    	<div class="media-body">
						<h4><a id=report idx="<%=rvo.getRpy_id()%>"><%=rvo.getRpy_id() %></a></h4>
						<small><i>Posted on <%=rvo.getRpy_date() %></i></small>
			      		<p><%=rvo.getRpy_cont() %></p>      
			      		<button type="button" value="<%=rvo.getRpy_num() %>" name="<%=rvo.getRpy_id() %>" class="replyUpdateBtn btn-sm">수정</button>
 				  		<button type="button" value="<%=rvo.getRpy_num() %>" name="<%=rvo.getRpy_id() %>" class="replyDeleteBtn btn-sm">삭제</button>
			    	</div>
			    	<br><br><br>
			    	<div class="media p-3" id="<%=rvo.getRpy_num() %>"></div>
			  	</div>
			  	<%
				}
			  	%>
			</div>
			<br><br>
			<hr id="hrStyle1">
			<div class="form-group">
				<label for="title" style="font-family: yg-jalnan">댓글</label> 
				<textarea class="form-control" rows="3" cols="" placeholder="내용을 입력하세요." id="content"></textarea>
				<button type="button" id="rpySubmit" class="btn btn-warning" style="float:right;">작성</button>
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