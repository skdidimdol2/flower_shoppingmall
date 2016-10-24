<!-- admin 권한의 상품 수정 페이지-->
<%@page import="com.fasterxml.jackson.annotation.JsonInclude.Include"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
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
<script type="text/javascript"
	src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/4.0.5/handlebars.min.js"></script>
<script type="text/javascript">

function readImg(input){
	if(input.files&&input.files[0]){ //파일을 선택했을때 파라미터로 보내는 값;
		var reader = new FileReader();
		reader.onload=function(e){
			 $("#image").attr("src", e.target.result); //이미지 파일 표시~
		}
		reader.readAsDataURL(input.files[0]); //파일의 경로를 읽는다.
	}
}

function adminDelitem(a){
	if(confirm("상품을 삭제하시겠습니까?")){
		alert("상품이 삭제되었습니다.");
		location.href="adminDelitem?item_no="+a;
	}else{
		return false;	
	}
}
function noChange(){
	var v = 
	document.getElementById('form1').submit();
}

</script>
<%@ include file="header.jsp"%>
<title>상품 수정</title>

</head>
<body>
	<!-- 상품 상세 설명 -->
	<div class="container" style="margin-top: 50;margin-left: 50">
		<p></p>
		<p></p>
		<form name="form1" action="modifyOk" id="form1">
			<input type="hidden" name="item_no" value="${item.item_no}">
			<table style="width: 700; width:70%; height: 400;" border="1">
				<tr>
					<td rowspan="5" width="300" height="250">
					<input type="file" id="imgs" name="imgs" onchange="readImg(this);" style="display: none; "/>
					<img id="image" src="${item.img}" style="cursor:pointer;"width=100% height=100% onclick="document.all.imgs.click();"/>
					<input type="hidden" id="img" name="img" value="${item.img }"/>
				</tr>
				<tr>
					<td colspan="2" height="50" style="background-color: red;"
						align="center" valign="middle" width="100"><b
						style="font-size: 13">상품명  <input type="text" name="item_name" style="background: red" value="${item.item_name }"></b></td>
				</tr>
				
				<tr>
					<td width="20%" height="50" align="center">수량 <input type="text" name="volume" value="${item.volume }"></td>
				</tr>
				<tr>
					<td colspan="2" width="20%" height="50" align="center"><a
						href="javascript:history.back();">뒤로가기</a></td>
				</tr>
				<tr>
					<td colspan="3" style="background-color: orange;;" valign="middle"
						width="100" align="center" height="40"><b
						style="font-size: 13"></b> 상품 가격  <input type="text" style="background-color: orange;" name="price" value="${item.price}">
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 적립금 : ${item.price*0.05}원
				<br></td>
				</tr>
				<tr>
					<td colspan="3" style="background-color: orange;;" valign="middle"
						width="100" align="center" height="150"><b
						style="font-size: 13"></b>[상품 설명] <br><textarea name="item_content" rows="6" cols="70" style="background: orange;">${item.item_content}</textarea> 
					</td>
				</tr>
			</table>
			<p></p>
			<input type="submit" style="display: none;">
			<a href="#" onclick="noChange();">상품 수정</a>			
		</form>		
	<a href="#" onclick="adminDelitem(${item.item_no});"><h4>상품 삭제</h4></a>
	</div>
	
	<script>

	</script>
	<br>


<!-- footer -->
<footer class="container-fluid text-left" id="footer">

	<div style="margin-left: 40px; margin-bottom: 15px;">
		<br> 상호 : Flower | Tel : 112 | Fax : 119<br> 주소 : 대한민국 꽃밭
		어디든<br> Copyright ⓒ <b>Java Study</b> All rights reserved.
	</div>
</footer>
</body>

</html>