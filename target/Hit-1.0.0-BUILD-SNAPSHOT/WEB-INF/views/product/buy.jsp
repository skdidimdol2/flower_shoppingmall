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
<script type="text/javascript">
var buy_vol="<%=request.getParameter("buy_vol")%>";
var totalprice=0;
function mul(a){
	totalprice = (buy_vol*a);
	document.write(totalprice);
}
</script>
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
		<h3><b><font color="red">주문서</font></b>  >  결제완료</h3>
		<div class="buy3">
		상품 이름 : ${list.item_name}<br>
		이미지 : <img src="${list.img }"><br>
		카테고리 : ${list.category}<br>
		가격 : ${list.price}<br>
		남은 수량 : ${list.volume}<br>
		구매 수량 : <h3><%=request.getParameter("buy_vol") %></h3><br>
		상품 상세 설명 : ${list.item_content }
		
		item_name,img,category,price,volume
		<script type="text/javascript">		
		mul(${list.price});
		</script>
		</div>
	</div>
</div>
<div class="a" align="center">
 <a href="#">결제하기</a>  |  <a href="#">취소</a>
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