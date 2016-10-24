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
<script type="text/javascript"
	src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/4.0.5/handlebars.min.js"></script>
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
<%--
header --%> a {
	text-decoration: none;
}

a:hover {
	text-decoration: none;
}

a:active {
	text-decoration: none
}

header>div>a {
	font-size: 40px;
	color: #000000;
	text-shadow: 2px 2px #000000;
	margin-left: 10px;
}

header>div>a:hover {
	text-decoration: none;
}

#users {
	float: right;
}

#users>a {
	color: #000000;
}

#users>a:hover {
	text-decoration: none;
}

<%--
footer --%> #footer {
	background-color: #ddddff;
}

.replyLi {
	background-color: "White";
	border-bottom: 1px solid Gray;
}
</style>

</head>
<body>

	<!--header -->
	<header>
		<div class="contatiner-fluid">
			<div id="users">
				<c:if test="${sessionScope.id!=null}">
					${sessionScope.id}님 환영합니다&emsp;&emsp;
				</c:if>
				<c:choose>
					<c:when test="${sessionScope.id==null}">
						<a href="../member/loginForm">Login</a>&emsp;&emsp;
					</c:when>
					<c:otherwise>
						<a href="../member/logout">logout</a><span></span>&emsp;&emsp;
						<a href="../product/myorder">Order</a>&emsp;&emsp;
					</c:otherwise>
				</c:choose>
				<a href="../basket/mybasket">Cart</a>&emsp;&emsp;
				<a href="../member/wishList">Wish List</a>&emsp;&emsp;
				<a href="../member/myPage">My Page</a>&emsp;&emsp;
			</div>
			<a href="../member/main">Flower</a>
		</div>
	</header>
