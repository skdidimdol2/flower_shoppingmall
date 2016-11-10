<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE>
<html>
<head>
<meta charset="utf-8">
<style>
@charset "utf-8";
@import url(https://fonts.googleapis.com/css?family=Lato:400,700);
* {
  -moz-box-sizing: border-box;
  -webkit-box-sizing: border-box;
  box-sizing: border-box;
}

body {
  font-family: 'Lato', sans-serif;
  background-color: #f8f8f8;
}
body .container {
  position: relative;
  overflow: hidden;
  width: 80%;
  margin: 80px auto 0;
  background-color: #ffffff;
  -moz-box-shadow: rgba(0, 0, 0, 0.1) 0px 10px 30px;
  -webkit-box-shadow: rgba(0, 0, 0, 0.1) 0px 10px 30px;
  box-shadow: rgba(0, 0, 0, 0.1) 0px 10px 30px;
}
body .container h1 {
  font-size: 18px;
  font-weight: 700;
  margin-bottom: 23px;
  text-align: center;
  text-indent: 6px;
  letter-spacing: 7px;
  text-transform: uppercase;
  color: #263238;
}
body .container .inner {
  width: 100%;
  height: 1500px;
  padding: 58px 40px 0;
}

body .container .content .cartList{
	margin-top:100px;
	margin-bottom:100px;
	width: 100%;
}
body .container .content .cartList img{
	width:300px;
}

body .container .content .cartList tfoot{
	text-align: center;
}

body .container .content .cartList tfoot a{
	text-decoration: none;
	color: #263238;
}

body .container .submit-wrap {
  position: relative;
  bottom: 0;
  width: 100%;
}
body .container input.submit {
  float: right;
  font-size: 12px;
  line-height: 42px;
  display: block;
  width: 10%;
  height: 42px;
  cursor: pointer;
  vertical-align: middle;
  letter-spacing: 2px;
  text-transform: uppercase;
  color: #263238;
  border: 1px solid #263238;
  background: transparent;
  -moz-border-radius: 2px;
  -webkit-border-radius: 2px;
  border-radius: 2px;
}
body .container input.submit:hover {
  background-color: #263238;
  color: #ffffff;
  -moz-transition: all 0.2s;
  -o-transition: all 0.2s;
  -webkit-transition: all 0.2s;
  transition: all 0.2s;
}

@keyframes slideIn {
  0% {
    filter: progid:DXImageTransform.Microsoft.Alpha(Opacity=0);
    opacity: 0;
    margin-left: -320px;
  }
  100% {
    filter: progid:DXImageTransform.Microsoft.Alpha(enabled=false);
    opacity: 1;
    margin-left: 0px;
  }
}
@-webkit-keyframes slideIn {
  0% {
    filter: progid:DXImageTransform.Microsoft.Alpha(Opacity=0);
    opacity: 0;
    margin-left: -320px;
  }
  100% {
    filter: progid:DXImageTransform.Microsoft.Alpha(enabled=false);
    opacity: 1;
    margin-left: 0px;
  }
}
.credits {
  display: block;
  position: absolute;
  right: 0;
  bottom: 0;
  color: #999999;
  font-size: 14px;
  margin: 0 10px 10px 0;
}
.credits a {
  filter: progid:DXImageTransform.Microsoft.Alpha(Opacity=80);
  opacity: 0.8;
  color: inherit;
  font-weight: 700;
  text-decoration: none;
}

</style>
</head>
<body>

<div class="container">
		    <div class="inner">
			        <h1>shopping cart</h1>
			        <div class="content">
			        		<table class = "cartList">
								<thead>
								<tr>
									<th><input type="checkbox"></th>
									<th>product</th>
									<th>price</th>
									<th>qty</th>
									<th>total</th>
									<th></th>
									</tr>
								</thead>
								<tbody>
								<tr>
									<td><input type="checkbox"></td>
									<td><img src = "../resources/image/product1.jpg"></td>
									<td></td>
									<td></td>
									<td></td>
								</tr>
									
								</tbody>			        		
			        			<tfoot>
			        				<tr>
			        					<td colspan="5"><a href="">선택상품삭제</a>&emsp;|&emsp;<a href="">관심상품등록</a>&emsp;|&emsp;<a href="">장바구니비우기</a></td>
			        				</tr>
			        			</tfoot>
			        		</table>
			        </div>
			       
			         	<div class="submit-wrap">
							             <input type="button" value="all order" class="submit">
							             <input type="button" value="select order" class="submit">
						</div>
		    </div>
	</div>



<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script> 
<script type="text/javascript">
$('.container .bg').mousemove(function(e){
    var amountMovedX = (e.pageX * -1 / 30);
    var amountMovedY = (e.pageY * -1 / 9);
    $(this).css('background-position', amountMovedX + 'px ' + amountMovedY + 'px');
});
</script>
</body>
</html>