<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script
	src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<style>
@import url(https://fonts.googleapis.com/css?family=Lato:400,700);

* {
	-moz-box-sizing: border-box;
	-webkit-box-sizing: border-box;
	box-sizing: border-box;
}

<%--
header --%> a {
	text-decoration: none;
}

a:hover {
	text-decoration: none;
}

a:active {
	text-decoration: none
}

header>div>a {
	font-size: 40px;
	color: #000000;
	text-shadow: 2px 2px #000000;
	margin-left: 10px;
}

header>div>a:hover {
	text-decoration: none;
}

#users {
	float: right;
}

#users>a {
	color: #000000;
}

#users>a:hover {
	text-decoration: none;
}

<%--
navbar --%> .navbar {
	margin-bottom: 0;
	border-radius: 0;
	background-color: #ff5555;
}

.navbar-header {
	width: 100%
}

#mobileNavbar .navbar-toggle {
	background-color: #ffffff;
}

#mobileNavbar>form>a {
	color: #ff5555;
}

.navbar-default .navbar-toggle .icon-bar {
	background-color: #ff5555;
	padding-top: 4px;
}

#mobileNavbar>form>input {
	background-color: #ffffff;
}

.nav {
	margin-top: -10px;
}

#pcNavbar>ul>li>a {
	color: #ffffff;
}

#pcNavbar>ul>li>a:hover {
	background-color: #ffffff;
	color: #ff5555;
	font-size: 17px;
}

body {
	font-family: 'Lato', sans-serif;
	background-color: #f8f8f8;
}

body .container {
	position: relative;
	overflow: hidden;
	width: 750px;
	height: 400px;
	margin: 80px auto 0;
	background-color: #ffffff;
	-moz-box-shadow: rgba(0, 0, 0, 0.1) 0px 10px 30px;
	-webkit-box-shadow: rgba(0, 0, 0, 0.1) 0px 10px 30px;
	box-shadow: rgba(0, 0, 0, 0.1) 0px 10px 30px;
}

body .container .half {
	float: left;
	width: 50%;
	height: 100%;
	padding: 58px 40px 0;
}

body .container .half.bg {
	background-image: url("../resources/image/loginbg.jpg");
	background-size: 400px;
	background-repeat: no-repeat;
}

body .container h1 {
	font-size: 18px;
	font-weight: 700;
	margin-bottom: 23px;
	text-align: center;
	text-indent: 6px;
	letter-spacing: 7px;
	text-transform: uppercase;
	color: #263238;
}

body .container .tabs {
	width: 100%;
	margin-bottom: 29px;
	border-bottom: 1px solid #d9d9d9;
}

body .container .tabs .tab {
	display: inline-block;
	margin-bottom: -1px;
	padding: 20px 15px 10px;
	cursor: pointer;
	letter-spacing: 0;
	border-bottom: 1px solid #d9d9d9;
	-moz-user-select: -moz-none;
	-ms-user-select: none;
	-webkit-user-select: none;
	user-select: none;
	transition: all 0.1s ease-in-out;
}

body .container .tabs .tab a {
	font-size: 11px;
	text-decoration: none;
	text-transform: uppercase;
	color: #d9d9d9;
	transition: all 0.1s ease-in-out;
}

body .container .tabs .tab.active a, body .container .tabs .tab:hover a
	{
	color: #263238;
}

body .container .tabs .tab.active {
	border-bottom: 1px solid #263238;
}

body .container .content form {
	position: relative;
	height: 287px;
}

body .container .content label:first-of-type, body .container .content input:first-of-type,
	body .container .content .more:first-of-type {
	-moz-animation: slideIn 0.4s cubic-bezier(0.37, 0.82, 0.2, 1);
	-webkit-animation: slideIn 0.4s cubic-bezier(0.37, 0.82, 0.2, 1);
	animation: slideIn 0.4s cubic-bezier(0.37, 0.82, 0.2, 1);
}

body .container .content label:nth-of-type(2), body .container .content input:nth-of-type(2),
	body .container .content .more:nth-of-type(2) {
	-moz-animation: slideIn 0.5s cubic-bezier(0.37, 0.82, 0.2, 1);
	-webkit-animation: slideIn 0.5s cubic-bezier(0.37, 0.82, 0.2, 1);
	animation: slideIn 0.5s cubic-bezier(0.37, 0.82, 0.2, 1);
}

body .container .content label:nth-of-type(3), body .container .content input:nth-of-type(3),
	body .container .content .more:nth-of-type(3) {
	-moz-animation: slideIn 0.6s cubic-bezier(0.37, 0.82, 0.2, 1);
	-webkit-animation: slideIn 0.6s cubic-bezier(0.37, 0.82, 0.2, 1);
	animation: slideIn 0.6s cubic-bezier(0.37, 0.82, 0.2, 1);
}

