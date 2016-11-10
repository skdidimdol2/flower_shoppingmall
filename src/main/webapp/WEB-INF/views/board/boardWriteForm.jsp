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
<title>글쓰기</title>
<style>
	body{
		margin:10;
	}
</style>
</head>
<body>
	<form action="boardWrite" method="POST">
		<h4>글쓰기</h4>
		<!-- sessionScope.id -->
		<input type="hidden" name="id" value="${sessionScope.id}"/>
		<!-- sessionScope.name -->
		<input type="text" name="name" value="${sessionScope.name}" readonly/>
		<p></p>
		<input type="text" name="title"  placeholder="글제목" style="height:30;width:300">
		<select name="category" id="category" style="height:30">
			<option value="꽃바구니">꽃바구니</option>
			<option value="꽃다발">꽃다발</option>
			<option value="꽃상자">꽃상자</option>
			<option value="동양란">동양란</option>
			<option value="서양란">서양란</option>
			<option value="축하화환">축하화환</option>
			<option value="근조화환">근조화환</option>
		</select>
		
		<p></p>
		<textarea name="content" rows="40" cols="200" style="width:95%;height:300px;resize:none;" wrap="hard"></textarea>
		<p></p>
		<button id="boardWrite" class="btn btn-primary" onclick="boardSubmit()">글등록</button>
		<input type="reset" class="btn btn-primary" value="다시쓰기"/>
	</form>
	
<script>
	$(document).ready(function(){
		var num = ${requestScope.num};
		if(num == 1){
			window.opener.location.href= window.opener.location.href;
			window.close();
		}	
	});
	
	function boardSubmit(){
		if(confirm("글을 등록 하시겠습니까?")==true){
			form.submit();
		}
	}
</script>
</body>
</html>