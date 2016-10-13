<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<% String cp = request.getContextPath(); %>
<!DOCTYPE>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
	
  <!-- start: Css -->
  <link rel="stylesheet" type="text/css" href="<%=cp %>/webapp/asset/css/bootstrap.min.css">

  <!-- plugins -->
  <link rel="stylesheet" type="text/css" href="<%=cp %>/webapp/asset/css/plugins/font-awesome.min.css"/>
  <link rel="stylesheet" type="text/css" href="<%=cp %>/webapp/asset/css/plugins/datatables.bootstrap.min.css"/>
  <link rel="stylesheet" type="text/css" href="<%=cp %>/webapp/asset/css/plugins/animate.min.css"/>
  <link href="<%=cp %>/webapp/asset/css/style.css" rel="stylesheet">
  <!-- end: Css -->

  <link rel="shortcut icon" href="<%=cp %>/webapp/asset/img/logomi.png">
  <!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
      <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
      <![endif]-->
      
<title>admin Page</title>

<!--header -->
<header>
	<div class="contatiner-fluid">
		<a href="admin">관리자 페이지</a>
	</div>
</header>
<!-- navbar -->
<nav class="navbar navbar-default">
	<div class="container-fluid">
		<div class="navbar-header" id="mobileNavbar">
			<form action="main" method="get" autocomplete="on">
				<button type="button" class="navbar-toggle" data-toggle="collapse"
					data-target="#pcNavbar">
					<span class="icon-bar"></span> <span class="icon-bar"></span> <span
						class="icon-bar"></span>
				</button>
			</form>
		</div>

		<div class="collapse navbar-collapse" id="pcNavbar">
			<ul class="nav navbar-nav">
				<li><a href="main">홈 <span class="glyphicon glyphicon-home"></span></a></li>
				<li><a href="javascript:void(0);">회원 관리</a></li>
				<li><a href="addProduct">상품 관리</a></li>
				<li><a href="boardList">게시판 관리</a></li>
				<li><a href="javascript:void(0);">매출 관리</a></li>
				<li><a href="javascript:void(0);">배송 관리</a></li>
			</ul>
		</div>
	</div>
</nav>

<script type="text/javascript">

// 	window.onload = function(){
// 		if('${type }'=='free'){
// 			free();
// 		}else if('${type }'=='review'){
// 			review();
// 		}else if('${type }'=='reply'){
// 			reply();
// 		}
// 	}

	function free(){
		
		document.getElementById('freeClick').style.backgroundColor="#EAEAEA";
		document.getElementById('reviewClick').style.backgroundColor="";
		document.getElementById('replyClick').style.backgroundColor="#FFFFFF";
		document.getElementById('freeTable').style.display="block";
		document.getElementById('reviewTable').style.display="none";
		document.getElementById('replyTable').style.display="none";
		
	}
	
	
	function review(){
		
		document.getElementById('freeClick').style.backgroundColor="#FFFFFF";
		document.getElementById('reviewClick').style.backgroundColor="#EAEAEA";
		document.getElementById('replyClick').style.backgroundColor="#FFFFFF";
		document.getElementById('freeTable').style.display="none";
		document.getElementById('reviewTable').style.display="";
		document.getElementById('replyTable').style.display="none";
		
	}
	
	
	function reply(){
		
		document.getElementById('freeClick').style.backgroundColor="#FFFFFF";
		document.getElementById('reviewClick').style.backgroundColor="#FFFFFF";
		document.getElementById('replyClick').style.backgroundColor="#EAEAEA";
		document.getElementById('freeTable').style.display="none";
		document.getElementById('reviewTable').style.display="none";
		document.getElementById('replyTable').style.display="";
		
		
	}
	
	
	function allSelectCheck(checkType){
		
		var Type = checkType;
		var all = document.getElementById('all'+Type);

		if(all.checked){
			var check = document.getElementsByName(Type);
			for(var i=0; i < check.length; i++){
				check[i].checked = true;
			}
		} else {
			var check = document.getElementsByName(Type);
			for(var i=0; i < check.length; i++){
				check[i].checked = false;
				}
		}
	}
	
	function del(type){
		var check = document.getElementsByName(type+'Check');
		var checkno = "";
		var count = 0;
		for(var i=0; i < check.length; i++){
			if(check[i].checked){
				if(checkno==""){
					checkno += "checkno=" + check[i].value;
				}else{
					checkno += "&checkno=" + check[i].value;
				}
			}else{
				count++;
			}
		}
		
		if(count == check.length){
				alert('삭제할 글을 선택해주세요.');
		}else{
			location.href='${pageContext.request.contextPath}/admin/boardDelete?type='+type+'&'+checkno;
			location.reload();
		}
			
	}
	
	
	function boardDetail(type, no){
     	
		window.open('${pageContext.request.contextPath}/admin/boardDetail?type='+type+"&"+type+"_no="+no,'', 'scrollbars=yes, resizeable=no, width=800, height=500');
	
	}


</script>

