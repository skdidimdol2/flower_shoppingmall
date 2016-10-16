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
	

<title>회원관리 페이지</title>
<style>	

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
		left:-80px;
		width:1245px;
	}
</style>
<!-- header -->
<%@include file="header.jsp" %>
<!-- header end -->
</head>
<body>
	<!-- content -->
    <div class="content-wrapper">
        <div class="container">
            <div class="row">
                <div class="col-md-12">
                    <h4 class="page-head-line"> Member Page </h4>
                </div>
            </div>
          
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
	</div>
	</div>
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