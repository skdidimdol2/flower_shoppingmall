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

//장바구니 목록 단일 삭제
function deletebasketone(a){
	window.location.href="deleteonesuccess?basket_no="+a;
}
//장바구니 목록 단일 구매
function buyoneitem(a) {
	window.location.href="buy?basket_no="+a;
}
//전체 선택 및 해제 스크립트
function checkAll(checkFlag){
	var f = document.getElementsByName("check[]");
	for(var i=0;i<f.length;i++){
		f[i].checked=checkFlag;
	}
}

//장바구니 목록 선택 삭제
function deletesel(){
	var chk="";
	var pp;
	var sum=0;
	for(var i=0;i<document.forms['table']['check[]'].length;i++){
		if(document.forms['table']['check[]'][i].checked){
			chk+=document.forms['table']['check[]'][i].value+",";
			sum+=1;
		}
	}

	if($("input:checkbox[name='check[]']").is(":checked")){
		if(confirm("장바구니를 비우시겠습니까?")){
			if(sum==0){
				pp=$('input:checkbox[name="check[]"]').val();
				location.href="deleteonesuccess?basket_no="+pp;
			}else{
				location.href="deleteselsuccess?basket_no="+chk;
			}
		}else{
			return false;
		}
	}
}

//장바구니 목록 선택 구매
function buysel(){
	var chk="";
	var pp;
	var sum=0;
	for(var i=0;i<document.forms['table']['check[]'].length;i++){
		if(document.forms['table']['check[]'][i].checked){
			chk+=document.forms['table']['check[]'][i].value+",";
			sum+=1;
		}	
	}
	if($("input:checkbox[name='check[]']").is(":checked")){
		if(confirm("선택된 상품을 구매하시겠습니까?")){
			if(sum==0){
				pp=$('input:checkbox[name="check[]"]').val();
				location.href="buy?basket_no="+pp;
			}else{
				location.href="buy?basket_no="+chk;
			}
		}else{
			return false;
		}
	}
}
	
</script>
<!--장바구니 목록 표시 -->

<title>장바구니 정보</title>    
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
		<h3><b><font color="red">장바구니 목록</font></b>  >  주문서  >  결제완료</h3>
		<form name="table">
		<table border="1" style="margin-left: 10;margin-top: 20;margin-bottom:20;width:  750;margin-right: 10">
				<tr>
					<td style="background-color: red" width="30" align="center">
					<input type="checkbox" name="checkall" onclick="checkAll(this.checked);"></td>
					<td style="background-color: red; width: 200" align="center">이미지</td>
					<td style="background-color: red" align="center" width="150">상품 이름</td>
					<td style="background-color: red" align="center" width="100">카테고리</td>
					<td style="background-color: red" align="center" width="50">수량</td>
					<td style="background-color: red" align="center" width="80">가격</td>
					<td style="background-color: red" align="center" width="100"></td>
				</tr>
		
			 <c:forEach items="${list}" var="pdt">
				<tr>
					<td align="center" width="30"><input type="checkbox" name="check[]" value="${pdt.basket_no }" ></td>
					<td height="200"><img src="${pdt.img }" alt="페이지를 표시할 수 없습니다." width="200" width="99%" height="99%"></td>
					<td align="center" width="150">${pdt.item_name }</td>
					<td align="center" width="100">${pdt.category }</td>
					<td align="center" width="50">${pdt.buy_vol }</td>
					<td align="center" width="80">${pdt.price}</td>	
					<td align="center" width="100">
					<input type="button" value="바로구매" style="font-size: 13" onclick="buyoneitem(${pdt.basket_no});">
					<br><br>
					<input type="button" value="비우기" style="font-size: 13;" onclick="deletebasketone(${pdt.basket_no});">  </td>
				</tr>
			</c:forEach>
		</table>
		&nbsp;&nbsp;&nbsp;선택한 상품 <a href="#" onclick="deletesel();">삭제</a><br>
			<div class="button" style="margin-bottom: 100;margin-left: 160;margin-top: 20;margin-right: 100">
		<a href="#" onclick="buysel();"><img src="../resources/image/buy.JPG" alt="페이지를 표시할 수 없습니다." width="200"></a>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		<a href="../member/main"><img src="../resources/image/쇼핑 더 하기.jpg" alt="페이지를 표시할 수 없습니다." width="200"></a>
			</div>
		</form>
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