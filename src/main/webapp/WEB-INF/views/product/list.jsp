<!-- 상품 목록 보기 -->

<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
    
<%@include file="../member/top.jsp"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>	
<!DOCTYPE>
<html>

<!-- 도해추가 -->

<script type="text/javascript"
		src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.0/jquery.min.js"></script>
<script type="text/javascript"
		src="../resources/js/jquery.eislideshow.js"></script>
<script type="text/javascript"
		src="../resources/js/jquery.easing.1.3.js"></script>
<script type="text/javascript">

$(function() {
	$('#ei-slider').eislideshow({
		animation : 'center',
		autoplay : true,
		slideshow_interval : 2000,
		titlesFactor : 0
	});
});
</script>


<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="../resources/css/responsive.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script
	src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

<jsp:include page="../include/style.jsp"></jsp:include>

<script type="text/javascript">
function searchitem(a,b){
	window.location.href="searchitem?item_name="+a+"&category="+b;
}
</script>
	
<!-- 상품 리스트들에 대한 목록 표시 -->
<jsp:include page="../include/style.jsp"></jsp:include>

<title>Flower</title>    

<<<<<<< HEAD
=======
<%-- <%-- header 
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
	footer
	#footer {
		background-color:#ddddff;  
	} 
</style>--%>
>>>>>>> origin/donggun

</head>
<body>

<<<<<<< HEAD
<section class="listings">
		<div class="wrapper">
			<ul class="properties_list">
				<c:forEach items="${list}" var="pdt">
					<li><a href="detail?item_no=${pdt.item_no}"> <img
							src="${pdt.img}" class="property_img"></a> <span class="price">${pdt.price}원</span>
						<div class="property_details">
							<h1>${pdt.item_name}</h1>
							<h2>
								${pdt.price}원 <span class="property_size">적립금 :
									${pdt.price*0.05}원</span>
							</h2>
						</div></li>
				</c:forEach>
			</ul>
			<div class="more_listing">
				<a href="#"  class="more_listing_btn">위로 가기</a>
=======
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
				<a href="../member/myPage">My Page</a>&emsp;&emsp;
>>>>>>> origin/donggun
			</div>
		</div>
<<<<<<< HEAD
	</section>


=======
	</header>
	<!-- navbar -->	
	<nav class="navbar navbar-default">
		<div class="container-fluid">
			<div class="navbar-header" id="mobileNavbar">
				<form action="main" method="get" autocomplete="on">
					<input type="submit" class="navbar-toggle" value="검색"/>
					<input type="text" name="item_name" class="navbar-toggle" style="width:150px;" placeholder="검색어 입력"/>
					
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
					<li><a href="../board/boardList">자유게시판</a></li>
			
				</ul>
				<input type="text" style="width:170px;margin-bottom:10px;margin-left:3px;" placeholder=" 검색어 입력">
				<a href="#"><span class="glyphicon glyphicon-search" style="color:#ffffff"></span></a>
			</div>
		</div>
	</nav>
>>>>>>> origin/donggun
<!-- board -->
	.<%--   <a href="detail?item_no=${pdt.item_no}"> <img
                              src="${pdt.img}" width="300" height="300"></a>
<<<<<<< HEAD
                        </td>
                        </tr>
                        <tr>
                        <td>
                           ${pdt.item_name}
                           <br>
                           </td>
                        </tr>
                        <tr>
                        <td>
                           ${pdt.price}원
                           <br>
                           </td>
                        </tr>
                        <tr>
                        <td>
                           적립금 : ${pdt.price*0.05}원
                           <br>
                           </td>
=======
                        </tr>
                        <tr>
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
>>>>>>> origin/donggun
                        </tr>
                    
                     </table>
                  
                  <c:if test="${i%j == j-1 }">
                     </tr>
                  </c:if>
                  <c:set var="i" value="${i+1 }" />
               </c:forEach>
            </table>
            <p></p>
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
</script> --%>

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
	