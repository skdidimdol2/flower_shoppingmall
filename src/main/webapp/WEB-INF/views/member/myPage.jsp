<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE>
<html>
<head>
<meta charset=UTF-8">
<title>마이페이지</title>
</head>
<body>
<center>
<h1>마이페이지</h1>
<hr>
<form action="modifyInfo" method="get">
<table border="1" cellpadding="0" cellspacing="0">   
   
   <tr>
      <td bgcolor="orange">아이디</td>
      <td>${dto.id}</td>
   </tr>
   <tr>
      <td bgcolor="orange">이름</td>
      <td>${dto.name}</td>
   </tr>
   <tr>
      <td bgcolor="orange">생일</td>
      <td>${dto.birthday}</td>
   </tr>
   <tr>
      <td bgcolor="orange">이메일</td>
      <td>${dto.email}</td>
   </tr>
   <tr>
      <td bgcolor="orange">연락처</td>
      <td>${dto.phone}</td>
   </tr>
   <tr>
      <td bgcolor="orange">성별</td>
      <td>${dto.gender}</td>
   </tr>
   <tr>
      <td bgcolor="orange">포인트</td>
      <td>${dto.point}</td>
   </tr>
   <tr>
      <td bgcolor="orange">가입일</td>
      <td>${dto.joindate}</td>
   </tr>
   <tr>
      <td bgcolor="orange">댓글수</td>
      <td>${dto.reply}</td>
   </tr>
   <tr>
      <td bgcolor="orange">리뷰수</td>
      <td>${dto.review}</td>
   </tr>
   

</table>

<a href="main">메인으로</a>
<input type="submit" value="정보수정"/>
</form>
</center>
</body>
</html>