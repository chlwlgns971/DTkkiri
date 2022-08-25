currentPage = 1;




listPageServer = function(cpage) {

		// 음식점 정보 끌어오기
		$.ajax({
			url : '/DTkkiri/selectAllRes.do',
			type : 'get',
			data: { "boardCode": "res", "page": cpage },
			success : function(res){
		       code=' <div class="container">';
		       code+='     <div class="text-center mt-5">';
			   code+='	<div class="container">';
			   code+='    <div class="row">';		
	
				$.each(res.lists, function(i,v){
				
					star = "";
					switch(parseInt(v.rst_rate)){
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
						default:
						star = '☆☆☆☆☆';
						break;
					}
				
					
					imgURL = "/DTkkiri/images/restaurant/" + v.rst_name + ".jpg";
					
					console.log(v.rst_cont);
					code+='      <div class="col-4">';
					code+='        <div class="revcard text-secondary bg-light">';
					code+='          <div class="card-header resname" id="resname">' + v.rst_name +'</div>';
					code+='           <img src="'+imgURL+'"class="card-img-top" alt="..." id="imgss">';
					code+='          <div class="card-body">';
					code+='            <p class="card-text resrate" id="resrate">'+ star + ' ('+ v.rst_rate+')' +'</p>'; //
					code+='            <p class="card-text rescont" id="rescont">'+ v.rst_cont  +'</p>'; //
					code+='            <p class="card-text resaddr" id="resaddr">'+v.rst_addr+'&nbsp;<a id="map" href="#"><img src="/DTkkiri/images/map.png"></a></p>';
					code+='            <p class="card-text resph" id="resph">'+v.rst_ph+'</p>';
					code+='            <p class="card-text resexp" id="resaddr">'+v.rst_exp+'</p>';
					code+='            <a href="#" id="btn" class="btn btn-warning reviewBtn" >리뷰보기</a>'; //target='_blank'
					code+='          </div>';
					code+='        </div>';
					code+='      </div>';
				})
					code+='    </div> ';
					code+='  </div>';
					code+='      </div>';
					code+='  </div>';                                                         

			$('.box').html(code);	
			
			//이전 버튼 
			pager = "";
			if (res.spage > 1) {
				pager += '<ul class="pagination">';
				pager += ' <li class="page-item"><a class="page-link prev" href="#" style="color: black;">Previous</a></li>'
				pager += ' </ul>';
			}

			//페이지번호
			pager += '<ul class="pagination plist">';
			for (i = res.spage; i <= res.epage; i++) {
				if (currentPage == i) {
					pager += '<li class="page-item active"><a class="page-link pnum" href="#" style="color:black;">' + i + '</a></li>';


				} else {
					pager += '<li class="page-item"><a class="page-link pnum" href="#" style="color:black;">' + i + '</a></li>';

				}
			}
			pager += '</ul>'

			//다음버튼 
			if (res.tpage > res.epage) {
				pager += '<ul class="pagination">';
				pager += ' <li class="page-item"><a class="page-link next" href="#" style="color: black;">Next</a></li>'
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
	



reviewGo = function(name){
			//location.href='/DTkkiri/reviewList.do?name=' + name;
			window.open('/DTkkiri/reviewList.do?name=' + name, width=500, height=1500);
}
	