</head>
<body>

	<div align="center">

		<br> <br>
		<h1>게시판 관리</h1>
		<table border="1" style="width: 50%">
			<tr height="50" align="center">
				<td id="freeClick" onclick="free()">자유게시판(16/600)</td>
				<td id="reviewClick" onclick="review()"
					style="background-color: #EAEAEA">리뷰게시판(44/777)</td>
				<td id="replyClick" onclick="reply()">댓글게시판(62/1000)</td>
			</tr>
		</table>
		<br>
		<br>
		<div id="freeTable" style="display: none;">
			<form id="2">
				<input type="button" value="삭제" onclick="del('board')"><br>
				<br>
				<table style="width: 70%;" border="1" class="text-center">
					<tr style="background-color: #BCE55C">
						<td><input type="checkbox" id="allfreeCheck"
							onClick="allSelectCheck('freeCheck')"></td>
						<td>글번호</td>
						<td>이름</td>
						<td>제목</td>
						<td>카테고리</td>
						<td>등록일</td>
					<tr>
						<c:forEach items="${freeList }" var="f">
							<tr onmouseover="this.style.backgroundColor='#F6FFCC'"
								onmouseout="this.style.backgroundColor='#FFFFFF'"
								onclick="boardDetail('board','${f.board_no}')">
								<td><input type="checkbox" name="freeCheck" value="${f.board_no}"></td>
								<td>${f.board_no}</a></td>
								<td>${f.name}</a></td>
								<td>${f.title}</a></td>
								<td>${f.category}</a></td>
								<td>${f.post_date}</a></td>
							<tr>
						</c:forEach>
				</table>
				<p></p>
				<c:forEach var="cnt" begin="1" end="${freeCount/15+1}">
					<button type="button" class="btn btn-primary"
						onclick="paging(${freeCount})">${cnt}</button>
				</c:forEach>
			</form>
		</div>
		
		 <!-- start: Content -->
            <div id="content">
      
		<div id="reviewTable" class="responsive-table">
			<form id="1">
				<input type="button" value="삭제" onclick="del('review')"><br>
				<br>
				<table class="table table-striped table-bordered">
					<tr>
						<td><input type="checkbox" id="allreviewCheck"
							onClick="allSelectCheck('reviewCheck')"></td>
						<td>리뷰번호</td>
						<td>상품번호</td>
						<td>리뷰제목</td>
						<td>아이디</td>
						<td>등록일</td>
					<tr>
						<c:forEach items="${reviewList }" var="r">
							<tr 
								onclick="boardDetail('review','${r.review_no }')">
								<td><input type="checkbox" name="reviewCheck" value="${r.review_no }"></td>
								<td>${r.review_no }</td>
								<td>${r.item_no}</td>
								<td>${r.review_tit}</td>
								<td>${r.id}</td>
								<td>${r.review_date}</td>
							<tr>
						</c:forEach>
				</table>
				<p></p>
				<c:forEach var="cnt" begin="1" end="${freeCount/15+1}">
					<button type="button" class="btn btn-primary"
						onclick="paging(${reviewCount})">${cnt}</button>
				</c:forEach>
			</form>
		</div></div></div></div></div></div>
		
	
		<div id="replyTable" style="display: none;">
			<form id="3">
				<input type="button" value="삭제" onclick="del('reply')"><br>
				<br>
				<table style="width: 70%;" border="1" class="text-center">
					<tr style="background-color: #BCE55C">
						<td><input type="checkbox" id="allreplyCheck"
							onClick="allSelectCheck('replyCheck')"></td>
						<td>댓글번호</td>
						<td>상품번호</td>
						<td>댓글내용</td>
						<td>아이디</td>
						<td>등록일</td>
					<tr>
						<c:forEach items="${replyList }" var="r">
							<tr onmouseover="this.style.backgroundColor='#F6FFCC'"
								onmouseout="this.style.backgroundColor='#FFFFFF'"
								onclick="boardDetail('reply','${r.reply_no}')">
								<td><input type="checkbox" name="replyCheck" value="${r.reply_no}"></td>
								<td>${r.reply_no}</a></td>
								<td>${r.item_no}</a></td>
								<td>${r.reply_con}</a></td>
								<td>${r.id}</a></td>
								<td>${r.reply_date}</a></td>
							<tr>
						</c:forEach>
				</table>
				<p></p>
				<c:forEach var="cnt" begin="1" end="${replyCount/15+1}">
					<button type="button" class="btn btn-primary"
						onclick="paging(${replyCount})">${cnt}</button>
				</c:forEach>
			</form>
		</div>
	</div>
	<br>
	<br>
	

	
<!-- start: Javascript -->
<script src="<%=cp %>/webapp/asset/js/jquery.min.js"></script>
<script src="<%=cp %>/webapp/asset/js/jquery.ui.min.js"></script>
<script src="<%=cp %>/webapp/asset/js/bootstrap.min.js"></script>



<!-- plugins -->
<script src="<%=cp %>/webapp/asset/js/plugins/moment.min.js"></script>
<script src="<%=cp %>/webapp/asset/js/plugins/jquery.datatables.min.js"></script>
<script src="<%=cp %>/webapp/asset/js/plugins/datatables.bootstrap.min.js"></script>
<script src="<%=cp %>/webapp/asset/js/plugins/jquery.nicescroll.js"></script>


<!-- custom -->
<script src="<%=cp %>/webapp/asset/js/main.js"></script>

<!-- end: Javascript -->

</body>
</html>