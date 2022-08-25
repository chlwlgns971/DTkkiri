<%@page import="kr.or.ddit.dtkkiri.vo.AuthorityVO"%>
<%@page import="kr.or.ddit.dtkkiri.vo.MemberVO"%>
<%@page import="kr.or.ddit.dtkkiri.vo.RestaurantVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="/DTkkiri/js/review.js"></script>
<script src="https://cdn.jsdelivr.net/npm/jquery@3.6.0/dist/jquery.min.js"></script>

<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>

</head>

<%
	String name = "";
	int num = 0;
	double rate = 0.0;
	String addr = "";
	String ph = "";
	String cont = "";
	
	List<RestaurantVO> list = (List<RestaurantVO>) request.getAttribute("ResList");

	for(int i=0; i<list.size();i++){
		RestaurantVO vo = list.get(i);
		
		name = vo.getRst_name();
		num = vo.getRst_num();
		rate = vo.getRst_rate();
		addr = vo.getRst_addr();
		ph= vo.getRst_ph();
		cont = vo.getRst_cont();
	}
	
	String star = "";
	switch((int)(rate)){
		case 5:
		star = "★★★★★";
		break;
		case 4:
		star = "★★★★☆";
		break;
		case 3:
		star = "★★★☆☆";
		break;
		case 2:
		star = "★★☆☆☆";
		break;
		case 1:
		star = "★☆☆☆☆";
		break;
		default:
		star = "☆☆☆☆☆";
		break;
	}
	
	MemberVO memVo = (MemberVO) session.getAttribute("member");
	//맛집게시판 코드
	String rev="rev";
	//권한 세션 가져오기
	AuthorityVO avo=(AuthorityVO)session.getAttribute(rev);
	
 %>
<script>
$(function(){
	// 리뷰 출력
	 reviewListServer(<%=num %>);	 
	 
	 
	// 버튼 이벤트
	$(document).on('click', '.action', function(){
		bname = $(this).attr('name');
		num = <%=num %>;
		var deleteAur='<%=avo.getAur_delete()%>';	
		var memId='<%=memVo.getMem_id()%>';
		if(bname == "r_delete"){ // 삭제
			idxnum = $(this).attr('idx');
			reviewId = $(this).attr('revId');
			if(deleteAur=='Y' || memId==reviewId){
				del = {};
				del.id = idxnum; // 댓글번호
				del.num = num;   // 게시글 번호
			
				reviewDeleteServer(this);
				//alert(num + "번글 댓글 삭제 "+ idxnum);
			}
			else alert("권한이 없습니다.");
		}else if(bname == "r_modify"){ // 수정
			//alert(num + "번글 댓글 수정");
		}else if(bname == "reply"){ // 등록
			//alert(num + "번글 댓글 등록");
			
			// 댓글 내용 가져오기
			rate = $(this).prev().val();
			cont = $(this).parent('.container').find("#texta").val();
			console.log(rate);
			console.log("내용가져오니? >> " + cont);
				
			//replytab에 저장할 예정, name, bonum (게시물번호), cont
			reply = { }; //객체 선언, 동적으로 속성을 추가할 수 있다

			reply.id = "<%= memVo.getMem_id()%>";
			reply.num = num;
			reply.cont = cont;
			reply.rate = rate;
			// reply의 이름들은 VO와 DB와 일치
				
			$(this).parent('.container').find("#texta").val(""); // 지우기 (공백으로 채우니까)
				
			// ajax 실행하여 호출
			reviewSaveServer(this); // this : 등록버튼
				
			//replyListServer(); ---(X) : 비동기라 SaveServer가 응답이 덜됐는데 ListServer가 먼저 나올 수도 있음 (댓글 내용이 안뜰 확률있음)
		}
		})
 })
 </script>

<style>
.img{
    position: relative;
    background-image: url("/DTkkiri/images/restaurant/<%= name%>.jpg");                                                         
    height: 40vh;
    background-size: 100% 500px; <!-- 100%-->
}
.img-cover{
   position: absolute;
   height: 100%;
   width: 100%;
   background-color: rgba(0, 0, 0, 0.4);                                                                 
   z-index:1;
}
.img .content{
     position: absolute;
     top:50%;
     left:50%;
     transform: translate(-50%, -50%);                                                                   
     font-size:2rem;
     color: white;
     z-index: 2;
     text-align: center;
}
textarea {
	 width: 80%;
	 height: 120px;
	 padding: 10px;
	 box-sizing: border-box;
	 border: solid 2px #FF8C00;
	 border-radius: 5px;
	 font-size: 16px;
	 resize: both;
}
#rate, #addr, #ph {
	font-size : 20px;
}
</style>
<body>

<div class="img">
        <div class="content">
            <p id="name"><%= name %> </p>
            <p id="rate"> <%= star %> ( <%= rate %> )</p>
            <p id="cont"> <%= cont %> </p>
            <p id="addr"><%= addr %></p>
            <p id="ph"><%=ph %></p>
        </div>
        <div class="img-cover"></div>
</div>
<div class="review">

</div>
</body>
</html>