<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE>
<html>
<head>
<meta charset="utf-8">
<title>Insert title here</title>

</head>

<body>
      <div id="writeReview" align="center">
   <form name="f" action="addReview" method="post" enctype="multipart/form-data">
      
         <b>리뷰작성</b><hr color="#828282"  width="500">
         
         상품번호 : ${item_no }<br> 
         <input type="hidden" name="item_no" value="${item_no }">
         
         작성자 : user01 <br> 
         <input type="hidden" name="id" value="user01" value="user01">
         
         제목 : <input type="text" name="review_tit"><br>
         <textarea name="review_con" rows="10" cols="50" placeholder="리뷰를 남겨주세요."></textarea> <br>
         사진첨부 : <input type="file" name="imgfile" id="img"> <br><br>
         <input type="button" id="addBtn" onclick="addReview()" value="등록">
         <input type="button" onclick="cancle()" value="취소">
      
   </form>
      </div>
<script>

   function addReview(){
      
      var img = document.getElementById('img').value;
      alert(img);
      document.f.submit();
      parent.opener.location.reload();
      alert("등록되었습니다.");
      window.close();
      
   }
      		
   function cancle(){
      window.close();
   }
   
</script>      
</body>
</html>