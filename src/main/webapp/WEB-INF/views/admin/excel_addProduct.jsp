<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>	
<!DOCTYPE>
<html>
<head>
<meta charset="utf-8">
</head>

<body>

<div align="center">
	
		<form name="asd" action="addProduct2">
			 			
			 		<h3>기존상품</h3>
						
							<c:if test="${empty pdList }">
								기존상품 추가 없음 
							</c:if>
							
							<c:if test="${not empty pdList}">
								<table class="table table-hover" >
									<tr>
										<td>상품번호</td>
										<td>수량</td>
									</tr>
									<c:forEach var="list" items="${pdList }" varStatus="status">
										<tr id="list_${status.getIndex() }">
										<td>${list.item_no }</td>
										<td>${list.volume }</td>
										</tr>
									</c:forEach>
								</table>
							</c:if>
							
							<h3>새상품</h3>
							
							<c:if test="${empty new_pdList }">
								새 상품 추가 없음
							</c:if>
							
							<table class="table table-hover" >
							
							<tr>
								<td>상품이름</td>
								<td>카테고리</td>
								<td>가격</td>
								<td>수량</td>
								<td>이미지</td>
								<td>상품설명</td>
							</tr>	
							
							<c:if test="${not empty new_pdList}">
								<c:forEach var="newlist" items="${new_pdList }" varStatus="status2">
									<tr id="newlist_${status2.getIndex() }">
									<td>${newlist.item_name }</td>
									<td>${newlist.category }</td>
									<td>${newlist.price }원</td>
									<td>${newlist.volume }</td>
									<td>${newlist.img }</td>
									<td>${newlist.item_content }</td>
									</tr>
								</c:forEach>
							</c:if>
						</table>
						
					<input type="submit" value="상품추가">
					
		</form>
		
</div>
</body>
</html>