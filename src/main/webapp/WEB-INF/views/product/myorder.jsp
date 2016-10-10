<!-- 장바구니의 목록 확인 -->

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
<script type="text/javascript">


</script>
<!-- 주문 목록 표시 -->

<title>결제 정보</title>    
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
					</c:otherwise>
				</c:choose>
				<a href="../basket/mybasket">Cart</a>&emsp;&emsp;
				<a href="../product/myorder">Order</a>&emsp;&emsp;
				<a href="../member/main">Wish List</a>&emsp;&emsp;
				<a href="../member/main">My Page</a>&emsp;&emsp;
			</div>
			<a href="../member/main">Flower</a>
		</div>
	</header>
<div class="basket1" style="margin-bottom: 50;margin-right: 10">
	<div class="basket2" style="margin-left: 100;margin-bottom: 10;margin-right: 10">
	&nbsp;&nbsp;&nbsp;&nbsp;
		<h3><b><font color="red">주문 목록</font></b>  </h3>
		
		<table border="1" style="margin-left: 10;margin-top: 20;margin-bottom:20;margin-right: 10">
			 
				<tr>
					<td style="background-color: red" align="center" width="100">주문번호</td>
					<td style="background-color: red" align="center" width="100">상품번호</td>
					<td style="background-color: red" align="center" width="100">아이디</td>
					<td style="background-color: red" align="center" width="100">주문량</td>
					<td style="background-color: red" align="center" width="100">결제방법</td>
					<td style="background-color: red" align="center" width="100">결제유무</td>
					<td style="background-color: red" align="center" width="100">주문일자</td>
					<td style="background-color: red" align="center" width="100">주문액</td>
					<td style="background-color: red" align="center" width="100">배송상태</td>
					
				</tr>
				
				<c:forEach items="${list}" var="l">
				<tr>
					<td align="center" width="100">${l.order_no}</td>
					<td align="center" width="100">${l.item_no }</td>
					<td align="center" width="100">${l.id }</td>
					<td align="center" width="100">${l.order_vol}</td>	
					<td align="center" width="100">${l.payment_way}</td>
					<td align="center" width="100">${l.payment_bool}</td>
					<td align="center" width="100">${l.order_date}</td>
					<td align="center" width="100">${l.payment_price}</td>
					
					<c:choose>
						<c:when test="${l.del_bool == 'Y' }">
							<td align="center" width="100">배송완료</td>
							<c:if test="${l.cancel_bool != 'Y' }">
							<form name="orderdel" method="get" action="../product/orderdel">
								<td><button type="hidden" value="${l.order_no}" name="order_no">취소/환불 요청</button><td>
							</form>
							</c:if>
							<c:if test="${l.cancel_bool == 'Y' }">
							
								<td align="center" width="100">취소 승인 중..</td>
							</c:if>
							
						</c:when>
						<c:otherwise>
							<td align="center" width="100">결제완료<br>(배송중)</td>
						</c:otherwise>
					</c:choose>
				</tr>
			</c:forEach>
		</table>
		
		
	</div>
</div>
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