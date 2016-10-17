<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
	
	<!-- start: Css -->
	
	<link rel="stylesheet"
		href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
	<script
		src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
	
		<!-- plugins -->
		<link rel="stylesheet" type="text/css" href="<c:url value="/resources/asset/css/plugins/font-awesome.min.css"/>"/>
		<link rel="stylesheet" type="text/css" href="<c:url value="/resources/asset/css/plugins/datatables.bootstrap.min.css"/>"/>
		<link rel="stylesheet" type="text/css" href="<c:url value="/resources/asset/css/plugins/animate.min.css"/>"/>
		<link rel="stylesheet" type="text/css" href="<c:url value="/resources/asset/css/style2.css" />"/>
		<link rel="stylesheet" type="text/css" href="<c:url value="/resources/asset/css/plugins/fullcalendar.min.css"/>"/>
		<link rel="stylesheet" type="text/css" href="<c:url value="/resources/asset/css/plugins/simple-line-icons.css"/>"/>
				
	<!-- end: Css -->
	
<title>Detail Page</title>

<script type="text/javascript">

	window.onload = function(){
		if('${type }'=='board'){
			document.getElementById('board_content').style.display="";
		} else if('${type }'=='review'){
			document.getElementById('review_content').style.display="";
		} else if('${type }'=='reply'){
			document.getElementById('reply_content').style.display="";
		}
	}

	function cancle(){
		window.close();
	}
	
	
	function del(type,no){
		location.href='${pageContext.request.contextPath}/admin/boardDelete?type='+type+'&checkno='+no;
		alert('삭제되었습니다.');
		parent.opener.location.reload();
		window.close();
	}
	
	
	function checkDel(type){
		var check = document.getElementsByName(type+'Check');
		var checkno = "";
		var count = 0;
		alert(check.length);
		for(var i=0; i < check.length; i++){
			if(check[i].checked){
				if(checkno==""){
					alert(check[i].value);
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
			alert(checkno);
			location.href='${pageContext.request.contextPath}/admin/boardDelete?type='+type+'&'+checkno;
			location.reload();
		}
		alert('삭제되었습니다.');
		window.close();
	}

</script>


</head>
<body>

	<div class="content-wrapper">

		<div class="container">
			<div class="row">
				<div class="col-md-12">
					<h4 class="page-head-line">상세내용</h4>
				</div>
			</div>

			<div id="content">
			
	<!-- 자유게시판 상세내용 -->			
	<div align="center" id="board_content" class="responsive-table" style="display: none;">
		<p></p>
		<p></p>
			<c:if test="${empty board}">
				<h3>목록이 없습니다.</h3> 
			</c:if>
			<div class="panel panel-default">
			<c:if test="${not empty board}">
			<table class="table table-hover">
			<thead>
				<tr> 
					<td>글번호</td>
					<td>${board.board_no}</td>
					<td>등록일</td>
					<td>${board.post_date}</td>
				</tr>
				<tr>	
					<td>이름</td>
					<td>${board.name}</td>
					<td>카테고리</td> 
					<td>${board.category}</td>
				</tr>
				<tr>	
					<td>제목</td>
					<td>${board.title}</td>
					<td>조회수</td>
					<td>${board.hits}</td>
				</tr>
				<tr>	
					<td colspan="4" align="left" valign="top" style="height:250" >
					<textarea id="content_textarea" style="height:250"  readonly >${board.content}</textarea>
					</td>
				<tr>
				</thead>
			</table>
			</c:if>	
			</div>
			<br>
			<input type="button" onclick="del('board','${board.board_no}')" value="삭제">
			<input type="button" onclick="cancle()" value="닫기">
	</div>
	<!-- 자유게시판 상세내용 끝-->	
	
	<!-- 리뷰게시판 상세내용 -->
	<div align="center" id="review_content" class="responsive-table" style="display: none;">
		<p></p>
		<p></p>
			<c:if test="${empty review}">
				<h3>목록이 없습니다.</h3> 
			</c:if>
			<div class="panel panel-default">
			<c:if test="${not empty review}">
			<table style="width:70%; height: 70%" border="1" class="text-center">
				<thead>
				<tr> 
					<td>리뷰번호</td>
					<td>${review.review_no}</td>
					<td>등록일</td>
					<td>${review.review_date}</td>
				</tr>
				<tr>	
					<td>아이디</td>
					<td>${review.id}</td>
					<td>상품번호</td> 
					<td>${review.item_no}</td>
				</tr>
				<tr>	
					<td>제목</td>
					<td colspan="3">${review.review_tit}</td>
				</tr>
				<tr>
					<td>리뷰사진</td>
					<td><img src="${pageContext.request.contextPath }/resources/review_img/${re.review_img}"
							 width="100" height="100"></td>
					<td colspan="4" align="left" valign="top" style="height:250" >
					<textarea id="content_textarea" style="height:250" readonly >${review.review_con}</textarea>
					</td>
					</tr>
				</thead>
				</table>
			</c:if>
			</div>	
			<br>
			<input type="button" onclick="del('review','${review.review_no}')" value="삭제">
			<input type="button" onclick="cancle()" value="닫기">
	</div>
	

	<div align="center" id="reply_content" style="display: none;">
		<h2>상세내용</h2><br>
		<p></p>
		<p></p>
			<c:if test="${empty reply}">
				<h3>목록이 없습니다.</h3> 
			</c:if>
			<c:if test="${not empty reply}">
			<table style="width: 90%; height: 35%" border="1" class="text-center">
				<tr style="background-color: #BCE55C">
						<td><input type="checkbox" id="allreplyCheck"
							onClick="allSelectCheck('replyCheck')"></td>
						<td>댓글번호</td>
						<td>상품번호</td>
						<td>댓글내용</td>
						<td>아이디</td>
						<td>등록일</td>
					<tr>
						<c:forEach items="${reply }" var="r">
							<tr onmouseover="this.style.backgroundColor='#F6FFCC'"
								onmouseout="this.style.backgroundColor='#FFFFFF'">
								<td><input type="checkbox" name="replyCheck" value="${r.reply_no}"></td>
								<td>${r.reply_no}</a></td>
								<td>${r.item_no}</a></td>
								<td>${r.reply_con}</a></td>
								<td>${r.id}</a></td>
								<td>${r.reply_date}</a></td>
							<tr>
						</c:forEach>
			</table>	
			</c:if>
			<br><br>
			<input type="button" onclick="checkDel('reply')" value="삭제">
			<input type="button" onclick="cancle()" value="닫기">
	</div></div></div></div>

</body>
</html>