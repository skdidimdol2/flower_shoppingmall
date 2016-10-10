<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>	
<!DOCTYPE>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script
	src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script type="text/javascript">
function readImg(input){
	if(input.files&&input.files[0]){
		var reader = new FileReader();
		reader.onload = function (e) {
            $('#blah')
                .attr('src', e.target.result)
                .width(400)
                .height(300);
        };

        reader.readAsDataURL(input.files[0]);
    }
}
</script>
<style>
	
<%-- header --%> 
	a{text-decoration:none;}
	a:hover{text-decoration:none;}
	a:active{text-decoration: none}
	
	header>div>a{
		font-size:40px; 
		color:#000000;
		text-shadow:2px 2px #000000;
		margin-left:10px;  
	} 
	header>div>a:hover{
		text-decoration:none; 
	} 
	
	#users{
		float:right;
	}
	#users>a{
		color:#000000;
	}
	#users>a:hover{
		text-decoration:none; 
	}
<%-- navbar --%> 
	.navbar {
    	margin-bottom: 0;
    	border-radius: 0;
    	background-color: #ff5555;
    }
    .navbar-header{
    	width:100%
    }
    #mobileNavbar .navbar-toggle{
    	background-color:#ffffff;
    }
    #mobileNavbar>form>a{
    	color: #ff5555; 
    }
    .navbar-default .navbar-toggle .icon-bar{
    	background-color:#ff5555;
    	padding-top:4px; 
    } 
    #mobileNavbar>form>input{
    	background-color: #ffffff; 
    }
    
    .nav{
    	margin-top:-10px;
    }
    #pcNavbar>ul>li>a{
    	color: #ffffff;
    }
    #pcNavbar>ul>li>a:hover{
    	background-color:#ffffff;
    	color:#ff5555;
    	font-size:17px; 
    }
<%-- carousel --%>
	.carousel-inner > .item > img,
  	.carousel-inner > .item > a > img {
    	width: 100%;
    	height:300px;
    	margin: auto;
  	}
<%-- main list --%>
	h3{
		width:100%
	}
	
	.container>.row>.col-sm-4>div{
		border:1px solid;
		border-color:#dddddd;
		font-family:고딕
	}
	.container>.row>.col-sm-4>div>div{
		margin-left:7px;margin-top:7px;
	}
  	
<%-- div class image --%>
	.second{
		background-size:100% 100% ;
		background-repeat: no-repeat; ;
		background-image:url('../resources/image/액자.jpg'); 
		margin-left: 60;margin-right:140; margin-top: 100;margin-bottom: 60;
		text-align:center;
	}

<%-- footer --%>
	#footer {
		background-color:#ddddff;
	}  	
</style>
<title>admin Page</title> 
</head>
<body>
<!--header -->
	<header>
		<div class="contatiner-fluid">		
			<a href="main">관리자 페이지</a>
			<div id="users">
				<c:if test="${sessionScope.id!=null}">
					${sessionScope.id}님 환영합니다&emsp;&emsp;
				</c:if>
				<c:choose>
					<c:when test="${sessionScope.id==null}">
						<a href="../member/loginForm">Login</a>&emsp;&emsp;
					</c:when>
					<c:otherwise>
						<a href="../member/logout">logout</a><span></span>&emsp;&emsp;
					</c:otherwise>
				</c:choose>
				<a href="../basket/mybasket">Cart</a>&emsp;&emsp;
				<a href="../member/order">Order</a>&emsp;&emsp;
				<a href="../member/myPage">My Page</a>&emsp;&emsp;
			</div>
		</div>
	</header>
<!-- navbar -->	
	<nav class="navbar navbar-default">
		<div class="container-fluid">
			<div class="navbar-header" id="mobileNavbar">
				<form action="main" method="get" autocomplete="on">
					<button type="button" class="navbar-toggle" data-toggle="collapse"
							data-target="#pcNavbar"> 
							<span class="icon-bar"></span>
							<span class="icon-bar"></span>
							<span class="icon-bar"></span>
					</button>
				</form>	
			</div>
		
			<div class="collapse navbar-collapse" id="pcNavbar">
				<ul class="nav navbar-nav">
					<li><a href="../member/main">홈 <span class="glyphicon glyphicon-home"></span></a></li>
					<li><a href="javascript:void(0);">회원 관리</a></li>
					<li><a href="itemMan">상품 관리</a></li>
					<li><a href="javascript:void(0);">게시판 관리</a></li>
					<li><a href="admin_sales?bool=0">매출 관리</a></li>
					<li><a href="javascript:void(0);">배송 관리</a></li>			
				</ul>
			</div>
		</div>
	</nav>
	
	<div class="first">
		<div class="second">			
		<p></p>
			<p></p>
			<form action="adminInsitem" method="get">
			<img src="">
			<input type="file" accept=".gif, .jpg, .png" name="img" onchange="readImg(this);"><br>
			<img id="blah" src="#" alt="이미지를 첨부하여 주세요" /><br><br>

			<b>상품명  :</b><br>  <input type="text" name="item_name" size="20">  <br><br>
			<select id="category" name="category">
				<option value="0">카테고리</option>
				<option value="꽃바구니">꽃바구니</option>
				<option value="꽃다발">꽃다발</option>
				<option value="꽃상자">꽃상자</option>
				<option value="동양란">동양란</option>
				<option value="서양란">서양란</option>
				<option value="축하화환">축하화환</option>
				<option value="근조화환">근조화환</option>
			</select><br><br>
			<b>수량  :</b><br> <input type="text" name="volume" size="10"> <br><br>
			<b>가격  :</b><br> <input type="text" name="price" size="10"> <br><br>
	
			상세내용<br><br>
			<textarea rows="6" cols="50" name="item_content" ></textarea>
			<br><br>
			<input type="submit" value="상품 추가"><br>
			</form>
			
		</div>
	
	</div>


<!-- footer -->	
	<footer class="container-fluid text-left" id="footer">
		
		<div style="margin-left:40px;margin-bottom:15px;">
			<br>
			상호 : Flower  |  Tel : 112  |  Fax : 119<br>
			주소 : 대한민국 꽃밭 어디든<br>
			Copyright ⓒ <b>Java Study</b> All rights reserved. 
		</div>
	</footer>
</body>
</html>