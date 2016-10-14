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
  	
<%-- footer --%>
	#footer {
		background-color:#ddddff;  
	}  	
</style>
<title>Flower</title> 
</head>
<body>
<!--header -->
	<header>
		<div class="contatiner-fluid">
			<div id="users">
				<c:if test="${sessionScope.name!=null}">
					<b>${sessionScope.name}</b>님 환영합니다&emsp;&emsp;
				</c:if>
				<c:if test="${sessionScope.id.equals('admin123')==true}">
					<a href="../admin/main" style="color:blue">관리자페이지로 이동</a>&emsp;&emsp;
				</c:if>
				<c:choose>
					<c:when test="${sessionScope.name==null}">
						<a href="loginForm">Login</a>&emsp;&emsp;
					</c:when>
					<c:otherwise>
						<a href="logout">logout</a><span></span>&emsp;&emsp;
						<a href="../product/myorder">Order</a>&emsp;&emsp;
					</c:otherwise>
				</c:choose>
				<a href="../basket/mybasket">Cart</a>&emsp;&emsp;
				<a href="wishList">Wish List</a>&emsp;&emsp;
				<a href="myPage">My Page</a>&emsp;&emsp;
			</div>		
			<a href="main">Flower</a>
		</div>
	</header>
<!-- navbar -->	
	<nav class="navbar navbar-default">
		<div class="container-fluid">
			<div class="navbar-header" id="mobileNavbar">
				<form action="main" method="get" autocomplete="on">
					<input type="submit" class="navbar-toggle" value="검색"/>
					<input type="text" name="item_name" class="navbar-toggle" style="width:150px;" placeholder="검색어 입력"/>
					
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
					<li><a href="main">홈 <span class="glyphicon glyphicon-home"></span></a></li>
					<li><a href="../product/list?category=꽃바구니">꽃바구니</a></li>
					<li><a href="../product/list?category=꽃다발">꽃다발</a></li>
					<li><a href="../product/list?category=꽃상자">꽃상자</a></li>
					<li><a href="../product/list?category=동양란">동양란</a></li>
					<li><a href="../product/list?category=서양란">서양란</a></li>
					<li><a href="../product/list?category=축하화환">축하화환</a></li>
					<li><a href="../product/list?category=근조화환">근조화환</a></li>
					<li><a href="../board/boardList">게시판</a></li>
					
				</ul>
				<input type="text" style="width:170px;margin-bottom:10px;margin-left:3px;" placeholder=" 검색어 입력">
				<a href="#"><span class="glyphicon glyphicon-search" style="color:#ffffff"></span></a>
			</div>
		</div>
	</nav>
		
<!-- mainpage photo roll -->	
	<div id="mainCarousel" class="carousel slide">
	    <!-- Indicators -->
	    <ol class="carousel-indicators">
			<li class="item1 active"></li>
			<li class="item2"></li>
			<li class="item3"></li>
			<li class="item4"></li>
	    </ol>
	
	    <!-- Wrapper for slides -->
	    <div class="carousel-inner" role="listbox">
			<div class="item active">
			  <img src="../resources/image/img_flower1.jpg" alt="Flower1" width="460" height="345">
			</div>
			
			<div class="item">
			  <img src="../resources/image/img_flower2.jpg" alt="Flower2" width="460" height="345">
			</div>
			
			<div class="item">
			  <img src="../resources/image/img_flower3.jpg" alt="Flower3" width="460" height="345">
			</div>
			
			<div class="item">
			  <img src="../resources/image/img_flower4.jpg" alt="Flower4" width="460" height="345">
			</div>
    	</div>
	</div>
