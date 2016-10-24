<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<meta name="viewport" content="width=device-width, initial-scale=1">

<title>Insert title here</title>

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
	
</head>
<body>

	<!--header -->
	 <header>
        <div class="container">
            <div class="row">
                <div class="col-md-12">
                	<a href="../member/main"><strong>[ Shop Main ]</strong></a>
                    <a href="../admin/main"><strong>[ Admin Page ]</strong></a>
                </div>

            </div>
        </div>
    </header>
    <!-- header end -->
	
	
	<!-- logo header -->	
	<div class="navbar navbar-inverse set-radius-zero">
        <div class="container">
            
            <div class="navbar-header">
                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                <a class="navbar-brand" href="main">
              		<img href="<c:url value="/resources/asset/img/1.png" />"/>
                    <!-- <img src="assets/img/logo.png" /> --> <!-- 로고이미지 -->
				</a>
            </div>

			<!-- 사람모양 이미지 눌렀을때 -->
            <div class="left-div">
                <div class="user-settings-wrapper">
                    <ul class="nav">
                        <li class="dropdown">
                            <a class="dropdown-toggle" data-toggle="dropdown" href="#" aria-expanded="false">
                                <span class="glyphicon glyphicon-user" style="font-size: 25px;"></span>
                            </a>
                            <div class="dropdown-menu dropdown-settings">
                                <div class="media">
                                    <a class="media-left" href="#">
                                        <img src="assets/img/64-64.jpg" alt="" class="img-rounded" />
                                    </a>
                                    <div class="media-body">
                                        <h4 class="media-heading">Jhon Deo Alex </h4>
                                        <h5>Developer & Designer</h5>

                                    </div>
                                </div>
                                <hr />
                                <h5><strong>Personal Bio : </strong></h5>
                                Anim pariatur cliche reprehen derit.
                                <hr />
                                <a href="#" class="btn btn-info btn-sm">Full Profile</a>&nbsp; <a href="login.html" class="btn btn-danger btn-sm">Logout</a>

                            </div>
                        </li>


                    </ul>
                </div>
            </div>
        </div>
    </div>
    <!-- logo header end -->
    
    <!-- navbar --> 
       <section class="menu-section">
        <div class="container">
            <div class="row">
                <div class="col-md-12">
                    <div class="navbar-collapse collapse ">
                        <ul id="menu-top" class="nav navbar-nav navbar-right">
                            <li><a class="main" href="main">HOME</a></li>
                            <li><a class="member" href="adminMember">회원 관리</a></li>
                            <li><a class="item" href="itemMan">상품 관리</a></li>
                            <li><a class="board" href="boardList">게시판 관리</a></li>
                            <li><a class="sales" href="admin_sales?bool=0">매출 관리</a></li>
                            <li><a class="delivery" href="delivery">배송 관리</a></li>
                        </ul>
                    </div>
                </div>

            </div>
        </div>
    </section>
    <!-- navbar end --> 
    
<!-- plugins -->
<script src="<c:url value="/resources/asset/js/plugins/moment.min.js"/>" type="text/javascript"></script>
<script src="<c:url value="/resources/asset/js/plugins/jquery.datatables.min.js"/>" type="text/javascript"></script>
<script src="<c:url value="/resources/asset/js/plugins/datatables.bootstrap.min.js"/>" type="text/javascript"></script> 
<script src="<c:url value="/resources/asset/js/plugins/jquery.nicescroll.js"/>" type="text/javascript"></script>
<script type="text/javascript" src="../resources/plugins/jqplot.categoryAxisRenderer.js"></script>
<script type="text/javascript" src="../resources/plugins/jqplot.barRenderer.js"></script>

</body>
</html>