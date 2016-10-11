<!-- 상품 목록 보기 -->

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
function searchitem(a,b){
	window.location.href="searchitem?item_name="+a+"&category="+b;
}
</script>
	
<!-- 상품 리스트들에 대한 목록 표시 -->


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
				<a href="../member/wishList">Wish List</a>&emsp;&emsp;
				<a href="../member/myPage">My Page</a>&emsp;&emsp;
			</div>
			<a href="../member/main">Flower</a>
		</div>
	</header>
<!-- board -->
	<div class="container">
		<div class="row">
			<div class="col-lg-4">
				<p></p>
				<b style="font-size:24"> 상품 목록 </b>
				<p></p>
            <c:set var="i" value="0" />
            <c:set var="j" value="3" />
            <table style="width: 100%;" border="0" class="text-center">
               <c:forEach items="${list}" var="pdt">
                  <c:if test="${i%j == 0 }">
                     <tr>
                  </c:if>
                  <td>
                     <table>
                        <tr>
                           <a href="detail?item_no=${pdt.item_no}"> <img
                              src="${pdt.img}" width="300" height="300"></a>
                        </tr>
                        </tr>
                        <tr>
                           ${pdt.item_name}
                           <br>
                        </tr>
                        <tr>
                           ${pdt.price}원
                           <br>
                        </tr>
                        <tr>
                           적립금 : ${pdt.price*0.05}원
                           <br>
                        </tr>
                     </table>
                  </td>
                  <c:if test="${i%j == j-1 }">
                     </tr>
                  </c:if>
                  <c:set var="i" value="${i+1 }" />
               </c:forEach>
            </table>
            <p></p>
				
				
				
				
				
				
				
				
				
				
				
				<%-- <p></p>
				<table style="width:100%;" border="1" class="text-center">
				<tr style="background-color:ff5555">
					<td width='70'><b><font size='2'>상품번호</font></td>
					<td><b><font size='2'>이미지</font></td>
					<td width='200'><b><font size='2'>상품명</font></td>
					<td><b><font size='2'>가격</font></td>
					<td width='100'><b><font size='2'>남은수량</font></td>
					<td><b><font size='2'>등록일자</font></td>

				<tr>
					
					<c:forEach items="${list}" var="pdt">
						<tr>
							<td>${pdt.item_no}</td>
							<td width="300" height="200"><a href="detail?item_no=${pdt.item_no}">
							<img src="${pdt.img}" width="100%" height="100%"></a></td>
							<td>${pdt.item_name}</td>
							<td>${pdt.price}</td>
							<td>${pdt.volume}</td>
							<td width="150">${pdt.reg_date}</td>
							<td>${pdt.item_content}</td>
						<tr>
					</c:forEach>
				</table>
				<p></p> --%>
			</div>
			&nbsp;&nbsp;&nbsp;
		</div>
	</div>	
<input type="button" class="btn back" value="돌아가기"/>
<!-- <input type="button" class="btn " value=""/> -->

<script>
		$(document).ready(function(){
			$(".back").on("click", function(){
				window.location.href="../member/main";
			});
		});
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
	