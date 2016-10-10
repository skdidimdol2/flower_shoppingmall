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
<title>Flower</title>
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
			<a href="main">Flower</a>
		</div>
	</header>
<!-- board -->
	<div class="container">
		<div class="row">
			<div class="col-lg-4">
				<p></p>
				<b style="font-size:24">자유게시판 </b>
				<p></p>
				<table style="width:100%;" border="1" class="text-center">
				<tr style="background-color:ff5555">
					<td>글번호</td>
					<td>아이디</td>
					<td>이름</td>
					<td>제목</td>
					<td>내용</td>
					<td>카테고리</td>
					<td>조회수</td>
					<td>등록일</td>
				<tr>
					<c:forEach items="${list}" var="dto">
						<tr>
							<td>${dto.board_no}</td>
							<td>${dto.id}</td>
							<td>${dto.name}</td>
							<td>${dto.title}</td>
							<td>${dto.content}</td>
							<td>${dto.category}</td>
							<td>${dto.hits}</td>
							<td>${dto.post_date}</td>
							<td><a href="delete?mId=${dto.board_no}">X</a></td>   <!-- 멤버 삭제 -->
						<tr>
					</c:forEach>
				</table>
				<p></p>
			</div>
		</div>
	</div>	
<p><a href="writeForm">글작성</a></p>
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