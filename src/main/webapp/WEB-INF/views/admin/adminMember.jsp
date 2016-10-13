<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>	
<!DOCTYPE>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
	
<!-- plugins -->
<link rel="stylesheet" type="text/css" href="<c:url value="/resources/asset/css/plugins/font-awesome.min.css"/>"/>
<link rel="stylesheet" type="text/css" href="<c:url value="/resources/asset/css/plugins/datatables.bootstrap.min.css"/>"/>
<link rel="stylesheet" type="text/css" href="<c:url value="/resources/asset/css/plugins/animate.min.css"/>"/>
<link rel="stylesheet" type="text/css" href="<c:url value="/resources/asset/css/style.css" />"/>
<!-- end: Css -->
<link rel="shortcut icon" href="/resources/asset/img/logomi.png">
	
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script
	src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

<title>회원관리 페이지</title>
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
<%-- navbar --%> 
	.navbar {
    	margin-bottom: 0;
    	border-radius: 0;
    	background-color: #ff5555;
    }
    .navbar-header{
    	width:100%
    }
    #mobileNavbar .navbar-toggle{
    	background-color:#ffffff;
    }
    #mobileNavbar>form>a{
    	color: #ff5555; 
    }
    .navbar-default .navbar-toggle .icon-bar{
    	background-color:#ff5555;
    	padding-top:4px; 
    } 
    #mobileNavbar>form>input{
    	background-color: #ffffff; 
    }
    
    .nav{
    	margin-top:-10px;
    }
    #pcNavbar>ul>li>a{
    	color: #ffffff;
    }
    #pcNavbar>ul>li>a:hover{
    	background-color:#ffffff;
    	color:#ff5555;
    	font-size:17px; 
    }

<%-- main list --%>
	h3{
		width:100%
	}
	
	.container>.row>.col-sm-4>div{
		border:1px solid;
		border-color:#dddddd;
		font-family:고딕
	}
	.container>.row>.col-sm-4>div>div{
		margin-left:7px;margin-top:7px;
	}
<%-- content --%>
	.content{
		min-height:100%; 
		width:1200px;
	}
<%-- search --%>
	#searchForm{
		position:relative;
		left:70px;
	}
	#searchBtn{
		position:relative;
		left:100px;
	}
<%-- btnGroup --%>
	#btnGroup{
		position:relative;
		left:70px;
	}		
<%-- board --%>
	#board_table{
		position:relative;
		left:20px;
		width:1300px;
	}
</style>

</head>
<body>