<body>
	<!-- 상품 상세 설명 -->
	<div class="container">
		<p></p>
		<p></p>

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
		<form name="form1">
			<table style="width: 700; height: 350" border="1">
				<tr>
					<td rowspan="5" width="300" height="300"><img
						src="${list.img}" width=100% height=100%></td>
					<td colspan="2" height="50" style="background-color: red;"
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
					<td width="20%" height="50" align="center"><select
						id="buy_vol" name="buy_vol"
						onchange="totalPrice(${list.price },this.form);">
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
					</select></td>
					<td width="20%" height="50" align="center">남은 수량 :
						${list.volume}</td>
				</tr>
				<tr>
					<td colspan="2" width="20%" height="50" align="center"><a
						href="../member/main">쇼핑계속하기(뒤로가기)</a></td>
				</tr>
				<tr>
					<td colspan="3" style="background-color: orange;;" valign="middle"
						width="100" align="center" height="40"><b
						style="font-size: 13"></b> 상품 가격 : ${list.price}원
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 적립금 : ${list.price*0.05}원
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 총 결제 금액 : <input type="text"
						name="total"> <br></td>
				</tr>
				<tr>
					<td colspan="3" style="background-color: orange;;" valign="middle"
						width="100" align="center" height="80"><b
						style="font-size: 13"></b>[상품 설명] <br> ${list.item_content}
					</td>
				</tr>
			</table>
		</form>

		<%-- 		
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
	</div> --%>

		<input type="button" onclick="writeReview('${list.item_no}')"
			value="리뷰등록">


		<!-- 리뷰목록 -->

		<div id="review" align="center">

			<b> REVIEW</b>
			<hr color="#828282" width="800">

			<c:if test="${empty review}">
	      리뷰가 없습니다. 
	   </c:if>

			<c:if test="${not empty review}">
				<table border="1">
					<c:forEach items="${review}" var="re">
						<tr>
							<b>작성자</b> ${re.id} |
							<b>작성일</b> ${re.review_date}
							<br> ${re.review_tit}
							<br> ${re.review_con}
							<br>
							<img
								src="${pageContext.request.contextPath }/resources/review_img/${re.review_img}"
								width="100" height="100">
							<br>
							<hr color="#c8c8c8" width="800">
						</tr>
					</c:forEach>
				</table>
			</c:if>
		</div>

		<!-- 댓글 작업 시작~ -->
		<!-- 등록화면 + 밑에 댓글 + 페이징 -->
		<!-- 댓글 등록하는 화면 -->
		<!-- 킵킵 style="display: none;"-->
		<div class="box box-success">
			<div class="box-header">
				<h3 class="box-title">Q & A</h3>
			</div>
			<div class="box-body">
				<!-- label for 다음에 쓰는 id는 다음 input id와 연관이 된다. 
			결국, label을 누르면 input을 누른것처럼 같은 효과를 볼 수 있다.
			ex) 작성자를 누르면 input type=text 쪽으로 넘어가서 입력이 가능하게 됨 -->
				<label for="newReplyWriter">작성자</label> <input class="form-control"
					type="text" placeholder="USER ID" id="newReplyWriter"> <br>
				<label for="newReplyText">내용</label> <input class="form-control"
					type="text" placeholder="REPLY TEXT" id="newReplyText">
			</div>
			<br>
			<div class="box-footer">
				<button type="submit" class="btn btn-reply" id="replyAddBtn">댓글
					등록</button>
				<br></br>
			</div>
		</div>

		<!-- 댓글 출력 부분 -->
		<ul class="timeline">
			<div class="time-label" id="repliesDiv"></div>
			<button class="time-label" id="repliesDivAll">댓글 목록</button>
		</ul>
		<!-- 밑에 페이징 출력 부분 -->
		<div class='text-center'>
			<ul id="pagination" class="pagination pagination-sm no-margin "></ul>
		</div>

		<!-- 수정 버튼 눌렀을 때 / modal은 bootstrap에서 창을 아래와 같이 만들 수 있다. class에서 fade 속성을 쓰면
	 	부드럽게 열리고 닫히게 된다.-->
		<!-- data-dismiss="modal"속성은 모달창을 닫게하는 기능이다. -->
		<div id="modifyModal" class="modal modal-primary fade" role="dialog">
			<div class="modal-content">
				<div class="modal-header">
					<!-- &times; 는  x표 -->
					<button type="button" class="close" data-dismiss="modal">&times;</button>
					<h4 class="modal-title"></h4>
				</div>
				<div class="modal-body" data-rno>
					<p>
						<input type="text" id="replytext" class="form-control">
					</p>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-info" id="replyModBtn">수정</button>
					<button type="button" class="btn btn-danger" id="replyDelBtn">삭제</button>
					<button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
				</div>
			</div>
		</div>

		<!-- 답글 버튼 눌렀을 때 / modal은 bootstrap에서 창을 아래와 같이 만들 수 있다. class에서 fade 속성을 쓰면
	 	부드럽게 열리고 닫히게 된다.-->
		<!-- data-dismiss="modal"속성은 모달창을 닫게하는 기능이다. -->
		<div id="replyModal" class="modal modal-primary fade" role="dialog">
			<div class="modal-content">
				<div class="modal-header">
					<!-- &times; 는  x표 -->
					<button type="button" class="close" data-dismiss="modal">&times;</button>
					<h4 class="replymodal-title"></h4>
				</div>
				<div class="modal-body" data-rno>
					<p>
						<label for="newReplyWriter">작성자</label> <input
							class="form-control" type="text" placeholder="USER ID"
							id="replyid"> <br> <label for="newReplyText">답글
							내용</label> <input class="form-control" type="text"
							placeholder="REPLY TEXT" id="replycon"> <input
							type="hidden" id="transfer">
					</p>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-info" id="replySubBtn">등록</button>
					<button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
				</div>
			</div>
		</div>




		<!-- template으로 댓글 창 모양 내기-->
		<!-- 중간에 {{#prettifyDate reply_date}}{{/prettifyDate}}는 핸들바의 사용자정의 함수라고
		생각해도 된다. 모양 만들기  -->
		<!-- 핸들바에서는 {{id}} 이런식으로 데이터를 뽑는다. -->
		<script id="template" type="text/x-handlebars-template">
		{{#each .}}
			<table class="replyLi" data-rno="{{reply_no}}" style="width: 100%;">
				<tr>
					<td align="right"><font color="White">.</font></td>
				</tr>
				<tr>
    				<td>{{reply_intend}}짜잉나({{id}})
					 - {{#prettifyDate reply_date}}{{/prettifyDate}}
					</td>
 				</tr>
				<tr>
 					<td><h5 class="reply_content">{{reply_intend}}{{reply_con}}</h5></td>
					<input type="hidden" class="transfer" value ="{{reply_step}}/{{reply_group}}/{{reply_level}}">
					
				</tr>
				<tr>
					<td align="right">
						<a class="btn btn-danger" data-toggle="modal" data-target="#replyModal">답글</a>
    					<a class="btn btn-danger" data-toggle="modal" data-target="#modifyModal">수정</a>
					</td>
				</tr>
				<tr>
					<td align="right"><font color="White">.</font></td>
				</tr>
			</table>
		{{/each}}

	</script>

		<script>
		/* date 모양 만들기 */
		Handlebars.registerHelper('prettifyDate', function(options) {
			var dateObj = new Date(options);
			var year = dateObj.getFullYear();
			var month = dateObj.getMonth() + 1;
			var date = dateObj.getDate();
			var time = dateObj.getHours() + ":" + dateObj.getMinutes() + ":"
					+ dateObj.getSeconds();
			return (year + "/" + month + "/" + date + " " + time);
		});

		// 상세페이지로 들어간 item_no를 변수로 저장한다.
		// 그래서 getPage할 때 item_no로 디비로 접근해 그것만 뽑아오기 등등..
		var item_no = ${list.item_no};
		
		console.log(item_no);
		var replyPage = 1;
		getPageFirst("/Hit/product/replies/" + item_no);
		
		// 댓글 보기 처음 3개만 보여주기
		function getPageFirst(pageInfo) {
			$.getJSON(pageInfo, function(data) {
				printData(data.list, $("#repliesDiv"), $('#template'));
			});
		}
		// 댓글 보기 
		function getPage(pageInfo) {
			$.getJSON(pageInfo, function(data) {
				printData(data.list, $("#repliesDivAll"), $('#template'));
				printPaging(data.pageMaker, $(".pagination"));
				$("#repliesDiv").hide();
				// 아직 미구현 댓글의 총 개수
				$("#replycntSmall").html("[" + data.pageMaker.totalCount + " ]");
			});
		}

		// 핸들바로 데이터 전송 
		var printData = function(replyArr, target, templateObject) {
			var template = Handlebars.compile(templateObject.html());
			var space = "";
            for(var i=0; i<replyArr.length; i++){
                for(var j=0; j<replyArr[i].reply_level; j++){
                      space += ("　　　"); 
                }
             replyArr[i].reply_intend = space;
             space="";
        	}
			var html = template(replyArr);
			$(".replyLi").remove();
			target.after(html);
		}
		
		// 댓글 페이징 처리 밑에 숫자 부분
		var printPaging = function(pageMaker, target) {
			var str = "";
			// << 조건 
			if (pageMaker.prev) {
				str += "<li><a href='" + (pageMaker.startPage - 1)+ "'> << </a></li>";
			}
			
			// 번호 눌렀을 때 .pagination li a 클릭 함수로 들어가서 처리한다.
			for (var i = pageMaker.startPage, len = pageMaker.endPage; i <= len; i++) {
				var strClass = pageMaker.cri.page == i ? 'class=active' : '';
				str += "<li "+strClass+"><a href='"+i+"'>" + i + "</a></li>";
			}
			// >> 조건
			if (pageMaker.next) {
				str += "<li><a href='" + (pageMaker.endPage + 1)+ "'> >> </a></li>";
			}
			target.html(str);
		};
		
		// 모달 창 부분 제목 부분과 내용 부분 읽어오는 부분
		$(".timeline").on("click", ".replyLi", function(event) {
			var reply = $(this);
			$("#replytext").val(reply.find('.reply_content').text());
			$(".modal-title").html(reply.attr("data-rno"));
			$("#transfer").val(reply.find('.transfer').val());
			
		});

		// 댓글 목록 출력 부분
		$("#repliesDivAll").on("click", function() {
			/* 	if ($(".timeline li").size() > 1) {
					return;
				} */
			getPage("/Hit/product/replies/" + item_no + "/1");
		});

		/* event.preventDefault() 는 a href 태그의 페이지 전환을 막는 역할을 한다. */
		// 막은 후 그때의 페이지를 저장해서 리스트 출력
		$(".pagination").on("click", "li a", function(event) {
			event.preventDefault();
			replyPage = $(this).attr("href");
			getPage("/Hit/product/replies/" + item_no + "/" + replyPage);
		});

		/* ADD 버튼 누를 때 이벤트 .ajax()를 통해 서버 호출 후 JSON으로 데이터 전송 */
		$("#replyAddBtn").on("click", function() {
			var idObj = $("#newReplyWriter");
			var reply_conObj = $("#newReplyText");
			var id = idObj.val();
			var reply_con = reply_conObj.val();

			// $.ajax()를 통해 서버를 호출한다. 전송하는 데이터를 JSON으로 구성된 문자열 사용
			$.ajax({
				type : 'post',
				url : '/Hit/product/replies',
				headers : {
					"Content-Type" : "application/json",
					"X-HTTP-Method-Override" : "POST"
				},
				dataType : 'text',
				/* JSON.stringify 를 통해 JSON 데이터를 구성해서 전송 */
				data : JSON.stringify({
					item_no : item_no,
					id : id,
					reply_con : reply_con
				}),
				success : function(result) {
					if (result == 'SUCCESS') {
						alert("등록 되었습니다.");
						replyPage = 1;
						getPage("replies/" + item_no + "/" + replyPage);
						idObj.val("");
						reply_conObj.val("");
					}else{
						alert("로그인을 하세요.");
					}
				}
			});	
		});

		/* replymodal창에서 등록 버튼 눌렀을 때 이벤트 */
		$("#replySubBtn").on("click", function() {		
			var reply = new Array();
			var replyAll = $("#transfer").val();
			reply = replyAll.split("/");
	
			var reply_step = reply[0];
			var reply_group = reply[1];
			var reply_level = reply[2];
			var id = $("#replyid").val();
			var reply_con = $("#replycon").val();
			
		 	$.ajax({
				type : 'post',
				url : '/Hit/product/replies/' + reply_group,
				headers : {
					"Content-Type" : "application/json",
					"X-HTTP-Method-Override" : "POST"
				},
				dataType : 'text',
				// JSON.stringify 를 통해 JSON 데이터를 구성해서 전송 
				data : JSON.stringify({
					item_no : item_no,
					id : id,
					reply_con : reply_con,
					reply_step : reply_step,
					reply_group : reply_group,
					reply_level : reply_level
				}),
				success : function(result) {
					console.log("result: " + result);
					if (result == 'SUCCESS') {
						$("replycon").val("");
						$("replyid").val("");
						alert("수정등록 성공!");
						//getAllList();
						getPage("/Hit/product/replies/" + item_no + "/" + replyPage);
					}
				}
			});
		});
		
		/* Modify 버튼 눌렀을 때 이벤트 */
		$("#replyModBtn").on("click", function() {
			var reply_no = $(".modal-title").html();
			var reply_con = $("#replytext").val();

			$.ajax({
				type : 'put',
				url : '/Hit/product/replies/' + reply_no,
				headers : {
					"Content-Type" : "application/json",
					"X-HTTP-Method-Override" : "PUT"
				},
				dataType : 'text',
				/* JSON.stringify 를 통해 JSON 데이터를 구성해서 전송 */
				data : JSON.stringify({
					reply_con : reply_con
				}),
				success : function(result) {
					console.log("result: " + result);
					if (result == 'SUCCESS') {
						alert("수정 되었습니다.");
						$("#modDiv").hide("slow");
						//getAllList();
						getPage("/Hit/product/replies/" + item_no + "/" + replyPage);
					}
				}
			});
		});

		/* DELETE 버튼 눌렀을 때 이벤트 */
		$("#replyDelBtn").on("click",function() {
			var reply_no = $(".modal-title").html();
			var reply_con = $("#replytext").val();
			
			$.ajax({
				type : 'delete',
				url : '/Hit/product/replies/' + reply_no,
				headers : {
					"Content-Type" : "application/json",
					"X-HTTP-Method-Override" : "DELETE"
				},
				dataType : 'text',
				success : function(result) {
					if (result == 'SUCCESS') {
						alert("삭제 되었습니다.");
						$("#modDiv").hide("slow");
						getPage("/Hit/product/replies/" + item_no + "/" + replyPage);
					}
				}
			});
		});
		
		//리뷰작성 시 새창
		function writeReview(item_no){
		    window.open('${pageContext.request.contextPath}/product/writeReview?item_no='+item_no,'', 'scrollbars=no, resizeable=no, width=510, height=600');
		}
	</script>
</body>
</html>
<!-- footer -->
<footer class="container-fluid text-left" id="footer">

	<div style="margin-left: 40px; margin-bottom: 15px;">
		<br> 상호 : Flower | Tel : 112 | Fax : 119<br> 주소 : 대한민국 꽃밭
		어디든<br> Copyright ⓒ <b>Java Study</b> All rights reserved.
	</div>
</footer>