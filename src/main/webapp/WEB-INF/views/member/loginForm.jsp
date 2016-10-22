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
<%-- navbar --%> 
	.navbar {
    	margin-bottom: 0;
    	border-radius: 0;
    	background-color: #ff5555;
    }
    .navbar-header{
    	width:100%
    }
    #mobileNavbar .navbar-toggle{
    	background-color:#ffffff;
    }
    #mobileNavbar>form>a{
    	color: #ff5555;  
    }
    .navbar-default .navbar-toggle .icon-bar{
    	background-color:#ff5555;
    	padding-top:4px; 
    } 
    #mobileNavbar>form>input{
    	background-color: #ffffff; 
    }
    
    .nav{
    	margin-top:-10px;
    }
    #pcNavbar>ul>li>a{
    	color: #ffffff;
    }
    #pcNavbar>ul>li>a:hover{
    	background-color:#ffffff;
    	color:#ff5555;
    	font-size:17px; 
    }

body {
  font-family: 'Lato', sans-serif;
  background-color: #f8f8f8;
}
body .container {
  position: relative;
  overflow: hidden;
  width: 700px;
  height: 850px;
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
body .container .tabs .tab.active a, body .container .tabs .tab:hover a {
  color: #263238;
}
body .container .tabs .tab.active {
  border-bottom: 1px solid #263238;
}
body .container .content form {
  position: relative;
  height: 287px;
}
body .container .content label:first-of-type, body .container .content input:first-of-type, body .container .content .more:first-of-type {
  -moz-animation: slideIn 0.4s cubic-bezier(0.37, 0.82, 0.2, 1);
  -webkit-animation: slideIn 0.4s cubic-bezier(0.37, 0.82, 0.2, 1);
  animation: slideIn 0.4s cubic-bezier(0.37, 0.82, 0.2, 1);
}
body .container .content label:nth-of-type(2), body .container .content input:nth-of-type(2), body .container .content .more:nth-of-type(2) {
  -moz-animation: slideIn 0.5s cubic-bezier(0.37, 0.82, 0.2, 1);
  -webkit-animation: slideIn 0.5s cubic-bezier(0.37, 0.82, 0.2, 1);
  animation: slideIn 0.5s cubic-bezier(0.37, 0.82, 0.2, 1);
}
body .container .content label:nth-of-type(3), body .container .content input:nth-of-type(3), body .container .content .more:nth-of-type(3) {
  -moz-animation: slideIn 0.6s cubic-bezier(0.37, 0.82, 0.2, 1);
  -webkit-animation: slideIn 0.6s cubic-bezier(0.37, 0.82, 0.2, 1);
  animation: slideIn 0.6s cubic-bezier(0.37, 0.82, 0.2, 1);
}
body .container .content label:nth-of-type(4), body .container .content input:nth-of-type(4), body .container .content .more:nth-of-type(4) {
  -moz-animation: slideIn 0.7s cubic-bezier(0.37, 0.82, 0.2, 1);
  -webkit-animation: slideIn 0.7s cubic-bezier(0.37, 0.82, 0.2, 1);
  animation: slideIn 0.7s cubic-bezier(0.37, 0.82, 0.2, 1);
}
body .container .content label:nth-of-type(5), body .container .content input:nth-of-type(5), body .container .content .more:nth-of-type(5) {
  -moz-animation: slideIn 0.8s cubic-bezier(0.37, 0.82, 0.2, 1);
  -webkit-animation: slideIn 0.8s cubic-bezier(0.37, 0.82, 0.2, 1);
  animation: slideIn 0.8s cubic-bezier(0.37, 0.82, 0.2, 1);
}
body .container .content label:nth-of-type(6), body .container .content input:nth-of-type(6), body .container .content .more:nth-of-type(6) {
  -moz-animation: slideIn 0.9s cubic-bezier(0.37, 0.82, 0.2, 1);
  -webkit-animation: slideIn 0.9s cubic-bezier(0.37, 0.82, 0.2, 1);
  animation: slideIn 0.9s cubic-bezier(0.37, 0.82, 0.2, 1);
}
body .container .content label:nth-of-type(7), body .container .content input:nth-of-type(7), body .container .content .more:nth-of-type(7) {
  -moz-animation: slideIn 1.0s cubic-bezier(0.37, 0.82, 0.2, 1);
  -webkit-animation: slideIn 1.0s cubic-bezier(0.37, 0.82, 0.2, 1);
  animation: slideIn 1.0s cubic-bezier(0.37, 0.82, 0.2, 1);
}
body .container .content label:nth-of-type(8), body .container .content input:nth-of-type(8), body .container .content .more:nth-of-type(8) {
  -moz-animation: slideIn 1.1s cubic-bezier(0.37, 0.82, 0.2, 1);
  -webkit-animation: slideIn 1.1s cubic-bezier(0.37, 0.82, 0.2, 1);
  animation: slideIn 1.1s cubic-bezier(0.37, 0.82, 0.2, 1);
}
body .container .content label:nth-of-type(9), body .container .content input:nth-of-type(9), body .container .content .more:nth-of-type(9) {
  -moz-animation: slideIn 1.1s cubic-bezier(0.37, 0.82, 0.2, 1);
  -webkit-animation: slideIn 1.1s cubic-bezier(0.37, 0.82, 0.2, 1);
  animation: slideIn 1.1s cubic-bezier(0.37, 0.82, 0.2, 1);
}
body .container .content label {
  font-size: 12px;
  color: #263238;
  -moz-user-select: -moz-none;
  -ms-user-select: none;
  -webkit-user-select: none;
  user-select: none;
}
body .container .content label:not([for='remember']) {
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
  clip: rect(0 0 0 0);
  width: 0;
  height: 0;
  margin: 17px -1px;
  padding: 0;
  border: 0;
}
body .container .content .checkbox + label {
  vertical-align: middle;
  display: inline-block;
  width: 50%;
}
body .container .content .checkbox + label:before {
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
body .container .content .checkbox:checked + label:before {
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

@keyframes slideIn {
  0% {
    filter: progid:DXImageTransform.Microsoft.Alpha(Opacity=0);
    opacity: 0;
    margin-left: -320px;
  }
  100% {
    filter: progid:DXImageTransform.Microsoft.Alpha(enabled=false);
    opacity: 1;
    margin-left: 0px;
  }
}
@-webkit-keyframes slideIn {
  0% {
    filter: progid:DXImageTransform.Microsoft.Alpha(Opacity=0);
    opacity: 0;
    margin-left: -320px;
  }
  100% {
    filter: progid:DXImageTransform.Microsoft.Alpha(enabled=false);
    opacity: 1;
    margin-left: 0px;
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
<title>Flower</title>
</head>
<body>
<!--header -->
	<header>
		<div class="contatiner-fluid">
			<div id="users">
			<%if(session.getAttribute("id")!=null){ %>
				${sessionScope.id}님 환영합니다&emsp;&emsp;
				<%
				}%>
				
				<%if(session.getAttribute("id")==null){ %>
				<a href="loginForm">Login</a>&emsp;&emsp;
				<%
				}else{
					%>
					<a href="logout">logout</a><span></span>&emsp;&emsp;
					<%
				}
				%>
				<a href="cart">Cart</a>&emsp;&emsp;
				<a href="order">Order</a>&emsp;&emsp;
				<a href="myPage">My Page</a>&emsp;&emsp;
			</div>
			<a href="main">Flower</a>
		</div>
	</header>
<!-- navbar -->	
	<nav class="navbar navbar-default">
		<div class="container-fluid">
			<div class="navbar-header" id="mobileNavbar">
				<form action="main" method="get" autocomplete="on">
					<input type="submit" class="navbar-toggle" value="검색"/>
					<input type="text" class="navbar-toggle" style="width:150px;" placeholder="검색어 입력"/>
					
					<button type="button" class="navbar-toggle" data-toggle="collapse"
							data-target="#pcNavbar"> 
							<span class="icon-bar"></span>
							<span class="icon-bar"></span>
							<span class="icon-bar"></span>
					</button>
				</form>	
			</div>
		
			<div class="collapse navbar-collapse" id="pcNavbar">
				
				
				<ul class="nav navbar-nav">
					<li><a href="main">홈 <span class="glyphicon glyphicon-home"></span></a></li>
					<li><a href="../product/list?category=꽃바구니">꽃바구니</a></li>
					<li><a href="../product/list?category=꽃다발">꽃다발</a></li>
					<li><a href="../product/list?category=꽃상자">꽃상자</a></li>
					<li><a href="../product/list?category=동양란">동양란</a></li>
					<li><a href="../product/list?category=서양란">서양란</a></li>
					<li><a href="../product/list?category=축하화환">축하화환</a></li>
					<li><a href="../product/list?category=근조화환">근조화환</a></li>
					<li><a href="../board/boardList">게시판</a></li>
				</ul>
				<input type="text" style="width:170px;margin-bottom:10px;margin-left:3px;" placeholder=" 검색어 입력">
				<a href="#"><span class="glyphicon glyphicon-search" style="color:#ffffff"></span></a>
			</div>
		</div>
	</nav>
		
<section class="container">
		    <article class="half">
			        <h1>Flower</h1>
			        <div class="tabs">
				            <span class="tab signin active"><a href="#signin">Sign in</a></span>
				            <span class="tab signup"><a href="#signup">Sign up</a></span>
			        </div>
			        <div class="content">
				            <div class="signin-cont cont">
				                <form action="login" method="post">
				                    <input name="id" id="id" class="inpt" required="required" placeholder="Your ID">
				                    <label for="id">Your ID</label>
				                    <input type="password" name="password" id="password" class="inpt" required="required" placeholder="Your password">
              						    <label for="password">Your password</label>
				                    <input type="checkbox" id="remember" class="checkbox" checked>
				                    <label for="remember">Remember me</label>
				                    <div class="submit-wrap">
			                        	<input type="submit" value="Sign in" class="submit" style="margin-bottom:5px;">
			                        	<input type="button" value="아이디 찾기" class="submit" onclick="idsearch();" style="margin-bottom:5px;">
			                        	<input type="button" value="비밀번호 찾기" class="submit" onclick="pwdsearch();">
				                        <a href="#" class="more">Forgot your password?</a>
				                    </div>
       					        </form>
    				        </div>
    				        <div class="signup-cont cont">
					<form action="member_join" method="post">
						<input type="text" name="id" id="join_id" class="inpt" required="required" value="${requestScope.id}" placeholder="ID를 입력해주세요 (30자이내)" onblur="idlength();" maxlength="30">
						<div id="idmsg"></div>
						<input type="password" name="password" id="password1" class="inpt" required="required" placeholder="비밀번호를 입력해주세요 (6~30자 내)" onblur="pwdlength();" maxlength="30"> 
						<input type="password" name="password2" id="password2" class="inpt" required="required" placeholder="비밀번호를 다시 한번 입력해주세요" onblur="passwordchk();" maxlength="30">
						<input type="text" name="name" id="name" class="inpt" required="required" placeholder="이름"> 
						<input type="date" name="birthday" id="birthday" class="inpt">
						<input type="email" name="email" id="email" class="inpt" required="required" placeholder="이메일">
						<input type="button" id="addressBtn" class="inpt" onclick="addressSearch();" value="주소검색"/>
						<input type="text" name="address" id="address" class="inpt" placeholder="주소를 입력해주세요">
						<input type="text" name="phone" class="inpt" placeholder="휴대폰번호를 '-'없이 입력해주세요" maxlength="11">
						<input type="radio" name="gender" id="gender1" value="남">
						남자&emsp;
						<input type="radio" name="gender" id="gender2" value="여">
						여자
						<p></p>
						<div class="submit-wrap">
							<input type="submit" value="회원가입" class="submit" onclick="formchk();">
							<a href="#" class="more">Terms and conditions</a>
						</div>
					</form>
				</div>
			</div>
		    </article>
		    <div class="half bg"></div>
	</section>



	<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
	<script type="text/javascript">
	
		/* function pwdlength() {
			if($("#password1").val().length < 6){
				 alert("비밀번호는 최소 6자리 이상 입력해주세요");
				 $("#password1").val("");
				 $("#password1").focus();
			}
		} */
		/* function passwordchk(){
			 if($("#password1").val()!=$("#password2").val()){
				$("#password1").val("");
				$("#password2").val("");
				alert("비밀번호가 다릅니다");
				$("#password1").focus();
			} 
		}*/
		function idlength(){
			
			 if($("#join_id").val()==""){
				//$("#idsearch").val("아이디를 입력해주세요");
				//alert("아이디를 입력해주세요");
				var idmsg = document.getElementById("idmsg")
				idmsg.innerHTML = "아이디를 입력해주세요";
				$("#join_id").focus();
			return false;
			}else{
				var idmsg = document.getElementById("idmsg")
				idmsg.innerHTML = "";
			}
			 
			var jid = $("#join_id").val();
			
			$.ajax({
				url : "member_Id",
				type : "POST",
				data : {jid : jid},
				dataType : "json",

				success : function(result) {	
					
					if(result.b == null)
					{
						
						alert("아이디가 중복이 되지 않습니다. 쓰셔도 됩니다.")
						
					}
					else
					{
						alert("아이디가 중복이 됩니다. 다시 입력 해주세요");
						$("#join_id").val("");
						$("#join_id").focus();
						return false;
					}	
				},
			 	 error : function(request, status, error) {
					if (request.status != '0') {
						alert("code : " + request.status + "\r\nmessage : "
								+ request.reponseText + "\r\nerror : " + error);
					}
				} 
			});
		}

		function formchk() {
			var id = document.getElementById("join_id");
			var password1 = document.getElementById("password1");
			var password2 = document.getElementById("password2");
			var name = document.getElementById("name");
			//var birthday = document.getElementById("birthday");
			var email = document.getElementById("email");
			var address = document.getElementById("address");
			var phone = document.getElementById("phone");
			
			if(join_id.value =="" || join_id.value == null ){
				alert("아이디를 입력해주세요");
				$("#join_id").focus();
				return false;
			}else if($("#password1").val().length < 6){
				 alert("비밀번호는 최소 6자리 이상 입력해주세요");
				 $("#password1").val("");
				 $("#password1").focus();
			}else if($("#password1").val()!=$("#password2").val()){
				$("#password1").val("");
				$("#password2").val("");
				alert("비밀번호가 다릅니다");
				$("#password1").focus();
			}else if(name.value =="" || name.value == null ){
				alert("이름을 입력해주세요");
				$("#name").focus();
				return false;
			}else if(email.value =="" || email.value == null ){
				alert("이메일을 입력해주세요");
				$("#email").focus();
				return false;
			}else if(address.value =="" || address.value == null ){
				alert("주소를 입력해주세요");
				$("#address").focus();
				return false;
			}else if(phone.value =="" || phone.value == null || phone.value == "-" ){
				alert("휴대전화번호를 입력해주세요");
				$("#phone").focus();
				return false;
			}else{
				alert("회원가입이 완료 되써요!!!!!");
				window.location.href="../member/loginForm";
			}
		}
		
		 function idsearch() {
			 window.location.href="/Hit/member/idsearch";
		} 
		 function pwdsearch() {
			 window.location.href="/Hit/member/pwdsearch";
		} 
		$('.tabs .tab').click(function() {
			if ($(this).hasClass('signup')) {
				$('.tabs .tab').removeClass('active');
				$(this).addClass('active');
				$('.cont').hide();
				$('.signup-cont').show();
			}
			if ($(this).hasClass('signin')) {
				$('.tabs .tab').removeClass('active');
				$(this).addClass('active');
				$('.cont').hide();
				$('.signin-cont').show();
			}

		});

		$('.container .bg').mousemove(
				function(e) {
					var amountMovedX = (e.pageX * -1 / 30);
					var amountMovedY = (e.pageY * -1 / 9);
					$(this).css('background-position', amountMovedX + 'px ' + amountMovedY + 'px');
		});
		
		//zipcode
		function addressSearch(){
			var option = "toolbar=no, menubar=no, location=no, directories=no, status=no, scrollbars=no,"
				option += "resizable=no, width=500, height=500, top=100, left=300";
			window.open("../zipcode/zipcodemain","",option);
		}
		
	</script>
</body>
</html>