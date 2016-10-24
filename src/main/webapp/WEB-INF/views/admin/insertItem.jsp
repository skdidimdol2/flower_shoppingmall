<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>	
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<%@include file="header.jsp"%>

<script type="text/javascript">
	function readImg(input) {
		if (input.files && input.files[0]) {
			var reader = new FileReader();
			reader.onload = function(e) {
				$('#blah').attr('src', e.target.result).width(400).height(300);
			};
			reader.readAsDataURL(input.files[0]);
		}
	}

	function insertCondition() {
		if ($('#category option:selected').val() == 0) {
			alert("카테고리를 선택하여 주세요.");
		} else if (document.item.img.value == '') {
			alert("이미지를 넣어 주세요.");
		} else if (document.item.item_name.value == '') {
			alert("상품명을 입력하세요.");
		} else if (document.item.volume.value == '') {
			alert("수량을 입력하세요.");
		} else if (document.item.price.value == '') {
			alert("가격을 입력하세요.");
		} else {
			alert("상품이 추가되었습니다.");
			document.name.submit();

		}
	}
</script>

<title>admin Page</title>

</head>
<body>

	<div class="content-wrapper">

		<div class="container">
			<div class="row">
				<div class="col-md-12">
					<h4 class="page-head-line">Add Product Page</h4>
				</div>
			</div>

			<div id="content">

				<ul class="nav nav-tabs">
					<li class="active"><a href="itemMan">상품목록</a></li>
					<li class="active">
					    <a class="dropdown-toggle" data-toggle="dropdown" href="#">상품추가
				        <span class="caret"></span></a>
						<ul class="dropdown-menu">
							<li><a href="insertItem">단품</a></li>          
							<li><a href="addProduct">서식 업로드</a></li>          
							<li><a href="excelDownload">서식 다운로드</a></li>         
						</ul>      
					</li>
				</ul>
				<br>

				<div class="panel panel-default" align="center">
					<form action="adminInsitem" method="get" name="item"
						onsubmit="insertCondition();return false">
						<img src=""> 
						<input type="file" accept=".gif, .jpg, .png"
							   name="img" onchange="readImg(this);" style="display: none;"><br>
						<img id="blah" src="#" alt="이미지를 첨부하여 주세요"
							 onclick="document.all.img.click();" /><br> <br> 
						<b>상품명:</b><br>
						<input type="text" name="item_name" size="20">	<br> <br>
						<select id="category" name="category">
							<option value="0">카테고리</option>
							<option value="꽃바구니">꽃바구니</option>
							<option value="꽃다발">꽃다발</option>
							<option value="꽃상자">꽃상자</option>
							<option value="동양란">동양란</option>
							<option value="서양란">서양란</option>
							<option value="축하화환">축하화환</option>
							<option value="근조화환">근조화환</option>
						</select><br><br>
						<b>수량 :</b><br>
						<input type="text"name="volume" size="10"> <br> <br> 
						<b>가격 :</b><br>
						<input type="text" name="price" size="10"> <br> <br>
						<b>상세내용</b><br><br>
						<textarea rows="6" cols="50" name="item_content"></textarea>
						<br> <br> <input type="submit" value="상품 추가"><br>
					</form>
				</div>

			</div>
		</div>
	</div>


</body>
</html>