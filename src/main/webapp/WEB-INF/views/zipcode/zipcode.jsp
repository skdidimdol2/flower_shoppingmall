<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE>
<html>
<head>
<meta charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- start: Css -->
<link rel="stylesheet"
	href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script
	src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<!-- javascript에서 json형식의 데이터를 string으로 변환하기 위해서 json2.js -->
<script type="text/javascript" src="../resources/json2.js"></script>	 
<title>주소 검색</title>
<style type="text/css">
	input[type=text] {margin-bottom:5px;}
</style>
</head>
<body>
 <form>
 	<br>
        <strong>검색할 도로명과 건물번호를 정확히 입력하십시오!<br> 
        찾고자 하는 주소 : 서울특별시 종로구 세종로 17 세종문화회관 검색(입력)방법 
        예시 : 도로명 + 건물번호 => 세종로 17</strong><br><br>
        <ul class="nav nav-tabs">
		    <li class="active"><a data-toggle="tab" href="#menu"> 지번주소</a></li>
		    <li><a data-toggle="tab" href="#menu">도로명주소</a></li>
		</ul>
		
        <p></p>&emsp;
        <input type="text" name="query" id="query" onkeydown="javascript:if(event.keyCode==13){search();return false;}"
        	placeholder="검색어(도로명,지번,건물명)를 입력해주세요" style="width:400;height:34;"/>
        <input type="button" class="btn btn-danger" value="검색" id="searchBtn" onclick="search();">
        <input type="hidden" name="target" value="postNew">
        <input type="hidden" name="countPerPage" value="50" id="countPerPage">
        <!-- countPerPage는 한 페이지에 출력시킬 데이터량(최대 50) -->
        <br>&emsp;
        <input type="text" class="addr" id="address1" name="address1" readonly style="width:460;height:34;"/><br>
        &emsp;
        <input type="text" class="addr" id="address2" name="address2" placeholder="상세주소를 입력해주세요."
        	onkeydown="javascript:if(event.keyCode==13){transfer();return false;}" style="width:370;height:34;"/>
        <input type="button" class="addr btn btn-danger" onclick="transfer();" value="주소입력"/>
    </form>
    <p>
    </p>
    <div class="tab-content">
    	<div id="menu" class="tab-pane fade in active">
	        <table class="table table-striped table-bordered">
	            <thead>
	                <tr>
	                    <th style="width:150px;">우편번호</th>
	                    <th style="width:600px;">주소</th>
	                </tr>
	            </thead>
	            <tbody id="zipcodeList"></tbody> 
	        </table>
        </div>
        
    </div>

    <script type="text/javascript">
    	//전송버튼을 처음에는 숨기도록 함.
    	$(document).ready(function(){
    		$(".addr").hide();
    	});
    	//검색 버튼을 누르거나 Enter키를 눌렀을 때
    	function search(){
    		
    		$.ajax({
                url: "list",
                data: $('form').serialize(),
                type: 'GET',
                dataType: 'json',
                success: function(result) {
                     
                    $("#zipcodeList").empty();<%-- 이전 값들 비우기 --%>
                     
                    var html = '';
                    
                    if (result.errorCode != null && result.errorCode != '') {
                    	html+='<tr>';
                    	html+=	'<td colspan="2" align="center">';
                    	html += 	"검색결과가 없습니다.<br>"
                   		html += 	"도로명 주소가 검색되지 않는 경우<br>"
               			html += 	"새주소안내시스템<a href='http://juso.go.kr'>(juso.go.kr )</a>에서<br> "
           				html += 	"정확한 도로명주소를 확인 후 다시 검색해 주시기 바랍니다.<br>"
      					html += 	"동명으로 검색시 법정동명으로 검색하셔야 합니다.<br>" 
   						html += 	"(행정동명으로는 검색이 되지 않습니다.)<br>";
                    	html+=	'</td>';
                    	html+='</tr>';   
                    } else {
                    	<%-- parameter로 넘어온 값 리스트 --%>
                        var list = result.list;
                        for(var i = 0; i < list.length ; i++) {
                        	var zipcode = list[i].zipcode;
                        	var address = JSON.stringify(list[i].address);
                        	address = "'"+address.substring(1,address.length-1)+"'";
                        	
                        	html += '<tr onclick="javascript:selectaddr('+address+','+zipcode+');" style="cursor:pointer;">';
                            html += '   <td align="center">';
                            
                            if (zipcode != null && zipcode.length > 5) {
                                var preZipcode = zipcode.substring(0, 3);
                                var afterZipcode = zipcode.substring(3, 6);
                                 
                                zipcode = preZipcode + '-' + afterZipcode;
                            }
                            
                            html +=         zipcode;<%-- 완성된 우편번호 --%>
                            html += '   </td>';
                            html += '   <td>';

                            if (list[i].lnmAddress != null && list[i].lnmAddress != '') {
                                html +=     list[i].lnmAddress;<%-- 도로명 주소 --%>
                                html += '   <br/>';
                            }
                             
                            html +=         address;<%-- 지번 주소 --%>
                            html += '   </td>';
                            html += '</tr>';
                            
                        }
                    }
                     
                    $("#zipcodeList").append(html);
                   
                }
    		});
    	}
    	//리스트 중에 골랐을 때
    	function selectaddr(addr, zipco){
    		var str = "";
    		str += "["+zipco+"] ";
    		str += addr;
    		$(".addr").show();
    		$("#address1").val(str);
    	}
    	//자식창의 값을 부모창으로 넘길 때
    	function transfer(){
    		var addr = document.getElementById('address1').value;
    		addr += " "+document.getElementById('address2').value;
    		//부모창으로 값 넘기기
    		opener.document.getElementById('address').value=addr;
    		//$('#address',opener.document).val(addr);	//jQuery방식
    		window.close();
    	}
 		
    </script>
</body>
</html>