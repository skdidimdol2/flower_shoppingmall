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
<%-- board --%>	
	
	#left_nav{
		margin-top:10;
		margin-bottom:10;
		
	}
	#board_content{
		position:absolute;
		left:200px;
		width:900px;
	}
	.btn{
		float:right;
		margin-bottom:10;
		margin-left:6;
	}
	#content_textarea{
		height:100%;width:100%;outline-style:none;border:none;resize:none;
	}
	
<%-- reply --%>
	#reply_board{
		border:1px solid;
		border-color:#8888ff;
		padding:5;
		margin-top:55;
	}
	#reply_form1{
		margin-top:15;
		margin-right:80;
	}
	#reply_form2{
		margin-top:15;
		margin-right:80;
	}
	<%-- 댓글 textarea --%>
	#reply_text{
		width:600;height:80;resize:none;
	}
	#reply_btn{
		width:60;height:80;
	}
</style>	
</head>
<body>
<!--header -->
	<header>
		<div class="contatiner-fluid">
			<div id="users">
				<c:if test="${sessionScope.id!=null}">
					<b>${sessionScope.name}</b>님 환영합니다&emsp;&emsp;
				</c:if>
				<c:if test="${sessionScope.id.equals('admin123')==true}">
					<a href="../admin/main" style="color:blue">관리자페이지로 이동</a>&emsp;&emsp;
				</c:if>
				<c:choose>
					<c:when test="${sessionScope.id==null}">
						<a href="../member/loginForm">Login</a>&emsp;&emsp;
					</c:when>
					<c:otherwise>
						<a href="../member/logout">logout</a><span></span>&emsp;&emsp;
						<a href="../product/myorder">Order</a>&emsp;&emsp;
					</c:otherwise>
				</c:choose>
				<a href="../basket/mybasket">Cart</a>&emsp;&emsp;
				<a href="../member/wishList">Wish List</a>&emsp;&emsp;
				<a href="../member/myPage">My Page</a>&emsp;&emsp;
			</div>
			<a href="../member/main">Flower</a>
		</div>
	</header>