body .container .content label:nth-of-type(4), body .container .content input:nth-of-type(4),
	body .container .content .more:nth-of-type(4) {
	-moz-animation: slideIn 0.7s cubic-bezier(0.37, 0.82, 0.2, 1);
	-webkit-animation: slideIn 0.7s cubic-bezier(0.37, 0.82, 0.2, 1);
	animation: slideIn 0.7s cubic-bezier(0.37, 0.82, 0.2, 1);
}

body .container .content label {
	font-size: 12px;
	color: #263238;
	-moz-user-select: -moz-none;
	-ms-user-select: none;
	-webkit-user-select: none;
	user-select: none;
}

body .container .content label:not ([for='remember'] ) {
	display: none;
}

body .container .content input.inpt {
	font-size: 14px;
	display: block;
	width: 100%;
	height: 42px;
	margin-bottom: 12px;
	padding: 16px 13px;
	color: #999999;
	border: 1px solid #d9d9d9;
	background: transparent;
	-moz-border-radius: 2px;
	-webkit-border-radius: 2px;
	border-radius: 2px;
}

body .container .content input.inpt::-webkit-input-placeholder {
	font-size: 14px;
	color: #999999;
	font-family: 'Lato', sans-serif;
}

body .container .content input.inpt:-moz-placeholder {
	font-size: 14px;
	color: #999999;
	font-family: 'Lato', sans-serif;
}

body .container .content input.inpt::-moz-placeholder {
	font-size: 14px;
	color: #999999;
	font-family: 'Lato', sans-serif;
}

body .container .content input.inpt:-ms-input-placeholder {
	font-size: 14px;
	color: #999999;
	font-family: 'Lato', sans-serif;
}

body .container .content input.inpt:focus {
	border-color: #999999;
}

body .container .content input.submit {
	font-size: 12px;
	line-height: 42px;
	display: block;
	width: 100%;
	height: 42px;
	cursor: pointer;
	vertical-align: middle;
	letter-spacing: 2px;
	text-transform: uppercase;
	color: #263238;
	border: 1px solid #263238;
	background: transparent;
	-moz-border-radius: 2px;
	-webkit-border-radius: 2px;
	border-radius: 2px;
}

body .container .content input.submit:hover {
	background-color: #263238;
	color: #ffffff;
	-moz-transition: all 0.2s;
	-o-transition: all 0.2s;
	-webkit-transition: all 0.2s;
	transition: all 0.2s;
}

body .container .content input:focus {
	outline: none;
}

body .container .content .checkbox {
	margin-top: 4px;
	overflow: hidden;
	clip: rect(0, 0, 0, 0);
	width: 0;
	height: 0;
	margin: 17px -1px;
	padding: 0;
	border: 0;
}

body .container .content .checkbox+label {
	vertical-align: middle;
	display: inline-block;
	width: 50%;
}

body .container .content .checkbox+label:before {
	content: "\A";
	color: #999999;
	font-family: Verdana;
	font-weight: bold;
	font-size: 8px;
	line-height: 10px;
	text-align: center;
	display: inline-block;
	vertical-align: middle;
	position: relative;
	-moz-border-radius: 2px;
	-webkit-border-radius: 2px;
	border-radius: 2px;
	background: transparent;
	border: 1px solid #d9d9d9;
	width: 11px;
	height: 11px;
	margin: -2px 8px 0 0;
}

body .container .content .checkbox:checked+label:before {
	content: "✓";
}

body .container .content .submit-wrap {
	position: inherit;
	bottom: 0;
	width: 100%;
}

body .container .content .submit-wrap a {
	font-size: 12px;
	display: block;
	margin-top: 20px;
	text-align: center;
	text-decoration: none;
	color: #999999;
}

body .container .content .submit-wrap a:hover {
	text-decoration: underline;
}

body .container .content .signup-cont {
	display: none;
}

@
keyframes slideIn { 0% {
	filter: progid:DXImageTransform.Microsoft.Alpha(Opacity=0);
	opacity: 0;
	margin-left: -320px;
}

100%
{
filter
:
 
progid
:DXImageTransform
.Microsoft
.Alpha
(enabled=false);

    
opacity
:
 
1;
margin-left
:
 
0
px
;

  
}
}
@
-webkit-keyframes slideIn { 0% {
	filter: progid:DXImageTransform.Microsoft.Alpha(Opacity=0);
	opacity: 0;
	margin-left: -320px;
}

100%
{
filter
:
 
progid
:DXImageTransform
.Microsoft
.Alpha
(enabled=false);

    
opacity
:
 
1;
margin-left
:
 
0
px
;

  
}
}
.credits {
	display: block;
	position: absolute;
	right: 0;
	bottom: 0;
	color: #999999;
	font-size: 14px;
	margin: 0 10px 10px 0;
}

