<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
   <script>
   
      function addReview(){
         
//          document.getElementById('addBtn').onclick=function(){
//             document.f.encoding="multipart/form-data";
//          }
         var img = document.getElementById('img').value;
         alert(img);
         document.f.submit();
         alert("등록되었습니다.");
         parent.opener.location.reload();
         window.close();
         
      }
   
      function cancle(){
         window.close();
      }
      
   </script>
</head>

<body>
   <form name="f" action="addReview" method="post" enctype="multipart/form-data">
      <div id="writeReview" align="center">
      
         <b>리뷰작성</b><hr color="#828282"  width="500">
         
         상품번호 : ${item_no }<br> 
         <input type="hidden" name="item_no" value="${item_no }">
         
         작성자 : user01 <br> 
         <input type="hidden" name="id" value="user01" value="user01">
         
         제목 : <input type="text" name="review_tit"><br>
         <textarea name="review_con" rows="10" cols="50" placeholder="리뷰를 남겨주세요."></textarea> <br>
         사진첨부 : <input type="file" name="imgfile" id="img"> <br><br>
         
         <input type="button" id="addBtn" onclick="addReview()" value="등록"> <input type="button" onclick="cancle()" value="취소">
      
      </div>
   </form>
</body>
</html>