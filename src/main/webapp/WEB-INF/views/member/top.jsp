<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link
	href='http://fonts.googleapis.com/css?family=Open+Sans+Condensed:300|Playfair+Display:400italic'
	rel='stylesheet' type='text/css' />
<link rel="stylesheet" type="text/css" href="../resources/css/reset.css" />
<link rel="stylesheet" type="text/css" href="../resources/css/top.css" />
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<style type="text/css">
@import url(https://fonts.googleapis.com/css?family=Lato:400,700);
</style>
</head>
<body>
	<header>
		<section>
			<div id="container_top">
				<div id="left_top">
					<% 
					if (session.getAttribute("id") != null) {
						if (session.getAttribute("id").equals("admin123")==true){
					%>
					<a href="../admin/main" style="color:blue">Admin Page</a>&emsp;&emsp;
					
					<%
						}else{
					%>
							
							<a href="../member/main">Flower</a>
					<%
						}
					}else{
					%>
					<a href="../member/main">Flower</a>
					
					<%
						}
					%>
				</div>
				<div id="right_top">
					<%
						if (session.getAttribute("id") != null) {
					%>
					${sessionScope.id}님 환영합니다&emsp;&emsp;
					<%
						}
					%>
						
					<%
						if (session.getAttribute("id") == null) {
					%>
					<a href="loginForm">Login</a>&emsp;&emsp; <a href="joinForm">Join</a>&emsp;&emsp;
					<%
						} else {
					%>
					<a href="logout">logout</a><span></span>&emsp;&emsp;
					<%
						}
					%>
					<a href="cart">Cart(0)</a>&emsp;&emsp; <a href="order">Order</a>&emsp;&emsp;
					<a href="myPage">My
						Page</a>
				</div>
			</div>
		</section>
		
		
		
		
		<section class="menus">
		<nav class="navbar navbar-default">
		<div class="container-fluid">
			<div class="navbar-header" id="mobileNavbar">
				<form action="main" method="get" autocomplete="on">
					<input type="submit" class="navbar-toggle" value="검색" />
					<input type="text" name="item_name" class="navbar-toggle"
						style="width: 150px;" placeholder="검색어 입력" />
					<button type="button" class="navbar-toggle" data-toggle="collapse"
						data-target="#pcNavbar">
						<span class="icon-bar"></span>
						<span class="icon-bar"></span>
						<span class="icon-bar"></span>
					</button>
				</form>
			</div>

			<div class="collapse navbar-collapse" id="pcNavbar">
			<nav class="menu-effect">
			<ul class="nav navbar-nav">
					<li><a href="../member/main">홈 <span class="glyphicon glyphicon-home"></span></a></li>
					<li><a href="../product/list?category=꽃바구니">꽃바구니</a></li>
					<li><a href="../product/list?category=꽃다발">꽃다발</a></li>
					<li><a href="../product/list?category=꽃상자">꽃상자</a></li>
					<li><a href="../product/list?category=동양란">동양란</a></li>
					<li><a href="../product/list?category=서양란">서양란</a></li>
					<li><a href="../product/list?category=축하화환">축하화환</a></li>
					<li><a href="../product/list?category=근조화환">근조화환</a></li>
					<li><a href="../board/boardList">게시판</a></li>
					
					
					
				</ul>
					<!-- <a href="main" data-hover="Home">Home</a>
                    <a href="../product/list?category=꽃바구니" data-hover="꽃바구니">꽃바구니</a>
                    <a href="../product/list?category=꽃다발" data-hover="꽃다발">꽃다발</a>
                    <a href="../product/list?category=꽃상자" data-hover="꽃상자">꽃상자</a>
                    <a href="../product/list?category=동양란" data-hover="동양란">동양란</a>
                    <a href="../product/list?category=서양란" data-hover="서양란">서양란</a>
                    <a href="../product/list?category=축하화환" data-hover="축하화환">축하화환</a>
                    <a href="../product/list?category=근조화환" data-hover="근조화환">근조화환</a>
                    <a href="../board/boardList" data-hover="자유게시판">자유게시판</a> -->
			</nav>		
			</div>
			</div>
			</nav>
		</section>
	</header>