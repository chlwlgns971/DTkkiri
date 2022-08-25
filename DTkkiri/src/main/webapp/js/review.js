/**
 * 
 */

// 댓글 리스트 가져오기 - 맛집 게시판에서 넘어왔을 때 첫 화면 / 댓글 등록했을 때 2번 나타내기
reviewListServer = function(target){
	console.log("reviewListServer target값 >>" + target);

	// 댓글 리스트 출력
	$.ajax({
		url : '/DTkkiri/reviewReplyList.do',
		type : 'get',
		// list는 하나를 가져오거나 여러개 가져와야할 때 , 무조건 하나 가져오는건 object
		data : { 'num' : target }, 
		success : function(res){
			rcode="";
			
			rcode+='<div class="container mt-3">';
			rcode+='<textarea rows="" cols="60" id="texta"></textarea>';
			rcode+='<select name="rate">';
   			rcode+='<option value="5">★★★★★</option>';
      		rcode+='<option value="4">★★★★☆</option>';    	
        	rcode+='<option value="3">★★★☆☆</option>';
        	rcode+='<option value="2">★★☆☆☆</option>';
        	rcode+='<option value="1">★☆☆☆☆</option>';
      		rcode+='</select>';
			rcode+='<input idx="18" type="button" value="등록" name="reply" class="action">';   	
			rcode+='</div>';
			
			$.each(res,function(i,v){
				
				cont = v.cont; // 역슬래시(\n)가 들어있는 cont --> <br>태그로 변경해야한다
				cont = cont.replace(/\r/g, "").replace(/\n/g,"<br>");

				rate = parseInt(v.rate);
				console.log(rate);
				star = "";
				
				switch(rate){
					case 5:
					star = '★★★★★';
					break;
					case 4:
					star = '★★★★☆';
					break;
					case 3:
					star = '★★★☆☆';
					break;
					case 2:
					star = '★★☆☆☆';
					break;
					case 1:
					star = '★☆☆☆☆';
					break;
				}
				
				rcode+='<div class="container mt-3">';
				rcode+='  <div class="media border p-3">';
				rcode+='    <img src="/DTkkiri/images/프로필.png" alt="John Doe" class="mr-3 mt-3 rounded-circle" style="width:60px;">';
				rcode+='    <div class="media-body">';
				rcode+='      <h4>'+ v.id +' <small><i>'+ v.date +'</i>&nbsp;&nbsp;&nbsp;';
				rcode+='      <i>'+ star +'</i>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;';
//				rcode+='		<i><input idx="'+ v.num +'" type="button" value="댓글수정" class="action" name="r_modify">';
				rcode+='		   <input  idx="'+ v.num +'" revId="'+v.id+'" type="button" value="댓글삭제" class="action" name="r_delete"></i></small></h4>';
				rcode+='      <p>' + cont +'</p>';    
				rcode+='    </div>';
				rcode+='  </div>';
				rcode+='</div>';
				
			})
			
			// parent는 부모 / parents는 조상 // panel-body로 하면 제목이 올 때 찾을 수 없기 때문에 panel로 사용
			$('.review').html(rcode);
		},
		error : function(xhr){
			alert('상태 : ' + xhr.status);
		},
		dataType : 'json'
		
	})	
	
}


// 댓글 등록
reviewSaveServer = function(target){
	
	console.log("reviewSaveServer target 값 >>" + target);
	
	$.ajax({
		url : '/DTkkiri/reviewReplySave.do',
		type : 'post',
		data : reply,	// reply 객체 - resNum, id, cont
		success : function(res){
			// 댓글 리스트 출력
			reviewListServer(res.num);
			//alert("가져오는값 : " + res.num + "/성공여부" + res.flag);
			
		},
		error : function(xhr){
			alert("상태 : " + xhr.status);
		},
		dataType : 'json'
		
	})
}

// 댓글 삭제
reviewDeleteServer = function(target){
	console.log("reviewDeleteServer target 값(댓글번호) >> " + target);
	
	
	$.ajax({
		url : '/DTkkiri/reviewDelete.do',
		type : 'post',
		data : del,
		success : function(res){
			//alert(res.flag);
			reviewListServer(res.num);
		},
		error : function(xhr){
			alert("상태 : " + xhr.status + ", " + xhr.readyState);
			
		},
		dataType : 'json'
	})
}