<!-- 구매 페이지 -->

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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

<title>구매 페이지</title>    
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
		<%-- footer --%>
	#footer {
		background-color:#ddddff;  
	} 
</style>

</head>
<body>

<!--header -->
	<header>
		<div class="contatiner-fluid">
			<div id="users">
				<a href="../basket/mybasket"><span class="glyphicon glyphicon-gift">장바구니</span></a>
				<a href="#"><span class="glyphicon glyphicon-user"></span>내정보</a>
				<a href="#"><span class="glyphicon glyphicon-log-in"></span>로그인</a>
			</div>
			<a href="../member/main">Flower</a>
		</div>
	</header>

<div class="basket1" style="margin-bottom: 50;margin-right: 10">
	<div class="basket2" style="margin-left: 100;margin-bottom: 10;margin-right: 10">
	&nbsp;&nbsp;&nbsp;&nbsp;
		<h3>장바구니 목록  >  <b><font color="red">주문서</font></b>  >  결제완료</h3>
		<c:set var="sum" value="0"/>
		<c:forEach items="${list}" var="val">
			상품이름 : ${val.item_name }<br>
			<img src="${val.img }" width="400"><br>
			카테고리 : ${val.category }<br>
			구매수량 : ${val.buy_vol}<br>
			가격 : ${val.price}<br>
			장바구니 번호 : ${val.basket_no}<br>
			<c:set var="sum" value="${sum+val.price}"/>
		</c:forEach>
		총 가격 : <c:out value="${sum}"></c:out>
	</div>
</div>
</body>
</html>
<!-- footer -->	
	<footer class="container-fluid text-left" id="footer">
		
		<div style="margin-left:40px;margin-bottom:15px;">
			<br>
			상호 : Flower  |  Tel : 112  |  Fax : 119<br>
			주소 : 대한민국 꽃밭 어디든<br>
			Copyright ⓒ <b>Java Study</b> All rights reserved. 
		</div>
	</footer>