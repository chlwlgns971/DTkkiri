currentPage = 1;

listPageServer = function(cpage, code, option, keyword) {
	boardname="";
	switch(code){
		case 'bfb':
			boardname="자유게시판";
			break;
		case 'info':
			boardname="정보게시판";
			break;
		case '304':
			boardname="304호게시판";
			break;
		case '305':
			boardname="305호게시판";
			break;
		case '306':
			boardname="306호게시판";
			break;
		case '401':
			boardname="401호게시판";
			break;
		case '402':
			boardname="402호게시판";
			break;
		case '403':
			boardname="403호게시판";
			break;
		case '404':
			boardname="404호게시판";
			break;
		case '405':
			boardname="405호게시판";
			break;
		case '406':
			boardname="406호게시판";
			break;
		case 'bqb':
			boardname="질문게시판";
			break;
		case 'bab':
			boardname="공지사항";
			break;
		case 'res':
			boardname="맛집게시판";
			break;
		case 'lib':
			boardname="자료실";
			break;
		case 'bsg':
			boardname="건의게시판";
			break;
		case 'brp':
			boardname="신고게시판";
			break;
	}
	$.ajax({
		url: '/DTkkiri/postList.do',
		type: 'post',
		//boardCode: 게시판 코드, page: 현재 페이지 ->쿠키나 변수로 가져올 예정 지금은 테스트를 위해 자유게시판 코드 입력
		data: { "boardCode": code, "page": cpage, "option": option, "keyword": keyword },
		success: function(res) {
			code='<div class="container">';
			code+='	<h2 class="sixth" style="font-family: yg-jalnan !important;">'+boardname+'</h2><br>';
			code+='	<table class="table table-hover orangeTable">';
			code+='		<thead>';
			code+='			<tr class="orangeTr"">';
			code+='				<th>게시글번호</th>';
			code+='				<th>제목</th>';
			code+='				<th>작성자</th>';
			code+='				<th>작성일</th>';
			code+='				<th>조회수</th>';
			code+='				<th>추천수</th>';
			code+='			</tr>';
			code+='		</thead>';
			code+='		<tbody>';
			
			$.each(res.lists, function(i, v) {
				code+='		<tr class="grayTr">';
				code+='			<td>'+v.post_num+'</td>';
				code+='			<td class="title" idx="'+v.post_num+'" name="title">'+v.post_tit+'</td>';
				code+='			<td class="id" data-toggle="tooltip" data-placement="top" title="신고하기!">';
				code+='				<div class="dropdown show">';
				code +='				<button class="btn btn-sm dropdown-toggle more-vertical" type="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"';
				code +='					<span class="text-muted sr-only" >'+v.post_id+'</span>';
				code +='				</button>';
				code +='				<div class="dropdown-menu dropdown-menu-right">';
				code +='					<a class="dropdown-item" id="report" idx="'+v.post_id+'" href="#">신고하기</a>';
				code +='				</div>';
				code +='			</div>';
				code+='			</td>';
				code+='			<td>'+v.post_date+'</td>';
				code+='			<td>'+v.post_view_num+'</td>';
				code+='			<td>'+v.post_rec_num+'</td>';
				code+='	    </tr>';
			})

			code+='		</tbody>';
			code+='	</table>';
			code+='</div>';

			$('.box').html(code);


			//이전 버튼 
			pager = "";
			if (res.spage > 1) {
				pager += '<ul class="pagination">';
				pager += ' <li class="page-item"><a class="page-link prev" href="#">Previous</a></li>'
				pager += ' </ul>';
			}

			//페이지번호
			pager += '<ul class="pagination plist">';
			for (i = res.spage; i <= res.epage; i++) {
				if (currentPage == i) {
					pager += '<li class="page-item active"><a class="page-link pnum" href="#" style="color:black;">' + i + '</a></li>';


				} else {
					pager += '<li class="page-item"><a class="page-link pnum" href="#" style="color:black;" >' + i + '</a></li>';

				}
			}
			pager += '</ul>'

			//다음버튼 
			if (res.tpage > res.epage) {
				pager += '<ul class="pagination">';
				pager += ' <li class="page-item"><a class="page-link next" href="#">Next</a></li>'
				pager += ' </ul>';
			}


			$('#pagelist').html(pager);

		},
		error: function(xhr) {
			alert("상태 : " + xhr.status);
		},
		dataType: 'json'
	})

}


reportPostList = function(cpage, code, option, keyword) {
	$.ajax({
		url: '/DTkkiri/postList.do',
		type: 'post',
		//boardCode: 게시판 코드, page: 현재 페이지 ->쿠키나 변수로 가져올 예정 지금은 테스트를 위해 자유게시판 코드 입력
		data: { "boardCode": code, "page": cpage, "option": option, "keyword": keyword },
		success: function(res) {
			code='<div class="container">';
			code+='	<table class="table border table-hover bg-white">';
			code+='		<thead>';
			code+='			<tr role="row">';
			code+='				<th>게시글번호</th>';
			code+='				<th>제목</th>';
			code+='				<th>작성자</th>';
			code+='				<th>작성일</th>';
			code+='			</tr>';
			code+='		</thead>';
			code+='		<tbody>';
			
			$.each(res.lists, function(i, v) {
				code+='		<tr class="grayTr">';
				code+='			<td>'+v.post_num+'</td>';
				code+='			<td class="title" idx="'+v.post_num+'" name="title">'+v.post_tit+'</td>';
				code+='			<td class="id" data-toggle="tooltip" data-placement="top" title="신고하기!">'+v.post_id+'</td>';
				code+='			<td>'+v.post_date+'</td>';
				code+='	    </tr>';
			})

			code+='		</tbody>';
			code+='	</table>';
			code+='</div>';

			$('.box').html(code);


			//이전 버튼 
			pager = "";
			if (res.spage > 1) {
				pager += '<ul class="pagination">';
				pager += ' <li class="page-item"><a class="page-link prev" href="#">Previous</a></li>'
				pager += ' </ul>';
			}

			//페이지번호
			pager += '<ul class="pagination plist">';
			for (i = res.spage; i <= res.epage; i++) {
				if (currentPage == i) {
					pager += '<li class="page-item active"><a class="page-link pnum" href="#" style="color:black;">' + i + '</a></li>';


				} else {
					pager += '<li class="page-item"><a class="page-link pnum" href="#" style="color:black;" >' + i + '</a></li>';

				}
			}
			pager += '</ul>'

			//다음버튼 
			if (res.tpage > res.epage) {
				pager += '<ul class="pagination">';
				pager += ' <li class="page-item"><a class="page-link next" href="#">Next</a></li>'
				pager += ' </ul>';
			}


			$('#pagelist').html(pager);

		},
		error: function(xhr) {
			alert("상태 : " + xhr.status);
		},
		dataType: 'json'
	})

}