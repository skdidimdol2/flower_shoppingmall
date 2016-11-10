<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>	
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!-- fn은 jstl에서 substring을 사용하기 위해서 -->
<!DOCTYPE>
<html>
<!-- top.jsp에 top부분 내용 기술. -->
<%@include file="top.jsp"%>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- start: Css -->
<link rel="stylesheet"
	href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script
	src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>   

<!-- plugins -->
<link rel="stylesheet" type="text/css" href="<c:url value="/resources/asset/css/plugins/font-awesome.min.css"/>"/>
<link rel="stylesheet" type="text/css" href="<c:url value="/resources/asset/css/plugins/datatables.bootstrap.min.css"/>"/>
<link rel="stylesheet" type="text/css" href="<c:url value="/resources/asset/css/plugins/animate.min.css"/>"/>

<link rel="stylesheet" type="text/css" href="<c:url value="/resources/asset/css/plugins/fullcalendar.min.css"/>"/>
<link rel="stylesheet" type="text/css" href="<c:url value="/resources/asset/css/plugins/simple-line-icons.css"/>"/>
<title>마이페이지</title>
<style>	
<%-- content --%>
	.container{
		margin:auto;
	}

	.col-sm-4{
		min-width:340px;
		margin-bottom:20px;
		margin-right:100px;
		margin-left:10px;
		
		border:1px solid #aaaaaa;
		border-radius:5px;
		padding-top:10px;
		padding-bottom:10px;
	}
	img{
		height:50px;
		width:50px;
	}	
</style>
</head> 
<body>
<p style="height:30px;"></p>
<!-- content -->
	<div class="container" id="mypage">
		<div class="row">
			<div><h4>쇼핑내역</h4></div><hr>	
			<div class="col-sm-4">
				<b>주문/배송조회</b> &emsp;최근 3달간의 주문 정보입니다.
				<table id="orderlist" class="table table-striped table-bordered">
					<thead>
						<tr>
							<th>주문번호</th>
							<th style="width:90;">상품명</th>
							<th>금액</th>
							<th>수량</th>
							<th>배송</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${orderlist}" var="dto">
							<tr>
								<td><b>${fn:substring(dto.order_date,2,10)}</b><br>
								<a href="../product/myorder">${dto.order_no}</a></td>
								<td style="width:90;"><a href="../product/detail?item_no=${dto.item_no}"><b>${dto.item_name}</b></a><br>
								<img src="${dto.img }"/></td>
								<td>${dto.payment_price}</td>
								<td>${dto.order_vol}</td>
								<td>${dto.payment_bool}</td>
							</tr>
						</c:forEach>	
					</tbody>
				</table>
			</div>
			<div class="col-sm-4">	
				<b>장바구니</b>&emsp;| <a href="../basket/mybasket">이동</a>
				<table id="orderlist" class="table table-striped table-bordered">
					<thead>
						<tr>
							<th style="width:90;">상품번호</th>
							<th>상품명</th>
							<th>수량</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${basketlist}" var="dto">
							<tr>
								<td style="width:90;">${dto.item_no}</td>
								<td>
									<a href="../product/detail?item_no=${dto.item_no}"><b>${dto.item_name}</b></a>
									<br>
									<img src="${dto.img }"/>
								</td>
								<td>${dto.buy_vol}</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
		</div>
		
		<div class="row">
			<div><h4>회원정보</h4></div><hr>	
			<div class="col-sm-4">
				<b>회원 조회/수정</b>
				<table style="min-width:300;">
					<tr>
						<th>아이디</th>
						<td>${me.id}</td>
					</tr>
					<tr>
						<th>비밀번호</th>
						<td>
							<form action="modifyInfoProc" method="post">
								<span class="hiddens pass">
									<input type="text" name="password1" placeholder="현재비밀번호" size="10"/><br>
									<input type="password" name="value" placeholder="변경비밀번호" size="10"/>
									<input type="hidden" name="types" value="password"/>
									<input type="submit" value="변경">
								</span>
							</form>
							<input id="pass" type="button" value="비밀번호변경">
						</td>
					</tr>
					<tr>
						<th>이름</th>
						<td>${me.name}</td>
					</tr>
					<tr>
						<th>생일</th>
						<td>${me.birthday}</td>
					</tr>
					<tr>
						<th>이메일</th>
						<td>${me.email}</td>
					</tr>
					<tr>
						<th>연락처</th>
						<td>${me.phone}</td>
					</tr>
					<tr>
						<th>성별</th>
						<td>${me.gender}</td>
					</tr>
					<tr>
						<th>포인트</th>
						<td>${me.point}</td>
					</tr>
					<tr>
						<th>가입일</th>
						<td>${fn:substring(me.joindate,0,16)}</td>
					</tr>
				</table>
				<button data-toggle="modal" data-target="#deleteModal">회원탈퇴</button>
				  <div class="modal fade" id="deleteModal" role="dialog">
				    <div class="modal-dialog modal-sm">
				      <div class="modal-content">
				        <div class="modal-header">
				          <button type="button" class="close" data-dismiss="modal">&times;</button>
				          <h4 class="modal-title">비밀번호입력</h4>
				          <input id ="pw" type="text"/>
				          <button onclick="deleteMember();">탈퇴</button>
				        </div>
				      </div>
				   </div>
				 </div>
			</div>
			<div class="col-sm-4">	
				<b>리뷰보기</b>
				<table id="reviewlist" class="table table-striped table-bordered">
					<thead>
						<tr>
							<th>번호</th>
							<th>상품명</th>
							<th>제목</th>
							<th>작성일</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${re}" var="dto">
							<tr onclick="reviewContent(${dto.review_no});" style="cursor:pointer;">
								<td>${dto.review_no}</td>
								<td>${dto.item_no}</td>
								<td>${fn:substring(dto.review_tit,0,8)}..</td>
								<td>${dto.review_date}</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
		</div>
	</div>
				
	
<!-- plugins -->
<script src="<c:url value="/resources/asset/js/plugins/moment.min.js"/>" type="text/javascript"></script>
<script src="<c:url value="/resources/asset/js/plugins/jquery.datatables.min.js"/>" type="text/javascript"></script>
<script src="<c:url value="/resources/asset/js/plugins/datatables.bootstrap.min.js"/>" type="text/javascript"></script> 
<script src="<c:url value="/resources/asset/js/plugins/jquery.nicescroll.js"/>" type="text/javascript"></script>
<script>
	$(document).ready(function(){
		$(".hiddens").hide();
	});
	$("#pass").click(function(){
		$("#pass").hide();
		$(".pass").show();
	});
	function deleteMember(){
		var password = $("#pw").val();
		location.href="deleteDao?password="+password;
	}
	function reviewContent(no){
		var option = "toolbar=no, menubar=no, location=no, directories=no, status=no, scrollbars=no,"
			option += "resizable=no, width=500, height=500, top=100, left=300";
			window.open("reviewContent?review_no="+no,"",option);
	}
</script>
</body>
</html>