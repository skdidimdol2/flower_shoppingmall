<!-- 상품 상세 정보 보기 -->

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>	
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
<script type="text/javascript">

function basketinst(a){
	if($('#buy_vol option:selected').val()==0){
		alert("구매 수량을 선택하세요");
	}else{
			if(confirm("장바구니에 보관하시겠습니까?")){
				//window.location.href="../basket/basketsuccess?item_no="+a+"&buy_vol="+$('#buy_vol option:selected').val();
				window.open("../basket/basketsuccess?item_no="+a+"&buy_vol="+$('#buy_vol option:selected').val(),"장바구니","width=400 height=400");
				window.location.href="../member/main";
			}else{
				return false;
			}
	}
}
function buyitem(b){
	if($('#buy_vol option:selected').val()==0){
		alert("구매 수량을 선택하세요");
	}else{
			if(confirm("구매 페이지로 이동합니다.")){
				window.open("buy?item_no="+b+"&buy_vol="+$('#buy_vol option:selected').val());
			}else{
				return false;	
			}
	}
}
function totalPrice(a,b){
	var selval = $('#buy_vol option:selected').val();
	var total = a*selval;
	b.total.value=total;
}

</script>
	
<!-- 상품 리스트들에 대한 목록 표시 -->


<title>상품 상세 정보</title>    
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
		<%-- footer --%>
	#footer {
		background-color:#ddddff;  
	} 
</style>

</head>
<body>

<!--header -->
	<header>
		<div class="contatiner-fluid">
			<div id="users">
				<a href="../basket/mybasket"><span class="glyphicon glyphicon-gift">장바구니</span></a>
				<a href="#"><span class="glyphicon glyphicon-user"></span>내정보</a>
				<a href="#"><span class="glyphicon glyphicon-log-in"></span>로그인</a>
			</div>
			<a href="../member/main">Flower</a>
		</div>
	</header>

<body>
<!-- 상품 상세 설명 -->
	<div class="container">
			<p></p><p></p>
			
			<%-- <b style="color:white; background-color: black;font-size: 20px;margin-left: 250;font-style:inherit;">${list.item_name }</b><br><br><br>
			<table style="width: 700;height: 350" border="1" >
				<tr>
					<td rowspan="4" width="300" height="250"><img src="${list.img}" width=100% height=100%></td>
					<td style="background-color:red" align="center" valign="middle" width="100"><b style="font-size: 13">상품 번호</b></td>
					<td align="center" valign="middle"><font size='3'>${list.item_no }</font></td>
				</tr>
				<tr>
					<td style="background-color:red" align="center" valign="middle" width="100"><b style="font-size: 13">가격</b></td>
					<td align="center" valign="middle"><font size='3'>${list.price }</font></td>
				</tr>
				<tr>
					<td style="background-color:red" align="center" valign="middle" width="100"><b style="font-size: 13">남은 수량</b></td>
					<td align="center" valign="middle"><font size='3'>${list.volume }</font></td>
				</tr>
				<tr>
					<td style="background-color:red" align="center" valign="middle" width="100"><b style="font-size: 13">상세설명</b></td>
					<td>${list.item_content }</td>
				</tr>
			</table> --%>
			<table style="width: 700; height: 350" border="1">
         <tr>
            <td rowspan="5" width="300" height="300"><img src="${list.img}"
               width=100% height=100%></td>
            <td colspan="2" height="50" style="background-color: red"
               align="center" valign="middle" width="100"><b
               style="font-size: 13">상품명 : ${list.item_name }</b></td>
         </tr>
         <tr>
            <td width="20%" height="50" align="center"><a
               href="javascript:void(0);" onclick="basketinst(${list.item_no});">장바구니</a>
            </td>
            <td width="20%" height="50" align="center"><a
               href="javascript:void(0);" onclick="buyitem(${list.item_no});">바로
                  구매</a></td>
         </tr>
         <tr>
            <td width="20%" height="50" align="center"><a
               href="../product/list?category=?">Q&A</a></td>
            <td width="20%" height="50" align="center"><a
               href="../product/list?category=?">Review</a></td>
         </tr>
         <tr>
            <td width="20%" height="50" align="center"><select id="buy_vol"
               name="buy_vol">
                  <option>수량 선택</option>
                  <option value="1">1</option>
                  <option value="2">2</option>
                  <option value="3">3</option>
                  <option value="4">4</option>
                  <option value="5">5</option>
                  <option value="6">6</option>
                  <option value="7">7</option>
                  <option value="8">8</option>
                  <option value="9">9</option>
                  <option value="10">10</option>
            </select></td>
            <td width="20%" height="50" align="center">남은 수량 :
               ${list.volume}</td>
         </tr>
         <tr>
            <td colspan="2" width="20%" height="50" align="center"><a
               href="../member/main">쇼핑계속하기(뒤로가기)</a></td>
         </tr>
         <tr>
            <td colspan="3" style="background-color: yellow" valign="middle"
               width="100"><b style="font-size: 13"> 상품 가격 :
                  ${list.price}원 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 적립금 : ${list.price*0.05}원
                  <br> [상품 설명]<br> ${list.item_content}
            </b></td>
         </tr>
      </table>
			
			
	</div>
	<div class="first">
		<div class="two" style="margin-left: 100;margin-top: 30">
		<form name="form1">
		수량 : <select id="buy_vol" name="buy_vol" onchange="totalPrice(${list.price },this.form);">
				<option value="0">수량 선택</option>
				<option value="1">1</option>
				<option value="2">2</option>
				<option value="3">3</option>
				<option value="4">4</option>
				<option value="5">5</option>
				<option value="6">6</option>
				<option value="7">7</option>
				<option value="8">8</option>
				<option value="9">9</option>
				<option value="10">10</option>
			</select>&nbsp;&nbsp; | &nbsp;&nbsp;최대 수량 : 10개
			&nbsp;&nbsp;&nbsp;&nbsp;
		<!-- 장바구니와 구매 버튼을 클릭한 후, 확인을 누르면 파라미터값으로 item_no(상품번호)와 buy_vol(구매수량)값이 전송 -->
		 	<input type="button" id="bt1" value="장바구니" style="font-size: 15;" onclick="basketinst(${list.item_no});">
		 	&nbsp;&nbsp;&nbsp;&nbsp;
		 	<input type="button" id="bt2" value="구매" style="font-size: 15" onclick="buyitem(${list.item_no});">
		 	&nbsp;&nbsp;&nbsp;&nbsp;총 결제 금액 : <input type="text" name="total">
		 	</form>
		</div>
	<br><br>
	</div>
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