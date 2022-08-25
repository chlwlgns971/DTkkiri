<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
   <%--여기 다 부트스트랩 코드 --%>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
    <meta name="description" content="" />
    <meta name="author" content="" />
    <title>Bare - Start Bootstrap Template</title>
   

    <!-- Favicon-->
    <link rel="icon" type="image/x-icon" href="assets/favicon.ico" />
   
    <!-- Core theme CSS (includes Bootstrap)-->
    <link href="../css/styles.css" rel="stylesheet" />
   
    <!-- CSS only -->
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">

	<!-- JavaScript Bundle with Popper -->
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
	<%----------------- --%>

	<script src="../js/restaurant.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/jquery@3.6.0/dist/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script>
	<!-- Bootstrap core JS--> 
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
	<!-- Core theme JS-->
	<script src="../js/scripts.js"></script>


</head>
<style>
	#pagelist {
		margin : 10px;
		margin-left : 45%;	
	}
	.card-img-top {
 		 height: 15rem;
 		 object-fit: cover;
	}

	
</style>
<script>
	$(function(){
		
		listPageServer(1);
		
		// 이전버튼 이벤트
		$(document).on('click', '.prev', function(){
			//alert($('.plist a').first().text());
			currentPage = parseInt($('.plist a').first().text().trim())-1;
			
			listPageServer(currentPage);
		})
		
		// 다음버튼 이벤트 
		$(document).on('click', '.next', function(){
			//alert($('.plist a').last().text());
			currentPage = parseInt($('.plist a').last().text().trim())+1;
			
			listPageServer(currentPage);
		})
		
		// 페이지 번호 이벤트 (text로 가져올것)
		$(document).on('click', '.plist a', function(){
			//alert($(this).text());
			currentPage = $(this).text().trim();
			
			listPageServer(currentPage);
		})
		
		$(document).on('click','#btn', function(){
			name = $(this).parents('.revcard').find('#resname').text();
			
			reviewGo(name);
		})	
		
		
	})

</script>    
<body>
       
    <div class="box">
	</div>
	<div id="pagelist"></div>
	<div id="reviewText"></div>
    </body>
</html>