<!-- board -->
	
	<div class="text-center" id="board_content">
		<p></p>
		<b style="font-size:24">게시판 </b>
		<p></p>
			<button id="boardList" class="btn btn-primary" onclick="board()">목록보기</button>
			<!-- 회원 본인일때만 버튼이 나오도록 추가, 로그인 id값이랑 글쓴이 id값이랑 비교 -->
			<c:if test="${sessionScope.id==dto.id}">
				<button id="boardUpdate" class="btn btn-primary" onclick="boardUpdate()">글수정</button>
				<button id="boardDelete" class="btn btn-primary" onclick="boardDelete()">글삭제</button>
			</c:if>
			<table style="width:100%;" border="1" class="text-center">
				<tr> 
					<td style="background-color:ff5555">글번호</td>
					<td style="width:200">${dto.board_no}</td>
					<td style="background-color:ff5555">등록일</td>
					<td>${dto.post_date}</td>
				</tr>
				<tr>	
					<td style="background-color:ff5555">이름</td>
					<td>${dto.name}</td>
					<td style="background-color:ff5555">카테고리</td> 
					<td>${dto.category}</td>
				</tr>
				<tr>	
					<td style="background-color:ff5555">제목</td>
					<td>${dto.title}</td>
					<td style="background-color:ff5555">조회수</td>
					<td>${dto.hits}</td>
				</tr>
				<tr>	
					<td colspan="4" align="left" valign="top" style="height:250" >
					<textarea id="content_textarea" readonly>${dto.content}</textarea>
					</td>
				<tr>
			</table>	
			<p></p>
			<button id="boardReply1" class="btn btn-primary" onclick="boardReplyForm1()">댓글쓰기</button>
			<p></p>
		<div id="reply_board">
			<div style="height:20;"><b style="position:absolute;left:20px;">댓글 ${list.size()}</b></div>
			<p></p>
			<div id="reply_form1">
				<form id= "re_form1" action="boardReplyWrite" method="POST">
					<input type="hidden" name="id" value="${sessionScope.id}"/>
					<input type="hidden" name="name" value="${sessionScope.name}"/>
					<input type="hidden" name="board_no" value="${dto.board_no}">
					<input type="hidden" name="board_group" value="${dto.board_group}">
					<input type="hidden" name="board_step" value="${dto.board_step}">
					<input type="hidden" name="board_indent" value="${dto.board_indent}">
					<textarea rows="100" name="content" cols="100" id="reply_text" wrap="hard"></textarea>
					<button type="button" class="btn btn-primary" id="reply_btn" onclick="replyWrite1()">전송</button>
				</form>
			</div>
			<div id="reply_form2">
				<form id= "re_form2" action="boardReplyWrite" method="POST">
					<input type="hidden" name="id" value="${sessionScope.id}"/>
					<input type="hidden" name="name" value="${sessionScope.name}"/>
					<input type="hidden" name="board_no" value="${dto.board_no}">
					<input type="hidden" name="board_group" value="${dto.board_group}">
					<input type="hidden" name="board_step" id="board_step">
					<input type="hidden" name="board_indent" id="board_indent">
					<textarea rows="100" name="content" cols="100" id="reply_text" wrap="hard"></textarea>
					<button type="button" class="btn btn-primary" id="reply_btn" onclick="replyWrite2()">전송</button>
				</form>
			</div>	
			<hr>
			<c:forEach items="${list}" var="dt">
				<div style="margin-left:20" class="text-left">
					<c:forEach begin="2" end="${dt.board_indent}">&nbsp;&nbsp;&nbsp;&nbsp;</c:forEach>
					<b>${dt.name}</b>&nbsp;&nbsp;&nbsp;&nbsp;${dt.post_date}&nbsp;&nbsp;&nbsp;
					<button onclick="boardReplyForm2(${dt.board_step},${dt.board_indent});">댓글</button><br>
					
					<textarea id="content_textarea" style="position:relative;left:${(dt.board_indent-1)*18}px" readonly>${dt.content}</textarea>
				</div>
				<hr>
			</c:forEach>
		</div>
	</div>
<script>
	<%-- 게시판 리스트로 돌아가기--%>
	function board(){
		location.href="boardList"
	}
	<%-- 삭제 하기--%>
	function boardDelete(){
		if(confirm("삭제 하시겠습니까?")==true){
			location.href="boardDelete?board_no=${dto.board_no}";
		}
	}
	<%-- 업데이트 창 띄우기--%>
	function boardUpdate(){
		var option = "toolbar=no, menubar=no, location=no, directories=no, status=no, scrollbars=no,"
			option += "resizable=no, width=500, height=500, top=100, left=300";
			window.open("boardUpdateForm?board_no=${dto.board_no}","",option);
	}
	$("#reply_form1").hide();
	$("#reply_form2").hide();
	<%-- 댓글1 창 띄우기--%>
	function boardReplyForm1(){
		$("#reply_form2").hide();
		$("#reply_form1").toggle();
		if($("#boardReply1").text()=="댓글쓰기"){
			$("#boardReply1").text("취소");
		}else{
			$("#boardReply1").text("댓글쓰기");
		}
	}
	<%-- 댓글 전송 --%>
	function replyWrite1(){
		if(confirm("글을 등록 하시겠습니까?")==true){
			$("#re_form1").submit();
		}
	}
	
	<%-- 댓글의 댓글창 띄우기 --%>
	function boardReplyForm2(board_step, board_indent){
		$("#reply_form1").hide();
		$("#reply_form2").toggle();
		$("#board_step").val(board_step);
		$("#board_indent").val(board_indent);
	}
	<%-- 댓글 전송2 --%>
	function replyWrite2(){
		if(confirm("글을 등록 하시겠습니까?")==true){
			$("#re_form2").submit();
		}
	}
</script>			
</body>
</html>