<!-- mainpage best item & new item -->	
	<div class="container">
		<div class="row">
			<p></p>
			<b style="font-size:24;margin-left:10px">인기상품 </b>&nbsp;|&nbsp;
			<a href="#">더보기</a>
			<p></p>
			<div class="col-sm-4">
				<div onclick="Moving();">
					<a href="../product/detail?item_no=1"><img alt="flower" src="../resources/image/flower1.jpg" style="width: 100%;height:30%" class="img-responsive"></a>
					<div>장미꽃다발</div>
					<span style="font-size:15;color:red"><b>&nbsp;가격</b></span>
					<span><b>10,000원</b></span>
					<p></p>
				</div>
			</div>
			
			<div class="col-sm-4">
				<div onclick="Moving();">
					<a href="../product/detail?item_no=2"><img alt="flower" src="../resources/image/flower2.jpg" style="width:100%;height:30%" class="img-responsive"></a>
					<div>카네이션꽃다발</div>
					<span style="font-size:15;color:red"><b>&nbsp;가격</b></span>
					<span><b>10,000원</b></span>
					<p></p>
				</div>
			</div>
			<div class="col-sm-4">
				<div onclick="Moving();">
					<a href="../product/detail?item_no=3"><img alt="flower" src="../resources/image/flower3.jpg" style="width:100%;height:30%" class="img-responsive"></a>
					<div>안개꽃다발 </div>
					<span style="font-size:15;color:red"><b>&nbsp;가격</b></span>
					<span><b>10,000원</b></span>
					<p></p>
				</div>
			</div>
		</div>	
		<div class="row">
			<p></p>
				<b style="font-size:24;margin-left:10px">신상품 </b>&nbsp;|&nbsp;
				<a href="#">더보기</a>
			<p></p>
			<div class="col-sm-4">
				<div onclick="Moving();">
					<a href="../product/detail?item_no=4"><img alt="flower" src="../resources/image/flower4.jpg" style="width:100%;height:30%" class="img-responsive"></a>
					<div>노란 장미꽃다발</div>
					<span style="font-size:15;color:red"><b>&nbsp;가격</b></span>
					<span><b>10,000원</b></span>
					<p></p>
				</div>
			</div>
			<div class="col-sm-4">
				<div onclick="Moving();">
					<a href="../product/detail?item_no=5"><img alt="flower" src="../resources/image/flower5.jpg" style="width:100%;height:30%" class="img-responsive"></a>
					<div>노란 장미 꽃바구니</div>
					<span style="font-size:15;color:red"><b>&nbsp;가격</b></span>
					<span><b>20,000원</b></span>
					<p></p>
				</div>
			</div>
			<div class="col-sm-4">
				<div onclick="Moving();">
					<a href="../product/detail?item_no=6"><img alt="flower" src="../resources/image/flower6.jpg" style="width:100%;height:30%" class="img-responsive"></a>
					<div>안개꽃바구니</div>
					<span style="font-size:15;color:red"><b>&nbsp;가격</b></span>
					<span><b>20,000원</b></span>
					<p></p>
				</div>
			</div>
		</div>
		
	</div>
	<br>
<!-- footer -->	
	<footer class="container-fluid text-left" id="footer">
		
		<div style="margin-left:40px;margin-bottom:15px;">
			<br>
			상호 : Flower  |  Tel : 112  |  Fax : 119<br>
			주소 : 대한민국 꽃밭 어디든<br>
			Copyright ⓒ <b>Java Study</b> All rights reserved. 
		</div>
	</footer>
	
<!-- javascript -->	
<script language="javascript" >
	$(document).ready(function(){
	    // Activate Carousel
	    $("#mainCarousel").carousel({interval: 3000, pause: "hover"});
	     
	    // Enable Carousel Indicators
	    $(".item1").click(function(){
	        $("#mainCarousel").carousel(0);
	    });
	    $(".item2").click(function(){
	        $("#mainCarousel").carousel(1);
	    });
	    $(".item3").click(function(){
	        $("#mainCarousel").carousel(2);
	    });
	    $(".item4").click(function(){
	        $("#mainCarousel").carousel(3);
	    });
	    
	});
	function Moving(){
		location.href="#";
	}
</script>	
</body>
</html>