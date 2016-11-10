<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE>
<html>
<head>
<meta charset=utf-8">
<title>회원정보 수정</title>
</head>
<body>
<center>
<h1>마이페이지</h1>
<hr>
<form action="modifyInfoProc" method="post">
<table border="1" cellpadding="0" cellspacing="0">	
	<input type="hidden" id="memberId" name="id" value="${dto.id}"/>
	<tr>
		<td bgcolor="orange">아이디</td>
		<td>${dto.id}</td>
	</tr>
	<tr>
		<td bgcolor="orange">비밀번호</td>
		<td><input type="password" name="password"></td>
	</tr>
	<tr>
		<td bgcolor="orange">이름</td>
		<td>${dto.name}</td>
	</tr>
	<tr>
		<td bgcolor="orange">생일</td>
		<td>${dto.birthday}</td>
	</tr>
	<tr>
		<td bgcolor="orange">이메일</td>
		<td><input type="text" name="email"/></td>
	</tr>
	<tr>
		<td bgcolor="orange">연락처</td>
		<td><input type="text" name="phone"/></td>
	</tr>
	<tr>
		<td bgcolor="orange">성별</td>
		<td>${dto.gender}</td>
	</tr>
	<tr>
		<td bgcolor="orange">포인트</td>
		<td>${dto.point}</td>
	</tr>
	<tr>
		<td bgcolor="orange">가입일</td>
		<td>${dto.joindate}</td>
	</tr>
	<tr>
		<td bgcolor="orange">댓글수</td>
		<td>${dto.reply}</td>
	</tr>
	<tr>
		<td bgcolor="orange">리뷰수</td>
		<td>${dto.review}</td>
	</tr>
	<tr>
		<td>
			<button id="btn" onclick="memberDelete();">회원탈퇴</button>
		</td>
	</tr>

</table>
<input type="submit" value="수정완료"/>
</form>
</center>
<script>
	function memberDelete(){
		location.href="deleteDao?id="+$("#memberId").val();
	}
</script>
</body>
</html>