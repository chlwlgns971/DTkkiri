
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
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.js"></script>
		<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
  		<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
        <title>DT끼리 Main Page</title>
        <link href="../css/styles.css" rel="stylesheet" />
        <script src="https://use.fontawesome.com/releases/v6.1.0/js/all.js" crossorigin="anonymous"></script>
        <script src="../js/board.js"></script>
</head>

<style>
	.delButton {
		background-color :transparent;
		font-size : 14px;
		border : 0;
		outline : 0;
	}
	
	@font-face {
   		font-family: 'ONE-Mobile-POP';
    	src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2105_2@1.0/ONE-Mobile-POP.woff') format('woff');
    	font-weight: normal;
    	font-style: normal;
	}
.js-saying{
	font-size: 24px;
}
@font-face {
    font-family: 'yg-jalnan';
    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_four@1.2/JalnanOTF00.woff') format('woff');
    font-weight: normal;
    font-style: normal;
}
</style>

<script>

$(function(){
	
	arr = new Array('“별로 놀랄 일도 아닌 일에 어?~ 금지”', '“프로그래머는 카페인을 코드로 바꿀 수 있는 유기체이다.”', '“당신의 두뇌로 코드를 만들고, 당신의 심장으로 디버깅한다.”', 
						'“이 코드를 짤 때, 세상에 단 둘, 나와 신만이 이 코드가 뭐하는 코드였는지 알고 있었다. 이제는 신만이 아신다.”',
						'“이 코드가 왜 동작하지 않는지 알지 못하고, 이 코드가 왜 동작하는지 알지 못한다.”');
	
	num = parseInt(Math.random() * 4 +1);
	
	console.log(num);
	
	$('.js-saying').text(arr[num]);
	
})


	
</script>

