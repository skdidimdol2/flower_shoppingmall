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

<title>회원 가입</title>
</head>
<body>
<!-- <button id="a" onclick="passwordchk()">123</button> -->

	<form action="member_join" method="post">
		<table border="1" align="center">
		<tr align="center">
		<td colspan="4"><b style="font-size: 24">회원가입</b></td>
			</tr>
			<tr>
				<td width="110">ID</td>
				<td>:</td>
				
				
				<td><input type="text" name="id" id="id" value="${requestScope.id}" placeholder="ID를 입력해주세요"></td>
				<%-- <td><c:if test="${errors.id}">ID를 입력하세요</c:if><c:if test="${errors.}">이미 사용중인 ID입니다</c:if></td> --%>
			<td><input type="button" value="중복확인" onclick="idchk();"></td>
			</tr>			
			<tr>
			<td></td>
			<td></td>
			<td id="b"> </td>
			</tr>
			<tr>
				<td width="110">비밀번호</td>
				<td>:</td>
				<td colspan="2"><input type="password" name="password1" id="password1" placeholder="비밀번호를 입력해주세요"/>
				<!-- <c:if test="${errors.password}"></c:if></td> -->
			</tr>
			<tr>
				<td width="110">비밀번호 확인</td>
				<td>:</td>
				<td colspan="2"><input type="password" name="password2" id="password2" placeholder="비밀번호를 다시 한번 입력해주세요" onblur="passwordchk();"/>
				
				<!-- <c:if test="${errors.password2}"></c:if><c:if test="${errors.notMatch}">비밀번호와 확인이 일치하지 않습니다</c:if></td> -->
			</tr>
			<tr>
			<td></td>
			<td></td>
			<td id="a"> </td>
			</tr>
			<tr>
				<td width="110">이름</td>
				<td>:</td>
				<td colspan="2"><input type="text" name="name"
					placeholder="이름을 입력해주세요"></td>

			</tr>
			<tr>
				<td width="110">생년월일</td>
				<td>:</td>
				<td colspan="2"><input type="date" name="birthday"></td>
			</tr>
			<tr>
				<td width="110">이메일</td>
				<td>:</td>
				<td colspan="2"><input type="email" name="email"></td>
			</tr>
			<tr>
				<td width="110">연락처</td>
				<td>:</td>
				<td colspan="2"><input type="text" name="phone"></td>
			</tr>
			<tr>
				<td width="110">성별</td>
				<td>:</td>
				<td colspan="2"><input type="radio" name="gender" value="남">남자
					<input type="radio" name="gender" value="여">여자</td>
			</tr>
			<tr>
				<td colspan="2" align="right"><input type="submit"
					value="회원 가입"></td>
				<td colspan="2" align="left"><input type="reset" value="다시입력" />
			</tr>
		</table>


	</form>
<script>
	function passwordchk(){
		if($("#password1").val()!=$("#password2").val()){
			
			$("#password1").val("");
			$("#password2").val("");
			$("#a").text("비밀번호가 다름");
		}else{
			$("#a").text("");
		}
	}
	
 	function idchk(){
 		 var formObj = $("form");
		/*if($("#id").val() == ""){
			$("#b").text("ID를 입력해주세요.");
		}
		 */
 		if($("#id").val() == ""){
			$("#b").text("ID를 입력해주세요.");
		}else{
 			formObj.attr("action", "/Hit/member/member_Id?id="+$("#id").val());
 		//$("#b").text
 		alert("이미 사용중인 ID입니다");
 			return 
 			formObj.submit();
 		}
 		/*  $("#b").text("Asdsadasdasdas");
 		function idchk(){
		if($("#id").val() == ""){
			$("#b").text("ID를 입력해주세요");
		return;
		}
		 
		if(MemberController.member_Id == 1){
		$("#b").text("사용가능한 ID입니다");
		}else{
			formObj.attr("action", "/Hit/member/member_Id?id="+$("#id").val());
		$("#b").text("이미 사용중인 ID입니다");
			
			formObj.submit();
		}
	} 
 		*/
	} 
	
</script>	
</body>
</html>