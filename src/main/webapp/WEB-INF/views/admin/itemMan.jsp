<%@page import="com.fasterxml.jackson.annotation.JsonInclude.Include"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>	


<!DOCTYPE>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">

<%@ include file="header.jsp"%>

<title>admin Page</title> 
</head>
<body>
<div class="first">
	<div class="second" style="margin-left: 50;margin-top: 100">

		<table border="1" style="width: 700; width: 90%; "> 
		<tr style="background-color: red">
			<td align="center">상품 번호</td>
			<td align="center">상품명</td>
			<td align="center">카테고리</td>
			<td align="center">가격</td>
			<td align="center">수량</td>
			<td align="center">등록 일자</td>
		</tr>
		<c:forEach items="${item}" var="item"> 
			<tr>
				<td align="center">${item.item_no }</td>
				<td align="center"><a href="modifyItem?item_no=${item.item_no }">${item.item_name}</a></td>
				<td align="center">${item.category}</td>
				<td align="center">${item.price}</td>
				<td align="center">${item.volume}</td>
				<td align="center">${item.reg_date }</td>
			</tr>
		</c:forEach>
		</table>
		<a href="insertItem"><h3>새 상품 추가</h3></a>
	</div>
	<br><br><br><br><br>
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