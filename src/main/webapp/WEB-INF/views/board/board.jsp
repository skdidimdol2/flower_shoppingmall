<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>	
<!DOCTYPE>
<html>
<!-- top.jsp에 top부분 내용 기술. -->
<%@include file="../member/top.jsp"%>
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

<%-- board --%>

	#left_nav{
		margin-top:10;
		margin-bottom:10;
		
	}	
	#board_list{
		align:center;
		margin-left:20px;
		margin-right:20px;
		width:100%;
		max-width:900px;
	}
	#writeFormBtn{
		margin-top:50px;
		float:right;
		
	}
</style>

</head>
<body>

<!-- board -->

	<div class="text-center" id="board_list">
		<p></p>
		<b style="font-size:24">게시판</b>
		<p></p>
		<form action="boardSearch" method="get">
			<select name="type" id="type" style="height:30">
				<option value="title">제목</option>
				<option value="content">내용</option>
				<option value="name">작성자</option>
				<option value="category">카테고리</option>
			</select>
			<input type="text" name="query" style="height:30"/>
			<input type="submit" class="btn btn-primary" value="검색"/>
			<p></p>
			<table style="width:100%;" class="text-center table table-striped">
				<thead>
					<tr style="background-color:8888c8">
						<td>글번호</td>
						<td>이름</td>
						<td>제목</td>
						<td>카테고리</td>
						<td>조회수</td>
						<td>등록일</td>
					<tr>
				</thead>
				<tbody>
					<c:forEach items="${list}" var="dto">
						<tr onclick="boardContent(${dto.board_no});" style="cursor:pointer;">
							<td>${dto.board_no}</td>
							<td>${dto.name}</td>
							<td>${dto.title}</td>
							<td>${dto.category}</td>
							<td>${dto.hits}</td>
							<td>${dto.post_date}</td>
						</tr>
					</c:forEach>
				</tbody>	
			</table>
			<p></p>
			<button onclick="writeForm()" type="button" class="btn btn-primary" id="writeFormBtn">글쓰기</button>
		<!-- bootstrap 의 pagination 사용-->	
			<ul class="pagination">
				<c:forEach var="cnt" begin="1" end="${count/16+1}">
					<li><a href="boardList?strNum=${(cnt-1)*15+1}">${cnt}</a></li>
				</c:forEach>
			</ul>
		</form>
	</div>
<script>
	$(document).ready(function(){
		$()
	});
	function writeForm(){
		if(${sessionScope.id == null}){
			alert("로그인 후 이용해 주세요.");
			location.href="../member/loginForm";
		}else{
			var option = "toolbar=no, menubar=no, location=no, directories=no, status=no, scrollbars=no,"
			option += "resizable=no, width=500, height=500, top=100, left=300";
			window.open("boardWriteForm","",option);
		} 
	}
<%-- javascript에서 +연산자를 사용하기 위해서 Number()사용 --%>	
	function paging(cnt){
		location.href="boardList?strNum="+Number((cnt-1)*15+1);
	}
	function boardContent(no){
		location.href="boardContent?board_no="+no;
	}
</script>	
</body>
</html>