.credits a {
	filter: progid:DXImageTransform.Microsoft.Alpha(Opacity=80);
	opacity: 0.8;
	color: inherit;
	font-weight: 700;
	text-decoration: none;
}
</style>
</head>
<body>
	<!--header -->
	<header>
		<div class="contatiner-fluid">
			<div id="users">
				<%
					if (session.getAttribute("id") != null) {
				%>
				${sessionScope.id}님 환영합니다&emsp;&emsp;
				<%
					}
				%>

				<%
					if (session.getAttribute("id") == null) {
				%>
				<a href="loginForm">Login</a>&emsp;&emsp;
				<%
					} else {
				%>
				<a href="logout">logout</a><span></span>&emsp;&emsp;
				<%
					}
				%>
				<a href="cart">Cart(0)</a>&emsp;&emsp; <a href="order">Order</a>&emsp;&emsp;
				<a href="wishList">Wish List</a>&emsp;&emsp; <a href="myPage">My
					Page</a>&emsp;&emsp;
			</div>
			<a href="main">Flower</a>
		</div>
	</header>
	<!-- navbar -->
	<nav class="navbar navbar-default">
		<div class="container-fluid">
			<div class="navbar-header" id="mobileNavbar">
				<form action="main" method="get" autocomplete="on">
					<input type="submit" class="navbar-toggle" value="검색" /> <input
						type="text" class="navbar-toggle" style="width: 150px;"
						placeholder="검색어 입력" />

					<button type="button" class="navbar-toggle" data-toggle="collapse"
						data-target="#pcNavbar">
						<span class="icon-bar"></span> <span class="icon-bar"></span> <span
							class="icon-bar"></span>
					</button>
				</form>
			</div>

			<div class="collapse navbar-collapse" id="pcNavbar">


				<ul class="nav navbar-nav">
					<li><a href="main">홈 <span
							class="glyphicon glyphicon-home"></span></a></li>
					<li><a href="#">꽃바구니</a></li>
					<li><a href="#">꽃다발</a></li>
					<li><a href="#">꽃상자</a></li>
					<li><a href="#">동양란</a></li>
					<li><a href="#">서양란</a></li>
					<li><a href="#">축하화환</a></li>
					<li><a href="#">근조화환</a></li>
					<li><a href="../board/boardList">게시판</a></li>
				</ul>
				<input type="text"
					style="width: 170px; margin-bottom: 10px; margin-left: 3px;"
					placeholder=" 검색어 입력"> <a href="#"><span
					class="glyphicon glyphicon-search" style="color: #ffffff"></span></a>
			</div>
		</div>
	</nav>

	<section class="container">
		<article class="half">
		<h1>비밀번호 바꾸기</h1>
			<div class="content">
				<div class="signin-cont cont">
					<form action="resetpwd" method="post">
						<input type="password" name="password1" id="password1" class="inpt" required="required" onblur="pwdlength();" placeholder="비밀번호를 입력해주세요 (6~30자 내)" > 
						<label for="id">Your Password</label>
						<div id="pwdmsg1"></div>
						<input type="password" name="password2" id="password2" class="inpt" required="required" onblur="passwordchk();" placeholder="비밀번호를 다시 한번 입력해주세요">
						<label for="name">Re Input</label>
						<div id="pwdmsg2"></div>
						<input type="hidden" id="pwd" value="${pwd}">
						<input type="hidden" id="id" value="${id}">
						<input type="button" value="비밀번호 변경" class="submit" onclick="resetpwd();">
						
					</form>
					
				</div>
			</div>
		</article>
		<div class="half bg"></div>
	</section>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
	<script type="text/javascript">

	
	function pwdlength() {
		//var password1 = document.getElementById("password1");
		if($("#password1").val().length < 3){
			 $("#password1").val("");
			 $("#password1").focus();
			 var pwdmsg1 = document.getElementById("pwdmsg1")
				pwdmsg1.innerHTML = "비밀번호는 최소 6자리 이상 입력해주세요";
		}else{
			var pwdmsg1 = document.getElementById("pwdmsg1")
			pwdmsg1.innerHTML = "";
		}
	}
	function passwordchk(){
		//var password1 = document.getElementById("password1");
		//var password2 = document.getElementById("password2");
		
		if($("#password1").val()!=$("#password2").val()){
			$("#password1").val("");
			$("#password2").val("");
			var pwdmsg2 = document.getElementById("pwdmsg2")
			pwdmsg2.innerHTML = "비밀번호가 다릅니다";
			$("#password1").focus();
		}else{
			var pwdmsg2 = document.getElementById("pwdmsg2")
			pwdmsg2.innerHTML = "";
		} 
	}
	
	function resetpwd() {
			if($("#password1").val() == $("#pwd").val()){
				$("#password1").val("");
				$("#password2").val("");
				alert("이전 비밀번호와 같습니다. 다른비밀번호로 변경해주세요!");
				$("#password1").focus();
			}else{
		
				alert("비밀번호가 변경되었습니다! 다시 로그인해주세요!");
				window.location.href="../member/resetpwd?pwd="+$("#password1").val()+"&id="+$("#id").val();
			} 
		} 
	
	</script>
</body>
</html>