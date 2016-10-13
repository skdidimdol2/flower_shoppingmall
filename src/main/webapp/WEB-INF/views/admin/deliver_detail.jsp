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
	
<!-- plugins -->
<link rel="stylesheet" type="text/css" href="<c:url value="/resources/asset/css/plugins/font-awesome.min.css"/>"/>
<link rel="stylesheet" type="text/css" href="<c:url value="/resources/asset/css/plugins/datatables.bootstrap.min.css"/>"/>
<link rel="stylesheet" type="text/css" href="<c:url value="/resources/asset/css/plugins/animate.min.css"/>"/>
<link rel="stylesheet" type="text/css" href="<c:url value="/resources/asset/css/style.css" />"/>
<!-- end: Css -->
<link rel="shortcut icon" href="/resources/asset/img/logomi.png">
	
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script
	src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>


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
 <%-- content --%>
	.content{
		min-height:100%; 
		width:1200px;
	}
<%-- search --%>
	#searchForm{
		position:relative;
		left:70px;
	}
	#searchBtn{
		position:relative;
		left:100px;
	}
<%-- btnGroup --%>
	#btnGroup{
		position:relative;
		left:70px;
	}		
<%-- board --%>
	#board_table{
		position:relative;
		left:20px;
		width:1300px;
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
					<li><a href="adminMember">회원 관리</a></li>
					<li><a href="itemMan">상품 관리</a></li>
					<li><a href="javascript:void(0);">게시판 관리</a></li>
					<li><a href="admin_sales?bool=0">매출 관리</a></li>
					<li><a href="delivery">배송 관리</a></li>			
				</ul>
			</div>
		</div>
	</nav>
<!-- body -->

	<body>
	<div class="search">
		<div>
			<button onclick="order()">전체 목록</button>&emsp;
			<button onclick="a()">배송 처리</button>&emsp;
			<button onclick="b()">취소/환불 처리</button>
		</div>
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
	
	<div id="order_table">
	<div id="table">
			<table id="datatable" class="table table-striped table-bordered">
			<thead>
				<tr>
					<th>주문번호</th>
					<th>상품번호</th>
					<th>아이디</th>
					<th>주문량</th>
					<th>결제방법</th>
					<th>결제유무</th>
					<th>주문일자</th>
					<th>주문액</th>
					<th>배송상태</th>
				</tr>
			</thead>
			<tbody id=orderlist">
			 <c:forEach items="${list}" var="l">
				<tr>
					<td>${l.order_no}</td>
					<td>${l.item_no }</td>
					<td>${l.id }</td>
					<td>${l.order_vol}</td>	
					<td>${l.payment_way}</td>
					<td>${l.payment_bool}</td>
					<td>${l.order_date}</td>
					<td>${l.payment_price}</td>
					<c:choose>
						<c:when test="${l.del_bool == 'Y' }">
							<td>배송완료</td>
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
			</tbody>
		</table>
	</div>
</div>	
	<br>
	
<!-- plugins -->
<script src="<c:url value="/resources/asset/js/plugins/moment.min.js"/>" type="text/javascript"></script>
<script src="<c:url value="/resources/asset/js/plugins/jquery.datatables.min.js"/>" type="text/javascript"></script>
<script src="<c:url value="/resources/asset/js/plugins/datatables.bootstrap.min.js"/>" type="text/javascript"></script> 
<script src="<c:url value="/resources/asset/js/plugins/jquery.nicescroll.js"/>" type="text/javascript"></script>
	
<script>
function order(){
	location.href="/Hit/admin/delivery";	
}

function a(){
	location.href="/Hit/admin/deliver_detail?detail=a";
}
function b(){
	location.href="/Hit/admin/deliver_detail?detail=b";
}

<%-- toggle --%>
$(document).ready(function(){
	$('#datatable').DataTable();
});

</script>

</body>

</html>