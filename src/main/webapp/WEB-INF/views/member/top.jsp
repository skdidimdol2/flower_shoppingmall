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
					<!-- 
					<%
						if (session.getAttribute("id") != null) {
					%>
					${sessionScope.name}님 환영합니다&emsp;&emsp;
					<%
						}
					%>
					-->	
					<%
						if (session.getAttribute("id") == null) {
					%>
					<a href="../member/loginForm">Login</a>&emsp;&emsp;
					<%
						} else {
					%>
					<a href="../member/logout">logout</a><span></span>&emsp;
					<%
						}
					%>
					<!--
					<a href="cart">Cart</a>&emsp;&emsp; <a href="order">Order</a>&emsp;&emsp;
					-->
					<a href="../member/myPage">My Page</a>
				</div>
			</div>
		</section>
	</header>
</body>	