<!-- navbar -->	
	<nav class="navbar navbar-default">
		<div class="container-fluid">
			<div class="navbar-header" id="mobileNavbar">
				<form action="main" method="get" autocomplete="on">
					<button type="button" class="navbar-toggle" data-toggle="collapse"
							data-target="#pcNavbar"> 
							<span class="icon-bar"></span>
							<span class="icon-bar"></span>
							<span class="icon-bar"></span>
					</button>
				</form>	
			</div>
		
			<div class="collapse navbar-collapse" id="pcNavbar">
				<ul class="nav navbar-nav">
					<li><a href="../member/main">홈 <span class="glyphicon glyphicon-home"></span></a></li>
					<li><a href="adminMember">회원 관리</a></li>
					<li><a href="itemMan">상품 관리</a></li>
					<li><a href="javascript:void(0);">게시판 관리</a></li>
					<li><a href="admin_sales?bool=0">매출 관리</a></li>
					<li><a href="delivery">배송 관리</a></li>				
				</ul>
			</div>
		</div>
	</nav>
	<p></p>
	<div class="content">
		<form action="adminSearchMember" method="get">
			<div>
				<span id="searchForm">
					<label for="id">아이디</label>
						<input type="text" name="id" id="id"/>&emsp;
					<label for="name">이름</label>
						<input type="text" name="name" id="name"/>&emsp;
					<label for="email">이메일</label>
						<input type="text" name="email" id="email"/>&emsp;
					<label for="gender">성별</label>
						<label class="radio-inline"><input type="radio" name="gender" value="전체" checked>전체</label>
						<label class="radio-inline"><input type="radio" name="gender" value="남">남</label>
						<label class="radio-inline"><input type="radio" name="gender" value="여">여</label>&emsp;
					<p></p>
					<label for="phone">연락처</label>
						<input type="text" name="phone" id="phone"/>&emsp;
					<label for="address">주소</label>
						<input type="text" name="address" id="address"/>&emsp;
					<label for="birthday1">생일</label>
						<input type="date" name="birthday1" id="birthday1"/>
					-
					<input type="date" name="birthday2" id="birthday2"/>
					<p></p>
					<label for="joindate1">가입일</label>
						<input type="date" name="joindate1" id="joindate1"/>
					-
					<input type="date" name="joindate2" id="joindate2"/>
				</span>
				<input id="searchBtn" type="submit" class="btn btn-primary" value="검색"/>
			</div>
		</form>
		<hr>
		
		<div id="board_table">
			<div id="btnGroup">
				<button onclick="adminSendMail();">메일보내기</button>
				<button onclick="adminMemberDel();">삭제하기</button>
				<button onclick="refresh();">새로고침</button>	
			</div>	
			<p></p>
			<table id="datatables" class="table table-striped table-bordered">
				<thead>
					<tr>
						<td><input type="checkbox" name="selectPoint" id="selectAll" onclick="selectAll(${list.size()})" value="All"></td>
						<th>아이디</th>
						<th>비밀번호</th>
						<th>이름</th>
						<th>생일</th>
						<th>이메일</th>
						<th>연락처</th>
						<th>주소</th>
						<th>성별</th>
						<th>포인트</th>
						<th>가입일</th>
						<th>댓글수</th>
						<th>리뷰수</th>
						<th>관리자</th>
			<!-- 			
						<th onmouseover="show('Tid');" onmouseout="hide('Tid');">아이디<span class="glyphicon glyphicon-resize-vertical" id="Tid" onclick="sort('id');"></span></th>
						<th onmouseover="show('Tpd');" onmouseout="hide('Tpd');">비밀번호<span class="glyphicon glyphicon-resize-vertical" id="Tpd" onclick="sort('password');"></span></th>
						<th onmouseover="show('Tna');" onmouseout="hide('Tna');">이름<span class="glyphicon glyphicon-resize-vertical" id="Tna" onclick="sort('name');"></span></th>
						<th onmouseover="show('Tbi');" onmouseout="hide('Tbi');">생일<span class="glyphicon glyphicon-resize-vertical" id="Tbi" onclick="sort('birthday');"></span></th>
						<th onmouseover="show('Tem');" onmouseout="hide('Tem');">이메일<span class="glyphicon glyphicon-resize-vertical" id="Tem" onclick="sort('email');"></span></th>
						<th onmouseover="show('Tph');" onmouseout="hide('Tph');">연락처<span class="glyphicon glyphicon-resize-vertical" id="Tph" onclick="sort('phone');"></span></th>
						<th onmouseover="show('Tad');" onmouseout="hide('Tad');">주소<span class="glyphicon glyphicon-resize-vertical" id="Tad" onclick="sort('address');"></span></th>
						<th onmouseover="show('Tge');" onmouseout="hide('Tge');">성별<span class="glyphicon glyphicon-resize-vertical" id="Tge" onclick="sort('gender');"></span></th>
						<th onmouseover="show('Tpo');" onmouseout="hide('Tpo');">포인트<span class="glyphicon glyphicon-resize-vertical" id="Tpo" onclick="sort('point');"></span></th>
						<th onmouseover="show('Tjo');" onmouseout="hide('Tjo');">가입일<span class="glyphicon glyphicon-resize-vertical" id="Tjo" onclick="sort('joindate');"></span></th>
						<th onmouseover="show('Trp');" onmouseout="hide('Trp');">댓글수<span class="glyphicon glyphicon-resize-vertical" id="Trp" onclick="sort('reply');"></span></th>
						<th onmouseover="show('Trv');" onmouseout="hide('Trv');">리뷰수<span class="glyphicon glyphicon-resize-vertical" id="Trv" onclick="sort('review');"></span></th>
						<th onmouseover="show('Tam');" onmouseout="hide('Tam');">관리자<span class="glyphicon glyphicon-resize-vertical" id="Tam" onclick="sort('admin');"></span></th>
				-->		
					</tr>
				</thead>
				<tbody id="memberList">
					<c:forEach items="${list}" var="dto" varStatus="st">
						<tr>
							<td><input type="checkbox" class="checkBox" name="selectPoint" id="${st.index}" value="${dto.id}"></td>
							<td>${dto.id}</td>
							<td>${dto.password}</td>
							<td>${dto.name}</td>
							<td>${dto.birthday}</td>
							<td>${dto.email}</td>
							<td>${dto.phone}</td>
							<td>${dto.address}</td>
							<td>${dto.gender}</td>
							<td>${dto.point}</td>
							<td>${dto.joindate}</td>
							<td>${dto.reply}</td>
							<td>${dto.review}</td>
							<td>${dto.admin}</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
	</div>
	<input type="hidden" id="sort" value="${requestScope.sort }"/>
	<input type="hidden" id="col2" value="${requestScope.col2 }"/>

