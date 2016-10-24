<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>	
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!-- fn은 jstl에서 substring을 사용하기 위해서 -->
<!DOCTYPE>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- start: Css -->
<link rel="stylesheet"
	href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script
	src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script> 
<title>리뷰보기</title>
<style>
	body{
		margin:10;
	}
</style>
</head>
<body>
	<div>
		<form action="" method="post">
			<h4>리뷰 보기</h4>
			<input type="text" name="item_no" value="${dto.item_no}" readonly/>
			<p></p>
			<input type="text" name="title"  placeholder="글제목" style="height:30;width:300" value="${dto.review_tit}">
			<p></p>
			<textarea name="content" rows="40" cols="200" style="width:95%;height:300px;resize:none;" wrap="hard">${dto.review_con}</textarea>
			<p></p>
			<button id="updateBtn" class="btn btn-primary" onclick="reviewSubmit()">수정</button>
			<button id="deleteBtn" class="btn btn-primary" onclick="deleteSubmit()">삭제</button>
			<button id="writeClose" class="btn btn-primary" onclick="boardClose()">닫기</button>
		</form>
	</div>
	
	<script>	
		function reviewSubmit(){
			if(confirm("이대로 수정 하시겠습니까?")==true){
				form.submit();
			}
		}
		function deleteSubmit(){
			if(confirm("이 글을 삭제 하시겠습니까?")==true){
				location.href="";
			}
		}
	</script>		
	
</body>
</html>