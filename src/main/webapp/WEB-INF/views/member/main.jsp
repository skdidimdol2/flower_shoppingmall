<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>	
<!DOCTYPE>
<html>

<!-- 도해추가 -->
<%@include file="top.jsp"%>
<script type="text/javascript"
		src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.0/jquery.min.js"></script>
<script type="text/javascript"
		src="../resources/js/jquery.eislideshow.js"></script>
<script type="text/javascript"
		src="../resources/js/jquery.easing.1.3.js"></script>
<script type="text/javascript">

$(function() {
	$('#ei-slider').eislideshow({
		animation : 'center',
		autoplay : true,
		slideshow_interval : 2000,
		titlesFactor : 0
	});
});
</script>

<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script
	src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>


<jsp:include page="../include/style.jsp"></jsp:include>

<title>Flower</title> 
</head>
<body>

<%-- 	<header>
		<div class="contatiner-fluid">
			<div id="users">
				<c:if test="${sessionScope.id!=null}">
					<b>${sessionScope.name}</b>님 환영합니다&emsp;&emsp;
				</c:if>
				<c:if test="${sessionScope.id.equals('admin123')==true}">
					<a href="../admin/main" style="color:blue">관리자페이지로 이동</a>&emsp;&emsp;
				</c:if>
				<c:choose>
					<c:when test="${sessionScope.id==null}">
						<a href="loginForm">Login</a>&emsp;&emsp;
					</c:when>
					<c:otherwise>
						<a href="logout">logout</a><span></span>&emsp;&emsp;
					</c:otherwise>
				</c:choose>
				<a href="../basket/mybasket">Cart</a>&emsp;&emsp;
				<a href="order">Order</a>&emsp;&emsp;
				<a href="myPage">My Page</a>&emsp;&emsp;
			</div>		
			<a href="main">Flower</a>
		</div>
	</header> --%>
	
<!--	
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
	</nav> -->
		
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
					<a href="../product/detail?item_no=8"><img alt="flower" src="../resources/image/flower8.jpg" style="width: 100%;height:30%" class="img-responsive"></a>
					<div>카네이션꽃바구니</div>
					<span style="font-size:15;color:red"><b>&nbsp;가격</b></span>
					<span><b>20,000원</b></span>
					<p></p>
				</div>
			</div>
			<div class="col-sm-4">
				<div onclick="Moving();">
					<a href="../product/detail?item_no=10"><img alt="flower" src="../resources/image/flower10.jpg" style="width:100%;height:30%" class="img-responsive"></a>
					<div>누군가에게</div>
					<span style="font-size:15;color:red"><b>&nbsp;가격</b></span>
					<span><b>5,000원</b></span>
					<p></p>
				</div>
			</div>
			<div class="col-sm-4">
				<div onclick="Moving();">
					<a href="../product/detail?item_no=11"><img alt="flower" src="../resources/image/flower11.jpg" style="width:100%;height:30%" class="img-responsive"></a>
					<div>너만을 사랑해 </div>
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
					<a href="../product/detail?item_no=22"><img alt="flower" src="../resources/image/flower22.jpg" style="width:100%;height:30%" class="img-responsive"></a>
					<div>축하수국3단</div>
					<span style="font-size:15;color:red"><b>&nbsp;가격</b></span>
					<span><b>200,000원</b></span>
					<p></p>
				</div>
			</div>
			<div class="col-sm-4">
				<div onclick="Moving();">
					<a href="../product/detail?item_no=18"><img alt="flower" src="../resources/image/flower18.jpg" style="width:100%;height:30%" class="img-responsive"></a>
					<div>만천홍</div>
					<span style="font-size:15;color:red"><b>&nbsp;가격</b></span>
					<span><b>120,000원</b></span>
					<p></p>
				</div>
			</div>
			<div class="col-sm-4">
				<div onclick="Moving();">
					<a href="../product/detail?item_no=27"><img alt="flower" src="../resources/image/flower27.jpg" style="width:100%;height:30%" class="img-responsive"></a>
					<div>고급화환3단</div>
					<span style="font-size:15;color:red"><b>&nbsp;가격</b></span>
					<span><b>230,000원</b></span>
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
<script>
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