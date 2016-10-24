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

	<div class="content-wrapper">

		<div class="container">
			<div class="row">
				<div class="col-md-12">
					<h4 class="page-head-line">Product Page</h4>
				</div>
			</div>

			<ul class="nav nav-tabs">
					<li class="active"><a id="freeClick" onclick="free()">상품목록</a></li>
					<li class="active">
				      	<a class="dropdown-toggle" data-toggle="dropdown" href="#">상품
				        <span class="caret"></span></a>
				        <ul class="dropdown-menu">
				          <li><a href="insertItem">단품</a></li>
				          <li><a href="addProduct">서식 업로드</a></li>
				          <li><a href="excelDownload">서식 다운로드</a></li>
				        </ul>
				     </li></ul>
			<div id="content">
			
			<br>
			
				<div class="panel panel-default">
						<table class="table table-hover">
							<tr>
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
									<td align="center"><a
										href="modifyItem?item_no=${item.item_no }">${item.item_name}</a></td>
									<td align="center">${item.category}</td>
									<td align="center">${item.price}</td>
									<td align="center">${item.volume}</td>
									<td align="center">${item.reg_date }</td>
								</tr>
							</c:forEach>
						</table>
					</div>
				</div>
			</div>
		</div>
		<script>
		$(document).ready(function(){
			$('.item').addClass('menu-top-active');
			
		});
		</script>
</body>
</html>