<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<meta name="viewport" content="width=device-width, initial-scale=1">

	<!-- start: Css -->
	
	<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css"/>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
	<script	src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
	
	<!-- plugins -->
	<link rel="stylesheet" type="text/css" href="<c:url value="/resources/asset/css/plugins/font-awesome.min.css"/>"/>
	<link rel="stylesheet" type="text/css" href="<c:url value="/resources/asset/css/plugins/datatables.bootstrap.min.css"/>"/>
	<link rel="stylesheet" type="text/css" href="<c:url value="/resources/asset/css/plugins/animate.min.css"/>"/>
	<link rel="stylesheet" type="text/css" href="<c:url value="/resources/asset/css/style2.css" />"/>
	<link rel="stylesheet" type="text/css" href="<c:url value="/resources/asset/css/plugins/fullcalendar.min.css"/>"/>
	<link rel="stylesheet" type="text/css" href="<c:url value="/resources/asset/css/plugins/simple-line-icons.css"/>"/>
	<link rel="stylesheet" type="text/css" href="https://cdnjs.cloudflare.com/ajax/libs/jqPlot/1.0.8/jquery.jqplot.min.css" />
	<script type="text/javascript" src="../resources/jquery.jqplot.js"></script>
	<link rel="stylesheet" href="http://code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css" type="text/css" />  
	<script src="http://code.jquery.com/ui/1.8.18/jquery-ui.min.js"></script> 
	<!-- end: Css -->
	
<title>Insert title here</title>
	

   <script type="text/javascript">
   
      function addReview(){
        
         alert("등록되었습니다.");
         parent.opener.location.reload();
         window.close();
         
      }
   
      function cancle(){
         window.close();
      }
      
   </script>


<body>

	<div class="content-wrapper">

		<div class="container">
			<div class="row">
				<div class="col-md-12">
					<h4 class="page-head-line">리뷰 작성</h4>
				</div>
			</div>

			<div id="content">

	
      <div id="writeReview" align="center">
   <form id="form" action="addReview" method="post" enctype="multipart/form-data">
      <div class="panel panel-default">
      <table class="table table-hover">
	<thead>    
	<tr><td>        
         상품번호 : ${item_no }
         <input type="hidden" name="item_no" value="${item_no }"></td></tr>
     <tr><td>  
         작성자 : user01 
         <input type="hidden" name="id" value="user01" value="user01"></td></tr>
     <tr><td>    
         
     <input type="text" name="review_tit" placeholder="제목을 남겨주세요."></tr></td>
         <tr><td>
         <textarea name="review_con" rows="10" cols="50" placeholder="리뷰를 남겨주세요."></textarea></td></tr>
     <tr><td>
         사진첨부 : <input type="file" name="imgfile" id="img"></td></tr>
         </thead></table>
      </div>
         <input type="submit" onclick="addReview()" value="등록" class=" btn btn-default"> <input type="button" onclick="cancle()" value="취소" class=" btn btn-default">
   </form>
      </div>
   </div></div></div>
   
<!-- plugins -->
<script src="<c:url value="/resources/asset/js/plugins/moment.min.js"/>" type="text/javascript"></script>
<script src="<c:url value="/resources/asset/js/plugins/jquery.datatables.min.js"/>" type="text/javascript"></script>
<script src="<c:url value="/resources/asset/js/plugins/datatables.bootstrap.min.js"/>" type="text/javascript"></script> 
<script src="<c:url value="/resources/asset/js/plugins/jquery.nicescroll.js"/>" type="text/javascript"></script>
<script type="text/javascript" src="../resources/plugins/jqplot.categoryAxisRenderer.js"></script>
<script type="text/javascript" src="../resources/plugins/jqplot.barRenderer.js"></script>
</body>
</html>