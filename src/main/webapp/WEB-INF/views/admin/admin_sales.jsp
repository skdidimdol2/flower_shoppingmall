<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<jsp:useBean id="now" class="java.util.Date" />

<%@include file="header.jsp" %>

</head>

<script>
	 
	function toXLS() {
		var file_name = $("#title").val()+" "+$("#savedate").val();
		$("#bool").attr('value',1);
		location.href = "/Hit/admin/admin_sales?bool="+$("#bool").val()+"&file_name="+file_name+".xls";
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
<!-- body -->
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

		
				<table id="datatable" class="table table-striped table-bordered" style="width: 100%;">
					<thead>
					<tr>
						<td align="center" colspan="2">제목</td>
						<td colspan="4"><input type="text" id='title'
							style="width: 70%;" value="2016년 월별 매출"></td>
						<td align="center" colspan="2">저장 일시</td>
						<td colspan="4"><input type="text" id='savedate'
							style="width: 70%;"
							value="<fmt:formatDate value="${now}" type="date" pattern="yyyy-MM-dd"/>">
						</td>
						<td><input type="button" id="save" onclick="toXLS()"
							value="저장하기"></td>
					</tr>
					<tr>
						<td colspan="13" align="center"><h1>월별 매출 현황</h1></td>
					</tr>
				
					<tr align="center" >
						<td>
							<h4>구분</h4>
						</td>
						<c:forEach items="${list}" var="list">
							<td><a href="admin_sales_month?bool=0&month=${list.month}">${list.month} 월</a></td>
						</c:forEach>
					</tr>
					</thead>
					<tr align="center">
						<td>
							<h4>매출</h4>
						</td>
						<c:set var="sum" value="0" />
						<c:forEach items="${list}" var="list">
							<td><fmt:formatNumber value="${list.payment_price_sum}" groupingUsed="true"/>원</td>
							<c:set var="sum" value="${sum+list.payment_price_sum}" />
						</c:forEach>
					</tr>
					<tr>
						<td align="center" ><h4>총 매출액</h4>
						<td colspan="12" align="center"><h4>
								<fmt:formatNumber value="${sum}" groupingUsed="true" /> 원 
							</h4>
					</tr>
				</table>
			</div>
			<br>
			<div id="chart1" style="width: 100%; height: 40%;"></div>
			</div>
	</body>
	
   <!-- footer -->
   <%@include file="hooter.jsp" %>
   <!-- footer end -->			
	
</html>