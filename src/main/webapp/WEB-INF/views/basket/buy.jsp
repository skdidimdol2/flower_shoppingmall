<!-- 구매 페이지 -->

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

<title>구매 페이지</title>    
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
		<%-- footer --%>
	#footer {
		background-color:#ddddff;  
	} 
</style>

</head>
<body>

<!--header -->
	<header>
	<div class="contatiner-fluid">
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
				<a href="../member/main">My Page</a>&emsp;&emsp;
			</div>
			<a href="../member/main">Flower</a>
		</div>
	</header>

<div class="basket1" style="margin-bottom: 50;margin-right: 10">
	<div class="basket2" style="margin-left: 100;margin-bottom: 10;margin-right: 10">
	&nbsp;&nbsp;&nbsp;&nbsp;
		<h3>장바구니 목록  >  <b><font color="red">주문서</font></b>  >  결제완료</h3>
		<c:set var="sum" value="0"/>
		<c:forEach items="${list}" var="val">
			상품이름 : ${val.item_name }<br>
			<img src="${val.img }" width="400"><br>
			카테고리 : ${val.category }<br>
			구매수량 : ${val.buy_vol}<br>
			가격 : ${val.price}<br>
			장바구니 번호 : ${val.basket_no}<br>
			<c:set var="sum" value="${sum+val.price}"/>
		</c:forEach>
		총 가격 : <c:out value="${sum}"></c:out>
	</div>
</div>

<div class="basket1" style="margin-bottom: 50;margin-right: 10">
	<div class="basket2" style="margin-left: 100;margin-bottom: 10;margin-right: 10">
	&nbsp;&nbsp;&nbsp;&nbsp;
		<h3><b><font color="red">구매자 정보</font></b>  </h3>
	    <form id="insert" method="POST" action="../basket/insert">
		<table border="1" style="margin-left: 10;margin-top: 20;margin-bottom:20;margin-right: 10;">
		
		<c:forEach items="${mlist}" var="m">
		<c:forEach items="${list}" var="val">
				<tr>
					<td style="background-color: red" align="center" width="100" >아이디</td>
					<td align="center" ><input type="text" value="${m.id}" name="id" style="border: 0px;width:100px"></td>
					<td style="background-color: red" align="center"  width="100">상품번호</td>
					<td align="center" ><input type="text" value="${val.item_no}" name="item_no" style="border: 0px;width:100px"></td>
				</tr>
				<tr>
					<td style="background-color: red" align="center" >이름</td>
					<td align="center" ><input type="text" value="${m.name}" name="name" style="border: 0px;width:100px"></td>
					<td style="background-color: red" align="center" >이메일</td>
					<td align="center" ><input type="text" value="${m.email}" name="email" style="border: 0px"></td>
				</tr>
				<tr>
					<td style="background-color: red" align="center" >연락처</td>
					<td align="center" ><input type="text" value="${m.phone}" name="phone" style="border: 0px"></td>
					<td style="background-color: red" align="center" >구매수량</td>
					<td align="center" ><input type="text" value="${val.buy_vol }" name="order_vol" style="border: 0px;width:100px"></td>
				</tr>
				<tr>
					<td style="background-color: red" align="center" >주문금액</td>
					<td align="center" ><input type="text" value="${val.price}" name="payment_price" style="border: 0px;width:100px"></td>
					<td style="background-color: red"align="center">결제 방법</td>
					<td>
					<select name="type" id="type" style="height:30">
					<option value="신용카드">신용카드</option>
					<option value="휴대폰결제">휴대폰결제</option>
					</select>
					</td>
				</tr>
				<tr>
					<input type="hidden" value="${val.basket_no }" name="basket_no" ></td>
					<td>
					</td>
			
				</tr>
		</c:forEach>
		</c:forEach>
		</table>
		<button type="button" onclick="pay()">결제하기</button>
		</form>
	</div>
</div>


<script>
function pay(){
	if(confirm("결제하시겠습니까?")==true){
		$("#insert").submit();
	}
}
</script>

</body>
</html>
<!-- footer -->	
	<footer class="container-fluid text-left" id="footer">
		
		<div style="margin-left:40px;margin-bottom:15px;">
			<br>
			상호 : Flower  |  Tel : 112  |  Fax : 119<br>
			주소 : 대한민국 꽃밭 어디든<br>
			Copyright ⓒ <b>Java Study</b> All rights reserved. 
		</div>
	</footer>