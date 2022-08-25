<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="http://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js">
</script>
<script>
var apiURI = "https://api.openweathermap.org/data/2.5/weather?q=daejeon&appid=f4b1c6882c589c4f858bc7e7c459df9c";

$(function(){
	$.ajax({
	    url: apiURI,
	    dataType: "json",
	    type: "GET",
	    async: "false",
	    success: function(resp) {
	        console.log(resp);
	        console.log("현재온도 : "+ (resp.main.temp- 273.15) );
	        console.log("현재습도 : "+ resp.main.humidity);
	        console.log("날씨 : "+ resp.weather[0].main );
	        console.log("상세날씨설명 : "+ resp.weather[0].description );
	        console.log("날씨 이미지 : "+ resp.weather[0].icon );
	        console.log("바람   : "+ resp.wind.speed );
	        console.log("나라   : "+ resp.sys.country );
	        console.log("도시이름  : "+ resp.name );
	        console.log("구름  : "+ (resp.clouds.all) +"%" );  
	        

	        imgURL = "http://openweathermap.org/img/wn/" + resp.weather[0].icon + ".png";   
	        $(".CurrIcon").attr("src", imgURL);
	        $(".City").html("대전  현재온도 : " + parseInt(resp.main.temp- 273.15) +"℃");
	        //$(".City").html("현재지역 : " + resp.name);
	        //$(".CurrTemp").html("현재온도 : " + parseInt(resp.main.temp- 273.15));
	        //$('#citytemp').html("대전  현재온도 : " + parseInt(resp.main.temp- 273.15) +"℃");
	    }
	})


})


</script>

<style>
	#image{
		background : orange;
	}
	#city{
		background : #FD6F22;
		color : white;
		font-weight: bold;

		padding : 10px;
	}
	#temp{
		background : #FD6F22;
		color : white;
		font-weight: bold;
	}
	table{
		border : 1px solid #FD6F22;
		border-collapse: collapse;
	}
	#citytemp{
		background : #FD6F22;
		color : white;
		font-weight: bold;

		padding : 10px;
	}
	.weather{
		display: flex;
    	align-items: center;
	}
</style>
</head>
<body>

<div class="weather">
	<img class='CurrIcon'><span class='City'></span>
	<!-- <div class='CurrTemp'></div>
	<div class='City'></div> -->
</div>
<br><br><!-- ---------------------------- -->
<!-- 
<table>
	<tr><td colspan="2" id="image"><div style="text-align:center;"><img class='CurrIcon'></div></td></tr>
	 <tr><td class='City' id="city"></td><td class='CurrTemp' id="temp"></td></tr>
	
	<tr><td id="citytemp" colspan="2"></td></tr>

</table>

 -->

</body>
</html>