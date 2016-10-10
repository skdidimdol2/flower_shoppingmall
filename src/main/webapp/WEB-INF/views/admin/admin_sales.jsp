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

<script>
	function toXLS() {
		var file_name = $("#title").val()+" "+$("#savedate").val();
		$("#bool").attr('value',1);
		location.href = "/Hit/admin/admin_sales?bool="+$("#bool").val()+"&file_name="+file_name+".xls";
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
					<li><a href="../admin/delivery">배송 관리</a></li>			
				</ul>
			</div>
		</div>
	</nav>
<!-- body -->
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
				<td><input type="text" id='title' style="width:50%;" value="2016년 월별 매출"></td>
				<td align="center">저장 일시</td>
				<td><input type="text" id='savedate' style="width:50%;" value='2016-10-06'></td>
			</tr>
			<tr>
				<td colspan="4" align="center"><h1>월별 매출 현황</h1></td>
			</tr>
			<!-- <tr>
				<td colspan="4" align="center"><h4>월별 매출 현황표</h4></td>
			</tr> -->
			<tr align="center">
				<td colspan="2">
					<h4>구분</h4>
				</td>
				<td colspan="2">
					<h4>매출</h4>
				</td>
			</tr>
			<c:set var="sum" value="0"/>
			<c:forEach items="${list}" var="list">
				<tr align="center">
					<td colspan="2"><a href="admin_sales_month?bool=0&month=${list.month}">${list.month} 월</a></td>
					<td colspan="2"><fmt:formatNumber value="${list.payment_price_sum}" groupingUsed="true"/>원</td>
					<c:set var="sum" value="${sum+list.payment_price_sum}"/>
				</tr>
			</c:forEach>
			<tr align="center">
				<td colspan="2">총 매출액</td>
				<td colspan="2"><fmt:formatNumber value="${sum}" groupingUsed="true"/> 원</td>
			</tr>
		</table>
	</div>
	<br>
	<div id="chart1" style="width:100%; height:40%;">
	</div>
	<script>
	var line=[['${list[0].month}월', ${list[0].payment_price_sum}], ['${list[1].month}월', ${list[1].payment_price_sum}]
      ,['${list[2].month}월', ${list[2].payment_price_sum}], ['${list[3].month}월', ${list[3].payment_price_sum}]
	  ,['${list[4].month}월', ${list[4].payment_price_sum}], ['${list[5].month}월', ${list[5].payment_price_sum}]
	  ,['${list[6].month}월', ${list[6].payment_price_sum}], ['${list[7].month}월', ${list[7].payment_price_sum}]
	  ,['${list[8].month}월', ${list[8].payment_price_sum}], ['${list[9].month}월', ${list[9].payment_price_sum}]
	  ,['${list[10].month}월', ${list[10].payment_price_sum}], ['${list[11].month}월', ${list[11].payment_price_sum}]];
	
	$(function(){
		$.jqplot('chart1', [line], 
		{
			title: '매출 현황 그래프',
			series:[{renderer:$.jqplot.BarRenderer}],
			axes: {
				xaxis: {
					renderer: $.jqplot.CategoryAxisRenderer,
					label: "날짜 (월)"
				},
				yaxis: {
					label: "가격 (원)"
				}
			},
		});
	});
	</script>	
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
