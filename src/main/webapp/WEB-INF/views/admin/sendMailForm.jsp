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
<title>Flower</title>
<style>
	body{
		margin:10;
	}
</style>
</head>
<body>
	<form action="adminSendMail" method="POST">
		<h4>이메일 쓰기</h4>
		<!-- sessionScope.id -->
		<input type="hidden" name="id" value="${sessionScope.id}"/>
		<!-- sessionScope.name -->
		<label for="sender">보내는 사람</label>
		<input type="text" name="sender" id="sender" value="${sessionScope.name}" readonly/><br>
		<label for="receiver">받는 사람</label>
		<input type="text" name="receiver" id="receiver" value=""/>
		<p></p>
		<input type="text" name="title"  placeholder="글제목" style="height:30;width:300">
		<select name="category" id="category" style="height:30">
			<option value="">종류</option>
			<option value="공지">공지</option>
			<option value="광고">광고</option>
			<option value="">일반</option>
		</select>
		
		<p></p>
		<textarea name="content" rows="40" cols="200" style="width:95%;height:300px;resize:none;" wrap="hard"></textarea>
		<p></p>
		<button id="mailWrite" class="btn btn-primary" onclick="mailSubmit()">보내기</button>
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
	
	function mailSubmit(){
		if(confirm("메일을 보내시겠습니까?")==true){
			form.submit();
		}
	}
</script>
</body>
</html>