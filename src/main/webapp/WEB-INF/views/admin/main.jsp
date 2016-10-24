<%@ page language="java" contentType="text/html; charset=utf-8"
   pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>   
<!DOCTYPE>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- header -->
<%@include file="header.jsp" %>
<style>
.main{
	menu-top-active
}
</style>
<!-- header end -->
</head>
<body>
    <!-- content -->
    <div class="content-wrapper">
        <div class="container">
            <div class="row">
                <div class="col-md-12">
                    <h4 class="page-head-line"> Admin Home </h4>

                </div>

            </div>
    
   <div id="content">
      <div class="col-md-12" style="padding: 10px;">
         <div class="col-md-12 padding-0">
            <div class="col-md-12 padding-0">
               <div class="col-md-12 padding-0">
                  <div class="col-md-3">
                     <div class="panel box-v1">
                        <div class="panel-heading bg-white border-none">
                           <div class="col-md-3 col-sm-3 col-xs-3 text-right">
                              <h4>
                                 <span class="icon-user icons icon text-right"></span>
                              </h4>
                           </div>
                        </div>
                        <div class="panel-body text-center">
                           <h1>320</h1>
                           <p>User active</p>
                           <hr/>
                        </div>
                     </div>
                  </div>
                  
                  <div class="col-md-3">
                     <div class="panel box-v1">
                        <div class="panel-heading bg-white border-none">
                           <div class="col-md-3 col-sm-3 col-xs-3 text-right">
                              <h4>
                                 <span class="icon-basket-loaded icons icon text-right"></span>
                              </h4>
                           </div>
                        </div>
                        <div class="panel-body text-center">
                      		<h1>${order}</h1>
                           <p>New Orders</p>
                           <hr />
                        </div>
                     </div>
                  </div>
                  <div class="col-md-3">
                     <div class="panel box-v1">
                        <div class="panel-heading bg-white border-none">
                           <div class="col-md-3 col-sm-3 col-xs-3 text-right">
                              <h4>
                                 <span class="icon-list icons icon text-right"></span>
                              </h4>
                           </div>
                        </div>
                        <div class="panel-body text-center">
                           <h1>59</h1>
                           <p>New Message</p>
                           <hr />
                        </div>
                     </div>
                  </div>
                  <div class="col-md-3">
                     <div class="panel box-v1">
                        <div class="panel-heading bg-white border-none">
                           <div class="col-md-3 col-sm-3 col-xs-3 text-right">
                              <h4>
                                 <span class="icon-user-follow icons icon text-right"></span>
                              </h4>
                           </div>
                        </div>
                        <div class="panel-body text-center">
                           <h1>67</h1>
                           <p>New Member</p>
                           <hr />
                        </div>
                     </div>
                  </div>
               </div>
               <div class="col-md-12">
                  <div class="panel box-v4">
                     <div class="panel-heading bg-white border-none">
                        <h4>
                           <span class="icon-notebook icons"></span> Agenda
                        </h4>
                     </div>
                     <div class="panel-body padding-0">
                        <div
                           class="col-md-12 col-xs-12 col-md-12 padding-0 box-v4-alert">
                           <h2>Checking Your Server!</h2>
                           <p>Daily Check on Server status, mostly looking at servers
                              with alerts/warnings</p>
                           <b><span class="icon-clock icons"></span> Today at 15:00</b>
                        </div>
                        <div class="calendar"></div>
                     </div>
                  </div>
               </div>
            </div>
         </div>
      </div>
   </div>
   </div>
   </div>
   <script>
   		$(document).ready(function(){
   			$('.main').addClass('menu-top-active');
   		});
   </script>
   <!-- content end -->


   <!-- footer -->
   <%@include file="hooter.jsp" %>
   <!-- footer end -->
   
   
   
</body>
</html>