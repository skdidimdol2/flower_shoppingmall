<!-- admin 권한의 상품 수정 페이지-->

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
<script type="text/javascript"
	src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/4.0.5/handlebars.min.js"></script>
<script type="text/javascript">
function readImg(input){
	
	if(input.files&&input.files[0]){
		var reader = new FileReader();
		reader.onload=function(e){
			 $("#image").attr("src", e.target.result);
		};
		reader.readAsDataURL(input.files[0]);
	}
}

function adminDelitem(a){
	if(confirm("상품을 삭제하시겠습니까?")){
		alert("상품이 삭제되었습니다.");
		location.href="adminDelitem?item_no="+a;
	}else{
		return false;	
	}
}
</script>

<!-- 상품 상세 정보 -->
<style type="text/css">
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

</style>

<title>상품 수정</title>
<jsp:include page="../include/style.jsp"></jsp:include>

</head>
<body>

	<!--header -->
	<header>
		<div class="contatiner-fluid">		
			<a href="main">관리자 페이지</a>
			<div id="users">
				<c:if test="${sessionScope.id!=null}">
					${sessionScope.id}님 환영합니다&emsp;&emsp;
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
				<a href="../member/myPage">My Page</a>&emsp;&emsp;
			</div>
		</div>
	</header>
	<!-- navbar -->	
	<nav class="navbar navbar-default">
		<div class="container-fluid">
			<div class="navbar-header" id="mobileNavbar">
				<form action="main" method="get" autocomplete="on">
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
					<li><a href="../member/main">홈 <span class="glyphicon glyphicon-home"></span></a></li>
					<li><a href="adminMember">회원 관리</a></li>
					<li><a href="itemMan">상품 관리</a></li>
					<li><a href="javascript:void(0);">게시판 관리</a></li>
					<li><a href="admin_sales?bool=0">매출 관리</a></li>
					<li><a href="../admin/delivery">배송 관리</a></li>			
				</ul>
			</div>
		</div>
	</nav>
<body>
	<!-- 상품 상세 설명 -->
	<div class="container" style="margin-top: 50;margin-left: 50">
		<p></p>
		<p></p>
		<form name="form1" action="modifyOk">
			<input type="hidden" name="item_no" value="${item.item_no}">
			<table style="width: 700; width:70%; height: 400;" border="1">
				<tr>
					<td rowspan="5" width="300" height="250">
					<input type="file" id="img" name="img" onchange="readImg(this);" style="display: none; ">
					<img id="image" src="${item.img}" style="cursor:pointer;"width=100% height=100% onclick="document.all.img.click();"/>
				</tr>
				<tr>
					<td colspan="2" height="50" style="background-color: red;"
						align="center" valign="middle" width="100"><b
						style="font-size: 13">상품명  <input type="text" name="item_name" style="background: red" value="${item.item_name }"></b></td>
				</tr>
				
				<tr>
					<td width="20%" height="50" align="center">수량 <input type="text" name="volume" value="${item.volume }"></td>
				</tr>
				<tr>
					<td colspan="2" width="20%" height="50" align="center"><a
						href="javascript:history.back();">뒤로가기</a></td>
				</tr>
				<tr>
					<td colspan="3" style="background-color: orange;;" valign="middle"
						width="100" align="center" height="40"><b
						style="font-size: 13"></b> 상품 가격  <input type="text" style="background-color: orange;" name="price" value="${item.price}">
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 적립금 : ${item.price*0.05}원
				<br></td>
				</tr>
				<tr>
					<td colspan="3" style="background-color: orange;;" valign="middle"
						width="100" align="center" height="150"><b
						style="font-size: 13"></b>[상품 설명] <br><textarea name="item_content" rows="6" cols="70" style="background: orange;">${item.item_content}</textarea> 
					</td>
				</tr>
			</table>
			<p></p>
			<input type="submit" style="display: none;">
			<a href="#" onclick="form1.submit();">상품 수정</a>			
		</form>		
	<a href="#" onclick="adminDelitem(${item.item_no});"><h4>상품 삭제</h4></a>
	</div>
	
	<script>

	</script>
	<br>


<!-- footer -->
<footer class="container-fluid text-left" id="footer">

	<div style="margin-left: 40px; margin-bottom: 15px;">
		<br> 상호 : Flower | Tel : 112 | Fax : 119<br> 주소 : 대한민국 꽃밭
		어디든<br> Copyright ⓒ <b>Java Study</b> All rights reserved.
	</div>
</footer>
</body>

</html>