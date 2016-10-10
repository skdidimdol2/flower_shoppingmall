<!-- 장바구니에 보관을 완료하였을 때 페이지 실행 -->
<!-- 장바구니에 담긴 창이 열리도록 구현 (중복 방지) -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>장바구니 담기</title>
</head>
<body>

<!-- 새로고침 및 backspace 키 방지 -->
<script type="text/javascript">
document.onkeydown=function(e){
	key=(e)?e.keyCode:event.keyCode;
	if(key==8||key==116){
		if(e){
			e.preventDefault();
		}else{
			event.keyCode=0;
			event.returnValue=false;
		}	
	}	
}
function basketMove(){
	window.open("mybasket");
	window.close();
}
</script>
<div class="first" style="margin-top: 200;margin-left: 20">
	<b><h3>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;장바구니에 보관되었습니다.</h3></b>
	<br><br>
	<img src="../resources/image/basketlion.JPG" alt="페이지를 표시할 수 없습니다." width="300">
	
<!-- 상품 보관 메소드 사용 (insert DB) -->
<br><br><br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<a href="" onclick="basketMove();">장바구니 이동</a>&nbsp;&nbsp;&nbsp;<a href="" onclick="window.close();">다른 상품 보기</a>
</div>


</body>
</html>