<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>	
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
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
<!-- jquery의 jqplot 그래프 사용 -->
<link class="include" rel="stylesheet" type="text/css" href="../resources/jquery.jqplot.css" />
<script src="//code.jquery.com/jquery-1.11.0.min.js"></script>
<script type="text/javascript" src="../resources/jquery.jqplot.js"></script>
<script type="text/javascript" src="../resources/plugins/jqplot.categoryAxisRenderer.js"></script>
<script type="text/javascript" src="../resources/plugins/jqplot.barRenderer.js"></script>

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
<%-- carousel --%>
	.carousel-inner > .item > img,
  	.carousel-inner > .item > a > img {
    	width: 100%;
    	height:300px;
    	margin: auto;
  	}
<%-- main list --%>
	h3{
		width:100%
	}
	
	.container>.row>.col-sm-4>div{
		border:1px solid;
		border-color:#dddddd;
		font-family:고딕
	}
	.container>.row>.col-sm-4>div>div{
		margin-left:7px;margin-top:7px;
	}
  	
<%-- footer --%>
	#footer {
		background-color:#ddddff;  
	}  	
</style>

<script type="text/javascript">
function searchCheck(frm){
	        //검색
	       
	        if(frm.keyWord.value ==""){
	            alert("검색 단어를 입력하세요.");
	            frm.keyWord.focus();
	            return;
	        }
	        frm.submit();      
	    }
</script>



<title>delivery Page</title> 
</head>

<!--header -->
	<header>
		<div class="contatiner-fluid">		
			<a href="main">관리자 페이지</a>
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
					<li><a href="main">홈 <span class="glyphicon glyphicon-home"></span></a></li>
					<li><a href="javascript:void(0);">회원 관리</a></li>
					<li><a href="javascript:void(0);">상품 관리</a></li>
					<li><a href="javascript:void(0);">게시판 관리</a></li>
					<li><a href="admin_sales?bool=0">매출 관리</a></li>
					<li><a href="../admin/delivery;">배송 관리</a></li>			
				</ul>
			</div>
		</div>
	</nav>
<!-- body -->

	<body>
	<div align="center">
		<form name="deliver" method="get" action="../admin/deliver_detail">
			<button type="hidden" value="a" name="a">배송 처리</button>
			<button type="hidden" value="b" name="a">취소/환불 처리</button>
		</form>	
	</div><br>
	
	<form action="search" method="get">
			<select name="type" id="type" style="height:30">
				<option value="0">---선택---</option>
				<option value="order_no">주문번호</option>
				<option value="item_no">상품번호</option>
				<option value="id">아이디</option>
			</select>
			<input type="text" name="query" style="height:30"/>
			<input type="submit" class="btn btn-primary" value="검색"/>
	</form>
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
						</c:when>
						<c:otherwise>
						<form name="delsuc" method="get" action="../admin/delsuc">
							<td><button type="hidden" value="${l.order_no}" name="order_no">배송완료 처리</button><td>
							
						</form>	
						</c:otherwise>
					</c:choose>
					
					<c:if test="${l.cancel_bool == 'Y' }">
					<form name="delete" method="get" action="../product/delete">
						<td><button type="hidden" value="${l.order_no}" name="order_no">취소승인</button><td>
						<input type="hidden" value="${l.item_no}" name="item_no">
						<input type="hidden" value="${l.order_vol}" name="order_vol">
					</form>
					</c:if>
				</tr>
			</c:forEach>
		</table>
		
		
	</div>
</div>	
	<br>
	</body>
<!-- footer -->	
	<footer class="container-fluid text-left" id="footer">
		
		<div style="margin-left:40px;margin-bottom:15px;">
			<br>
			상호 : Flower  |  Tel : 112  |  Fax : 119<br>
			주소 : 대한민국 꽃밭 어디든<br>
			Copyright ⓒ <b>Java Study</b> All rights reserved. 
		</div>
	</footer>
</html>