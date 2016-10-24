<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>	
<!DOCTYPE>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<%@include file="header.jsp"%>
<title>admin Page</title> 


</head>

<body>

	<div class="content-wrapper">

		<div class="container">
			<div class="row">
				<div class="col-md-12">
					<h4 class="page-head-line">Add Product Page - Excel Upload</h4>
				</div>
			</div>

			<div id="content">

				<ul class="nav nav-tabs">
					<li class="active"><a href="itemMan">상품목록</a></li>
					<li class="active">
					    <a class="dropdown-toggle" data-toggle="dropdown" href="#">상품
				        <span class="caret"></span></a>
						<ul class="dropdown-menu">
							<li><a href="insertItem">단품</a></li>          
							<li><a href="addProduct">서식 업로드</a></li>          
							<li><a href="excelDownload">서식 다운로드</a></li>         
						</ul>      
					</li>
				</ul>
				<br>

				<div class="panel panel-default">


	
			<table class="table table-hover">
				<tr>
					<form name="f" action="excelUpload" method="post" enctype="multipart/form-data">
					<td> 상품추가 엑셀서식 업로드  : </td><td><input type="file" name="addfile"></td> <td><input type="submit" value="업로드"></td>
						</form>
				</tr>
			</table></div>
			<p></p>
			
			<c:if test="${empty i }"></c:if>
			<c:if test="${not empty i }"><div class="panel panel-default" align="center"><%@include file="excel_addProduct.jsp"%></div> </c:if>
	</div></div></div>
</body>
</html>