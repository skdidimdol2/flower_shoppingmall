<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>	
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page import="java.util.*" %>
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
<!-- <link class="include" rel="stylesheet" type="text/css" href="../resources/jquery.jqplot.css" /> -->
<link rel="stylesheet" type="text/css" href="https://cdnjs.cloudflare.com/ajax/libs/jqPlot/1.0.8/jquery.jqplot.min.css" />

<link rel="stylesheet" href="http://code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css" type="text/css" />  
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>  
<script src="http://code.jquery.com/ui/1.8.18/jquery-ui.min.js"></script> 
 <jsp:useBean id="now" class="java.util.Date"/>
 
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

<script>
	$(function(){
		$("#savedate").datepicker({
			dateFormat: 'yy-mm-dd'
		});
	});

	function toXLS() {
		var file_name = $("#title").val()+" "+$("#savedate").val();
		$("#bool").attr('value',1);
		location.href = "/Hit/admin/admin_sales_month?bool="+$("#bool").val()+"&month="+$("#month").val()+"&file_name="+file_name+".xls";
	} 
</script>

<%
	String month = request.getParameter("month");
	int bool= Integer.parseInt(request.getParameter("bool"));
	if(bool==0){
		response.setContentType("text/html; charset=utf-8");
	}else{
		String file_name = request.getParameter("file_name");
		file_name = new String(file_name.getBytes("utf-8"),"iso-8859-1");
		response.setHeader("Content-Disposition", "attachment; filename="+file_name);
		response.setHeader("Content-Description", "JSP Generated Data");
		response.setContentType("application/vnd.ms-excel");
	}
%>
<title>admin Page</title> 
</head>

<!--header -->
	<header>
		<div class="contatiner-fluid">		
			<a href="admin">관리자 페이지</a>
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
<!-- body -->
<input type="hidden" id='month' value=<%=month %>>
<input type="hidden" id='bool' value=0>
	<div align="center">
		<input type="button" id="save" onclick="toXLS()" value="저장하기">
		<input type="button" id="preview" value="미리보기">
		<input type="button" id="print" value="출력하기">
	</div><br>
	<body>
	<div align="center">
		<table border="1" style="width:100%;">
			<tr>
				<td align="center">제목</td>
				<td colspan="2"><input type="text" id='title' style="width:50%;" value="2016년 <%=month%>월 매출"></td>
				<td align="center">저장 일시</td>
				<td colspan="2"><input type="text" id='savedate' style="width:70%;" value="<fmt:formatDate value="${now}" type="date" pattern="yyyy-MM-dd"/>"></td>
			</tr>
			<tr>
				<td colspan="6" align="center"><h1><%= month %>월 매출 현황</h1></td>
			</tr>

			<tr align="center">
				<td>
					<h4>주문 번호</h4>
				</td>
				<td>
					<h4>상품 번호</h4>
				</td>
				<td>
					<h4>상품 수량</h4>
				</td>
				<td>
					<h4>사용자</h4>
				</td>
				<td>
					<h4>주문 날짜</h4>
				</td>
				<td>
					<h4>주문 가격</h4>
				</td>
			</tr>
			<c:set var="sum" value="0"/>
			<c:forEach items="${list}" var="list">
				<tr align="center">
					<td>${list.order_no}</td>
					<td>${list.item_no}</td>
					<td>${list.order_vol}</td>
					<td>${list.id}</td>
					<td><fmt:formatDate value= "${list.pay_date}" pattern="YYYY-MM-dd"/></td>
					<td><fmt:formatNumber value="${list.payment_price}" groupingUsed="true"/>원</td>
					<c:set var="sum" value="${sum+list.payment_price}"/>
				</tr>
			</c:forEach>
			<tr align="center">
				<td>총 매출액</td>
				<td colspan="5"><fmt:formatNumber value="${sum}" groupingUsed="true"/> 원</td>
			</tr>		
		</table>
	</div>
	</body>
	<br>
	<input type="button" onclick="history.back()" value="돌아가기"> 
	<br><br>
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