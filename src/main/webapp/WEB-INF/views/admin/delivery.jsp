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
<%-- <link rel="stylesheet" type="text/css" href="<c:url value="/resources/asset/css/style.css" />"/> --%>
<!-- end: Css -->
<link rel="shortcut icon" href="/resources/asset/img/logomi.png">
	
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script
	src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

<!-- header -->
<%@include file="header.jsp" %>
<!-- header end -->


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


<!-- body -->

	<body>
	
	  <!-- content -->
    <div class="content-wrapper">
        <div class="container">
            <div class="row">
                <div class="col-md-12">
                    <h4 class="page-head-line"> Delivery Page </h4>

                </div>

            </div>
	
	
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
			<tbody id="orderlist">
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