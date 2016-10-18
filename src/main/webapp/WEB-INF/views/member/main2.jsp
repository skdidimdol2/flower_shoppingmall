<%@ page language="java" contentType="text/html; charset=utf-8"
   pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE>
<html>
<head>
<title>Flower</title>
	
	<meta charset="utf-8">
	<meta name="author" content="pixelhint.com">
	<meta name="viewport"
	   content="width=device-width, initial-scale=1.0, minimum-scale=1.0" />
	
	<link rel="stylesheet" type="text/css" href="../resources/css/reset.css">
	<link rel="stylesheet" type="text/css"
	   href="../resources/css/responsive.css">
	
	<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
	<link href="..//cdnjs.cloudflare.com/ajax/libs/animate.css/3.1.1/animate.min.css" rel="stylesheet" />
	<link rel="stylesheet" href="//code.ionicframework.com/ionicons/2.0.1/css/ionicons.min.css" />
	<link rel="stylesheet" href="../resources/asset/css/style3.css" />
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
	<script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
	<script src="..//cdnjs.cloudflare.com/ajax/libs/jquery-easing/1.3/jquery.easing.min.js"></script>
    <script src="..//cdnjs.cloudflare.com/ajax/libs/wow/1.1.2/wow.js"></script>
    <script src="..//js/scripts.js"></script>    
</head>
<body>

	    <nav id="topNav" class="navbar navbar-default navbar-fixed-top">
        <div class="container-fluid">
            <div class="navbar-header">
                <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-navbar">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                <a class="navbar-brand page-scroll" href="#first"><i class="ion-ios-analytics-outline"></i> Landing Zero</a>
            </div>
            <div class="navbar-collapse collapse" id="bs-navbar">
            
                <ul class="nav navbar-nav">
					<li>
                        <a class="page-scroll" href="#one">Intro</a>
                    </li>
                    <li>
                        <a class="page-scroll" href="#two">Highlights</a>
                    </li>
                    <li>
                        <a class="page-scroll" href="#three">Gallery</a>
                    </li>
                    <li>
                        <a class="page-scroll" href="#four">Features</a>
                    </li>
                    <li>
                        <a class="page-scroll" href="#last">Contact</a>
                    </li>
                </ul>
                <ul class="nav navbar-nav navbar-right">
                    <li>
                        <a class="page-scroll" data-toggle="modal" title="A free Bootstrap video landing theme" href="#aboutModal">About</a>
                    </li>
                </ul>
            </div>
        </div>
    </nav>
    <header id="first">
        <div class="header-content">
            <div class="inner">
                <h1 class="cursive">Welcome, Flower Shop </h1>
                <h4>A free landing page theme with video background</h4>
                <hr>
                <a href="#video-background" id="toggleVideo" data-toggle="collapse" class="btn btn-primary btn-xl"></a>
            </div>
        </div>
        <video autoplay="" loop="" class="fillWidth fadeIn wow collapse in" data-wow-delay="0.5s" poster="https://s3-us-west-2.amazonaws.com/coverr/poster/Traffic-blurred2.jpg" id="video-background">
            <source src="https://s3-us-west-2.amazonaws.com/coverr/mp4/Traffic-blurred2.mp4" type="video/mp4">Your browser does not support the video tag. I suggest you upgrade your browser.
        </video>
    </header>
    
    <!-- mainpage best item & new item -->	
    <section class="bg-primary" id="one">
        <div class="container">
		<div class="row">
			<p></p>
			<b style="font-size:24;margin-left:10px">인기상품 </b>&nbsp;|&nbsp;
			<a href="#">더보기</a>
			<p></p>
			<div class="col-sm-4">
				<div onclick="Moving();">
					<img alt="flower" src="../resources/image/img_flower1.jpg" style="width: 100%;height:30%" class="img-responsive">
					<div>감사 화환</div>
					<span style="font-size:15;color:red"><b>&nbsp;가격</b></span>
					<span><b>20,000원</b></span>
					<p></p>
				</div>
			</div>
			<div class="col-sm-4">
				<div onclick="Moving();">
					<img alt="flower" src="../resources/image/img_flower2.jpg" style="width:100%;height:30%" class="img-responsive">
					<div>축하 화환</div>
					<span style="font-size:15;color:red"><b>&nbsp;가격</b></span>
					<span><b>120,000원</b></span>
					<p></p>
				</div>
			</div>
			<div class="col-sm-4">
				<div onclick="Moving();">
					<img alt="flower" src="../resources/image/img_flower3.jpg" style="width:100%;height:30%" class="img-responsive">
					<div>선인장 머리 화분 </div>
					<span style="font-size:15;color:red"><b>&nbsp;가격</b></span>
					<span><b>9,900원</b></span>
					<p></p>
				</div>
			</div>
		</div>	
    </section>
 
  
  


</body>
</html>