<body>

	<nav class="sb-topnav navbar navbar-expand bg-ddit"> <!-- navbar-dark bg-dark -->
	    <!-- Navbar Brand-->
	    <a href="main.jsp">
	    	<img id="logo" src="../images/Ver3.1.png"  alt="DT끼리logo" >
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
	            <ul id="ulBox" class="dropdown-menu dropdown-menu-end" aria-labelledby="navbarDropdown" style="border-radius:20px; background-color: rgba(255,255,255,0.8);"> 

						    <%  
						    	//로그인한 회원의 정보가져오기
						    	MemberVO memVo =(MemberVO)session.getAttribute("member"); 
						       
						    	//여자 + 학생
						        if(memVo.getMem_gen().equals("F") && memVo.getMem_pid().equals("STUDENT")){
						    %>		
								    <img src="../images/pngwing.com (8).png" alt="studentF" style="margin-bottom:50px;">
						    
						    <%  //남자 + 학생
						    	}else if(memVo.getMem_gen().equals("M") && memVo.getMem_pid().equals("STUDENT")){
						    %>		
						    		<img src="../images/남자아이콘.png" alt="studentM" style="margin-bottom:50px;">
                            <%  //메인어드민
						    	}else if(memVo.getMem_pid().equals("MAINADMIN")){   
						    %>		
								    <img src="../images/mainAdmin.png" alt="mainAdmin">
				            <%  //서브어드님 (현재 여자 반장으로만 설정!)
						    	}else if(memVo.getMem_gen().equals("F") && memVo.getMem_pid().equals("SUBADMIN") ){
						    %>
						    		<img src="../images/guja.png" alt="SUBADMIN" >
						    <%						    	
						     	}else if(memVo.getMem_gen().equals("M") && memVo.getMem_pid().equals("SUBADMIN")){ 	
							%>	
						    	  <img src="<%=request.getContextPath() %>/images/pngwing.com (11).png" alt="SUBADMIN" >
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
						        <span >   
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
						        </span>   
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
						    <a href="../memberUpdate/memUpdate.jsp" class="btn btn-warning">내정보수정</a>
						    
						
						    <%
						    	if(pid.equals("STUDENT")){
						    %>
                            <a href="" class="btn btn-warning"  style="display: none;">회원관리</a>
                            <%
						    	}else if(pid.equals("MAINADMIN")){
                            %>
                            <a href="../adminView/adminView.jsp" class="btn btn-warning" >회원관리</a>
                            <%
						    	}else if(pid.equals("SUBADMIN")){
                            %>
                            <a href="../adminView/subAdminView.jsp" class="btn btn-warning" >회원관리</a>                            	
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
	
	<!-- 사이드 네브바 -->
    <div id="layoutSidenav">
        <div id="layoutSidenav_nav">
            <nav class="sb-sidenav accordion sb-sidenav-dark" id="sidenavAccordion">
                <div class="sb-sidenav-menu">
                    <div class="nav">
                        <div class="sb-sidenav-menu-heading">info</div>
                        <a class="nav-link" href="board.jsp?post_bcode=bab">
                            <div class="sb-nav-link-icon"><i class="fa-solid fa-bullhorn"></i></div>
                            공지사항
                        </a>
                        <a class="nav-link" href="board.jsp?post_bcode=bsg">
                            <div class="sb-nav-link-icon"><i class="fa-solid fa-head-side-cough"></i></div>
                            건의사항
                        </a>
                        <div class="sb-sidenav-menu-heading">게시판</div>
                        <a class="nav-link" href="board.jsp?post_bcode=bfb">
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
                                <a class="nav-link" href="board.jsp?post_bcode=304">304</a>
                                <a class="nav-link" href="board.jsp?post_bcode=305">305</a>
                                <a class="nav-link" href="board.jsp?post_bcode=306">306</a>
                                <a class="nav-link" href="board.jsp?post_bcode=401">401</a>
                                <a class="nav-link" href="board.jsp?post_bcode=402">402</a>
                                <a class="nav-link" href="board.jsp?post_bcode=403">403</a>
                                <a class="nav-link" href="board.jsp?post_bcode=404">404</a>
                                <a class="nav-link" href="board.jsp?post_bcode=405">405</a>
                                <a class="nav-link" href="board.jsp?post_bcode=406">406</a>
                            </nav>
                        </div>
                        <a class="nav-link" href="board.jsp?post_bcode=bqb">
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
                            	<a class="nav-link" href="restaurantFrame.jsp">맛집</a>
                                <a class="nav-link" href="board.jsp?post_bcode=info">정보</a>
                                <a class="nav-link" href="board.jsp?post_bcode=lib">자료실</a>
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
        	<%
        		if(pid.equals("MAINADMIN")||pid.equals("SUBADMIN")){
        	%>
        			<main id="main" style="background-image: url('../images/main후보.jpg'); text-align: center;">
        	<%
        		}else if(pid.equals("STUDENT")){
        	%>        			
        			<main id="main" style="background-image: url('../images/mainBackground1.jpg'); text-align: center;">
        	<%
        		}
        	%>
            <main id="main" style="text-align: center;">
            	<div>
		          <!-- 시계 -->  
				  <div class="js-clock">
				  	   <br>
				  	   <br>
				  	   <br>
				  	   <br>
					   <h3 id="date" style="font-family: 'ONE-Mobile-POP' !important;">2022-08-16</h3> 
					   <h1 id="time" style="font-family: 'ONE-Mobile-POP' !important;">00:00</h1>
					   <br>
					   <br>
					   <br>
					   <br>
					   <br>
					   <br>
					   <br>
					   
					  <!-- 명언 -->
					  <div class="js-saying" style="font-family: 'ONE-Mobile-POP' !important;">
					  	<br>
					  	<br>
					  </div>
			
				  </div>
				  	<br>
				  	<br>
				  	<br>
				  	<br>
				  	
				  <!-- 누구님 반갑습니다! -->
		    	  <div>
					 <%--    <%  MemberVO memVo= (MemberVO)session.getAttribute("member"); %> --%>
					    <h2 style="font-family: 'ONE-Mobile-POP' !important;"> 오늘도 화이팅, <%= name %>님!</h2>
					    <br>
					    <br>
				    
				  </div>

				  <!-- todoList -->
				  <form class="js-toDoForm">
		            <input id="todoInput" type="text" placeholder="todoList" autocomplete='off'/> 
    	          </form> 
		          <br>
		          <ul class="js-toDoList"></ul>
		           
			    </div>  
            </main>
            <!-- <footer id="footer" class="py-4 bg-light">  mt-auto  style="margin-top:5%"
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
            </footer>  -->
        </div>
    </div>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
    <script src="../js/scripts.js"></script>
	<script type="text/javascript" src="../js/clock.js"></script>
	<script type="text/javascript" src="../js/todoList.js"> </script>
</body>
</html>
