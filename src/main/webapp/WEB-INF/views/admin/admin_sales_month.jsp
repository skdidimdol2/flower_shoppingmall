<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page import="java.util.*"%>
<!DOCTYPE>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">

<jsp:useBean id="now" class="java.util.Date" />

<%@include file="header.jsp"%>

</head>

<script>
	function toXLS() {
		var file_name = $("#title").val() + " " + $("#savedate").val();
		$("#bool").attr('value', 1);
		location.href = "/Hit/admin/admin_sales_month?bool=" + $("#bool").val()
				+ "&month=" + $("#month").val() + "&file_name=" + file_name
				+ ".xls";
	}
</script>

<%
	String month = request.getParameter("month");
	int bool = Integer.parseInt(request.getParameter("bool"));
	if (bool == 0) {
		response.setContentType("text/html; charset=utf-8");
	} else {
		String file_name = request.getParameter("file_name");
		file_name = new String(file_name.getBytes("utf-8"), "iso-8859-1");
		response.setHeader("Content-Disposition", "attachment; filename=" + file_name);
		response.setHeader("Content-Description", "JSP Generated Data");
		response.setContentType("application/vnd.ms-excel");
	}
%>

<!-- body -->
<input type="hidden" id='month' value=<%=month%>>
<input type="hidden" id='bool' value=0>
<body>
	<!-- content -->
	<div class="content-wrapper">
		<div class="container">
			<div class="row">
				<div class="col-md-12">
					<h4 class="page-head-line">Sales Page</h4>

				</div>
			</div>
			<div class="content">
				<div align="center">
					<table id="datatables" class="table table-striped table-bordered">
						<thead>
						<tr>
							<td align="center">제목</td>
							<td colspan="2"><input type="text" id='title'
								style="width: 50%;" value="2016년 <%=month%>월 매출"></td>
							<td align="center">저장 일시</td>
							<td><input type="text" id='savedate' style="width: 70%;"
								value="<fmt:formatDate value="${now}" type="date" pattern="yyyy-MM-dd"/>"></td>
							<td><input type="button" id="save" onclick="toXLS()"
								value="저장하기"></td>
						</tr>
						<tr>
							<td colspan="7" align="center"><h1><%=month%>월 매출 현황
								</h1></td>
						</tr>
						
						<tr align="center">
							<th>주문 번호</th>
							<th>상품 번호</th>
							<th>상품 수량</th>
							<th>사용자</th>
							<th>주문 날짜</th>
							<th>주문 가격</th>
						</tr>
						</thead>
						<c:set var="sum" value="0" />
						<tbody>
						<c:forEach items="${list}" var="list">
							<tr>
								<td>${list.order_no}</td>
								<td>${list.item_no}</td>
								<td>${list.order_vol}</td>
								<td>${list.id}</td>
								<td><fmt:formatDate value="${list.order_date}"
										pattern="YYYY-MM-dd" /></td>
								<td><fmt:formatNumber value="${list.payment_price}"
										groupingUsed="true" />원</td>
								<c:set var="sum" value="${sum+list.payment_price}" />
							</tr>
						</c:forEach>
						</tbody>
						<tr align="center">
							<td>총 매출액</td>
							<td colspan="5"><fmt:formatNumber value="${sum}"
									groupingUsed="true" /> 원</td>
						</tr>
					</table>
				</div>
				<input type="button" onclick="history.back()" value="돌아가기">
			</div>
		</div>
		</div>
</body>
<br>
<br>

<!-- footer -->
<%@include file="hooter.jsp"%>
<!-- footer end -->
</html>