<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<%@include file="header.jsp"%>
<style>
.board{
	menu-top-active
}
</style>

<title>admin Page</title>


<script type="text/javascript">


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
     	
		window.open('${pageContext.request.contextPath}/admin/boardDetail?type='+type+"&"+type+"_no="+no,'', 'scrollbars=yes, resizeable=yes, width=700, height=550');
	
	}


</script>

</head>
<body>

	<div class="content-wrapper">

		<div class="container">
			<div class="row">
				<div class="col-md-12">
					<h4 class="page-head-line">Board Page</h4>
				</div>
			</div>

			<div id="content">


				<ul class="nav nav-tabs">
					<li class="active"><a id="freeClick" onclick="free()">자유게시판</a></li>
					<li class="active"><a id="reviewClick" onclick="review()"
						style="background-color: #EAEAEA">리뷰게시판</a></li>
					<li class="active"><a id="replyClick" onclick="reply()">댓글게시판</a></li>
				</ul>
				<br>

				<!-- 자유게시판 -->
				<div id="freeTable" class="responsive-table" style="display: none;">
					<form id="2">
						<div align="right">
							<input type="button" style="width: 15%;" class=" btn btn-default"
								   value="삭제" onclick="del('board')"><p></p>
						</div>
						<div class="panel panel-default">
							<table id="freetalbes" class="table table-hover">
								<thead>
									<tr>
										<td><input type="checkbox" id="allfreeCheck"
											onClick="allSelectCheck('freeCheck')"></td>
										<td>글번호</td>
										<td>이름</td>
										<td>제목</td>
										<td>카테고리</td>
										<td>등록일</td>
									<tr>
								</thead>
								<c:forEach items="${freeList }" var="f">
									<tr onclick="boardDetail('board','${f.board_no}')">
										<td><input type="checkbox" name="freeCheck"
											value="${f.board_no}"></td>
										<td>${f.board_no}</a></td>
										<td>${f.name}</a></td>
										<td>${f.title}</a></td>
										<td>${f.category}</a></td>
										<td>${f.post_date}</a></td>
									</tr>
								</c:forEach>
							</table>
							</div>
							<div align="center">
								<c:forEach var="cnt" begin="1" end="${freeCount/15+1}">
									<button type="button" class="btn btn-default"
										onclick="paging(${freeCount})">${cnt}</button>
								</c:forEach>
							</div>
					</form>
				</div>
				<!-- 자유게시판 끝 -->


				<!-- 리뷰게시판 -->
				<div id="reviewTable" class="responsive-table">
					<form id="1">
						<div align="right">
							<input type="button" style="width: 15%;" class=" btn btn-default"
								   value="삭제" onclick="del('review')"><p></p>
						</div>
						<div class="panel panel-default">
							<table id="reviewtables" class="table table-hover">
								<thead>
									<tr>
										<td><input type="checkbox" id="allreviewCheck"
											onClick="allSelectCheck('reviewCheck')"></td>
										<td>리뷰번호</td>
										<td>상품번호</td>
										<td>리뷰제목</td>
										<td>아이디</td>
										<td>등록일</td>
									</tr>
								</thead>
								<c:forEach items="${reviewList }" var="r">
									<tr onclick="boardDetail('review','${r.review_no }')">
										<td><input type="checkbox" name="reviewCheck"
											value="${r.review_no }"></td>
										<td>${r.review_no }</td>
										<td>${r.item_no}</td>
										<td>${r.review_tit}</td>
										<td>${r.id}</td>
										<td>${r.review_date}</td>
									</tr>
								</c:forEach>
							</table>
						</div>
						<div align="center">
							<c:forEach var="cnt" begin="1" end="${freeCount/15+1}">
								<button type="button" class="btn btn-default"
									onclick="paging(${reviewCount})">${cnt}</button>
							</c:forEach>
						</div>
					</form>
				</div>
				<!-- 리뷰게시판 끝 -->


		<!-- 댓글게시판 -->
				<div id="replyTable" class="responsive-table" style="display: none;">
					<form id="3">
						<div align="right">
							<input type="button" style="width: 15%;" class=" btn btn-default"
								   value="삭제" onclick="del('reply')"><p></p>
						</div>
						<div class="panel panel-default">
							<table id="replytables" class="table table-hover">
								<thead>
									<tr>
										<td><input type="checkbox" id="allreplyCheck"
											onClick="allSelectCheck('replyCheck')"></td>
										<td>댓글번호</td>
										<td>상품번호</td>
										<td>댓글내용</td>
										<td>아이디</td>
										<td>등록일</td>
									</tr>
								</thead>
								<c:forEach items="${replyList }" var="r">
									<tr onclick="boardDetail('reply','${r.reply_no}')">
										<td><input type="checkbox" name="replyCheck"
											value="${r.reply_no}"></td>
										<td>${r.reply_no}</a></td>
										<td>${r.item_no}</a></td>
										<td>${r.reply_con}</a></td>
										<td>${r.id}</a></td>
										<td>${r.reply_date}</a></td>
									</tr>
								</c:forEach>
							</table>
						</div>
						<div align="center">
							<c:forEach var="cnt" begin="1" end="${replyCount/15+1}">
								<button type="button" class="btn btn-default"
									onclick="paging(${replyCount})">${cnt}</button>
							</c:forEach>
						</div>
					</form>
				</div>
				<!-- 댓글게시판 끝 -->

	</div>
	</div>
	</div>
	<br>
	<br>


<script>
<%-- toggle --%>
	$(document).ready(function(){
		$('.board').addClass('menu-top-active');
		$('#reviewtables').DataTable();
		//$(".glyphicon-resize-vertical").hide();
	});

</script>
<!-- hooter -->
<%@include file="hooter.jsp"%>
<!-- hooter end -->

</body>
</html>