<!-- plugins -->
<script src="<c:url value="/resources/asset/js/plugins/moment.min.js"/>" type="text/javascript"></script>
<script src="<c:url value="/resources/asset/js/plugins/jquery.datatables.min.js"/>" type="text/javascript"></script>
<script src="<c:url value="/resources/asset/js/plugins/datatables.bootstrap.min.js"/>" type="text/javascript"></script> 
<script src="<c:url value="/resources/asset/js/plugins/jquery.nicescroll.js"/>" type="text/javascript"></script>

<script>
	<%-- checkbox 전체 선택 jstl varStatus(현재index값) 이용해서 id값 지정--%>
	function selectAll(cnt){
		var boxId;
		for (var i = 0; i < cnt; i++) {
			boxId = i;
			if($("#selectAll").prop("checked")){
				$("#"+boxId).prop("checked",true);
			}else{
				$("#"+boxId).prop("checked",false);
			}
		}
	}
	<%-- mail send form--%>
	function adminSendMail(){
		var option = "toolbar=no, menubar=no, location=no, directories=no, status=no, scrollbars=no,"
			option += "resizable=no, width=500, height=500, top=100, left=300";
		window.open("sendMailForm","",option);
	}
	<%-- member delete --%>
	function adminMemberDel(){
		var checkBoxCount = $(".checkBox");
		var checkSum = "";
		for (var i = 0; i < checkBoxCount.length; i++) {
			if(checkBoxCount[i].checked == true){
				if(checkSum==""){
					checkSum += "id="+ checkBoxCount[i].value;
				}else{
					checkSum += "&id="+ checkBoxCount[i].value;
				}
			}
		}
		if(checkSum==""){
			alert("삭제할 회원을 선택해주세요.");
			return;
		}
		if(confirm("선택하신 회원을 삭제하시겠습니까?")==true){
			location.href="adminMemberDel?"+checkSum;
		}
		
	}
	<%-- toggle --%>
	$(document).ready(function(){
		$('#datatables').DataTable();
		//$(".glyphicon-resize-vertical").hide();
	});
	
	function show(col){
		$("#"+col).show();
	}
	function hide(col){
		$("#"+col).hide();
	}
	<%-- sort column --%>
	function sort(col){
		//한번 정렬한 칼럼 값을 다시 받아서 내림 차순을 할 것인지 다른 칼럼 오름차순을 할 것인지 판별.
		var sort = "";
		var col2 = "";
			sort = $("#sort").val();
			col2 = $("#col2").val();
		
		location.href="adminMemberSort?col1="+col+"&col2="+col2+"&sort="+sort;	
	}
	function refresh(){
		location.href="adminMember";
	}
</script>	
</body>
</html>