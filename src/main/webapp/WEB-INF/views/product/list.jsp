<!-- 상품 목록 보기 -->

<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
    
<%@include file="../member/top.jsp"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>   
<!DOCTYPE>
<html>

<!-- 도해추가 -->

<script type="text/javascript"
      src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.0/jquery.min.js"></script>
<script type="text/javascript"
      src="../resources/js/jquery.eislideshow.js"></script>
<script type="text/javascript"
      src="../resources/js/jquery.easing.1.3.js"></script>
<script type="text/javascript">

$(function() {
   $('#ei-slider').eislideshow({
      animation : 'center',
      autoplay : true,
      slideshow_interval : 2000,
      titlesFactor : 0
   });
});
</script>


<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
   href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="../resources/css/responsive.css">
<script
   src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script
   src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

<jsp:include page="../include/style.jsp"></jsp:include>

<script type="text/javascript">
function searchitem(a,b){
   window.location.href="searchitem?item_name="+a+"&category="+b;
}
</script>
   
<!-- 상품 리스트들에 대한 목록 표시 -->
<jsp:include page="../include/style.jsp"></jsp:include>

<title>Flower</title>

</head>
<body>

<section class="listings">

      <div class="wrapper">
         <ul class="properties_list">
            <c:forEach items="${list}" var="pdt">
               <li><a href="detail?item_no=${pdt.item_no}"> <img
                     src="${pdt.img}" class="property_img"></a> <span class="price">${pdt.price}원</span>
                  <div class="property_details">
                     <h1>${pdt.item_name}</h1>
                     <h2>
                        ${pdt.price}원 <span class="property_size">적립금 :
                           ${pdt.price*0.05}원</span>
                     </h2>
                  </div></li>
            </c:forEach>
         </ul>
         <div class="more_listing">
            <a href="#"  class="more_listing_btn">위로 가기</a>
         </div>
      </div>
   </section>
   <!--  end listing section  -->


</body>
</html>
<!-- footer -->   
   <footer class="container-fluid text-left" id="footer">
      
      <div style="margin-left:40px;margin-bottom:15px;">
         <br>
         상호 : Flower  |  Tel : 112  |  Fax : 119<br>
         주소 : 대한민국 꽃밭 어디든<br>
         Copyright ⓒ <b>Java Study</b> All rights reserved. 
      </div>
   </footer>
   